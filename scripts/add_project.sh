#!/bin/bash

# Ottenere il percorso assoluto dello script corrente
script_dir="$(dirname "$(readlink -f "$0")")"

# Navigare alla cartella root del progetto. Questo presuppone che la cartella 'scripts'
# sia sempre una sottocartella diretta della root del progetto.
project_root="$(dirname "$script_dir")"

# Cambiare la directory corrente alla root del progetto
cd "$project_root" || { echo "Failed to change to project root directory"; exit 1; }

# Function to check if sufficient arguments are provided.
    # Exit the script if the number of arguments is not equal to 2.
check_arguments() {
    if [ "$#" -ne 2 ]; then
        echo "Usage: $0 <ProjectName> <Description>"
        exit 1
    fi
}


# Function to check if a directory exists
    # Exit the script if the directory already exists.
check_directory() {
    if [ -d "$1" ]; then
        echo "Directory $1 already exists."
        exit 1
    fi
}


# Function to check if a file already exists.
    # Exit the script if the file already exists.
check_file() {
    if [ -f "$1" ]; then
        echo "File $1 already exists."
        exit 1
    fi
}


# Function to create a new project directory.
    # First, check if the directory already exists.
    # Create the directory if it does not exist.
create_project_directory() {
    check_directory "$1"
    mkdir -p "$1"
}


# Function to create a README file for the new project.
    # First, check if the README.md file already exists in the project directory.
    # Create the README.md file with the project name and description.
create_project_readme() {
    check_file "$1/README.md"
    echo "# $2\n\n$3" > "$1/README.md"
}


# Function to update the main README.md file
update_main_readme() {
    # Define a temporary README file
    temp_readme="temp_README.md"

    # Process each line of the original README.md
    awk -v project_line="[$PROJECT_NAME](./$PROJECT_NAME/README.md): $DESCRIPTION" \
        -v placeholder="<!-- PROJECTS_LIST -->" \
        'BEGIN { last_number = 0; }
        {
            if ($1 ~ /^[0-9]+[.]/) {
                split($1, a, ".");
                last_number = a[1];
            }
            if ($0 == placeholder) {
                print last_number + 1 ". " project_line;
            }
            print;
        }' README.md > "$temp_readme"

    # Replace the original README.md with the modified content
    mv "$temp_readme" README.md
}


# Main script execution
# Check for the required number of arguments.
check_arguments "$@"
# Store the project name and description as variables.
PROJECT_NAME=$1
DESCRIPTION=$2
# Call the function to create the project directory.
create_project_directory "$PROJECT_NAME"
# Call the function to create the project README.md file.
create_project_readme "$PROJECT_NAME" "$PROJECT_NAME" "$DESCRIPTION"
# Call the function to update the main README.md file.
update_main_readme "$PROJECT_NAME" "$DESCRIPTION"
