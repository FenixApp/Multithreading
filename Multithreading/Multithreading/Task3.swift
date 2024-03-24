//
//  Task3.swift
//  Multithreading
//
//  Created by Dmitriy Starozhilov on 24.03.2024.
//

import UIKit

class Task3: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemRed
        
        print("Task 1 is finished")
        
        Task.detached(priority: .userInitiated) {
            for i in 0..<50 {
                print(i)
            }
            print("Task 2 is finished")
//            print(Thread.current)
        }
        
        print("Task 3 is finished")
    }
    
    
}

/*
 Ничего не изменилось. После изменения приоритета у Task, также ничего не поменялось.
 */
