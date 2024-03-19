//
//  ViewController.swift
//  Multithreading
//
//  Created by Dmitriy Starozhilov on 19.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Thread.detachNewThread {
            for _ in (0..<10) {
                let currentThread = Thread.current
                print("1, Current thread: \(currentThread)")
            }
        }
        
        for _ in (0..<10) {
            let currentThread = Thread.current
            print("2, Current thread: \(currentThread)")
        }
    }
    /// Разгрузить главный поток. Только первый цикл перевести в другой поток с помощью Thread.detachNewThread и объяснить почему изменился вывод.
    /*
     Изменился вывод, потому что написанный код разделяет выполнение циклов в двух разных потоках.
     Первый цикл работает в отдельном потоке, который создан с помощью detachNewThread(), а второй цикл выполняется в главном потоке.
     */
}

