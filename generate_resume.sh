#!/bin/bash

# Capture email from command line argument, or use a default.
EMAIL="${1:-brisk.bell8333@tenesm.us}";

# Create a temporary .tex file with custom commands. Use a HEREDOC.
cat > params.tex <<EOF
\newcommand{\myemail}{$EMAIL}
EOF

# Compile the LaTeX document.
pdflatex resume.tex
