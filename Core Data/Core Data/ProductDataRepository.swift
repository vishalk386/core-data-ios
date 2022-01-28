//
//  ProductDataRepository.swift
//  Core Data
//
//  Created by Vishal Kamble on 21/12/21.
//

import Foundation
import CoreData

protocol ProductRepository {
    
    func create(product : ProductModel)
    func getAll() -> [ProductModel]?
    func get(byIdentifier id : UUID) -> ProductModel?
    func update(product: ProductModel) -> Bool
    func delete(product: ProductModel) -> Bool
}

struct ProductDataRepository: ProductRepository {
    
    
    func create(product: ProductModel) {
        let cdProduct = Product(context: PersistentStorage.shared.context)
        cdProduct.title = product.title
        cdProduct.date = product.date
        cdProduct.desc = product.desc
        cdProduct.image = product.image
        cdProduct.id = product.id
        cdProduct.isavailable = product.isavailable
        PersistentStorage.shared.saveContext()
    }
    
    func getAll() -> [ProductModel]? {
             let result = PersistentStorage.shared.fetchManagedObject(managedObject: Product.self)
                    var products : [ProductModel] = []
        result? .forEach({
                (cdProduct) in
            products.append(cdProduct.convertToProduct())
            })
            return products
                    
    }
    
    func get(byIdentifier id: UUID) -> ProductModel? {
        let result = getCDProduct(byIdentifier: id)
        guard result != nil else {return nil}
        return result?.convertToProduct()

    }
    
    func update(product: ProductModel) -> Bool {
        let cdProduct = getCDProduct(byIdentifier: product.id)
        guard cdProduct != nil else {return false}
       cdProduct?.title = product.title
       cdProduct?.date = product.date
       cdProduct?.image = product.image
       cdProduct?.isavailable = product.isavailable
       cdProduct?.desc = product.desc
        PersistentStorage.shared.saveContext()
        return true
    }
    
    func delete(product: ProductModel) -> Bool {
        let result = getCDProduct(byIdentifier: product.id)
        guard result != nil else {return false}
        PersistentStorage.shared.context.delete(result!)
        return true
    }
    
    func getCDProduct(byIdentifier id: UUID) -> Product? {
        let fetchRequest = NSFetchRequest<Product>(entityName: "Product")
        let predicate = NSPredicate(format: "id==%@", id as CVarArg)
        fetchRequest.predicate = predicate
        do {
            let result = try PersistentStorage.shared.context.fetch(fetchRequest).first
            guard result != nil else {return nil}
            return result
        } catch let error {
            debugPrint(error)
        }
        return nil
    }
    
    
}
