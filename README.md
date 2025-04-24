# MyLittleLibrary
Book Tracker App
Table of Contents
Overview
Product Spec
Wireframes
Schema

Overview
Description
The Book Tracker App allows users to track their book collection. Users can add books with a title, author, and category (Read, Reading, or Want to Read). The app also lets users delete books from their collection, and it persists data using UserDefaults so that it remains even after the app is closed. The app features a simple and clean design with a basic theme and a customizable background based on the user’s book collection.

App Evaluation
Category: Personal Productivity
Mobile: iOS
Story: Users can add and manage their book collection.
Market: This app is ideal for book enthusiasts who want to keep track of their books and reading progress.
Habit: This app is used whenever users want to update or check their book collection.
Scope: The app allows adding, viewing, and deleting books. The scope could be expanded in future versions to include categories like book reviews or ratings.

Product Spec
1. User Stories
Required Must-have Stories
As a user, I can add a new book to the app by entering its title, author, and category (Read/Reading/Want to Read).

As a user, I can see a list of all my books with their respective category and author.

As a user, I can swipe to delete a book from my collection.


Optional Nice-to-have Stories
As a user, I can customize the theme of the app (e.g., switch between light and dark mode).

As a user, I can see an emoji next to each book based on its category (e.g., ✅ for Read, 📖 for Reading, ⭐️ for Want to Read).

2. Screen Archetypes
Main Screen

Displays a list of books with their title, author, and category.

Allows users to swipe to delete books.

Displays an empty message when there are no books in the collection.

Add Book Screen

A popup alert where users can add a new book's title, author, and category.

3. Navigation
Tab Navigation (Tab to Screen)
Main Screen - The default screen that shows the book list.

Flow Navigation (Screen to Screen)
Main Screen → Add Book Screen - Triggered by the "Add Book" button, opens a popup to add a new book.

Wireframes

<img width="385" alt="Wireframe" src="https://github.com/user-attachments/assets/1a7e4fc8-e08b-4c1e-b3ba-50c3e94e41ca" />


Schema
Models
Book

title: String

author: String

category: String (Can be "Read", "Reading", or "Want to Read")

Networking
There is no network communication in this app since it uses UserDefaults for data storage.
