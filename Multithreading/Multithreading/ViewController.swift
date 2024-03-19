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
        
        // Создаем и запускаем поток
        let infinityThread = InfinityLoop()
        infinityThread.start()
        print(infinityThread.isExecuting)
        
        // Подождем некоторое время, а затем отменяем выполнение потока
        sleep(2)
        print(infinityThread.isCancelled)
        
        // Отменяем тут
        while !infinityThread.isFinished {
            if infinityThread.counter >= 5 {
                infinityThread.cancel()
            } else {
                sleep(2)
            }
        }
        print(infinityThread.isFinished)
    }
}

class InfinityLoop: Thread {
    var counter = 0
    
    override func main() {
        while counter < 30 && !isCancelled {
            counter += 1
            print(counter)
            InfinityLoop.sleep(forTimeInterval: 1)
        }
    }
}
