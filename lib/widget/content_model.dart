class UnboardingContent {
  late String image;
  late String title;
  late String description;

  UnboardingContent(
      {required this.description, required this.image, required this.title});
}

List<UnboardingContent> contents = [
  UnboardingContent(
      description: 'pick your food from our menu\n   More than 35 times',
      image: 'images/screen1.png',
      title: 'Select from our\n    Best Menu'),
  UnboardingContent(
      description:
          'You can Pay Cash on delivery and\n   Cart payment is a available',
      image: 'images/screen2.png',
      title: 'Easy And Online Payment'),
  UnboardingContent(
      description: 'Delivery your food at your\n    Doorstep',
      image: 'images/screen3.png',
      title: 'quick Delivery at your doorstep'),

  // Add more UnboardingContent objects as needed
];
