//
//  ViewController.swift
//  ViewAnimations
//
//  Created by Ahmad Ubaidillah on 04/10/21.
//

import UIKit
import ViewAnimator

class ViewController: UIViewController {
    
    private let titleList: [String] = ["Zoom Animation", "Rotate Animation", "Direction Animation"]
    
    private let tableView: UITableView = {
        let tblView = UITableView()
        tblView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        return tblView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        
        view.addSubview(tableView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let animation = AnimationType.from(direction: .bottom, offset: 150)
        UIView.animate(views: tableView.visibleCells,
                       animations: [animation])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        titleList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = titleList[indexPath.row]
        
        if(indexPath.row % 2 == 0){
            cell.backgroundColor = .systemGray
        }else{
            cell.backgroundColor = .systemMint
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if(indexPath.row == 0){
            let vc = ZoomAnimation()
//            vc.modalPresentationStyle = .automatic
//            vc.modalPresentationStyle = .currentContext
//            vc.modalPresentationStyle = .custom
//            vc.modalPresentationStyle = .formSheet
//            vc.modalPresentationStyle = .fullScreen
//            vc.modalPresentationStyle = .overCurrentContext
//            vc.modalPresentationStyle = .overFullScreen
//            vc.modalPresentationStyle = .pageSheet
//            vc.modalPresentationStyle = .popover
            present(vc, animated: true)
        } else if (indexPath.row == 1) {
            let vc = RotateAnimation()
            present(vc, animated: true)
        }else if (indexPath.row == 2) {
            let vc = MoveAnimation()
            present(vc, animated: true)
        }
    }
}
