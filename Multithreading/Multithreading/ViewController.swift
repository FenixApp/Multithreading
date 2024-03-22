//
//  ViewController.swift
//  Multithreading
//
//  Created by Dmitriy Starozhilov on 19.03.2024.
//

import UIKit

protocol RMOperationProtocol {
    // Приоритеты
    var priority: DispatchQoS.QoSClass { get }
    // Выполняемый блок
    var completionBlock: (() -> Void)? { get }
    // Завершена ли операция
    var isFinished: Bool { get }
    // Метод для запуска операции
    func start()
}

class RMOperation: RMOperationProtocol {
    var priority: DispatchQoS.QoSClass
    
    var completionBlock: (() -> Void)?
    
    var isFinished: Bool
    
    func start() {
        completionBlock!()
    }
    
    init(priority: DispatchQoS.QoSClass = .default, completionBlock: ( () -> Void)? = nil) {
        self.priority = priority
        self.completionBlock = completionBlock
        self.isFinished = false
    }
    /// В методе start. реализуйте все через глобальную паралельную очередь с приоритетами.
    
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let operationFirst = RMOperation()
        let operationSecond = RMOperation()
        
        operationFirst.priority = .userInitiated
        operationFirst.completionBlock = {
            
            for _ in 0..<50 {
                print(2)
            }
            print(Thread.current)
            print("Операция полностью завершена!")
        }
        
        operationFirst.start()
        
        operationSecond.priority = .background
        operationSecond.completionBlock = {
            
            for _ in 0..<50 {
                print(1)
            }
            print(Thread.current)
            print("Операция полностью завершена!")
        }
        operationSecond.start()
        
    }
}
