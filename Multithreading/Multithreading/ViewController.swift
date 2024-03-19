//
//  ViewController.swift
//  Multithreading
//
//  Created by Dmitriy Starozhilov on 19.03.2024.
//

import UIKit

//class ViewController: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        print(2)
//        DispatchQueue.main.async {
//            print(3)
//            DispatchQueue.main.sync {
//                print(5)
//            }
//            print(4)
//        }
//        print(6)
//    }
//}
//
//let vc = ViewController()
//print(1)
//let view = vc.view
//print(7)

/*
 Думаю, в консоль выведется: 2, 6, 3, 4, 5, 1, 7 (Вывелось: 2, 6, 1, 7)
 Метод viewDidLoad() вызвался, так как находится в главном потоке.
 */

//class ViewController: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        print(2)
//        DispatchQueue.main.async {
//            print(3)
//            DispatchQueue.main.async {
//                print(5)
//            }
//            print(4)
//        }
//        print(6)
//    }
//}
//
//let vc = ViewController()
//print(1)
//let view = vc.view
//print(7)
