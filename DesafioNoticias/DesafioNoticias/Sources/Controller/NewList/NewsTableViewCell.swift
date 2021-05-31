//
//  NewsTableViewCell.swift
//  DesafioNoticias
//
//  Created by Moacir Lamego on 31/05/21.
//

import UIKit

class NewsTableViewCell: UITableViewCell {
    var imagem = UIImage()
    var title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = .textLabelColorDefault
        
        return label
    }()
    
    var subTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .textLabelColorDefault
        
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(title: String, subTitle: String) {
        setTitle()
        setSubTitle()
        
        self.title.text = title
        self.subTitle.text = subTitle
    }
    
    private func setTitle() {
        addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            title.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
        ])
    }
    
    private func setSubTitle() {
        addSubview(subTitle)
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            subTitle.topAnchor.constraint(equalTo: self.title.bottomAnchor, constant: 12),
            subTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 12),
            subTitle.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -12),
        ])
    }
}
