//
//  main.swift
//  Assignment 5
//
//  Created by admin on 10/23/20.
//

import Foundation



    
    var customerArray = [CustomerClass]()
    var supplierArray = [SupplierClass]()
    var departmentArray = [DepartmentClass]()
    var categoryArray = [CategoryClass]()
    var productArray = [ProductClass]()

//-------------------------------------------------------------- Adding default values ----------------------------------------------------------

    let customer = CustomerClass(firstName: "Nidhi", lastName: "Badde",cust_Address: "City View", cust_ContactDetails: "632-541-2589" , cust_EmailID: "abc@abc.abc")
    customerArray.append(customer);

    let supplier = SupplierClass(sName: "Raj", sAddress: "Parker St", sPhone: "632-541-2589" , sEmail: "abc.efg@abc.com");
    supplierArray.append(supplier);

    let department = DepartmentClass(dept_Name: "Clothing");
    departmentArray.append(department);

    let category = CategoryClass(dept_Id: 0, category_Name: "Women");
    categoryArray.append(category);

    let product = ProductClass(prod_Name: "AddidasT", category_name: "Women", supplier_id:0, prod_AvailableQuantity: 5, prod_Type: "Regular", prod_dept_Id: 0);
    productArray.append(product);



   

    
    MainOptions();
    
    
        func MainOptions () {
            
           
        print("\n 1- Customers \n 2- Suppliers \n 3- Products \n 4- Departments \n 5- Categories")

        print("\nChoose the section to perform action :")
            
            let choice = readLine();
        
        switch Int(choice!) {
        
        case 1 :
            CustomersActions();
            MainOptions();
            break;
            
        case 2:
            SupplierActions();
            MainOptions();
            break;
            
        case 3:
            ProductActions();
            MainOptions();
            break;
         
        case 4:
            DepartmentActions();
            MainOptions();
            break;
            
        case 5:
            CategoriesActions();
            MainOptions();
            break;
            

        default:
            print("Enter the correct choice: ")
            MainOptions();
            break;
            
            
        }
        
    }



//------------------------------------ Customer  related functionalities -----------------------------------------------------

func CustomersActions()  {
    
    print("\n 1- Add Customer \n 2- Delete Customer \n 3- Update Customer \n 4- View all Customers  \n 5- Exit ")
    
    print("\nChoose action to perform on customers:")
    
    let customerAction = readLine();
    
    switch Int(customerAction!) {
    case 1 :
        AddCustomer();
        CustomersActions();
        break;
               
    case 2:
        DeleteCustomer();
        CustomersActions();
        break;
        
        
    case 3 :
        UpdateCustomer();
        CustomersActions();
        break;
        
    case 4:
        ViewCustomers();
        CustomersActions();
        break;
        
    case 5:
        MainOptions();
        break;
        
    default:
        print("Enter the correct choice")
        CustomersActions();
        break;
    }
}


func isValidEmail(email:String) -> Bool {
           
           let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
           let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
            let result = emailTest.evaluate(with: email)
           return result
       }

func validate(phone: String) -> Bool {
            let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
            let result = phoneTest.evaluate(with: phone)
            return result
        }



func AddCustomer()  {
    print("\nEnter First Name:")
    let cust_firstname = readLine();
    
    print("\nEnter Last Name:")
    let cust_lastname = readLine();
    
    print("\nEnter Address :")
    let address = readLine();
    
    print("\nEnter Contact Details :")
    let contact = readLine();
    
    
    if validate(phone: contact!){
        print("\nEnter Email Id :")
        let email = readLine();
        
        if isValidEmail(email: email!){
            
            let customer = CustomerClass(firstName: cust_firstname!, lastName: cust_lastname!, cust_Address: address!, cust_ContactDetails: contact!, cust_EmailID: email!);
            customerArray.append(customer);
        }else{
            print("\nEnter email in correct format (abc@xyz.com)")
        }
       
    }else{
        print("\nEnter correct contact number in format (xxx-xxx-xxxx)")
    }
    
   
   
    
    
}

func DeleteCustomer () {
    print("\nCurrent customers :")
    for items in customerArray {
        print(items.firstName , items.lastName);
    }
    
    print("\nEnter the first name of customer to be deleted :")
    let deleteCustomerFirstName = readLine();
    if customerArray.contains(where: {$0.firstName == deleteCustomerFirstName}){
        print("\nEnter Last Name of customer:")
        let deletecustomerLName = readLine();
        if customerArray.contains(where: {$0.lastName == deletecustomerLName}){
            
            let indexofdeletecust = customerArray.firstIndex(where: {$0.firstName == deleteCustomerFirstName && $0.lastName == deletecustomerLName})
            
            customerArray.remove(at: indexofdeletecust!)
        }else {
            print("Enter correct last name from above list")
        }
        
    }else{
        print("\nEnter Correct first name from the above list")
    }
    
    print("\nCustomers :")
    for items in customerArray {
        print(items.firstName , items.lastName);
    }
    
    
}

func UpdateCustomer() {
    print("\nList of all the customers : ")
    for items in customerArray {
        print(items.firstName , items.lastName);
    }
    
    print("\nEnter the first name of the customer you want to update:")
    let toUpdateCustomerFirstName = readLine();
    print("\nEnter the last name of the customer you want to update:")
    let toUpdateCustomerLastName = readLine();
    //let indexofUpdatecust = customerArray.index(where: {$0.firstName == toUpdateCustomerFirstName && $0.lastName == toUpdateCustomerLastName})
    
    
    print("\nWhat would you like to update?")
    print("\n 1- First Name \n 2- Last Name \n 3- Address \n 4- Contact Details \n 5- Email Id")
    print("\nEnter your choice:")
    let takeChoice = readLine();
    
    switch Int(takeChoice!){
    case 1:
        print("\nEnter the first name to be updated to ")
        let nametobeUpdated = readLine();
        
        customerArray.filter {$0.firstName == toUpdateCustomerFirstName && $0.lastName == toUpdateCustomerLastName }.first?.firstName = nametobeUpdated!;
        
        print("\nList of all the customers : ")
        for items in customerArray {
            print(items.firstName , items.lastName);
        }
        
        CustomersActions();
        break;
        
    case 2:
        print("\nEnter last name to be updated to:")
        let lastnametobeUpdated = readLine();
        
        customerArray.filter {$0.firstName == toUpdateCustomerFirstName && $0.lastName == toUpdateCustomerLastName }.first?.lastName = lastnametobeUpdated!;
        
        print("\nList of all the customers : ")
        for items in customerArray {
            print(items.firstName , items.lastName);
        }
        
        CustomersActions();
        break;
        
    case 3:
        print("\nEnter new address :")
        let newAddress = readLine();
        
        customerArray.filter {$0.firstName == toUpdateCustomerFirstName && $0.lastName == toUpdateCustomerLastName }.first?.cust_Address = newAddress!;
        
        CustomersActions();
        break;
        
    case 4:
        print("\nEnter new contact number :")
        let newContactNumber = readLine();
        if validate(phone: newContactNumber!){
            customerArray.filter {$0.firstName == toUpdateCustomerFirstName && $0.lastName == toUpdateCustomerLastName }.first?.cust_ContactDetails = newContactNumber!;
        }else{
            print("Enter correct contact number in format (xxx-xxx-xxxx)")
        }
        
        
        CustomersActions();
        break;
        
    case 5:
        print("\nEnter new Email Id :")
        let newEmailId = readLine();
        if isValidEmail(email: newEmailId!){
            customerArray.filter {$0.firstName == toUpdateCustomerFirstName && $0.lastName == toUpdateCustomerLastName }.first?.cust_EmailID = newEmailId!;
        }else{
            print("Enter email in correct format (abc@xyz.com)")
        }
        
        CustomersActions();
        break;
        
    default :
        print("\nEnter the correct choice:")
        UpdateCustomer();
        break;
    
    }
    
    
}

func ViewCustomers() {
   print("\nList of all the customers : ")
    for items in customerArray {
       
        print("\nName: " ,items.firstName , items.lastName)
        let custId = customerArray.firstIndex(where: {$0.firstName == items.firstName && $0.lastName == items.lastName})
        print("Customer Id: ", custId!)
        print("Address: ", items.cust_Address)
        print("Contact details: ", items.cust_ContactDetails)
        print("Email Id: ", items.cust_EmailID)
    }

}








//---------------------------------------------- Supplier related functionalities ----------------------------------------------------

func SupplierActions()  {
    
    print("\n 1- Add Supplier \n 2- Delete Supplier \n 3- Update Supplier \n 4- View all Supplier  \n 5- Exit ")
    
    print("\nChoose action to perform on customers:")
    
    let supplierAction = readLine();
    
    switch Int(supplierAction!) {
    case 1 :
        AddSupplier();
        SupplierActions();
        break;
               
    case 2:
        DeleteSupplier();
        SupplierActions();
        break;
        
        
    case 3 :
        UpdateSupplier();
        SupplierActions();
        break;
        
    case 4:
        ViewSupplier();
        SupplierActions();
        break;
        
    case 5:
        MainOptions();
        break;
        
    default:
        print("Enter the correct choice")
        SupplierActions();
        break;
    }
}
    

func AddSupplier() {
    
    print("\nEnter Name:")
    let supp_name = readLine();
    
    
    print("\nEnter Address :")
    let address = readLine();
    
    print("\nEnter Contact Phone Number :")
    let contact = readLine();
    
    if validate(phone: contact!){
        print("\nEnter Email Id :")
        let email = readLine();
        
        if isValidEmail(email: email!){
            
            let supplier = SupplierClass(sName: supp_name!, sAddress: address!, sPhone: contact!, sEmail: email!);
            supplierArray.append(supplier);
        }else{
            print("\nEnter email in correct format (abc@xyz.com)")
        }
        
    }else{
        print("\nEnter correct contact number in format (xxx-xxx-xxxx)")
    }
    
    
    
}

func DeleteSupplier() {
    
    print("\nList of Suppliers :")
    for items in supplierArray {
        
        let supplierindex = supplierArray.firstIndex(where: {$0.sName == items.sName})
        print("Unique Id: " , supplierindex!);
        print("Supplier Name: ", items.sName);
    }
    
    print("\nEnter the Id of the supplier to be deleted :")
    let deletesupplierId = readLine();
    let indextodelete = Int(deletesupplierId!)!;
    supplierArray.remove(at: indextodelete)
    
    for item in productArray {
        if(item.supplier_id == indextodelete){
            let supp_prod_delete = productArray.firstIndex(where: {$0.supplier_id == indextodelete})
            productArray.remove(at: supp_prod_delete!);
        }
    }
    
    
    print("\nSuppliers :")
    for items in supplierArray {
        let supplierindex = supplierArray.firstIndex(where: {$0.sName == items.sName})
        print("Unique Id: " , supplierindex!);
        print("Supplier Name: ", items.sName);
    }
}


func UpdateSupplier() {
    print("\nList of all the Suppliers : ")
    for items in supplierArray {
        let supplierindex = supplierArray.firstIndex(where: {$0.sName == items.sName})
        print("Unique Id: " , supplierindex!);
        print("Supplier Name: ", items.sName);
    }
    
    print("\nEnter the name of supplier you want to update:")
    let toUpdateSupplierName = readLine();
    
    
    print("\nWhat would you like to update?")
    print("\n 1- Name \n 2- Address \n 3- Contact Details \n 4- Email Id")
    let takeChoice = readLine();
    
    switch Int(takeChoice!){
    case 1:
        print("\nEnter the name to be updated to ")
        let nametobeUpdated = readLine();
        
        supplierArray.filter{$0.sName == toUpdateSupplierName}.first?.sName = nametobeUpdated!;
        
        print("\nList of all the Suppliers : ")
        for items in supplierArray {
            let supplierindex = supplierArray.firstIndex(where: {$0.sName == items.sName})
            print("Unique Id: " , supplierindex!);
            print("Supplier Name: ", items.sName);
        }
        
        SupplierActions();
        break;
        
        
    case 2:
        print("\nEnter new address :")
        let newAddress = readLine();
        
        supplierArray.filter{$0.sName == toUpdateSupplierName}.first?.sAddress = newAddress!;
        
        SupplierActions();
        break;
        
    case 3:
        print("\nEnter new contact number :")
        let newContactNumber = readLine();
        
        if validate(phone: newContactNumber!){
            supplierArray.filter{$0.sName == toUpdateSupplierName}.first?.sPhone = newContactNumber!;
            
            SupplierActions();
        }else{
            print("Enter correct contact number in format (xxx-xxx-xxxx)")
        }
        
        break;
        
    case 4:
        print("\nEnter new Email Id :")
        let newEmailId = readLine();
        if isValidEmail(email: newEmailId!){
            supplierArray.filter{$0.sName == toUpdateSupplierName}.first?.sEmail = newEmailId!;
            SupplierActions();
        }else{
            print("Enter email in correct format (abc@xyz.com)")
        }
        
        break;
        
    default :
        print("Enter the correct choice:")
        UpdateSupplier();
        break;
    
    }
    
}

func ViewSupplier () {
    
    print("\nList of Suppliers :")
    for items in supplierArray {
        
        let supplierindex = supplierArray.firstIndex(where: {$0.sName == items.sName})
        print("\nUnique Id: " , supplierindex!);
        print("Supplier Name: ", items.sName);
        print("Address: ", items.sAddress);
        print("Phone: ", items.sPhone);
        print("Email: ", items.sEmail);
    }
    
    
}


//----------------------------------------------------- Department related functionalities ------------------------------------------------

func DepartmentActions()  {
    
    print("\n 1- Add Department \n 2- Delete Department \n 3- Update Department \n 4- View all Departments  \n 5- Exit ")
    
    print("Choose action to perform on customers:")
    
    let departmentAction = readLine();
    
    switch Int(departmentAction!) {
    case 1 :
        AddDepartment();
        DepartmentActions();
        break;
               
    case 2:
        DeleteDepartment();
        DepartmentActions();
        break;
        
        
    case 3 :
        UpdateDepartment();
        DepartmentActions();
        break;
        
    case 4:
        ViewDepartment();
        DepartmentActions();
        break;
        
    case 5:
        MainOptions();
        break;
        
    default:
        print("Enter the correct choice")
        DepartmentActions();
        break;
    }
}
    

func AddDepartment() {
    
    print("Enter Name:")
    let deptname = readLine();
    
    if (deptname != ""){
        let department = DepartmentClass(dept_Name: deptname!);
        departmentArray.append(department);
    }else{
        print("Enter valid department name")
        
    }
    
    
   
}

func DeleteDepartment() {
    
    print("List of all the Departments :")
    for items in departmentArray {
        
        let departmentindex = departmentArray.firstIndex(where: {$0.dept_Name == items.dept_Name})
        print("\nUnique Id: " , departmentindex!);
        print("Department Name: ", items.dept_Name);
    }
    
    print("Enter the Id of the department to be deleted :")
    let deletedepartmentId = readLine();
    let indextodelete = Int(deletedepartmentId!)!;
    departmentArray.remove(at: indextodelete)
    
    //----------------- removing product depended on this department Id --------------------------
    
    for item in productArray {
            if(item.prod_dept_Id == indextodelete){
                let dept_prod_delete = productArray.firstIndex(where: {$0.prod_dept_Id == indextodelete})
                            let prod_deleted_name = productArray[dept_prod_delete!]
            print("\n Delete the product \(prod_deleted_name.prod_Name) as it is depent on this department")
            productArray.remove(at: dept_prod_delete!);
           
        }
    }
    
    
    //-------------------- delete category dependent on this department -------------------------------
    
    for item in categoryArray{
        if(item.dept_Id == indextodelete){
            let dept_category_delete = categoryArray.firstIndex(where: {$0.dept_Id == indextodelete})
            let cat_to_delete = categoryArray[dept_category_delete!];
            print("Deleting category name \(cat_to_delete.category_Name) as it is dependent on this department")
            categoryArray.remove(at: dept_category_delete!);
        }
    }
    
    
    print("\nDepartments :")
    for items in departmentArray {
        
        let departmentindex = departmentArray.firstIndex(where: {$0.dept_Name == items.dept_Name})
        print("\nUnique Id: " , departmentindex!);
        print("Department Name: ", items.dept_Name);
    }
}


func UpdateDepartment() {
    print("List of all the Departments : ")
    for items in departmentArray {
        
        let departmentindex = departmentArray.firstIndex(where: {$0.dept_Name == items.dept_Name})
        print("\nUnique Id: " , departmentindex!);
        print("Department Name: ", items.dept_Name);
    }
    
    print("Enter the name of department you want to update:")
    let toUpdateDepartmentName = readLine();
    
    print("Enter the name to be updated to:")
    let newName = readLine();
    
    departmentArray.filter{$0.dept_Name == toUpdateDepartmentName}.first?.dept_Name = newName!;
    
}

func ViewDepartment () {
    
    print("List of Departments :")
    for items in departmentArray {        
        let departmentindex = departmentArray.firstIndex(where: {$0.dept_Name == items.dept_Name})
        print("\nUnique Id: " , departmentindex!);
        print("Department Name: ", items.dept_Name);
    }
    
    
    
}





//------------------------------------------------------ Categories related functionalities ------------------------------------------------

func CategoriesActions()  {
   
    print("\n 1- Add Category \n 2- Delete Category \n 3- Update Category \n 4- View all Categories  \n 5- Exit ")
    
    print("Choose action to perform on customers:")
    
    let categoryAction = readLine();
    
    switch Int(categoryAction!) {
    case 1 :
        AddCategory();
        CategoriesActions();
        break;
               
    case 2:
        DeleteCategory();
        CategoriesActions();
        break;
        
        
    case 3 :
        UpdateCategory();
        CategoriesActions();
        break;
        

    case 4:
        ViewCategories()
        CategoriesActions()
        break;
        
    case 5:
        MainOptions();
        break;
        
    default:
        print("Enter the correct choice")
        CategoriesActions();
        break;
    }
}
    

func AddCategory() {
    
    print("Enter Category Name:")
    let categoryname = readLine();
    
    print("List of Departments :")
    for items in departmentArray {
        let departmentindex = departmentArray.firstIndex(where: {$0.dept_Name == items.dept_Name})
        print("\nUnique Id: " , departmentindex!);
        print("Department Name: ", items.dept_Name);
    }
    
    print("\nSelect the department for your category and add its unique Id: ")
    let cat_dept_Id = readLine();
    let dept_Id = Int(cat_dept_Id!);
    
    let category = CategoryClass(dept_Id: dept_Id!, category_Name: categoryname!);
    categoryArray.append(category);
    
   
}

func DeleteCategory() {
    
    print("List of all the Categories :")
    for items in categoryArray {
        
        let categoryindex = categoryArray.firstIndex(where: {$0.category_Name == items.category_Name && $0.dept_Id == items.dept_Id})
        
        print("\nCategory Id: " , categoryindex!);
        print("Department Id: ", items.dept_Id)
        print("Category Name: ", items.category_Name);
        
    }
    
    print("Enter the Id of the category you want to delete :")
    let deletecategoryId = readLine();
    let indextodelete = Int(deletecategoryId!)!;
    let category_delete_name = categoryArray[indextodelete];
    categoryArray.remove(at: indextodelete);
    
    //----------------- removing product depended on this category Id --------------------------
    
    for item in productArray {
        if(item.category_name == category_delete_name.category_Name){
            let category_prod_delete = productArray.firstIndex(where: {$0.category_name == category_delete_name.category_Name})
            let prod_deleted_name = productArray[category_prod_delete!]
            print("\n Delete the product \(prod_deleted_name.prod_Name) as it is depent on this category")
            productArray.remove(at: category_prod_delete!);
           
        }
    }
    
    print("\nCategories :")
    for items in categoryArray {
        
        let categoryindex = categoryArray.firstIndex(where: {$0.category_Name == items.category_Name && $0.dept_Id == items.dept_Id})
        
        print("\nCategory Id: " , categoryindex!);
        print("Department Id: ", items.dept_Id)
        print("Category Name: ", items.category_Name);
        
    }
    
}

func UpdateCategory() {
    
    print("List of all the Categories :")
    for items in categoryArray {
        
        let categoryindex = categoryArray.firstIndex(where: {$0.category_Name == items.category_Name && $0.dept_Id == items.dept_Id})
        
        print("\nCategory Id: " , categoryindex!);
        print("Department Id: ", items.dept_Id)
        print("Category Name: ", items.category_Name);
        
    }
    
    print("Enter the name of category you want to update:")
    let toUpdateCategorytName = readLine();
    
    print("What would you like to update?")
    print("\n 1- Category Name \n 2- Department Id ")
    let takeChoice = readLine();
    
    switch Int(takeChoice!){
    case 1:
        print("Enter the category name to be updated to ")
        let catnameUpdatedto = readLine();
        
        categoryArray.filter{$0.category_Name == toUpdateCategorytName}.first?.category_Name = catnameUpdatedto!;
        
  //------------------------------------------ Update category name in Product array --------------------------------------------------
        for item in productArray{
            if(item.category_name == toUpdateCategorytName){
                let prod_update_catname = productArray.firstIndex(where: {$0.category_name == toUpdateCategorytName})
                let prod_cat_name_update = productArray[prod_update_catname!];
                productArray.filter{$0.category_name == toUpdateCategorytName}.first?.category_name = catnameUpdatedto!;
                print("\n Updating the product \(prod_cat_name_update.category_name) as it is depent on this category name")
                
               
            }
        }
        
                
        print("List of all the Categories :")
        for items in categoryArray {
            
            let categoryindex = categoryArray.firstIndex(where: {$0.category_Name == items.category_Name && $0.dept_Id == items.dept_Id})
            
            print("\nCategory Id: " , categoryindex!);
            print("Department Id: ", items.dept_Id)
            print("Category Name: ", items.category_Name);
            
        }
        
        CategoriesActions();
        break;
        
        
    case 2:
        
        print("List of all the Categories :")
        for items in categoryArray {
            
            let categoryindex = categoryArray.firstIndex(where: {$0.category_Name == items.category_Name && $0.dept_Id == items.dept_Id})
            
            print("\nCategory Id: " , categoryindex!);
            print("Department Id: ", items.dept_Id)
            print("Category Name: ", items.category_Name);
            
        }
        
        print("Enter add new department Id :")
        let newDeptId = readLine();
        let deptId = Int(newDeptId!)
        categoryArray.filter{$0.category_Name == toUpdateCategorytName}.first?.dept_Id = deptId!;
        
        CategoriesActions();
        break;
        
    default:
        print("Enter correct choice:")
        UpdateCategory();
        break;
        
    }
    
}

func ViewCategories() {
    
    print("List of all the Categories :")
    for items in categoryArray {
        
        let categoryindex = categoryArray.firstIndex(where: {$0.category_Name == items.category_Name && $0.dept_Id == items.dept_Id})
        
        print("\nCategory Id: " , categoryindex!);
        print("Department Id: ", items.dept_Id)
        print("Category Name: ", items.category_Name);
        
    }
    
}




//----------------------------------------------------------- Product Related functions --------------------------------------------------------------

func ProductActions() {
    print("\n 1- Add Product \n 2- Delete Product \n 3- Update Product \n 4- View all Products  \n 5- Search Products by \n 6- Exit ")
    
    print("Choose action to perfoem on customers:")
    
    let productAction = readLine();
    
    switch Int(productAction!) {
    case 1 :
        AddProduct();
        ProductActions();
        break;
               
    case 2:
        DeleteProduct();
        ProductActions();
        break;
        
        
    case 3 :
        UpdateProduct();
        ProductActions();
        break;
        

    case 4:
        ViewProducts();
        ProductActions();
        break;
        
    case 5:
        SearchProduct();
        ProductActions();
        break;
        
    case 6:
        MainOptions();
        break;
    
        
    default:
        print("Enter the correct choice")
        ProductActions();
        break;
    }
}
    

func AddProduct() {
    
    print("Enter Product Name:")
    let productname = readLine();
    
    print("Categories :")
    for items in categoryArray {
        print(items.category_Name)
    }
    
    print("Enter the category for your product from above list : ")
    let prodCategory = readLine();
    if categoryArray.contains(where: {$0.category_Name == prodCategory})
    {
        
        print("Supplier Id and Name")
        for items in supplierArray {
            let supplierindex = supplierArray.firstIndex(where: {$0.sName == items.sName})
            print(supplierindex! , items.sName )
        }
        
        print("Add Supplier to your product by entering name :")
        let selectedSupplier = readLine();
        
        
        
        if supplierArray.contains(where: {$0.sName == selectedSupplier})
        {
            let supplierindextoadd = supplierArray.firstIndex(where: {$0.sName == selectedSupplier!})
            print("Departments :")
            for items in departmentArray {
                print(items.dept_Name);
            }
            
            print("Add your product to one of the above department, \nEnter the name of department :")
            let prod_Dept = readLine();
            
            if departmentArray.contains(where: {$0.dept_Name == prod_Dept}){
                
                let prod_dept_Id = departmentArray.firstIndex(where: {$0.dept_Name == prod_Dept})
                print("Enter available quantity of the product :")
                let prod_Quantity = readLine();
                let prodAvaiableQuantity = Int(prod_Quantity!);
                
                print("Enter type of the product:")
                let prod_Type = readLine();
                
                let product = ProductClass(prod_Name: productname!, category_name: prodCategory!, supplier_id:supplierindextoadd!, prod_AvailableQuantity: prodAvaiableQuantity!, prod_Type: prod_Type!, prod_dept_Id: prod_dept_Id!);
                
                productArray.append(product);
                
            }
            else{
                print("Department name you entered is not from above list, please enter correct dpartment name")
                AddProduct();
            }
            
            
        }else{
            print("Entered name is not present in above supplier list. Enter correct supplier name");
            AddProduct();
        }
        
    }else{
        print("Enter category from above list only ")
        AddProduct();
    }
    
   
}

func DeleteProduct() {
    
    print("List of all the Products :")
    print("Product Id and Name :")
    for items in productArray {
        let productindex = productArray.firstIndex(where: {$0.prod_Name == items.prod_Name && $0.category_name == items.category_name})
        print(productindex! ,  items.prod_Name);
    }
    
    print("Enter the Id of the product you want to delete :")
    let deleteprodId = readLine();
    let indextodelete = Int(deleteprodId!)!;
    productArray.remove(at: indextodelete);
    
    print("\nProducts :")
    for items in productArray {
        let productindex = productArray.firstIndex(where: {$0.prod_Name == items.prod_Name && $0.category_name == items.category_name})
        print(productindex! ,  items.prod_Name);
    }
    
    
}

func UpdateProduct() {
    
    print("List of all the Products :")
    print("Product Id and Name :")
    for items in productArray {
        let productindex = productArray.firstIndex(where: {$0.prod_Name == items.prod_Name && $0.category_name == items.category_name})
        print(productindex! ,  items.prod_Name);
        print("Product Quantity : ", items.prod_AvailableQuantity);
        print("Product Type : ", items.prod_Type);
    }
    
    
    print("Enter the name of product you want to update:")
    let productToUpdate = readLine();
    
    print("What would you like to update?")
    print("\n 1- Product Name \n 2- Product Quantity \n 3- Product Type ")
    let takeChoice = readLine();
    
    switch Int(takeChoice!){
    case 1:
        print("Enter the new product name to be updated to ")
        let prodnameUpdateto = readLine();
        
        productArray.filter{$0.prod_Name == productToUpdate }.first?.prod_Name = prodnameUpdateto!;
                
        print("List of all the Products :")
        for items in productArray {
            let productindex = productArray.firstIndex(where: {$0.prod_Name == items.prod_Name && $0.category_name == items.category_name})
            print(productindex! ,  items.prod_Name);
        }
        
        ProductActions();
        break;
        
        
    case 2:
        
        print("Enter new quantity of product :")
        let newquantity = Int(readLine()!);
        
        productArray.filter{$0.prod_Name == productToUpdate}.first?.prod_AvailableQuantity = newquantity!;
        
        ProductActions();
        break;
        
    case 3:
        print("Enter new product type :")
        let newProdType = readLine();
        productArray.filter{$0.prod_Name == productToUpdate}.first?.prod_Type = newProdType!;
        
        
    default:
        print("Enter correct choice:")
        UpdateProduct();
        break;
        
    }
    
}

func ViewProducts() {
    print("List of all the Products :")
    
    for items in productArray {
        let productindex = productArray.firstIndex(where: {$0.prod_Name == items.prod_Name && $0.category_name == items.category_name})
        print("Product Id : " , productindex!)
        print("Product Name : ",  items.prod_Name);
        print("Product Quantity : ", items.prod_AvailableQuantity);
        print("Product Type : ", items.prod_Type);
        print("Product Category : ", items.category_name);
        print("Supplier Id :", items.supplier_id);
        print("Department Id :", items.prod_dept_Id);
        
    }
    
}


func SearchProduct() {
    
    print("Search By :")
    print(" 1- Supplier \n 2- Category \n 3- Department \n 4- Product Name \n 5- Product Type")
    var searchChoice = readLine();
    
    switch Int(searchChoice!) {
    case 1:
        print("Supplier Id and Name")
        for items in supplierArray {
            let supplierindex = supplierArray.firstIndex(where: {$0.sName == items.sName})
            print(supplierindex! , items.sName )
        }
        
        print("\nEnter Id of supplier to get all products under him:")
        let prod_supplier_search = readLine();
        
        for item in supplierArray{
            let supplierindex = supplierArray.firstIndex(where: {$0.sName == item.sName})
            if  supplierArray.contains(where: {_ in supplierindex == Int(prod_supplier_search!)}){
              
                print("List of products under this supplier are :\n")
                
                for item in productArray {
                    
                    if(item.supplier_id == Int(prod_supplier_search!)){
                        print(item.prod_Name)
                    }
                }
            }
            else {
                print("\nThis supplier Id does not exist , Enter correct supplier Id");
                SearchProduct();
            }
        }
        break;
        
    case 2 :
        print("Category Id and Name")
        for items in categoryArray {
                   
                   let categoryindex = categoryArray.firstIndex(where: {$0.category_Name == items.category_Name && $0.dept_Id == items.dept_Id})
                   
                   print("\nCategory Id: " , categoryindex!);
                   print("Department Id: ", items.dept_Id)
                   print("Category Name: ", items.category_Name);
                   
               }
        
        print("\nEnter name of category to get all products under it:")
        let prod_category_search = readLine();
        
        for item in categoryArray{
            
            if  categoryArray.contains(where: {_ in item.category_Name == prod_category_search}){
              
                print("List of products under this category are :\n")
                
                for item in productArray {
                    
                    if(item.category_name == prod_category_search){
                        print(item.prod_Name)
                    }
                }
            }
            else {
                print("\nThis category name does not exist , Enter correct category name");
                SearchProduct();
            }
        }
        break;
        
    case 3:
        print("List of Departments :")
           for items in departmentArray {
               let departmentindex = departmentArray.firstIndex(where: {$0.dept_Name == items.dept_Name})
               print("\nUnique Id: " , departmentindex!);
               print("Department Name: ", items.dept_Name);
           }
           
        
        print("\nEnter Id of department to get all products under that:")
        let prod_dept_search = readLine();
        
        for items in departmentArray{
            let departmentindex = departmentArray.firstIndex(where: {$0.dept_Name == items.dept_Name})
            
            if  departmentArray.contains(where: {_ in departmentindex == Int(prod_dept_search!)}){
              
                print("List of products under this department are :\n")
                
                for item in productArray {
                    
                    if(item.prod_dept_Id == Int(prod_dept_search!)){
                        print(item.prod_Name)
                    }
                }
            }
            else {
                print("\nThis department Id does not exist , Enter correct department Id");
                SearchProduct();
            }
        }
        break;
        
    case 4:
        print("Enter product name :")
        let prodName = readLine();
        print("\nSearched product :")
        
        for item in productArray {
            if productArray.contains(where: {_ in item.prod_Name == prodName!}) {
                print(item.prod_Name);
            }
        }
        
        break;
        
    case 5:
        print("Enter product type :")
        let prodType = readLine();
        print("\nSearched product :")
        
        for item in productArray {
            if productArray.contains(where: {_ in item.prod_Type == prodType!}) {
                print(item.prod_Name);
            }
        }
        
        break;
        
        
    default:
        print("Enter the correct choice to Search By")
        SearchProduct();
        break;
    }
    
}
