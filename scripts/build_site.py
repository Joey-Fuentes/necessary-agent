#!/usr/bin/env python3
"""Build the GitHub Pages site for necessary-agent.

Runs only from the `pages` workflow, which is triggered by a SUCCESSFUL run of
`verify`, and checks out the exact commit verify certified.  Everything the
site shows is therefore the certified state.

Dependencies: Python 3 stdlib and `pandoc` (Markdown → HTML).  No CDN, no
JavaScript required to read anything.

Environment (all optional; filled in by the workflow):
  SITE_COMMIT   the commit built (default: git HEAD)
  SITE_RUN_ID   the verify run id that certified it
  SITE_RUN_URL  its URL
  SITE_REPO     owner/repo
"""
import datetime
import hashlib
import html
import os
import pathlib
import re
import shutil
import subprocess
import sys

ROOT = pathlib.Path(__file__).resolve().parent.parent
OUT = ROOT / "site"
DOCS = ROOT / "docs"


def sh(*args, **kw):
    return subprocess.run(args, check=True, capture_output=True, text=True, **kw).stdout


COMMIT = os.environ.get("SITE_COMMIT") or sh("git", "-C", str(ROOT), "rev-parse", "HEAD").strip()
RUN_ID = os.environ.get("SITE_RUN_ID", "")
RUN_URL = os.environ.get("SITE_RUN_URL", "")
REPO = os.environ.get("SITE_REPO", "")
REPO_URL = f"https://github.com/{REPO}" if REPO else ""
BUILT = datetime.datetime.now(datetime.timezone.utc).strftime("%Y-%m-%d %H:%M UTC")
LEAN_SRC = ROOT / "NecessaryAgent.lean"
TOOLCHAIN = (ROOT / "lean-toolchain").read_text().strip()
VERSION = re.search(r"^## Version ([\d.]+)", (DOCS / "necessary_agent_argument_v8_7.md").read_text(), re.M).group(1)

# ----------------------------------------------------------------------------
CSS = """
:root{--fg:#1b1b1b;--bg:#fffdf8;--muted:#5a5a5a;--rule:#d9d4c7;--acc:#6a3d1a;--code:#f4f1ea;--kw:#7a1f1f;--cm:#5d6b52;--str:#1f4e79;--cmd:#4a1f7a}
html{font-size:17px}
body{margin:0;color:var(--fg);background:var(--bg);font-family:Georgia,"Times New Roman",serif;line-height:1.55}
nav.top{position:sticky;top:0;background:var(--bg);border-bottom:1px solid var(--rule);padding:.5rem 1rem;font-family:system-ui,sans-serif;font-size:.85rem;z-index:5}
nav.top a{color:var(--acc);text-decoration:none;margin-right:1rem}
nav.top a:hover{text-decoration:underline}
nav.top .status{float:right;color:var(--muted)}
main{max-width:52rem;margin:0 auto;padding:1.5rem 1rem 4rem}
main.wide{max-width:96rem}
h1,h2,h3,h4{font-family:system-ui,sans-serif;line-height:1.2;margin-top:2rem}
h1{font-size:1.9rem} h2{font-size:1.4rem;border-bottom:1px solid var(--rule);padding-bottom:.2rem} h3{font-size:1.15rem}
a{color:var(--acc)}
code,pre{font-family:"JetBrains Mono",Menlo,Consolas,monospace;font-size:.86em}
code{background:var(--code);padding:.05em .3em;border-radius:3px}
pre{background:var(--code);padding:.8rem 1rem;overflow-x:auto;border-radius:4px;line-height:1.4}
pre code{background:none;padding:0}
table{border-collapse:collapse;margin:1rem 0;font-size:.92em;font-family:system-ui,sans-serif}
th,td{border:1px solid var(--rule);padding:.35rem .55rem;vertical-align:top;text-align:left}
th{background:var(--code)}
blockquote{border-left:3px solid var(--rule);margin:1rem 0;padding:.2rem 1rem;color:var(--muted)}
details.toc{background:var(--code);padding:.5rem 1rem;border-radius:4px;font-family:system-ui,sans-serif;font-size:.9rem}
details.toc ul{padding-left:1.2rem}
.card{border:1px solid var(--rule);border-radius:6px;padding:1rem 1.2rem;margin:1rem 0;background:#fff}
.card h3{margin-top:0}
.grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(18rem,1fr));gap:1rem}
.muted{color:var(--muted)}
.ok{color:#1f6b2e;font-weight:600}
footer{max-width:52rem;margin:2rem auto;padding:0 1rem;color:var(--muted);font-size:.85rem;font-family:system-ui,sans-serif;border-top:1px solid var(--rule)}
/* Lean source */
.lean-wrap{display:grid;grid-template-columns:18rem 1fr;gap:1rem}
.lean-index{position:sticky;top:3rem;align-self:start;max-height:calc(100vh - 4rem);overflow:auto;font-family:system-ui,sans-serif;font-size:.78rem;border-right:1px solid var(--rule);padding-right:.5rem}
.lean-index a{display:block;text-decoration:none;color:var(--fg);padding:.05rem 0;white-space:nowrap;overflow:hidden;text-overflow:ellipsis}
.lean-index a:hover{color:var(--acc)}
.lean-index .ns{color:var(--acc);font-weight:600;margin-top:.4rem}
.lean-index .sec{color:var(--muted);margin-top:.3rem}
pre.lean{font-size:.8rem;line-height:1.35;counter-reset:none;padding-left:0}
pre.lean .ln{display:inline-block;width:4.2em;text-align:right;padding-right:.8em;color:#9a9484;user-select:none}
pre.lean .ln a{color:inherit;text-decoration:none}
pre.lean .l:target{background:#fff3c4}
pre.lean .kw{color:var(--kw);font-weight:600}
pre.lean .cm{color:var(--cm);font-style:italic}
pre.lean .dc{color:var(--cm)}
pre.lean .st{color:var(--str)}
pre.lean .cmd{color:var(--cmd);font-weight:600}
@media (max-width:60rem){.lean-wrap{grid-template-columns:1fr}.lean-index{position:static;max-height:14rem;border-right:0;border-bottom:1px solid var(--rule)}}
"""

NAV = [
    ("index.html", "Home"),
    ("argument.html", "The argument"),
    ("proof.html", "The formal proof"),
    ("verification.html", "Verification"),
    ("guide.html", "Plain-language guide"),
    ("handoff.html", "Handoff"),
    ("reviews.html", "Reviews"),
    ("downloads.html", "Downloads"),
]


def page(title, body, wide=False, extra_head=""):
    nav = " ".join(f'<a href="{h}">{t}</a>' for h, t in NAV)
    status = f'commit <code>{COMMIT[:10]}</code>'
    if RUN_URL:
        status += f' · <a href="{html.escape(RUN_URL)}">verify run {RUN_ID}</a>'
    return f"""<!doctype html>
<html lang="en"><head><meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<title>{html.escape(title)} — A Necessary Agent</title>
<style>{CSS}</style>{extra_head}</head>
<body><nav class="top">{nav}<span class="status">{status}</span></nav>
<main{' class="wide"' if wide else ''}>
{body}
</main>
<footer>A Necessary Agent, v{VERSION}. Built {BUILT} from commit <code>{COMMIT}</code>{' certified by <a href="'+html.escape(RUN_URL)+'">verify run '+RUN_ID+'</a>' if RUN_URL else ''}. This site is published only after the <code>verify</code> workflow passes; what it shows is the certified state. {('<a href="'+REPO_URL+'">Repository</a>.') if REPO_URL else ''}</footer>
</body></html>"""


def md_to_html(path, toc=False):
    args = ["pandoc", "-f", "gfm", "-t", "html5", "--wrap=none", "--no-highlight"]
    if toc:
        args += ["--toc", "--toc-depth=3", "--standalone", "--template=" + str(_toc_template())]
    out = sh(*args, str(path))
    if toc:
        # template emits <details class="toc">…</details> + body
        return out
    return out


def _toc_template():
    t = OUT / "_toc.tpl"
    t.write_text('<details class="toc"><summary>Contents</summary>\n$table-of-contents$\n</details>\n$body$\n')
    return t


# ----------------------------------------------------------------------------
# Lean rendering: a small state-machine highlighter (nested block comments,
# line comments, strings, keywords, commands) with per-line anchors, and a
# declaration index.
KEYWORDS = {"theorem", "def", "abbrev", "structure", "inductive", "namespace", "section", "end", "where", "open",
            "variable", "include", "omit", "in", "with", "fun", "by", "let", "have", "show", "match", "if", "then",
            "else", "intro", "exact", "refine", "obtain", "rcases", "rintro", "cases", "induction", "apply",
            "constructor", "exists", "rw", "simp", "simp_all", "omega", "decide", "trivial", "rfl", "absurd",
            "nomatch", "subst", "exfalso", "left", "right", "case", "calc", "at", "deriving", "extends", "local",
            "notation", "instance", "class", "import", "Prop", "Type", "Sort", "True", "False", "Nat", "Bool"}
CMDS = {"#print", "#check", "#eval"}
ID_RE = re.compile(r"[A-Za-z_][\w'₀-₉]*|#\w+|\S")


def hl_line(line, depth):
    """Return (html, new_depth). depth = block-comment nesting depth at line start."""
    out = []
    i = 0
    n = len(line)
    while i < n:
        if depth > 0:
            j = i
            while j < n:
                if line.startswith("/-", j):
                    depth += 1; j += 2; continue
                if line.startswith("-/", j):
                    depth -= 1; j += 2
                    if depth == 0:
                        break
                    continue
                j += 1
            out.append(f'<span class="cm">{html.escape(line[i:j])}</span>')
            i = j
            continue
        if line.startswith("/-", i):
            depth = 1
            cls = "dc" if line.startswith("/--", i) or line.startswith("/-!", i) else "cm"
            j = i + 2
            while j < n:
                if line.startswith("/-", j):
                    depth += 1; j += 2; continue
                if line.startswith("-/", j):
                    depth -= 1; j += 2
                    if depth == 0:
                        break
                    continue
                j += 1
            out.append(f'<span class="{cls}">{html.escape(line[i:j])}</span>')
            i = j
            continue
        if line.startswith("--", i):
            out.append(f'<span class="cm">{html.escape(line[i:])}</span>')
            break
        if line[i] == '"':
            j = i + 1
            while j < n and line[j] != '"':
                j += 2 if line[j] == "\\" else 1
            out.append(f'<span class="st">{html.escape(line[i:j+1])}</span>')
            i = j + 1
            continue
        m = ID_RE.match(line, i)
        if not m:
            out.append(html.escape(line[i])); i += 1; continue
        tok = m.group(0)
        if tok in CMDS:
            out.append(f'<span class="cmd">{html.escape(tok)}</span>')
        elif tok in KEYWORDS:
            out.append(f'<span class="kw">{html.escape(tok)}</span>')
        else:
            out.append(html.escape(tok))
        i = m.end()
    return "".join(out), depth


DECL_RE = re.compile(r"^(namespace|section|structure|inductive|theorem|def|abbrev|end)\s+([\w.'₀-₉]+)?")


def render_lean(src):
    lines = src.split("\n")
    body = []
    index = []
    depth = 0
    for k, line in enumerate(lines, 1):
        h, depth = hl_line(line, depth)
        body.append(f'<span class="l" id="L{k}"><span class="ln"><a href="#L{k}">{k}</a></span>{h}</span>')
        if depth == 0:
            m = DECL_RE.match(line)
            if m and m.group(1) != "end":
                kind, name = m.group(1), m.group(2) or ""
                cls = "ns" if kind in ("namespace",) else ("sec" if kind == "section" else "")
                index.append(f'<a class="{cls}" href="#L{k}" title="line {k}">{html.escape(kind)} {html.escape(name)}</a>')
    return "\n".join(body), "\n".join(index)


# ----------------------------------------------------------------------------
def sha256(p):
    return hashlib.sha256(pathlib.Path(p).read_bytes()).hexdigest()


def main():
    if OUT.exists():
        shutil.rmtree(OUT)
    OUT.mkdir()
    (OUT / ".nojekyll").write_text("")
    dl = OUT / "downloads"
    dl.mkdir()

    # ---- downloads: the proof, the pins, the docs, a source archive ----
    for f in ["NecessaryAgent.lean", "expected_axioms.txt", "expected_statements.txt", "expected_definitions.txt",
              "lean-toolchain", "README.md", "lakefile.toml", "lake-manifest.json"]:
        shutil.copy(ROOT / f, dl / f)
    shutil.copy(ROOT / "scripts" / "verify.sh", dl / "verify.sh")
    for f in DOCS.glob("*.md"):
        shutil.copy(f, dl / f.name)
    archive = dl / f"necessary-agent-{COMMIT[:10]}.tar.gz"
    subprocess.run(["git", "-C", str(ROOT), "archive", "--format=tar.gz", "--prefix=necessary-agent/",
                    "-o", str(archive), COMMIT], check=True)

    hashes = {f: sha256(dl / f) for f in ["NecessaryAgent.lean", "expected_axioms.txt", "expected_statements.txt", "expected_definitions.txt"]}

    # ---- documents ----
    docs = [
        ("argument.html", "The argument", DOCS / "necessary_agent_argument_v8_7.md", True),
        ("guide.html", "Plain-language guide", DOCS / "plain_language_guide_v8_7.md", True),
        ("handoff.html", "Handoff", DOCS / "Necessary_Agent_Handoff_v8_7.md", True),
        ("cosmic_strand.html", "The cosmic strand", DOCS / "cosmic_strand_v2.md", True),
        ("review_v8_13.html", "Third external review (of v8.13)", DOCS / "necessary_agent_v8_13_review.md", True),
        ("review_v8_14.html", "Fourth external review (of v8.14)", DOCS / "necessary_agent_v8_14_review_findings.md", True),
        ("review_brief.html", "Review brief (v8.13)", DOCS / "REVIEW_BRIEF_v8_13.md", False),
        ("readme.html", "README", ROOT / "README.md", True),
    ]
    for out, title, src, toc in docs:
        body = md_to_html(src, toc=toc)
        note = f'<p class="muted">Source: <a href="downloads/{src.name}">{src.name}</a> · rendered from commit <code>{COMMIT[:10]}</code>.</p>'
        (OUT / out).write_text(page(title, note + body))

    # ---- the formal proof ----
    src = LEAN_SRC.read_text()
    body, index = render_lean(src)
    nlines = src.count("\n")
    ax = (ROOT / "expected_axioms.txt").read_text().splitlines()
    proof = f"""
<h1>The formal proof — <code>NecessaryAgent.lean</code></h1>
<p>{nlines:,} lines · Lean <code>{html.escape(TOOLCHAIN)}</code> · {len(ax)} certified results ·
SHA-256 <code>{hashes['NecessaryAgent.lean']}</code> ·
<a href="downloads/NecessaryAgent.lean" download>download</a> ·
<a href="verification.html">how to verify</a>.
Line numbers are anchors: append <code>#L1234</code> to the URL. The index on the left lists every top-level
declaration; the reviews cite these lines.</p>
<div class="lean-wrap">
<div class="lean-index">{index}</div>
<pre class="lean">{body}</pre>
</div>"""
    (OUT / "proof.html").write_text(page("The formal proof", proof, wide=True))

    # ---- verification ----
    rows = []
    for line in ax:
        m = re.match(r"'(.*)' ((?:depends on axioms|does not depend on any axioms).*)", line)
        rows.append(f"<tr><td><code>{html.escape(m.group(1))}</code></td><td>{html.escape(m.group(2))}</td></tr>")
    checks = re.search(r"# Passes only if ALL of the following hold:\n(.*?)\n#\n# What green means", (ROOT / "scripts" / "verify.sh").read_text(), re.S)
    checks_txt = html.escape(checks.group(1) if checks else "")
    green = re.search(r"# What green means after all six:(.*?)\n\nset -euo", (ROOT / "scripts" / "verify.sh").read_text(), re.S)
    green_txt = html.escape(green.group(1).replace("# ", "").replace("#", "") if green else "")
    ver = f"""
<h1>Verification</h1>
<p>This site is published by the <code>pages</code> workflow, which runs <em>only</em> when the <code>verify</code>
workflow has passed on <code>main</code>, and builds the exact commit it certified: <code>{COMMIT}</code>{f' (<a href="{html.escape(RUN_URL)}">run {RUN_ID}</a>)' if RUN_URL else ''}.</p>
<h2>What <code>verify.sh</code> checks</h2>
<pre>{checks_txt}</pre>
<h2>What green means, and does not</h2>
<pre>{green_txt}</pre>
<h2>Reproduce it yourself</h2>
<pre>git clone {html.escape(REPO_URL) if REPO_URL else '&lt;repository&gt;'}
cd necessary-agent
elan toolchain install {html.escape(TOOLCHAIN)}   # or paste NecessaryAgent.lean into https://live.lean-lang.org
scripts/verify.sh</pre>
<p>Expected: exit 0, empty stderr, and the three files below byte-identical to the script's output.</p>
<table><tr><th>File</th><th>SHA-256 at this commit</th></tr>
{''.join(f'<tr><td><a href="downloads/{f}">{f}</a></td><td><code>{h}</code></td></tr>' for f, h in hashes.items())}
</table>
<h2>The {len(ax)} certified results and their axioms</h2>
<p>Every result depends on at most <code>propext</code>, <code>Classical.choice</code>, <code>Quot.sound</code> — Lean's three standard axioms. No <code>sorry</code>, no added axioms, no escape hatches.</p>
<table><tr><th>Result</th><th>Axioms</th></tr>{''.join(rows)}</table>
<p>The pinned <a href="downloads/expected_statements.txt">statements</a> and <a href="downloads/expected_definitions.txt">definitions</a> are what checks 5 and 6 compare against.</p>"""
    (OUT / "verification.html").write_text(page("Verification", ver))

    # ---- reviews hub, downloads, index ----
    reviews = """
<h1>External reviews</h1>
<p>The README's rule (§4, step 5) is that no session verifies its own changes. These are the reviews the current
version answers, with the status of every item in the handoff.</p>
<div class="grid">
<div class="card"><h3><a href="review_brief.html">Review brief (v8.13)</a></h3><p>What the third reviewer was asked to attack, and in what order.</p></div>
<div class="card"><h3><a href="review_v8_13.html">Third review (of v8.13)</a></h3><p>Built its attacks as compiling countermodels; every one is now in the file. Produced v8.14.</p></div>
<div class="card"><h3><a href="review_v8_14.html">Fourth review (of v8.14)</a></h3><p>A read-through that found four gaps between certificate and claim. Produced v8.15.</p></div>
<div class="card"><h3><a href="handoff.html">Handoff</a></h3><p>Status of every recommendation (§8, §8a, §8b) and the burden list (§9).</p></div>
</div>
<p class="muted">The v8.5 review is not in the repository (<code>docs/NOTE_review_file.md</code>).</p>"""
    (OUT / "reviews.html").write_text(page("Reviews", reviews))

    files = sorted(p.name for p in dl.iterdir())
    downloads = "<h1>Downloads</h1><p>Everything the site renders, as files.</p><ul>" + "".join(
        f'<li><a href="downloads/{f}" download>{f}</a>{" — the full formal proof" if f=="NecessaryAgent.lean" else ""}{" — source archive of this commit (history is in the repository)" if f.startswith("necessary-agent-") else ""}</li>'
        for f in files) + "</ul>"
    (OUT / "downloads.html").write_text(page("Downloads", downloads))

    index = f"""
<h1>A Necessary Agent</h1>
<p class="muted">Version {VERSION} · a machine-checked argument for a necessary rational agent, with every exit certified consistent and priced.</p>
<div class="card"><p><span class="ok">Certified state.</span> <code>god_exists</code> follows from <code>Axioms</code>; {len(ax)} results, each on at most Lean's three standard axioms; the premise set is consistent; every contested premise has an independence witness; statements and definitions are pinned. This page exists only because the <code>verify</code> workflow passed on commit <code>{COMMIT[:10]}</code>{f' (<a href="{html.escape(RUN_URL)}">run {RUN_ID}</a>)' if RUN_URL else ''}.</p>
<p><span class="muted">Not certified, and not certifiable by any tool:</span> that the premises are true, or that the Lean definitions mean what the prose says. That is what the dossier (Part III) and the reviews are for.</p></div>
<div class="grid">
<div class="card"><h3><a href="argument.html">The argument</a></h3><p>Part I renders the Lean in words; Part II prices the exits; Part III is the soundness dossier — every premise's case, the strongest objections, the replies, the cost of denial, and where argument stops.</p></div>
<div class="card"><h3><a href="proof.html">The formal proof</a></h3><p><code>NecessaryAgent.lean</code>, rendered with line anchors and a declaration index — or <a href="downloads/NecessaryAgent.lean" download>download it</a> and check it yourself.</p></div>
<div class="card"><h3><a href="verification.html">Verification</a></h3><p>The six checks, what green means and does not, how to reproduce, and the full list of certified results with their axioms.</p></div>
<div class="card"><h3><a href="guide.html">Plain-language guide</a></h3><p>Every premise in plain words; the two exits a serious naturalist takes, and what each costs.</p></div>
<div class="card"><h3><a href="reviews.html">External reviews</a></h3><p>The brief, the third and fourth reviews, and the handoff that tracks every finding.</p></div>
<div class="card"><h3><a href="cosmic_strand.html">The cosmic strand</a></h3><p>The empirical strand: conservative fine-tuning numbers, their two narrow jobs, and what is excluded.</p></div>
<div class="card"><h3><a href="readme.html">README</a></h3><p>How to verify, how to read, how to change things without breaking them; the full change log.</p></div>
<div class="card"><h3><a href="downloads.html">Downloads</a></h3><p>The proof, the pinned expected files, every document, and a source archive of this commit.</p></div>
</div>"""
    (OUT / "index.html").write_text(page("A Necessary Agent", index))
    (OUT / "_toc.tpl").unlink(missing_ok=True)
    print(f"site built at {OUT}: {sum(1 for _ in OUT.rglob('*') if _.is_file())} files, commit {COMMIT[:10]}, {len(ax)} results")


if __name__ == "__main__":
    main()
