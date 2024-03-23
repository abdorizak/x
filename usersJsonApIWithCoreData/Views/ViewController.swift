//
// ViewController.swift
// usersJsonApIWithCoreData
//
// Created by Abdirizak Hassan on 3/23/24. 💻
// Copyright © 2024 Abdirizak Hassan DR X. All Rights Reserved.
//
// GitHub: https://github.com/abdorizak
// Website: https://abdorizak.dev


import UIKit


class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    var users: [Users] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        getUsers()
    }
    
    private func configureUI() {
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UsersCell.self, forCellReuseIdentifier: UsersCell.identifier)
        
     // Layouting..
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func getUsers() {
        
        NetworkManager.shared.getUsers { [weak self] result in
            switch result {
            case .success(let success):
                self?.users = success
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UsersCell.identifier, for: indexPath) as! UsersCell
        let item = users[indexPath.row]
        cell.displayUsersData(item)
        
        return cell
    }


}


