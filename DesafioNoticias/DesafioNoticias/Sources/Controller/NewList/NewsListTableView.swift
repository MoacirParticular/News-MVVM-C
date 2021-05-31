//
//  NewsListTableView.swift
//  DesafioNoticias
//
//  Created by Moacir Lamego on 31/05/21.
//

import UIKit

class NewsListTableView: UIView {
    
    //MARK: Constants
    let kCell = "NewsTableViewCell"
    
    //MARK: Propertys
    var tableView = UITableView()
    var newsViewModel: NewsViewModel?
    
    
    //MARK: Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupTableView()
        setConstraintsTableView()
        tableView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: kCell)
        
        tableView.rowHeight = 100
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func setConstraintsTableView() {
        addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            tableView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            tableView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
        ])
    }
}

//MARK: - TableViewDelegate
extension NewsListTableView: UITableViewDelegate {
    public func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
}

//MARK: - TableViewDataSource
extension NewsListTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        newsViewModel?.articles.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kCell, for: indexPath as IndexPath) as! NewsTableViewCell
        
        let article = newsViewModel!.articles[indexPath.row]
        
        cell.setupView(title: article.title ?? "", subTitle: article.articleDescription ?? "")
        
        return cell
    }
}
