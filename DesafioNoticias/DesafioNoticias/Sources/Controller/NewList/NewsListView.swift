//
//  NewsListView.swift
//  DesafioNoticias
//
//  Created by Moacir Lamego on 31/05/21.
//

import UIKit

class NewsListView: UIView {
    //MARK: - Propertys
    private var newsViewModel: NewsViewModel?
    
    var newsListTableView = NewsListTableView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createView() {
        self.backgroundColor = .backgroundColorDefault
        
        setTableView()
    }
    
    func setViewModel(viewModel: NewsViewModel) {
        self.newsViewModel = viewModel
        self.newsListTableView.newsViewModel = self.newsViewModel
    }
    
    private func setTableView() {
        addSubview(newsListTableView)
        newsListTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            newsListTableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            newsListTableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            newsListTableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            newsListTableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
        ])
    }
}
