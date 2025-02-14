#!/bin/bash

# Parse command line options.
temporary="$(getopt -o e:r: --long email:,role: -- "$@")";
[ $? == 0 ] || exit 1;

# Check for invalid options.
eval set -- "$temporary" || exit 1;

# Set default values.
my_email='herodevs@tenesm.us';
my_title='Senior DevOps/Platform/Site Reliability Engineer';
my_first_name='Nathan';
my_last_name='Douglas';
my_phone_number='(330) 998-8049';
my_phone_number_plain='+13309988049';
my_website='darkdell.net';
my_linkedin_username='nug-doug';
my_github_username='ndouglas';

# Parse options.
while true; do
  case "${1}" in
    -e | --email ) my_email="${2}"; shift;;
    -t | --title ) my_title="${2}"; shift;;
    -f | --first-name ) my_first_name="${2}"; shift;;
    -l | --last-name ) my_last_name="${2}"; shift;;
    -p | --phone-number ) my_phone_number="${2}"; shift;;
    -w | --website ) my_website="${2}"; shift;;
    -i | --linkedin-username ) my_linkedin_username="${2}"; shift;;
    -g | --github-username ) my_github_username="${2}"; shift;;
    -- ) shift; break;;
    * ) break;;
  esac
done

my_phone_number_plain="+1$(echo $my_phone_number | tr -d '() -')";

# Create a temporary .tex file with custom commands. Use a HEREDOC.
cat > params.tex <<EOF
\newcommand{\MyEmail}{$my_email}
\newcommand{\MyTitle}{$my_title}
\newcommand{\MyFirstName}{$my_first_name}
\newcommand{\MyLastName}{$my_last_name}
\newcommand{\MyFullName}{$my_first_name $my_last_name}
\newcommand{\MyPhoneNumber}{$my_phone_number}
\newcommand{\MyPhoneNumberPlain}{$my_phone_number_plain}
\newcommand{\MyWebsite}{$my_website}
\newcommand{\MyLinkedInUsername}{$my_linkedin_username}
\newcommand{\MyGitHubUsername}{$my_github_username}
EOF



# Compile the LaTeX document.
pdflatex resume.tex;

# Convert the PDF to text.
pdftotext -raw resume.pdf;
