//
//  CustomerClass.swift
//  Assignment 5
//
//  Created by admin on 10/23/20.
//

import Foundation

class CustomerClass {
    var firstName: String ;
    var lastName : String ;
    var cust_Address : String ;
    var cust_ContactDetails : String;
    var cust_EmailID : String ;
    
    init(firstName: String,lastName : String,cust_Address : String,cust_ContactDetails : String,cust_EmailID : String ) {
        
        self.firstName = firstName;
        self.lastName = lastName;
        self.cust_Address = cust_Address;
        self.cust_ContactDetails = cust_ContactDetails;
        self.cust_EmailID = cust_EmailID;
    }
 
}

    


/*

    func customersActions()  {
        
        print("\n 1- Add Customer \n 2- Delete Customer \n 3- Update Customer \n 4- View all Customers ")
        
        print("Choose action to perfoem on customers:")
        
        let customerAction = readLine();
        
        switch Int(customerAction!) {
        case 1 :
            addCustomer();
            
        case 2:
            deleteCustomer();
        default:
            "No"
        }
    }

    
    func addCustomer()  {
        print("Enter First Name:")
        let cust_firstname = readLine();
        
        print("Enter Last Name:")
        let cust_lastname = readLine();
        
        print("Enter Customer Id :")
        let id = readLine();
        let a = Int(id!);
        
        print("Enter Address :")
        let address = readLine();
        
        print("Enter Contact Details :")
        let contact = readLine();
        let b = Int(contact!);
        
        print("Enter Email Id :")
        let email = readLine();
        
        
       let customer = CustomerClass(firstName: cust_firstname!, lastName: cust_lastname!, cust_ID: a!, cust_Address: address!, cust_ContactDetails: b!, cust_EmailID: email!)
        
        print(customer);
 
        
     
        
    }



func deleteCustomer() {
    
    /*
    for items in customerArray {
        print(items);
    }
    
    print("Enter the customer name you would like to delete :")
    let deleteCust = readLine()
 */
    
}



*/
