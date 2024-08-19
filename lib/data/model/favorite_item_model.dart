class FavoriteItemDetailsModel {
  int itemId;
  bool isFavorite;
  bool isGood;
  bool isLike;
  bool isDelicious;

  FavoriteItemDetailsModel(
      {required this.isFavorite,
      required this.isGood,
      required this.isLike,
      required this.isDelicious,
      required this.itemId});
}
