# -*- coding: utf-8 -*-
"""
Created on Tue Sep  3 21:13:45 2024

@author: ZT5549
"""

import os
import pandas as pd
import re

# Function to create a valid filename for Windows
def create_valid_filename(name):
    return re.sub(r'[\\\\/*?:"<>|]', "", name)

# Load the CSV file
csv_file_path = 'citations_motivantes_fr_utf8_extended_exp_tags_quotes.csv'
df = pd.read_csv(csv_file_path)

# Create a directory to save the markdown files
output_dir = 'quotes_md_files'
os.makedirs(output_dir, exist_ok=True)

# Generate a markdown file for each citation
for index, row in df.iterrows():
    title = create_valid_filename(row['Citation'][:50])  # Taking first 50 characters for filename
    md_filename = f"{output_dir}/{title}.md"
    
    with open(md_filename, 'w', encoding='utf-8') as file:
        file.write(f"# {row['Citation']}\n\n")
        file.write(f"**Explication :** {row['Explication']}\n\n")
        file.write(f"**Tags :** {row['Tags']}\n")

print(f"Markdown files created in the '{output_dir}' directory.")
