class CarWashItems {
  final String image;
  final int price;

  final String name;

  CarWashItems({
    required this.image,
    required this.price,
    required this.name,
  });
}

List<CarWashItems> item = [
  CarWashItems(
    image: 'assets/images/ddd.jpeg',
    price: 50,
    name: 'Dry Wash',
  ),
  CarWashItems(
    image: 'assets/images/steam wash.jpeg',
    price: 70,
    name: 'Steam Wash',
  ),
  CarWashItems(
    image: 'assets/images/foam cleanning.jpeg',
    price: 65,
    name: 'Foam Wash',
  ),
  CarWashItems(
    image: 'assets/images/polising cleanning.jpeg',
    name: 'Polishing the car serface',
    price: 90,
  ),
  CarWashItems(
    image: 'assets/images/engine cleanning.jpeg',
    price: 95,
    name: 'Engine Wash',
  ),
  CarWashItems(
    image: 'assets/images/seats cleanning.jpeg',
    price: 65,
    name: 'Seats Wash',
  ),
];
