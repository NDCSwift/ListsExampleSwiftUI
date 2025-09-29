//  Created by Noah Carpenter
//  🐱 Follow me on YouTube! 🎥
//  https://www.youtube.com/@NoahDoesCoding97
//  Like and Subscribe for coding tutorials and fun! 💻✨
//  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
//  Dream Big, Code Bigger

import SwiftUI

// MARK: - ContentView

/// The main view for the ListsExampleSwiftUI app.
/// Displays a list of to-do items and allows users to add or delete tasks.
struct ContentView: View {
    // MARK: - State Properties
    
    @State private var toDoItems: [String] = ["Buy Groceries", "Play with the cat", "Go to the Gym", "Complete Homework"] // List of to-do items
    @State private var newTask: String = "" // Holds the text for a new task
    
    // MARK: - Body
    
    var body: some View {
        NavigationView {
            VStack {
                // Input section for adding new tasks
                HStack {
                    // TextField for entering a new task
                    TextField("New Task", text: $newTask)
                        .textFieldStyle(RoundedBorderTextFieldStyle()) // Applies rounded border style to the text field
                        .padding(.horizontal) // Adds horizontal padding to the text field
                    
                    // Button to add the new task
                    Button(action: addTask) {
                        Image(systemName: "plus.circle.fill") // Plus icon
                            .foregroundStyle(Color.blue) // Sets the icon color to blue
                            .font(.title) // Sets the icon size
                    }
                }
                
                // List displaying the to-do items
                List {
                    // Iterates over each to-do item
                    ForEach(toDoItems, id: \.self) { item in
                        Text(item) // Displays the to-do item text
                            .padding(.vertical, 8) // Adds vertical padding to each list item
                    }
                    .onDelete(perform: deleteTask) // Enables swipe-to-delete functionality
                }
            }
        }
        .padding() // Adds padding around the NavigationView
    }
    
    // MARK: - Functions
    
    /// Adds a new task to the to-do list if the input is not empty.
    private func addTask() {
        guard !newTask.isEmpty else { return } // Ensures the new task is not empty
        toDoItems.append(newTask) // Appends the new task to the list
        newTask = "" // Clears the input field
    }
    
    /// Deletes tasks from the to-do list at the specified offsets.
    /// - Parameter offsets: The set of indices to delete.
    private func deleteTask(at offsets: IndexSet) {
        toDoItems.remove(atOffsets: offsets) // Removes items from the list at the specified indices
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}
