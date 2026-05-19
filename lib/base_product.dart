abstract class BaseProduct {
  final String id;
  final String title;
  final double price;
  final String company;
  final String imageUrl;

  const BaseProduct({  // ✅ constructor name should match class name
    required this.id,
    required this.title,
    required this.price,
    required this.company,
    required this.imageUrl,
  });
}
