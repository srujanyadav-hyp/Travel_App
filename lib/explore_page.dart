// explore_page.dart
import 'package:flutter/material.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  String selectedCategory = 'architecture';
  int? hoveredIndex;

  final List<Map<String, String>> architectureCards = [
    {
      'title': 'Taj Mahal',
      'location': 'Agra, India',
      'description':
          'A white marble mausoleum built by Mughal emperor Shah Jahan.',
      'visitors': '22,000+',
      'bestTime': 'Oct to Mar',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/d/da/Taj-Mahal.jpg',
    },
    {
      'title': 'Colosseum',
      'location': 'Rome, Italy',
      'description': 'An ancient amphitheatre and a symbol of Imperial Rome.',
      'visitors': '19,000+',
      'bestTime': 'Apr to Jun',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/c/c7/Rom_%28IT%29%2C_Kolosseum_--_2024_--_0610.jpg',
    },
    {
      'title': 'Petra',
      'location': "Ma'an, Jordan",
      'description': 'Rock-cut architecture and water conduit system.',
      'visitors': '7,000+',
      'bestTime': 'Mar to May',
      'image':
          'https://images.memphistours.com/large/42f179abb6c489128ab9e1304e45781b.jpg',
    },
  ];

  final List<Map<String, String>> natureCards = [
    {
      'title': 'Bondi Beach',
      'location': 'Sydney, Australia',
      'description': 'Popular beach known for surfing and scenic views.',
      'visitors': '10,000+',
      'bestTime': 'Dec to Feb',
      'image':
          'https://thumbs.dreamstime.com/b/bondi-beach-australia-view-52707746.jpg',
    },
    {
      'title': 'Swiss Alps',
      'location': 'Switzerland',
      'description': 'Beautiful mountain range ideal for skiing and hiking.',
      'visitors': '5,000+',
      'bestTime': 'Dec to Mar',
      'image':
          'https://alpsinsight.com/wp-content/uploads/2016/02/14SPen0242.jpg',
    },
    {
      'title': 'Yellowstone National Park',
      'location': 'USA',
      'description': 'Famous for geysers, wildlife, and nature trails.',
      'visitors': '15,000+',
      'bestTime': 'Apr to Sep',
      'image':
          'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1c/84/92/2f/yellowstone-national.jpg?w=900&h=500&s=1',
    },
  ];

  final List<Map<String, String>> beliefCards = [
    {
      'title': 'Meenakshi Temple',
      'location': 'Madurai, India',
      'description': 'Historic Hindu temple with intricate carvings.',
      'visitors': '20,000+',
      'bestTime': 'Oct to Mar',
      'image':
          'https://www.sahyogmantratours.com/images/blogs/meenakshi-temple-20231009101928-1_crop.jpg',
    },
    {
      'title': 'Blue Mosque',
      'location': 'Istanbul, Turkey',
      'description': 'Famous for its blue tiles and domes.',
      'visitors': '18,000+',
      'bestTime': 'Apr to Jun',
      'image':
          'https://upload.wikimedia.org/wikipedia/commons/thumb/3/34/Blue_Mosque.jpg/2560px-Blue_Mosque.jpg',
    },
    {
      'title': "St. Peter's Basilica",
      'location': 'Vatican City',
      'description': 'Major pilgrimage site for Catholics around the world.',
      'visitors': '25,000+',
      'bestTime': 'Sep to Nov',
      'image':
          'https://www.learner.org/wp-content/uploads/2019/03/art-through-time-the-urban-experience-work-183-St.-Peters-Basilica-and-St.-Peters-Square.jpg',
    },
  ];

  List<Map<String, String>> get currentCards {
    switch (selectedCategory) {
      case 'nature':
        return natureCards;
      case 'belief':
        return beliefCards;
      default:
        return architectureCards;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _categoryButton('architecture'),
            _categoryButton('nature'),
            _categoryButton('belief'),
          ],
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: currentCards.length,
            itemBuilder: (context, index) {
              final card = currentCards[index];
              final isHovered = index == hoveredIndex;
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: MouseRegion(
                  onEnter: (_) => setState(() => hoveredIndex = index),
                  onExit: (_) => setState(() => hoveredIndex = null),
                  cursor: SystemMouseCursors.click,
                  child: InkWell(
                    onTap: () {},
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      transform: isHovered
                          ? Matrix4.translationValues(0, -8, 0)
                          : Matrix4.identity(),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 2,
                            offset: const Offset(2, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16),
                            ),
                            child: Image.network(
                              card['image'] ??
                                  'https://via.placeholder.com/300x180?text=No+Image',
                              height: 180,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  card['title'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text('Location: ${card['location'] ?? 'N/A'}'),
                                Text(
                                  'Description: ${card['description'] ?? 'N/A'}',
                                ),
                                Text(
                                  'Daily Visitors: ${card['visitors'] ?? 'N/A'}',
                                ),
                                Text(
                                  'Best Time to Visit: ${card['bestTime'] ?? 'N/A'}',
                                ),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {},
                                  child: const Text('Book to Visit'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _categoryButton(String category) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedCategory = category;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: selectedCategory == category
            ? Colors.blue
            : Colors.grey[300],
        foregroundColor: selectedCategory == category
            ? Colors.white
            : Colors.black,
      ),
      child: Text(category[0].toUpperCase() + category.substring(1)),
    );
  }
}
