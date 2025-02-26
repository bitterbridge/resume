#!/bin/bash

# Compile the LaTeX document.
lualatex resume.tex;

# Convert the PDF to text.
pdftotext -raw resume.pdf;
