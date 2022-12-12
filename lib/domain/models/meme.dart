class Meme {
  Meme(
    this.fact,
    this.image,
  );
  Meme.fromJson(Map<String, dynamic> json)
      : fact = json["fact"],
        image = json["image"];
  final String image;
  final String fact;
}
