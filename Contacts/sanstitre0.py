# -*- coding: utf-8 -*-
"""
Created on Thu Sep 26 17:02:56 2024

@author: ZT5549
"""

import pandas as pd

# Load the CSV file (replace 'contacts.csv' with your file path)
file_path = 'contacts.csv'
contacts_df = pd.read_csv(file_path)

# Function to clean phone numbers and names
def clean_contacts(df):
    # Select only relevant columns: Names and Phone Numbers
    df_cleaned = df[['First Name', 'Middle Name', 'Last Name', 'Phone 1 - Value']].copy()

    # Create a "Full Name" column by concatenating 'First Name', 'Middle Name', and 'Last Name'
    df_cleaned['Full Name'] = df_cleaned[['First Name', 'Middle Name', 'Last Name']].fillna('').apply(lambda x: ' '.join(x).strip(), axis=1)

    # Clean phone numbers: retain only those starting with +254
    df_cleaned = df_cleaned[df_cleaned['Phone 1 - Value'].str.startswith('+254', na=False)]

    # Standardize phone numbers to 12 characters, trimming extra digits from the right
    df_cleaned['Phone 1 - Value'] = df_cleaned['Phone 1 - Value'].apply(lambda x: x[:13] if len(x) > 13 else x)

    # Filter out invalid phone numbers (not exactly 12 characters or incorrect format)
    df_cleaned = df_cleaned[df_cleaned['Phone 1 - Value'].str.len() == 13]

    # Remove duplicates based on phone numbers
    df_cleaned = df_cleaned.drop_duplicates(subset='Phone 1 - Value', keep='first')

    # Return only the 'Full Name' and cleaned 'Phone 1 - Value' columns
    return df_cleaned[['Full Name', 'Phone 1 - Value']]

# Clean the contact list
cleaned_contacts = clean_contacts(contacts_df)

# Save the cleaned data to a new CSV file
output_file_path = 'cleaned_contacts.csv'
cleaned_contacts.to_csv(output_file_path, index=False)

print(f"Cleaned contact list saved to {output_file_path}")
