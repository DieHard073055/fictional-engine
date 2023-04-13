#!/bin/sh

# Create the root directory for the project and navigate into it
mkdir linked_list_exercises
cd linked_list_exercises

# Initialize the root Cargo.toml with the workspace configuration
echo '[workspace]' > Cargo.toml
echo 'members = [' >> Cargo.toml

# Create the list_node library crate and add it to the workspace
cargo new --lib list_node
echo '    "list_node",' >> Cargo.toml

# Create the exercise directories, initialize them as binary crates, and add them as workspace members
for i in $(seq 1 7); do
    exercise_dir="exercise${i}_linked_list"
    cargo new --bin "${exercise_dir}"
    echo "    \"${exercise_dir}\"," >> Cargo.toml

    # Add the list_node dependency to each exercise's Cargo.toml
    echo 'list_node = { path = "../list_node" }' >> "${exercise_dir}/Cargo.toml"
done

# Close the members array in the root Cargo.toml
echo ']' >> Cargo.toml

