import UIKit

// TODO:
/*
 1. Fetch Data
 2. Save locally
 3. Push to Server
 
 ************* Edge case
 1. Network Visibility
 
 */

// Netowrk is avaialble
// Fecth data


// Compare || timpsatap


class NetworkManager {
    func postRequest() {}
}


struct Product {
    let id: String?
    let timeStamp = Date()
}


class LocalDatanaManager {
    
    
    private func fetchDataFromLocal() -> [Product] {
        return []
    }
    
    func itemToBeSync(products: [Product]) -> [Product]? {
        // get the list of local product
        let productsInLocalDatabase: [Product] = fetchDataFromLocal()
        let serverProduct = products
        
       
        for product in serverProduct {
            if productsInLocalDatabase.contains(where: {$0.id != product.id}) {
                
            }
        }
        
        
        
        
        
        return filterProductWhichAraNotAvailableInLocalDB = products.filter({$0.timeStamp != nil})
    }
    
}

class CartScrrenViewModel {
    
    
    
}


class CartScrrenUIViewControlle {
    
    
    let localDatanaManager: LocalDatanaManager()
    let networkManager = NetworkManager()
    var products: [Product]?
    
    init(CartScrrenViewModel: CartScrrenViewModel) {
        self.localDatanaManager = localDatanaManager
        fetchDataFromServer()
    }
    
    private func fetchDataFromServer() {
        
        products = [] //
        
        syncDataBase()
        
    }
    
    
    func syncDataBase() {
        let itemsToSync = localDatanaManager.itemToBeSync(products: products)
        if itemsToSync?.count > 0 {
            networkManager.postRequest()
        }
       
        // lewe
    }
    
}
