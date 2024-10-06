# -*- coding: utf-8 -*-
"""
Created on Mon Apr 24 14:00:14 2023

@author: ZT5549
"""


import tkinter as tk
import csv
import datetime
from collections import deque
from datetime import datetime, timedelta
# Create a window
root = tk.Tk()
root.title("Flashcards Application")

# Set window size
root.geometry("1500x900")
root.resizable(False, False)
today = datetime.date.today()

cards_data = []
card_review_dates = []
card_review_intervals = []

def initialize_arrays():
    global cards_data, card_review_dates, card_review_intervals, review_intervals

    cards_data = []
    card_review_dates = []
    card_review_intervals = []

    with open("flashcards.csv", newline="\r\n", encoding="utf-8") as csvfile:
        reader = csv.reader(csvfile, delimiter=",")
        for row in reader:
            cards_data.append(row[:2])

            try:
                card_review_dates.append(datetime.date.fromisoformat(row[-3]))
            except (IndexError, ValueError):
                card_review_dates.append(today)

            try:
                card_review_intervals.append(int(row[-2]))
            except (IndexError, ValueError):
                card_review_intervals.append(0)

            try:
                review_intervals = [datetime.timedelta(days=int(x)) for x in row[-1].split("|")]
            except (IndexError, ValueError):
                review_intervals = [datetime.timedelta(days=x) for x in [1, 2, 5, 22]]


initialize_arrays()

print(card_review_dates)
print(cards_data)
print(card_review_intervals)
print(review_intervals)
# Initialize review dates and intervals
# review_intervals = [datetime.timedelta(days=x) for x in [1, 2, 5, 22]]
# card_review_dates = [today for _ in range(len(cards_data))]
# card_review_intervals = [0 for _ in range(len(cards_data))]

# Create a queue of cards due for review
card_queue = deque(card_index for card_index, review_date in enumerate(card_review_dates) if review_date <= today)
print(card_review_dates)
# Function to save updated review dates to the CSV file
def save_review_dates():
    with open("flashcards.csv", "w", newline="", encoding="utf-8") as csvfile:
        writer = csv.writer(csvfile, delimiter=",", quotechar='"', quoting=csv.QUOTE_NONNUMERIC)
        for i, card_data in enumerate(cards_data):
            writer.writerow(card_data + [card_review_dates[i].strftime("%Y-%m-%d"), card_review_intervals[i]])


# Display flashcard answer and show "Good" and "Bad" buttons
def show_answer():
    back_label.config(text=cards_data[current_card_index][1], fg="green")
    flip_button.pack_forget()
    good_button.pack()
    bad_button.pack()

# Mark the card as good or bad and move to the next card
def mark_card(good):
    global card_queue, card_review_dates, card_review_intervals
    if good:
        print(f"Card {current_card_index} marked as Good")
        if card_review_intervals[current_card_index] < len(review_intervals):
            card_review_intervals[current_card_index] += 1
        card_review_dates[current_card_index] = today + review_intervals[card_review_intervals[current_card_index] - 1]
    else:
        print(f"Card {current_card_index} marked as Bad")
        card_queue.append(current_card_index)
    next_card()

# Display flashcard information
def show_card():
    if card_queue:
        card_index = card_queue.popleft()
        card_data = cards_data[card_index]
        face_label.config(text=card_data[0])
        back_label.config(text="", fg="red")
        good_button.pack_forget()
        bad_button.pack_forget()
        flip_button.pack()
        return card_index
    else:
        face_label.pack_forget()
        back_label.pack_forget()
        flip_button.pack_forget()
        good_button.pack_forget()
        bad_button.pack_forget()
        end_label.config(text="Revision finished")
        end_label.pack()
        save_review_dates()
        #root.after(5000, root.destroy)

# Go to the next flashcard
def next_card():
    global current_card_index
    
    current_card_index = show_card()
    # Check if there are no cards to review at the start of the application
    if current_card_index is None and not card_queue:
        end_label.config(text="Nothing to review today")
        end_label.pack()
   

def close_application():
    root.destroy()
    
# Add widgets to the window
face_label = tk.Label(root, text="", wraplength=400, justify="center", font=("Arial", 18))

face_label.pack()
back_label = tk.Label(root, text="", fg="red", wraplength=400, justify="center", font=("Arial", 18))
back_label.pack()

flip_button = tk.Button(root, text="Flip", command=show_answer)
flip_button.pack()


good_button = tk.Button(root, text="Good", command=lambda: mark_card(True))
bad_button = tk.Button(root, text="Bad", command=lambda: mark_card(False))

close_button = tk.Button(root, text="Close", command=close_application)
close_button.pack(side=tk.BOTTOM)


end_label = tk.Label(root, text="", fg="blue")

current_card_index = show_card()




root.mainloop()
