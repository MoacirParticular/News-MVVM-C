//
//  Coordinator.swift
//  DesafioNoticias
//
//  Created by Moacir Lamego on 31/05/21.
//

import UIKit

public protocol Coordinator: AnyObject {
    func start()
}

// Só Utilizado em um projeto com StoryBoard junto
extension Coordinator {
    func getStoryBoard(nameStoryboard: String) -> UIStoryboard {
        let pathBundle: Bundle = .current
        return UIStoryboard(name: nameStoryboard, bundle: pathBundle)
    }
}

extension Bundle {
    static var current: Bundle {
        class DummyClass {
            init() { }
        }
        
        return Bundle(for: DummyClass.self)
    }
}
