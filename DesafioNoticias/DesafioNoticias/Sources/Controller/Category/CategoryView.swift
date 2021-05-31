//
//  CategoryView.swift
//  DesafioNoticias
//
//  Created by Moacir Lamego on 31/05/21.
//

import UIKit

class CategoryView: UIView {
    // MARK: Actions
    var onCategoryButton: ((_ category: CategoryType) -> Void)?
    
    // MARK: - Propertys
    
    let technologyButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.frame = .zero
        btn.backgroundColor = .blue
        btn.setTitle("Tecnologia", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 10
        
        return btn
    }()
    
    let scienceButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.frame = .zero
        btn.backgroundColor = .blue
        btn.setTitle("Ciência", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 10
        
        return btn
    }()

    let sportButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.frame = .zero
        btn.backgroundColor = .blue
        btn.setTitle("Esporte", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 10
        
        return btn
    }()

    let tourismButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.frame = .zero
        btn.backgroundColor = .blue
        btn.setTitle("Turismo", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.cornerRadius = 10
        
        return btn
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        createView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createView() {
        
        self.backgroundColor = .backgroundColorDefault
        
        setTechnologyButton()
        setScienceButton()
        setSportButton()
        setTourismButton()
    }
    
    private func setTechnologyButton() {
        technologyButton.addTarget(self, action: #selector(technologyActionButton), for: .touchUpInside)
        scienceButton.addTarget(self, action: #selector(scienceActionButton), for: .touchUpInside)
        sportButton.addTarget(self, action: #selector(sportActionButton), for: .touchUpInside)
        tourismButton.addTarget(self, action: #selector(tourismActionButton), for: .touchUpInside)
        
        addSubview(technologyButton)
        
        NSLayoutConstraint.activate([
            technologyButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 12),
            technologyButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            technologyButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            technologyButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
    
    @objc
    func technologyActionButton(sender: UIButton!) {
            onCategoryButton?(CategoryType.Technology)
    }
    
    @objc
    func scienceActionButton(sender: UIButton!) {
        onCategoryButton?(CategoryType.Science)
    }
    
    @objc
    func sportActionButton(sender: UIButton!) {
        onCategoryButton?(CategoryType.Sport)
    }
    
    @objc
    func tourismActionButton(sender: UIButton!) {
        onCategoryButton?(CategoryType.Tourism)
    }

    private func setScienceButton() {
        addSubview(scienceButton)
        
        NSLayoutConstraint.activate([
            scienceButton.topAnchor.constraint(equalTo: self.technologyButton.bottomAnchor, constant: 12),
            scienceButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            scienceButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            scienceButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }

    private func setSportButton() {
        addSubview(sportButton)
        
        NSLayoutConstraint.activate([
            sportButton.topAnchor.constraint(equalTo: self.scienceButton.bottomAnchor, constant: 12),
            sportButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            sportButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            sportButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }

    private func setTourismButton() {
        addSubview(tourismButton)
        
        NSLayoutConstraint.activate([
            tourismButton.topAnchor.constraint(equalTo: self.sportButton.bottomAnchor, constant: 12),
            tourismButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            tourismButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            tourismButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }    
}
