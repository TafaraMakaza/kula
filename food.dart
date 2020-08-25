//The model for all food items in the game

class Food {
  final String name;
  final String image;

  const Food(
      {this.name,
        this.image,
        });

  Food.fromMap(Map<String, dynamic> data)
      : this(
    name: data['name'],
    image: data['image'],
  );
}
