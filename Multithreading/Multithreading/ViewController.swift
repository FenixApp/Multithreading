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
        
        print("A")
        
        DispatchQueue.main.async {
            print("B")
        }
        
        print("C")
    }
    
    
}

/*
 Выведется такой порядок: A, C, B, потому что A и C итак выполняются на главной очереди, а B только ставится в очередь, да и еще асинхронно.
 */

