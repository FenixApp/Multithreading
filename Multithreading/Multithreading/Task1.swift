//
//  Task1.swift
//  Multithreading
//
//  Created by Dmitriy Starozhilov on 24.03.2024.
//

import UIKit

class Task1: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        print(1)
        Task {
            print(2)
        }
        print(3)
    }
    
    
}

/*
 print(1) и print(3) выполняются на главной очереди, print(2) выполняется асинхронно и идет его переброс на главную очередь, поэтому он выполняется позже.
 
 Upd: при замене на Task ничего не изменилось.
 */
