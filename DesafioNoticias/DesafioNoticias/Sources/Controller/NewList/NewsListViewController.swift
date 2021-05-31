//
//  NewsListViewController.swift
//  DesafioNoticias
//
//  Created by Moacir Lamego on 31/05/21.
//

import UIKit

class NewsListViewController: UIViewController {
    
    //MARK: - Propertys
    var newsListView = NewsListView(frame: .zero)
    
    
    //MARK: - DidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setView(viewModel: NewsViewModel) {
        self.title = "Lista de Noticias"
        newsListView.setViewModel(viewModel: viewModel)
    }
    
    override func loadView() {
        self.view = newsListView
    }
}
