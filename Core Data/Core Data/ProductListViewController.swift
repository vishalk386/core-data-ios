//
//  ProductListViewController.swift
//  Core Data
//
//  Created by Vishal Kamble on 21/12/21.
//

import UIKit

class ProductListViewController: UIViewController {

    @IBOutlet weak var _tableView: UITableView!
    
    private let manager = ProductManager()
      var products : [ProductModel]? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        _tableView.register(UINib(nibName: "ProductViewCell", bundle: nil), forCellReuseIdentifier: "ProductViewCell")

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
              self.title = "Product List"
        products = manager.fetchProduct()
              if(products != nil && products?.count != 0)
              {
                  self._tableView.reloadData()
              }
          }

   

}
extension ProductListViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.products!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductViewCell", for: indexPath) as! ProductViewCell
        cell.setCell(item: products![indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}
