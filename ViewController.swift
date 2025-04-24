//
//  ViewController.swift
//  My Little Library
//
//  Created by Imandi on 4/23/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var books: [Book] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        updateEmptyMessage()
        loadBooks() // Load books when the view is loaded
    }
    
    // MARK: - Load & Save Books
    func loadBooks() {
        if let savedBooks = UserDefaults.standard.object(forKey: "books") as? Data {
            let decoder = JSONDecoder()
            if let loadedBooks = try? decoder.decode([Book].self, from: savedBooks) {
                books = loadedBooks
                
            }
        }
    }

    func saveBooks() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(books) {
            UserDefaults.standard.set(encoded, forKey: "books")
        }
    }
    
    @IBAction func addBookButtonTapped(_ sender: UIButton) {
    let alert = UIAlertController(title: "Add Book", message: nil, preferredStyle: .alert)
                
                alert.addTextField { (textField) in
                    textField.placeholder = "Book Title"
                }
                alert.addTextField { (textField) in
                    textField.placeholder = "Author"
                }
                alert.addTextField { (textField) in
                    textField.placeholder = "Category (Read/Reading/Want to Read)"
                }
                
                let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
                    if let title = alert.textFields?[0].text,
                       let author = alert.textFields?[1].text,
                       let category = alert.textFields?[2].text {
                        let newBook = Book(title: title, author: author, category: category)
                        self?.books.append(newBook)
                        self?.saveBooks()
                        self?.tableView.reloadData()
                    }
                }
                
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                
                alert.addAction(addAction)
                alert.addAction(cancelAction)
                
                present(alert, animated: true, completion: nil)
            }
    func updateEmptyMessage() {
        if books.isEmpty {
            let label = UILabel()
            label.text = ""
            label.textAlignment = .center
            label.textColor = .gray
            label.font = UIFont.italicSystemFont(ofSize: 18)
            tableView.backgroundView = label
        } else {
            tableView.backgroundView = nil
        }
    }
}
        // MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let book = books[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        // Emoji by category
        let icon: String
        switch book.category.lowercased() {
        case "read": icon = "✅"
        case "reading": icon = "📖"
        case "want to read": icon = "⭐️"
        default: icon = "📘"
        }

        // Style
        cell.textLabel?.text = "\(icon) \(book.title) by \(book.author)"
        cell.textLabel?.textColor = .label
        cell.textLabel?.font = UIFont.systemFont(ofSize: 17, weight: .medium)

        return cell
    }

    // Swipe-to-delete
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            books.remove(at: indexPath.row)
            saveBooks()
            tableView.deleteRows(at: [indexPath], with: .fade)
            updateEmptyMessage()
        }
    }
}
