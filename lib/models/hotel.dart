
class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;

  Hotel({
    this.imageUrl,
    this.name,
    this.address,
    this.price,
  });
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/images/hotel0.jpg',
    name: 'Hotel 0',
    address: '404 Great St',
    price: 575,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel1.jpg',
    name: 'Hotel 1',
    address: '404 London St',
    price: 800,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel2.jpg',
    name: 'Hotel 2',
    address: '404 Redsea St',
    price: 540,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel1.jpg',
    name: 'Hotel 3',
    address: '404 Great St',
    price: 800,
  ),
  Hotel(
    imageUrl: 'assets/images/hotel2.jpg',
    name: 'Hotel 2',
    address: '404 Michel St',
    price: 540,
  ),
];