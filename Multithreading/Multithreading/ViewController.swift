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
        
//        let phraseSemaphore = DispatchSemaphore(value: 1)
//        
//        DispatchQueue.global().async {
//            let phrasesService = PhrasesService()
//            
//            for i in 0..<10 {
//                phraseSemaphore.wait()
//                phrasesService.addPhrase("Phrase \(i)")
//                phraseSemaphore.signal()
//            }
//            
//            // Даем потокам время на завершение работы
//            Thread.sleep(forTimeInterval: 1)
//            
//            // Выводим результат
//            print(phrasesService.phrases)
//            
//            print(Thread.current)
//            print(phraseSemaphore.description)
//        }
        
        let phrasesService = PhrasesService()
        
        DispatchQueue.global().async {
            for i in 0..<10 {
                phrasesService.addPhrase("Phrase \(i)")
            }
        }
        
        // Даем потокам время на завершение работы
        Thread.sleep(forTimeInterval: 1)
        
        // Выводим результат
        print(phrasesService.phrases)
        
    }
    
    actor PhrasesService {
        var phrases: [String] = []
        
        func addPhrase(_ phrase: String) {
            phrases.append(phrase)
        }
    }
}

//class PhrasesService {
//    var phrases: [String] = []
//    
//    func addPhrase(_ phrase: String) {
//        phrases.append(phrase)
//    }
//}
