//
//  Task8.swift
//  Multithreading
//
//  Created by Dmitriy Starozhilov on 24.03.2024.
//

import UIKit

class Task8: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        Task {
            await printMessage()
        }
    }
    
    
    func printMessage() async {
        let words = ["Hello", "My", "Road", "Map", "Group"]
        let string = await withTaskGroup(of: String.self) { group -> String in
            // тут добавляем строки в группу
            for word in words {
                group.addTask {
                    word
                }
            }
            var collected = [String]()
            
            for await value in group {
                collected.append(value)
            }
            
            return collected.joined(separator: " ")
        }
        
        print(string)
    }
}
