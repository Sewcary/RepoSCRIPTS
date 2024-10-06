import os
import pandas as pd
from PyPDF2 import PdfFileReader
import openai

# Configurez votre clé API OpenAI
openai.api_key = 'YOUR_OPENAI_API_KEY'

def extract_pdf_info(pdf_path):
    try:
        with open(pdf_path, 'rb') as f:
            pdf = PdfFileReader(f)
            info = pdf.getDocumentInfo()
            number_of_pages = pdf.getNumPages()

            pdf_info = {
                'Filename': os.path.basename(pdf_path),
                'Title': info.title if info.title else '',
                'Author': info.author if info.author else '',
                'NumberOfPages': number_of_pages,
                'Subject': ''  # This column will be updated with the category from OpenAI
            }

        return pdf_info

    except Exception as e:
        print(f"Error processing {pdf_path}: {e}")
        return None

def get_book_category(title, author):
    prompt = f"Provide the category, genre, or type for the book titled '{title}' by {author}."
    try:
        response = openai.ChatCompletion.create(
            model="gpt-3.5-turbo",
            messages=[
                {"role": "system", "content": "You are a helpful assistant."},
                {"role": "user", "content": prompt}
            ],
            max_tokens=50
        )
        category = response['choices'][0]['message']['content'].strip()
        return category
    except Exception as e:
        print(f"Error getting category for '{title}' by '{author}': {e}")
        return 'Unknown'

def process_directory(directory_path):
    data = []
    for filename in os.listdir(directory_path):
        if filename.endswith('.pdf'):
            pdf_path = os.path.join(directory_path, filename)
            pdf_info = extract_pdf_info(pdf_path)
            if pdf_info:
                title = pdf_info['Title']
                author = pdf_info['Author']
                if title and author:
                    pdf_info['Subject'] = get_book_category(title, author)
                data.append(pdf_info)
    
    return pd.DataFrame(data)

def save_to_csv(dataframe, output_path):
    dataframe.to_csv(output_path, index=False, encoding='utf-8-sig')  # Using 'utf-8-sig' for Excel compatibility

# Specify the directory containing the PDF files and the output CSV file path
directory_path = 'C:\\Users\\ZT5549\\OneDrive - SUEZ\\Bureau\\LIVRES'
output_csv_path = 'output.csv'

# Process the directory and save the extracted information to a CSV file
pdf_data = process_directory(directory_path)
if not pdf_data.empty:
    save_to_csv(pdf_data, output_csv_path)
    print(f"PDF information saved to {output_csv_path}")
else:
    print("No valid PDF information extracted.")





    
    
    
    
    
    
    
    


    
    








