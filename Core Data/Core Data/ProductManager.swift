//
//  ProductManager.swift
//  Core Data
//
//  Created by Vishal Kamble on 21/12/21.
//

import Foundation

struct ProductManager {
    
    private let _productDataRepository = ProductDataRepository()
    
    func createProduct(product : ProductModel){
        _productDataRepository.create(product: product)
    }
    func fetchProduct() -> [ProductModel]? {
     return _productDataRepository.getAll()
        
    }
    func updateProduct(product: ProductModel) -> Bool{
        return _productDataRepository.update(product: product)
    }
    func deleteProduct(product: ProductModel) -> Bool{
        
        return _productDataRepository.delete(product: product)
    }
    
    func fetchProduct(byIdentifier id: UUID) -> ProductModel {
        return _productDataRepository.get(byIdentifier: id)!
    }
}
