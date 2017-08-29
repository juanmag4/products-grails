package productsapi

import grails.converters.JSON

class ProductsTestController {

    /*
    * Get all the products and loaded into the index page (index.gsp)
    */
    def index() {
        def products = productsapi.Product.list()

        [productsList: products]
    }

    /*
    * Get a specific product by its id and loaded into the show products page (showProduct.gsp)
    */
    def showProduct(Integer id) {
        def product = productsapi.Product.get(id)

        [productInstance: product]
    }

    /*
    * Creates a new object to be fill with data in the add product page (addProduct.gsp)
    */
    def addProduct() {
        [productInstance: new Product(params)]
    }

    /*
    * Get a specific product by its id and loads it information into the edit product page (editProduct.gsp)
    */
    def editProduct(Integer id) {
        def product = productsapi.Product.get(id)
        [productInstance: product]
    }

    /*
    * Renders all products or a reduced list by search with JSON format
    */
    def productsJson() {

        if (params.query) {
            render productsapi.Product.findAllByNameLikeOrDescriptionLike("%" + params.query + "%", "%" + params.query + "%") as JSON
        }

        render productsapi.Product.list() as JSON
    }

    /*
    * Creates a new product object with data through parameters and saves it to the DB, then it redirects to the index page
    */
    def saveProduct() {
        def productInstance = new Product(params)

        if (!productInstance.save()) {
            render(view: 'addProduct', model: [productInstance: productInstance])
            return
        }

        redirect(action: 'index')
    }

    /*
    * Gets a product by id and saves it changes to the DB, then redirects to the index page
    */
    def updateProduct(Integer id) {
        def productInstance = productsapi.Product.get(id)

        productInstance.properties = params

        if (!productInstance.save()) {
            render(view: "edit", model: [productInstance: productInstance])
            return
        }

        redirect(action: "index")
    }

    /*
    * Gets a product by id and deletes it, then redirects to the index page
    */
    def deleteProduct(Integer id) {
        def productInstance = productsapi.Product.get(id)

        productInstance.delete()

        redirect(action: 'index')
    }

    /*
    * Search products by name and description and renders the index page with them
    */
    def searchProducts(String query) {
        def products = productsapi.Product.findAllByNameLikeOrDescriptionLike("%" + query + "%", "%" + query + "%")

        render(view: 'index', model: [productsList: products])
    }
}
