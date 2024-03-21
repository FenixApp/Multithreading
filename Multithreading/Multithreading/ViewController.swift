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
        
        let asyncWorker = AsyncWorker()
        
        asyncWorker.doJobs(postNumbers: 1, 2, 3, 4, 5) { posts in
            print(Thread.current)
            print(posts.map { $0.id })
        }
    }


}

class AsyncWorker {
    func doJobs(postNumbers: Int..., completion: @escaping ([Post]) -> Void) {
        var posts = [Post]()
        
        let dispatchGroup = DispatchGroup()
        
        for i in postNumbers {
            dispatchGroup.enter()
            URLSession.shared.dataTask(with: URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/todos/\(i)")!)) { data, response, error in
                guard let data = data else {
                    return
                }
                if let post = try? JSONDecoder().decode(Post.self, from: data) {
                    posts.append(post)
                    dispatchGroup.leave()
                }
            }
            .resume()
            
        }
        dispatchGroup.wait()
        dispatchGroup.notify(queue: .main) {
            completion(posts)
        }
        
    }
}

struct Post: Codable {
    var userId: Int
    var id: Int
    var title: String
    var completed: Bool
}
