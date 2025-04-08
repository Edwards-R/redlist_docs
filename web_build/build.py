# Read in each .mer file as a csv and split up
# Then add file Jeykll headers and section pages

import csv
import os
import shutil

groups = ["ant", "bee", "wasp"]

# # rename the mer to csv
# try:
#     os.rename("source/ant.mer", "source/ant.csv")
#     os.rename("source/bee.mer", "source/bee.csv")
#     os.rename("source/wasp.mer", "source/wasp.csv")
# except:
#     print ("No .mer found - this may be intentional")


# with open("source/ant.csv", "r") as file:
#     reader = csv.reader(file)
#     for row in reader:
#         out_file = f'out/{(row[0].replace(":", "%3A"))}.md'
#         with open(out_file, "x") as out:
#             out.write(row[1].replace("", "\n"))

for group in groups:
    # rename the file
    try:
        os.rename(f'source/{group}.mer', f'source/{group}.csv')
    except:
        print (f'No {group}.mer found - this may be intentional')

    # Open the CSV file
    with open(f'source/{group}.csv', "r") as csv_file:
        reader = csv.reader(csv_file)
        next(reader) # Skip the header row
        # Delete existing folder
        if(os.path.isdir(f'out/{group}')):
                shutil.rmtree(f'out/{group}')

        os.mkdir(f'out/{group}') # Make output directory

        for row in reader:
            # Set the file name. Using URL-encoded `:` characters
            out_file = f'out/{group}/{(row[0].replace(":", "%3A"))}.md'
            with open(out_file, "x") as out:
                out.write(f'---\nparent: {group}\n---\n\n')# Write the jeykll header
                out.write(row[1].replace("", "\n")) # Write the main content
    
    # Now make the Jeykll index file
    with open(f'out/{group}/index.md', "x") as index_file:
        index_file.write(f'---\nparent: 1992-2021 GB Aculeate Hymenoptera Red List (DRAFT)\ntitle: {group}\n---\n\n# Bee taxa')