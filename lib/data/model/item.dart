class Item {
  int id;
  String category;
  String name;
  double price;
  double reviewCount;
  String image;
  int numberOfPieces;
  int stock;
  String background;
  String? posterImage;

  Item(
      {
        required this.id,
        required this.category,
        required this.background,
        required this.name,
        required this.price,
        required this.image,
        this.posterImage,
        required this.reviewCount,
        required this.numberOfPieces,
        required this.stock,
      });
}