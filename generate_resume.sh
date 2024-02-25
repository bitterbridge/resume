#!/bin/bash

# Capture email from command line argument, or use a default.
EMAIL="${1:-brisk.bell8333@tenesm.us}";

# Create a temporary .tex file with custom commands
echo "\newcommand{\myemail}{$EMAIL}" > params.tex

# Compile the LaTeX document, ensuring params.tex is included before your main document
pdflatex resume.tex
