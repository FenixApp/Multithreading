//
//  ViewController.swift
//  Multithreading
//
//  Created by Dmitriy Starozhilov on 19.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private var name = "Введите имя"
    private let lockQueue = DispatchQueue(label: "name.lock.queue")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateName()
    }
    
    func updateName() {
        DispatchQueue.global().async {
            self.lockQueue.async {
                self.name = "I love RM" // Перезаписываем имя в другом потоке
                print(Thread.current)
                print(self.name)
            }
        }
        
        lockQueue.async {
            print(self.name) // Считываем имя из main
        }
        
    }
    
}

/*
 1. Такой порядок вывелся из-за того, что вначале код выполняется на главной очереди синхронно, а затем код из глобальной очереди асинхронно. Эта задача выполняется выполняется в другом потоке, не блокируя основной поток.
 2. Такой порядок вывелся из-за того, в функции updateName DispatchQueue.global().sync стоит первой в очереди, после нее выполняется следующий print(self.name)
 Проблема - гонка данных (Data race)
 */
