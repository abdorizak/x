//
// UserCell.swift
// usersJsonApIWithCoreData
//
// Created by Abdirizak Hassan on 3/23/24. 💻
// Copyright © 2024 Abdirizak Hassan DR X. All Rights Reserved.
//
// GitHub: https://github.com/abdorizak
// Website: https://abdorizak.dev


import Foundation
import UIKit

class UsersCell: UITableViewCell {
    
    static let identifier = String(describing: UsersCell.self)
    private var userNameLabel = UILabel()
    private var userEmailLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configCell()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configCell() {
        contentView.addsubViews(userNameLabel, userEmailLabel)
        
        userNameLabel.text = "User Name"
        userNameLabel.numberOfLines = 1
        
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userEmailLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            userEmailLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 10),
            userEmailLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            userEmailLabel.trailingAnchor.constraint(equalTo: userNameLabel.trailingAnchor)
            
        ])
    }
    
    // display data
    func displayUsersData(_ users: Users) {
        userNameLabel.text = users.name
        userEmailLabel.text = users.email
    }
    
    
}

extension UIView {
    func addsubViews(_ views: UIView...) {
        for i in views { addSubview(i)}
    }
}
