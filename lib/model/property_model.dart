import 'package:nestigo/model/rating_model.dart';

class PropertyModel {
  final String id;
  final String ownerId;
  final String title;
  final String location;
  final String imageUrl;
  final double price;
  final bool isAvailable;
  final List<String> images;
  final String description;
  final List<String> amenties;
  final double averageRating;
  final int numberOfRatings;
  final double latitude;
  final double longitude;
  final String type;

  PropertyModel({
    required this.id,
    required this.ownerId,
    required this.title,
    required this.location,
    required this.imageUrl,
    required this.price,
    required this.images,
    required this.latitude,
    required this.longitude,
    required this.type,
    this.isAvailable = true,
    this.amenties = const [],
    this.description = '',
  }) : numberOfRatings =
           RatingModel.dummyRatings
               .where((rating) => rating.propertyId == id)
               .length,
       averageRating =
           RatingModel.dummyRatings
               .where((rating) => (rating.propertyId == id))
               .fold(0.0, (sum, item) => sum + item.rating) /
           (RatingModel.dummyRatings
                   .where((rating) => rating.propertyId == id)
                   .isNotEmpty
               ? RatingModel.dummyRatings
                   .where((rating) => rating.propertyId == id)
                   .length
               : 1);

  static List<String> favouritePropertyIds = [];

  bool get isFavourite => favouritePropertyIds.contains(id);

  static void toggleFavourite(String id) {
    if (favouritePropertyIds.contains(id)) {
      favouritePropertyIds.remove(id);
    } else {
      favouritePropertyIds.add(id);
    }
  }

  static final List<PropertyModel> dummyProperties = [
    PropertyModel(
      id: '1',
      ownerId: '1',
      title: 'Luxury Downtown Apartment',
      location: 'Downtown, New York, NY',
      imageUrl:
          'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?w=800&h=600&fit=crop',
      price: 2500.0,
      images: [
        'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?w=800&h=600&fit=crop',
        'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?w=800&h=600&fit=crop',
        'https://images.unsplash.com/photo-1484154218962-a197022b5858?w=800&h=600&fit=crop',
        'https://images.unsplash.com/photo-1493809842364-78817add7ffb?w=800&h=600&fit=crop',
      ],
      latitude: 40.7589,
      longitude: -73.9851,
      type: 'Apartment',
      isAvailable: true,
      description:
          'Beautiful luxury apartment in the heart of downtown with stunning city views, modern amenities, and premium finishes throughout.',
      amenties: [
        'WiFi',
        'Air Conditioning',
        'Kitchen',
        'Parking',
        'Gym',
        'Pool',
        'Elevator',
        'Security',
        'Balcony',
        'City View',
      ],
    ),
    PropertyModel(
      id: '2',
      ownerId: '2',
      title: 'Cozy Suburban House',
      location: 'Brooklyn Heights, NY',
      imageUrl:
          'https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800&h=600&fit=crop',
      price: 3200.0,
      images: [
        'https://images.unsplash.com/photo-1570129477492-45c003edd2be?w=800&h=600&fit=crop',
        'https://images.unsplash.com/photo-1564013799919-ab600027ffc6?w=800&h=600&fit=crop',
        'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?w=800&h=600&fit=crop',
        'https://images.unsplash.com/photo-1512918728675-ed5a9ecdebfd?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ],
      latitude: 40.6962,
      longitude: -73.9441,
      type: 'House',
      isAvailable: true,
      description:
          'Charming 3-bedroom house in quiet neighborhood with private garden, modern kitchen, and family-friendly amenities.',
      amenties: [
        'WiFi',
        'Air Conditioning',
        'Kitchen',
        'Parking',
        'Garden',
        'Laundry',
        'Pet Friendly',
        'Fireplace',
        'Dishwasher',
        'Storage',
      ],
    ),
    PropertyModel(
      id: '3',
      ownerId: '3',
      title: 'Modern Studio Loft',
      location: 'SoHo, Manhattan, NY',
      imageUrl:
          'https://images.unsplash.com/photo-1502672023488-70e25813eb80?w=800&h=600&fit=crop',
      price: 1800.0,
      images: [
        'https://images.unsplash.com/photo-1502672023488-70e25813eb80?w=800&h=600&fit=crop',
        'https://images.unsplash.com/photo-1586023492125-27b2c045efd7?w=800&h=600&fit=crop',
        'https://images.unsplash.com/photo-1522771739844-6a9f6d5f14af?w=800&h=600&fit=crop',
        'https://images.unsplash.com/photo-1560448204-e02f11c3d0e2?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      ],
      latitude: 40.7230,
      longitude: -74.0020,
      type: 'Studio',
      isAvailable: false,
      description:
          'Stylish studio loft with high ceilings, exposed brick walls, and modern amenities in trendy SoHo neighborhood.',
      amenties: [
        'WiFi',
        'Air Conditioning',
        'Kitchen',
        'Elevator',
        'Exposed Brick',
        'High Ceilings',
        'Natural Light',
        'Hardwood Floors',
        'Modern Appliances',
        'Art District',
      ],
    ),
    PropertyModel(
      id: '4',
      ownerId: '4',
      title: 'Waterfront Penthouse',
      location: 'Battery Park, Manhattan, NY',
      imageUrl:
          'https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?w=800&h=600&fit=crop',
      price: 5500.0,
      images: [
        'https://images.unsplash.com/photo-1545324418-cc1a3fa10c00?w=800&h=600&fit=crop',
        'https://images.unsplash.com/photo-1600596542815-ffad4c1539a9?w=800&h=600&fit=crop',
        'https://images.unsplash.com/photo-1600607687939-ce8a6c25118c?w=800&h=600&fit=crop',
        'https://images.unsplash.com/photo-1600566753376-12c8ab7fb75b?w=800&h=600&fit=crop',
      ],
      latitude: 40.7033,
      longitude: -74.0170,
      type: 'Penthouse',
      isAvailable: true,
      description:
          'Exclusive waterfront penthouse with panoramic harbor views, luxury finishes, and premium amenities for the discerning renter.',
      amenties: [
        'WiFi',
        'Air Conditioning',
        'Kitchen',
        'Parking',
        'Concierge',
        'Gym',
        'Pool',
        'Spa',
        'Rooftop Terrace',
        'Harbor View',
        'Premium Appliances',
        'Wine Cellar',
      ],
    ),
    PropertyModel(
      id: '5',
      ownerId: '5',
      title: 'Historic Brownstone',
      location: 'West Village, Manhattan, NY',
      imageUrl:
          'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=800&h=600&fit=crop',
      price: 4200.0,
      images: [
        'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?w=800&h=600&fit=crop',
        'https://images.unsplash.com/photo-1600566752355-35792bedcfea?w=800&h=600&fit=crop',
        'https://plus.unsplash.com/premium_photo-1683769251695-963095b23d67?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        'https://images.unsplash.com/photo-1600573472592-401b489a3cdc?w=800&h=600&fit=crop',
      ],
      latitude: 40.7353,
      longitude: -74.0027,
      type: 'Townhouse',
      isAvailable: true,
      description:
          'Beautifully restored historic brownstone with original architectural details, modern updates, and charming character.',
      amenties: [
        'WiFi',
        'Air Conditioning',
        'Kitchen',
        'Fireplace',
        'Original Details',
        'Hardwood Floors',
        'Private Entrance',
        'Garden Access',
        'Historic Character',
        'Updated Kitchen',
        'Laundry',
        'Storage',
      ],
    ),
    PropertyModel(
      id: '6',
      ownerId: '6',
      title: 'Modern High-Rise Condo',
      location: 'Midtown East, Manhattan, NY',
      imageUrl:
          'https://images.unsplash.com/photo-1560185127-6ed189bf02f4?w=800&h=600&fit=crop',
      price: 3800.0,
      images: [
        'https://images.unsplash.com/photo-1560185127-6ed189bf02f4?w=800&h=600&fit=crop',
        'https://images.unsplash.com/photo-1560185009-5bf9f2849488?w=800&h=600&fit=crop',
        'https://images.unsplash.com/photo-1560184897-ae75f418493e?w=800&h=600&fit=crop',
        'https://images.unsplash.com/photo-1560185007-cde436f6a4d0?w=800&h=600&fit=crop',
      ],
      latitude: 40.7505,
      longitude: -73.9934,
      type: 'Condo',
      isAvailable: true,
      description:
          'Sleek modern condominium with floor-to-ceiling windows, premium amenities, and convenient Midtown location.',
      amenties: [
        'WiFi',
        'Air Conditioning',
        'Kitchen',
        'Parking',
        'Gym',
        'Pool',
        'Doorman',
        'Elevator',
        'Floor-to-Ceiling Windows',
        'City View',
        'Modern Appliances',
        'In-Unit Laundry',
      ],
    ),
  ];
}
