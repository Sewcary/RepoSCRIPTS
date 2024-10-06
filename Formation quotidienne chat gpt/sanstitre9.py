# -*- coding: utf-8 -*-
"""
Created on Wed Mar 22 12:31:37 2023

@author: ZT5549
"""


import re

def parse_questions_answers(file_name):
    with open(file_name, 'r', encoding='utf-8') as file:
        content = file.read()

    question_pattern = r'NEW QUESTION\s\d+'
    answer_pattern = r'Answer:\s[A-Z]'

    questions = re.findall(question_pattern, content)
    answers = re.findall(answer_pattern, content)

    flash_cards = []

    for i, question in enumerate(questions):
        start_index = content.index(question)
        end_index = content.index(answers[i]) if i < len(answers) - 1 else len(content)

        question_text = content[start_index:end_index].strip()
        answer = answers[i].split(" ")[1].strip()

        flash_cards.append((question_text, answer))

    return flash_cards

file_name = "az-900_dump.txt"
flash_cards = parse_questions_answers(file_name)

for i, flash_card in enumerate(flash_cards):
    print(f"Question {i + 1}:")
    print(flash_card[0])
    print(f"Answer: {flash_card[1]}")
    print()