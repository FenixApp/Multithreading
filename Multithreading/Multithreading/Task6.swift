//
//  Task6.swift
//  Multithreading
//
//  Created by Dmitriy Starozhilov on 24.03.2024.
//

import UIKit

class Task6: UIViewController {
    
    var networkService2 = NetworkService2()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemFill
        
        Task {
            do {
                let messages = try await fetchMessagesResult()
                print(messages)
            } catch {
                print("Error: \(error.localizedDescription)")
            }
            
        }
        
        func fetchMessagesResult(completion: @escaping ([Message2]) -> Void) {
            networkService2.fetchMessages { message in
                completion(message)
            }
        }
        
        @available(*, renamed: "fetchMessagesResult()")
        func fetchMessagesResult() async throws -> [Message2] {
            return try await withCheckedThrowingContinuation { continuation in
                fetchMessagesResult { messages in
                    if messages.isEmpty {
                        continuation.resume(throwing: ErrorMessages.emptyMessages)
                    } else {
                        continuation.resume(returning: messages)
                    }
                    
                }
            }
        }
    }
}
    
struct Message2: Decodable, Identifiable {
    let id: Int
    let from: String
    let message: String
}
    
class NetworkService2 {
    
    func fetchMessages(completion: @escaping ([Message2]) -> Void) {
        let url = URL(string: "https://hws.dev/user-messages.json")!
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                if let messages = try? JSONDecoder().decode([Message2].self, from: data) {
                    completion(messages)
                    return
                }
            }
            
            completion([])
        }
        .resume()
    }
}

enum ErrorMessages: Error, LocalizedError {
    case emptyMessages
    
    var errorDescription: String? {
        "EmptyMassages"
    }
}

