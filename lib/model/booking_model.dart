// ignore_for_file: unnecessary_this

import 'package:nestigo/model/property_model.dart';

enum BookingStatus { upcoming, completed, cancelled, ongoing }

class BookingModel {
  final String id;
  final PropertyModel property;
  final DateTime checkIn;
  final DateTime checkOut;
  final double totalPrice;
  final BookingStatus status;
  final DateTime bookingDate;

  BookingModel({
    required this.id,
    required this.property,
    required this.checkIn,
    required this.checkOut,
    required this.totalPrice,
    required this.status,
    DateTime? bookingDate,
  }) : this.bookingDate = bookingDate ?? DateTime.now();

  static List<BookingModel> dummyBookings = [
    BookingModel(
      id: '1',
      property: PropertyModel.dummyProperties[0],
      checkIn: DateTime.now().add(const Duration(days: 5)),
      checkOut: DateTime.now().add(const Duration(days: 10)),
      totalPrice: 3500 * 5,
      status: BookingStatus.upcoming,
      bookingDate: DateTime.now().subtract(const Duration(days: 1)),
    ),
    BookingModel(
      id: '2',
      property: PropertyModel.dummyProperties[1],
      checkIn: DateTime.now().add(const Duration(days: 2)),
      checkOut: DateTime.now().add(const Duration(days: 6)),
      totalPrice: 2500 * 4,
      status: BookingStatus.upcoming,
      bookingDate: DateTime.now().subtract(const Duration(days: 2)),
    ),
    BookingModel(
      id: '3',
      property: PropertyModel.dummyProperties[2],
      checkIn: DateTime.now().subtract(const Duration(days: 5)),
      checkOut: DateTime.now().subtract(const Duration(days: 1)),
      totalPrice: 4000 * 4,
      status: BookingStatus.completed,
      bookingDate: DateTime.now().subtract(const Duration(days: 10)),
    ),
    BookingModel(
      id: '4',
      property: PropertyModel.dummyProperties[3],
      checkIn: DateTime.now(),
      checkOut: DateTime.now().add(const Duration(days: 3)),
      totalPrice: 3000 * 3,
      status: BookingStatus.ongoing,
      bookingDate: DateTime.now().subtract(const Duration(hours: 5)),
    ),
    BookingModel(
      id: '5',
      property: PropertyModel.dummyProperties[4],
      checkIn: DateTime.now().add(const Duration(days: 7)),
      checkOut: DateTime.now().add(const Duration(days: 10)),
      totalPrice: 2000 * 3,
      status: BookingStatus.cancelled,
      bookingDate: DateTime.now().subtract(const Duration(days: 3)),
    ),
  ];
}
