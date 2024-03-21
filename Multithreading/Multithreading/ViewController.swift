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
        // 1. Подзадача - Будет взаимная блокировка.
        //        let serialQueue = DispatchQueue(label: "com.example.myQueue")
        //
        //        serialQueue.async {
        //            serialQueue.async {
        //                print("This will never be printed.")
        //                    // deadlock
        //            }
        //        }
        
        // 2. Подзадача - Будет происходить состояние гонки
        //        var sharedResource = 0
        //
        //        DispatchQueue.global(qos: .background).sync {
        //            for _ in 1...100 {
        //                sharedResource += 1
        //                print("Queue 1")
        //            }
        //        }
        //
        //        DispatchQueue.global(qos: .background).sync {
        //            for _ in 1...100 {
        //                sharedResource += 1
        //                print("Queue 2")
        //            }
        //        }
        
        // 3. Подзадача - Активная блокировка
        //        let lock = NSLock()
        //
        //        var people1 = People1()
        //        var people2 = People2()
        //
        //        let thread1 = Thread {
        //            lock.lock()
        //            people1.walkPast(with: people2)
        //            lock.unlock()
        //        }
        //
        //        thread1.start()
        //
        //        let thread2 = Thread {
        //            lock.lock()
        //            people2.walkPast(with: people1)
        //            lock.unlock()
        //        }
        //
        //        thread2.start()
        
        // 4. Подзадача - инверсия приоритетов
        
        DispatchQueue.global().async {
            self.thread1()
        }
        
        DispatchQueue.global().async {
            self.thread2()
        }
    }
    
    let resourceASemaphore = DispatchSemaphore(value: 1)
    let resourceBSemaphore = DispatchSemaphore(value: 1)
    
    func thread1() {
        print("Поток 1 пытается захватить Ресурс A")
        resourceASemaphore.wait() // Захват Ресурса A
        
        print("Поток 1 захватил Ресурс A и пытается захватить Ресурс B")
        Thread.sleep(forTimeInterval: 1) // Имитация работы для демонстрации livelock
        
        //resourceBSemaphore.wait() // Попытка захвата Ресурса B, который уже занят Потоком 2
        print("Поток 1 захватил Ресурс B")
        
        //resourceBSemaphore.signal()
        resourceASemaphore.signal()
    }
    
    func thread2() {
        print("Поток 2 пытается захватить Ресурс B")
        resourceBSemaphore.wait() // Захват Ресурса B
        
        print("Поток 2 захватил Ресурс B и пытается захватить Ресурс A")
        Thread.sleep(forTimeInterval: 1) // Имитация работы для демонстрации livelock
        
        // resourceASemaphore.wait() // Попытка захвата Ресурса A, который уже занят Потоком 1
        print("Поток 2 захватил Ресурс A")
        
        //resourceASemaphore.signal()
        resourceBSemaphore.signal()
    }
    
}

//class People1 {
//    var isDifferentDirections = false
//    let condition = NSCondition()
//    func walkPast(with people: People2) {
//        while (!people.isDifferentDirections) {
//            self.condition.lock()
//            print("People1 не может обойти People2")
//            sleep(1)
//            self.condition.wait()
//        }
//
//        print("People1 смог пройти прямо")
//        isDifferentDirections = true
//
//        self.condition.signal()
//        self.condition.unlock()
//    }
//}
//
//class People2 {
//    var isDifferentDirections = false
//    let condition = NSCondition()
//    func walkPast(with people: People1) {
//        while (!people.isDifferentDirections) {
//            self.condition.lock()
//            print("People2 не может обойти People1")
//            sleep(1)
//            self.condition.wait()
//        }
//
//        print("People2 смог пройти прямо")
//        isDifferentDirections = true
//
//        self.condition.signal()
//        self.condition.unlock()
//    }
//}
