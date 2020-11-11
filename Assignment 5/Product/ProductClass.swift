//
//  ProductClass.swift
//  Assignment 5
//
//  Created by admin on 10/23/20.
//

import Foundation

class ProductClass {
    
    var prod_Name: String ;
    var category_name: String;
    var supplier_id : Int;
    var prod_AvailableQuantity : Int;
    var prod_Type : String;
    var prod_dept_Id : Int;
    
    
    init(prod_Name: String, category_name: String,supplier_id : Int, prod_AvailableQuantity : Int, prod_Type : String, prod_dept_Id : Int) {
        
        self.prod_Name = prod_Name;
        self.category_name = category_name;
        self.supplier_id = supplier_id;
        self.prod_AvailableQuantity = prod_AvailableQuantity;
        self.prod_Type = prod_Type;
        self.prod_dept_Id = prod_dept_Id;
    }

}

