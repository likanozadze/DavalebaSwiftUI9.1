//
//  UITableViewRepresentable.swift
//  DavalebaSwiftUI9
//
//  Created by Lika Nozadze on 12/28/23.
//

import Foundation

import SwiftUI


struct UITableViewRepresentableView: UIViewRepresentable {
    var data: [Article]
    
    // MARK: - UIViewRepresentable
    
    func makeUIView(context: Context) -> UITableView {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.dataSource = context.coordinator
        
        return tableView
    }
    
    func updateUIView(_ uiView: UITableView, context: Context) {
        context.coordinator.data = data
        DispatchQueue.main.async {
            uiView.reloadData()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(data: data)
    }
    
    // MARK: - Coordinator
    
    class Coordinator: NSObject, UITableViewDataSource {
        var data: [Article]
        
        init(data: [Article]) {
            self.data = data
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            tableViewCell.textLabel?.numberOfLines = 0
            tableViewCell.textLabel?.text = data[indexPath.row].title
            
            return tableViewCell
        }
    }
}
