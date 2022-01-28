//
//  Product+CoreDataProperties.swift
//  Core Data
//
//  Created by Vishal Kamble on 21/12/21.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var title: String?
    @NSManaged public var image: Data?
    @NSManaged public var desc: String?
    @NSManaged public var date: Date?
    @NSManaged public var isavailable: Bool
    
    
    func convertToProduct() -> ProductModel{
        return ProductModel(title: self.title, desc: self.desc, date: self.date, id: self.id!, image: self.image, isavailable: self.isavailable)
    }

}

extension Product : Identifiable {

}
