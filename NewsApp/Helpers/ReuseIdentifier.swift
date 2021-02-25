//
//  ReuseIdentifier.swift
//  NewsApp
//
//  Created by Евгений Самарин on 12.02.2021.
//

import Foundation
import UIKit

protocol ReuseIdentifiable {
     static var reuseIdentifier: String { get }
 }

 extension ReuseIdentifiable {
     static var reuseIdentifier: String {
         return String(describing: self)
     }
 }

 extension UITableViewCell: ReuseIdentifiable {
 }

 extension UITableViewHeaderFooterView: ReuseIdentifiable {
 }

 extension UICollectionReusableView: ReuseIdentifiable {
 }

 extension UICollectionView {
     func dequeueCell<T: UICollectionViewCell>(cellType: T.Type, for indexPath: IndexPath) -> T {
         guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier,
                 for: indexPath) as? T else {
             fatalError("fuck can't dequeue")
         }
         return cell
     }

     func register<T: UICollectionViewCell>(_ cellType: T.Type) {
         self.register(cellType, forCellWithReuseIdentifier: cellType.reuseIdentifier)
     }
 }

 extension UITableView {
     func dequeueCell<T: UITableViewCell>(cellType: T.Type, for indexPath: IndexPath) -> T {
         guard let cell = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier,
                 for: indexPath) as? T else {
             fatalError("fuck can't dequeue")
         }
         return cell
     }

     func register<T: UITableViewCell>(_ cellType: T.Type) {
         self.register(cellType, forCellReuseIdentifier: cellType.reuseIdentifier)
     }
 }
