//
//  ListViewController.swift
//  saltside
//
//  Created by Siddhesh Redkar on 21/02/21.
//  Copyright © 2021 Siddhesh Redkar. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
 
    var itemList = ItemDetailViewModelList()
    
    let padding: CGFloat = 12
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.width - padding * 2, height: 100 + padding * 2)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    var layout: UICollectionViewFlowLayout {
        return collectionView.collectionViewLayout as! UICollectionViewFlowLayout
    }
    
    
    private let cellId = "ItemCollectionViewCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dispatchGroup = DispatchGroup()

        let dispatchQueue = DispatchQueue.global(qos: .background)

        dispatchGroup.enter()
        dispatchQueue.async {
            self.getListOfItems()
            print("List complete")
            dispatchGroup.leave()
        }

        dispatchGroup.notify(queue: .main){
            print("all opertaion done")
        }

        print("waiting For opertaion to complete")
        
        
        setConstatins()
        collectionView.register(ItemCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.contentInset = UIEdgeInsets(top: 12, left: 12, bottom: 0, right: 12)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupNavBar()
    }
    
    //MARK:SetUpNavBar
    
    func setupNavBar(){
        self.navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.prefersLargeTitles = false
        navigationItem.title = "LIST"
        self.navigationController?.navigationBar.backItem?.title = ""
    }
    
    func setConstatins(){
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    //MARK:SERVICE
    
    func getListOfItems() {
        
        DispatchQueue.main.async {
         self.customActivityIndicatory(self.view,startAnimate: true)
        }
        
        NetworkManager.shared.getItemList() { [weak self] (result) in
            //#warning("Call Dismiss")
            guard let self = self else { return } // weak returns a optional so we guard
            DispatchQueue.main.async {
             self.customActivityIndicatory(self.view,startAnimate: false)
            }
            
            switch result {
            case .success(let resp):
                
                self.itemList = resp.map({return ItemDetailViewModel(item: $0)}) 
                dump(resp)
                DispatchQueue.main.async {
                    //reaload view
                    self.collectionView.reloadData()
                }
                
                
            case .failure(let error):
                self.presentGFAlertOnMainThread(title: "Bad Stuff Happened preg", message: error.rawValue, buttonTitle: "Ok")
            }
            
        }
    }

}




extension ListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
            as! ItemCollectionViewCell
        let itemDetails = itemList[indexPath.row]
        cell.itemDetails = itemDetails
        return cell
    }
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
   
        print(indexPath.row)
    }
     
}

