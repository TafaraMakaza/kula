


import 'package:scoped_model/scoped_model.dart';

class MyModel extends Model {
  List<Product> cart = [];
  double totalCartValue = 0;

  int get total => cart.length;

  void addProduct(product) {
    int index = cart.indexWhere((i) => i.id == product.id);
    print(index);
    if (index != -1)
      updateProduct(product, product.quantity + 1);
    else {
      cart.add(product);
      calculateTotal();
      notifyListeners();
    }
  }

  void removeProduct(product) {
    int index = cart.indexWhere((i) => i.id == product.id);
    cart[index].quantity = 1;
    cart.removeWhere((item) => item.id == product.id);
    calculateTotal();
    notifyListeners();
  }

  void updateProduct(product, quantity) {
    int index = cart.indexWhere((i) => i.id == product.id);
    cart[index].quantity = quantity;
    if (cart[index].quantity == 0)
      removeProduct(product);

    calculateTotal();
    notifyListeners();
  }

  void clearCart() {
    cart.forEach((f) => f.quantity = 1);
    cart = [];
    notifyListeners();
  }

  void calculateTotal() {
    totalCartValue = 0;
    cart.forEach((f) {
      totalCartValue += f.price * f.quantity
      ;
    });
  }
}

class Product {
  int id;
  String name;
  String vendor;
  int quantity;
  String description;
  String image;
  double price;
  bool inCart;


  Product(
      {
        this.id,
        this.name,
        this.vendor,
        this.quantity,
        this.description,
        this.image,
        this.price,
        this.inCart
      });

  Product.fromMap(Map<String, dynamic> data)
      : this(
      id: data['id'],
      name: data['name'],
      vendor: data['vendor'],
      quantity: data['quantity'],
      description: data['description'],
      image: data['image'],
      price: data['price'],
      inCart: data['inCart']

  );
}
