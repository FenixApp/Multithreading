//
//  ViewController.swift
//  Multithreading
//
//  Created by Dmitriy Starozhilov on 19.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var name = "I love RM"
    var lock = NSLock()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateName()
    }
    
    func updateName() {
        DispatchQueue.global().async {
            self.lock.lock()
            print(self.name) // Считываем имя из global
            print(Thread.current)
            self.lock.unlock()
        }
        
        print(self.name) // Считываем имя из main
    }
    
}

/*
 В данном примере проблема с гонкой данных (Data Race), вызванная ленивой переменной.
 */
