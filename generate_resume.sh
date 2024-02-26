#!/bin/bash

# Parse command line options.
temporary="$(getopt -o e:r: --long email:,role: -- "$@")";
[ $? == 0 ] || exit 1;

# Check for invalid options.
eval set -- "$temporary" || exit 1;

# Set default values.
email='brisk.bell8333@tenesm.us';
role='devops';

# Parse options.
while true; do
  case "${1}" in
    -e | --email ) email="${2}"; shift;;
    -r | --role ) role="${2}"; shift;;
    -- ) shift; break;;
    * ) break;;
  esac
done

# Create a temporary .tex file with custom commands. Use a HEREDOC.
cat > params.tex <<EOF
\newcommand{\myemail}{$email}
\newcommand{\myrole}{$role}
EOF

# Compile the LaTeX document.
pdflatex resume.tex;
