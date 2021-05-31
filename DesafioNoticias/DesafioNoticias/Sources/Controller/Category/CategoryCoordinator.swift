//
//  CategoryCoordinator.swift
//  DesafioNoticias
//
//  Created by Moacir Lamego on 31/05/21.
//

import UIKit

class CategoryCoordinator: Coordinator {
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = CategoryViewController()
        
        viewController.onCategoryButton = { category in
            let coordinator = NewsListCoordinator(navigationController: self.navigationController, category: category)
            coordinator.start()
        }
        
        self.navigationController.pushViewController(viewController, animated: true)
    }
}
