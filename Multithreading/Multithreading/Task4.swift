//
//  Task4.swift
//  Multithreading
//
//  Created by Dmitriy Starozhilov on 24.03.2024.
//

import UIKit

class Task4: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        
        func randomD6() async -> Int {
            Int.random(in: 1...6)
        }
        Task {
            let result = await randomD6()
            print(result)
//            print(Thread.current)
        }
    }
    
}
