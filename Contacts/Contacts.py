import pandas as pd
import re

# Load the CSV file (replace 'contacts.csv' with your file path)
file_path = 'cleaned_contacts.csv'
contacts_df = pd.read_csv(file_path)

# Function to clean names and phone numbers
def clean_contacts(df):
    # Select only relevant columns: Names and Phone Numbers
    df_cleaned = df[['Name', 'Phone']].copy()

    # Convert both Name and Phone columns to strings to avoid TypeError
    df_cleaned['Phone'] = df_cleaned['Phone'].astype(str)
    df_cleaned['Name'] = df_cleaned['Name'].astype(str)

    # Clean phone numbers: retain only those starting with +254
    df_cleaned = df_cleaned[df_cleaned['Phone'].str.startswith('+254', na=False)]

    # Standardize phone numbers to 13 characters, trimming extra digits from the right
    df_cleaned['Phone'] = df_cleaned['Phone'].apply(lambda x: x[:13] if len(x) > 13 else x)

    # Remove invalid phone numbers (those not exactly 13 characters or incorrect format)
    df_cleaned = df_cleaned[df_cleaned['Phone'].str.len() == 13]

    # Remove unwanted special characters from names using regex
    df_cleaned['Name'] = df_cleaned['Name'].apply(lambda x: re.sub(r'[^\w\s]', '', x))

    # Remove duplicates based on phone numbers
    df_cleaned = df_cleaned.drop_duplicates(subset='Phone', keep='first')

    # Return cleaned data
    return df_cleaned

# Clean the contact list
cleaned_contacts = clean_contacts(contacts_df)

# Save the cleaned data to a new CSV file
output_file_path = 'cleaned_contacts.csv'
cleaned_contacts.to_csv(output_file_path, index=False)

print(f"Cleaned contact list saved to {output_file_path}")
