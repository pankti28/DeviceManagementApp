//
//  HomeVC.swift
//  DeviceManagementApp
//
//  Created by Pankti Patel on 2022-04-25.
//

import Foundation
import UIKit

class HomeVC: UIViewController {
    
    var homeViewModel: HomeViewModel = HomeViewModel(repository: DeviceRepository())
    var tableRowHeight: CGFloat = 80
    
    var searchbar = UISearchBar().apply {
        $0.frame = CGRect.zero
        $0.textField?.font = AppFonts.system18Medium
        $0.showsCancelButton = true
        $0.searchBarStyle = .prominent
        $0.placeholder = AppStrings.placeholderSearch
        $0.sizeToFit()
    }
    
    var deviceListView = UITableView(frame: .zero, style: .insetGrouped).apply {
        $0.backgroundColor = UIColor.clear
        $0.separatorStyle = .singleLine
        $0.separatorColor = UIColor.clear
        $0.showsVerticalScrollIndicator = false
        $0.hideEmptyCellsFooter()
    }
    
    var deviceListFromServer: [Device] = []
    var deviceData = SearchableWrapper()
    var deviceList: [Device] {
       return self.deviceData.dataArray as! [Device]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setUpUI()
        bindData()
        setUpSearchableComponent()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }
    
    func setUpUI() {
        setUpNavigationBar()
        setUpDeviceListView()
        setUpSearchbar()
    }
    
    func bindData() {
        if !isViewLoaded {
            return
        }
         
        homeViewModel.deviceList.bindAndFire { [weak self] businesslist in
            self?.deviceListFromServer = businesslist
            DispatchQueue.main.async {
                self?.deviceListView.reloadData()
            }
        }
    }
    
    func setUpSearchableComponent() {
        self.searchbar.delegate = self.deviceData
        self.deviceData.customDelegate = self
      
        self.deviceData.searchingCallBack = { isSearching, searchText in
            print("searching Text:= \(searchText)")
            self.deviceListView.reloadData()
        }
        self.deviceData.serverArray = deviceListFromServer
    }
}

extension HomeVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deviceList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DeviceCell = deviceListView.dequeueCell(cell: DeviceCell.self)!
        cell.display(device: deviceList[indexPath.row])
       return cell
    }
}

extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableRowHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(deviceList[indexPath.row].title)
        let detailVC = DeviceDetailVC()
        detailVC.device = deviceList[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension HomeVC: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchbar.textField?.text = nil
        self.view.endEditing(true)
    }
}

extension HomeVC {
    @objc func settingTapped(_ sender: UIBarButtonItem) {
        
    }
}
