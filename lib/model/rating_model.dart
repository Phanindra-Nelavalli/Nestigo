class RatingModel {
  final String id;
  final String propertyId;
  final String userId;
  final String userName;
  final double rating;
  final String comment;
  final DateTime timeStamp;

  RatingModel({
    required this.id,
    required this.propertyId,
    required this.userId,
    required this.userName,
    required this.rating,
    required this.comment,
    required this.timeStamp,
  });
  static final List<RatingModel> dummyRatings = [
    RatingModel(
      id: '1',
      propertyId: '1',
      userId: '1',
      userName: 'Alice Johnson',
      rating: 4.5,
      comment: 'Great place, very clean and well-maintained!',
      timeStamp: DateTime.now().subtract(Duration(days: 1)),
    ),
    RatingModel(
      id: '2',
      propertyId: '1',
      userId: '2',
      userName: 'Bob Smith',
      rating: 3.0,
      comment: 'Decent experience, but the wifi was slow.',
      timeStamp: DateTime.now().subtract(Duration(days: 3)),
    ),
    RatingModel(
      id: '3',
      propertyId: '2',
      userId: '3',
      userName: 'Catherine Lee',
      rating: 5.0,
      comment: 'Absolutely amazing! Will visit again.',
      timeStamp: DateTime.now().subtract(Duration(hours: 6)),
    ),
    RatingModel(
      id: '4',
      propertyId: '3',
      userId: '4',
      userName: 'David Kim',
      rating: 2.5,
      comment: 'Had some issues with the plumbing.',
      timeStamp: DateTime.now().subtract(Duration(days: 7)),
    ),
    RatingModel(
      id: '5',
      propertyId: '1',
      userId: '5',
      userName: 'Ella Patel',
      rating: 4.0,
      comment: 'Friendly staff and good location.',
      timeStamp: DateTime.now().subtract(Duration(days: 2)),
    ),
  ];
}
