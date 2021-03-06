//
//  PSSearchable.swift
//  DeviceManagementApp
//
//  Created by Pankti Patel on 2022-04-27.
//

import Foundation
import UIKit

public protocol SearchableData {
  /*
   @param: searchValue
   using this value from your dataModal, "searchedArray" will be generated
   */
  var searchValue: String {get}
}

public protocol Searchable {
  
  /*
   @param: serverArray
   this is the origional data array or source array, using this array we search the data
   */
  var serverArray: [SearchableData]  {get set}
  
  /*
   @param: searchedArray
   resulting array, based on the search text
   */
  var searchedArray: [SearchableData]  {get set}
  
  /*
   @param: isSearching
   to identify if user currently searching or not
   */
  var isSearching: Bool {get set}
  
  /*
   @param: dataArray
   this will return array to display the result,
   if      user searching, this will return the "searchedArray"
   else    this will return the "serverArray", main source array
   */
  var dataArray: [SearchableData]  {get}
}

public typealias SearchingCallBack = (_ isSearching: Bool, _ searchText: String)->(Void)


class SearchableWrapper: NSObject,Searchable {
    /*
       @param: customDelegate
       to support same access of UISearchBarDelegate
       */
      open var customDelegate: UISearchBarDelegate?
      
      open var serverArray: [SearchableData]  = []
      open var searchedArray: [SearchableData]  = []
      
      open var isSearching: Bool = false
      open var dataArray: [SearchableData]  {
          return isSearching ? self.searchedArray : self.serverArray
      }
      
      //callback when requied
      open var searchingCallBack: SearchingCallBack?
}

public protocol PSSearchBarDelegate: UISearchBarDelegate{}

//MARK:- UISearchBarDelegate
extension SearchableWrapper: UISearchBarDelegate{
  open func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    self.isSearching = false
    self.searchingCallBack?(self.isSearching, "")
    self.customDelegate?.searchBarCancelButtonClicked?(searchBar)
  }
  
  open func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    self.isSearching = searchText.count > 0
    self.searchedArray = self.serverArray.filter({( modelObject : SearchableData) -> Bool in
      let range = modelObject.searchValue.range(of: searchText, options: .caseInsensitive)
      return !((range?.isEmpty) ?? true)
    })
    self.searchingCallBack?(self.isSearching, searchText)
  }
  
  open func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    self.customDelegate?.searchBarSearchButtonClicked?(searchBar)
  }
    
  open func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    self.customDelegate?.searchBarTextDidBeginEditing?(searchBar)
  }
  
  public func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
    return self.customDelegate?.searchBarShouldBeginEditing?(searchBar) ?? true
  }
  
  public func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool{
    return self.customDelegate?.searchBarShouldEndEditing?(searchBar) ?? true
  }
  
  public func searchBarTextDidEndEditing(_ searchBar: UISearchBar){
    self.customDelegate?.searchBarTextDidEndEditing?(searchBar)
  }
  
  public func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool{
    return self.customDelegate?.searchBar?(searchBar,
                                           shouldChangeTextIn: range,
                                           replacementText: text) ?? true
  }
  
  public func searchBarBookmarkButtonClicked(_ searchBar: UISearchBar) {
    self.customDelegate?.searchBarBookmarkButtonClicked?(searchBar)
  }
  
  public func searchBarResultsListButtonClicked(_ searchBar: UISearchBar) {
    self.customDelegate?.searchBarResultsListButtonClicked?(searchBar)
  }
  
  public func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int){
    self.customDelegate?.searchBar?(searchBar, selectedScopeButtonIndexDidChange: selectedScope)
  }
}
