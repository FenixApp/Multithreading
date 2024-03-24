//
//  Task2.swift
//  Multithreading
//
//  Created by Dmitriy Starozhilov on 24.03.2024.
//

import UIKit

class Task2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        print(1)
        Task { @MainActor  in
            print(2)
        }
        print(3)
    }
    
    
}

/*
 Данный вариант отличается от обычного тем, что Task выполняется на главном потоке.
 */
