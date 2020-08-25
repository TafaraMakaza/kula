

class Product {
  final int id;
  final String name;
  final String vendor;
  final String description;
  final String image;
  final double price;
  final bool inCart;


  const Product(
      {
        this.id,
        this.name,
        this.vendor,
        this.description,
        this.image,
        this.price,
        this.inCart
      });

  factory Product.fromJson(Map<String, dynamic> data){
     return Product(
    id: data['id'],
    name: data['name'],
    vendor: data['vendor'],
    description: data['description'],
    image: data['image'],
    price: data['price'],
    inCart: data['inCart']

  );
  }
}


class ProductList {
  final List<Product> products;

  ProductList({
    this.products,
  });

  factory ProductList.fromJson(List<dynamic> parsedJson) {

    List<Product> products = new List<Product>();

    return new ProductList(
      products: products,


    );
  }

}
