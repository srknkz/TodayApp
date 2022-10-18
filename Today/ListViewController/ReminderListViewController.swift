//
//  ViewController.swift
//  Today
//
//  Created by Игорь Сорокин on 15.10.2022.
//

import UIKit

class ReminderListViewController: UICollectionViewController {
   
    
    var dataSource: DataSource!
    var reminders: [Reminder] = Reminder.sampleData

    override func viewDidLoad() {
        super.viewDidLoad()
        let listLayout = listLayout()
        collectionView.collectionViewLayout = listLayout
        
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
            
        
        dataSource = DataSource(collectionView: collectionView) { (collectionView: UICollectionView, IndexPath: IndexPath, itemIdentifier: Reminder.ID) in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: IndexPath, item: itemIdentifier)
        }
       var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(reminders.map {$0.id})
        dataSource.apply(snapshot)
        
        collectionView.dataSource = dataSource
    }

    private func listLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
}

