enum Category { grocery, home, health }

class Product {
  final String id;
  final String name;
  final String quantity;
  final String desc;
  final String imageURL;
  final Category category;
  final double price;
  final String merchant;
  final bool available;

  const Product(
      {this.id,
        this.name,
        this.quantity,
        this.desc,
        this.imageURL,
        this.category,
        this.price,
        this.merchant,
        this.available});

  Product.fromMap(Map<String, dynamic> data, String id)
      : this(
    id: id,
    name: data['name'],
    quantity: data['quantity'],
    desc: data['desc'],
    imageURL: data['image'],
    category: Category.grocery,
    price: data['price'].toDouble(),
    merchant: data['merchant'],
    available: data['available'],
  );
}
