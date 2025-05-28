//
//  APODView.swift
//  NASA-API-MVC
//
//  Created by Paco Arvizu on 27/05/25.
//

import UIKit

class APODView: UIView{
    
    var explanation : UITextView = {
        let view: UITextView = UITextView()
        view.isEditable = false
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .left
        view.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        return view
    }()
    
    var picture : UIImageView = {
        let view: UIImageView = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 15
        view.isUserInteractionEnabled = true
        return view
    }()
    
    var title : UILabel = {
        let view: UILabel = UILabel()
        view.text = "Explanation"
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        view.numberOfLines = 2
        view.baselineAdjustment = .alignBaselines
        return view
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpUI()
    }
    
    required init?(coder: NSCoder){
        fatalError("init() has not been implemented")
    }
    
    func setUpConstraints(){
        
        let safeArea = self.safeAreaLayoutGuide
        
        let pictureConstraints = [picture.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: -64),
                                  picture.heightAnchor.constraint(equalToConstant: 272),
                                  picture.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
                                  picture.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16),
                                  picture.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor)]
        NSLayoutConstraint.activate(pictureConstraints)
        
        let titleConstraints = [title.topAnchor.constraint(equalTo: picture.bottomAnchor, constant: 8),
                                title.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 16),
                                title.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -16)]
        NSLayoutConstraint.activate(titleConstraints)
        
        let explanationConstraints = [explanation.topAnchor.constraint(equalTo: title.bottomAnchor,constant: 8),
                                      explanation.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 8),
                                      explanation.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -8),
                                      explanation.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)]
        NSLayoutConstraint.activate(explanationConstraints)
        
    }
    
    func setUpUI(){
        self.addSubview(picture)
        self.addSubview(title)
        self.addSubview(explanation)
        setUpConstraints()
    }
}
