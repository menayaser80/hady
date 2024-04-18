class CarTypeItems {
  final String image;

  final String name;

  CarTypeItems({
    required this.image,
    required this.name,
  });
}

List<CarTypeItems> carTypeitem = [
  CarTypeItems(
    image: 'assets/images/icons8-sport-car-64.png',
    name: 'Sedan',
  ),
  CarTypeItems(
    image: 'assets/images/icons8-suv-64.png',
    name: 'SUV',
  ),
  CarTypeItems(
    image: 'assets/images/icons8-van-50.png',
    name: 'Van',
  ),
  CarTypeItems(
    image: 'assets/images/icons8-pickup-car-50.png',
    name: 'Pickup',
  ),
  CarTypeItems(
    image: 'assets/images/icons8-sport-car-64.png',
    name: 'Sport',
  ),
];
