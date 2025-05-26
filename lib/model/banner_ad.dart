class BannerAd {
  final String id;
  final String imageUrl;
  final String title;
  final String description;
  final String? link;

  BannerAd({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.description,
    this.link,
  });

  static List<BannerAd> dummyBanners = [
    BannerAd(
      id: '1',
      imageUrl:
          'https://images.unsplash.com/photo-1580587771525-78b9dba3b914?auto=format&fit=crop&w=800&q=60',
      title: 'Luxury 2BHK Apartment',
      description:
          'Fully furnished 2BHK with gym access & rooftop pool. ₹25,000/month.',
      link: 'https://rentnest.com/listing/2bhk-downtown-deluxe',
    ),
    BannerAd(
      id: '2',
      imageUrl:
          'https://images.unsplash.com/photo-1613553507747-5f8d62ad5904?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTl8fHByb3BlcnR5fGVufDB8fDB8fHww',
      title: 'Studio Near IT Park',
      description:
          'Ideal for working professionals. Walkable to tech park. ₹12,000/month.',
      link: 'https://rentnest.com/listing/studio-it-park',
    ),
    BannerAd(
      id: '3',
      imageUrl:
          'https://images.unsplash.com/photo-1648840887119-a9d33c964054?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjN8fHByb3BlcnR5fGVufDB8fDB8fHww',
      title: '3BHK Family Home',
      description:
          'Spacious 3BHK with kids play area & parking. ₹18,500/month.',
      link: 'https://rentnest.com/listing/3bhk-family-home',
    ),
    BannerAd(
      id: '4',
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1687960116506-f31f84371838?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDR8fHByb3BlcnR5fGVufDB8fDB8fHww',
      title: 'Budget 1BHK Apartment',
      description: 'Compact & affordable 1BHK in prime location. ₹9,000/month.',
      link: 'https://rentnest.com/listing/budget-1bhk',
    ),
    BannerAd(
      id: '5',
      imageUrl:
          'https://images.unsplash.com/photo-1512915922686-57c11dde9b6b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NTB8fHByb3BlcnR5fGVufDB8fDB8fHww',
      title: 'Pet-Friendly Rental',
      description: '2BHK with garden access, pets allowed! ₹14,000/month.',
      link: 'https://rentnest.com/listing/pet-friendly-2bhk',
    ),
  ];
}
