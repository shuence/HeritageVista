class HeritageSite {
  final String name;
  final String location;
  final List<String> images;
  final String history;
  final List<String> topAttractions;
  final List<String> nearbySites;

  HeritageSite({
    required this.name,
    required this.location,
    required this.images,
    required this.history,
    required this.topAttractions,
    required this.nearbySites,
  });
}

final List<HeritageSite> allHeritageSites = [
  HeritageSite(
    name: 'Red Fort',
    location: 'Delhi, India',
    images: [
      'https://static.toiimg.com/img/65666850/Master.jpg',
    ],
    history: 'The Red Fort is a historic fort in the city of Delhi, India, '
        'constructed in 1638 by the fifth Mughal Emperor Shah Jahan as the '
        'palace of his fortified capital Shahjahanabad.',
    topAttractions: [
      'Diwan-i-Aam',
      'Diwan-i-Khas',
      'Moti Masjid',
    ],
    nearbySites: [
      'Jama Masjid',
      'Chandni Chowk',
    ],
  ),
  HeritageSite(
    name: 'India Gate',
    location: 'Delhi, India',
    images: [
      'https://indiacsr.in/wp-content/uploads/2022/07/India-Gate.jpg',
    ],
    history: 'India Gate is a war memorial located astride the Rajpath, '
        'formerly the Kingsway, in New Delhi, India. It stands as a memorial to '
        '70,000 soldiers of the British Indian Army who died in between 1914–1921 '
        'in the First World War.',
    topAttractions: [
      'Amar Jawan Jyoti',
      'Canopy and Fountain',
      'Surrounding Lawns',
    ],
    nearbySites: [
      'Rashtrapati Bhavan',
      'National War Memorial',
    ],
  ),
  HeritageSite(
    name: 'Gateway of India',
    location: 'Mumbai, India',
    images: [
      'https://cdn.yehaindia.com/wp-content/uploads/2020/03/Gatway-of-India-image-1.jpg',
    ],
    history: 'The Gateway of India is an arch-monument built in the early '
        'twentieth century in the city of Mumbai, in the Indian state of Maharashtra. '
        'It was erected to commemorate the landing in December 1911 at Apollo Bunder, '
        'Mumbai (then Bombay) of King-Emperor George V and Queen-Empress Mary, '
        'the first British monarch to visit India.',
    topAttractions: [
      'Elephanta Caves',
      'Taj Mahal Palace Hotel',
      'Chhatrapati Shivaji Maharaj Vastu Sangrahalaya',
    ],
    nearbySites: [
      'Colaba Causeway',
      'Marine Drive',
    ],
  ),
  HeritageSite(
    name: 'Taj Mahal',
    location: 'Agra, India',
    images: [
      'https://upload.wikimedia.org/wikipedia/commons/b/bd/Taj_Mahal%2C_Agra%2C_India_edit3.jpg',
    ],
    history: 'The Taj Mahal is an ivory-white marble mausoleum on the southern '
        'bank of the river Yamuna in the Indian city of Agra. It was commissioned '
        'in 1632 by the Mughal emperor Shah Jahan to house the tomb of his favorite wife, Mumtaz Mahal.',
    topAttractions: [
      'Main Mausoleum',
      'Taj Museum',
      'Mehtab Bagh',
    ],
    nearbySites: [
      'Agra Fort',
      'Fatehpur Sikri',
    ],
  ),
  HeritageSite(
    name: 'Hawa Mahal',
    location: 'Jaipur, India',
    images: [
      'https://www.jaigarhfort.com/wp-content/uploads/2017/03/Hawa-Mahal-Evening-View.jpg',
    ],
    history: 'Hawa Mahal, the Palace of Winds, is a palace in Jaipur, India. '
        'It is constructed of red and pink sandstone. The palace sits on the edge '
        'of the City Palace, Jaipur, and extends to the Zenana, or women\'s chambers.',
    topAttractions: [
      'Jantar Mantar',
      'City Palace',
      'Albert Hall Museum',
    ],
    nearbySites: [
      'Jaigarh Fort',
      'Nahargarh Fort',
    ],
  ),
  HeritageSite(
    name: 'Qutub Minar',
    location: 'Delhi, India',
    images: [
      'https://akm-img-a-in.tosshub.com/indiatoday/images/story/201704/647_042717101905.jpg?size=690:388',
    ],
    history: 'The Qutub Minar, also spelled as Qutab Minar, is a minaret '
        'that forms part of the Qutb complex, a UNESCO World Heritage Site in the '
        'Mehrauli area of Delhi, India. Qutb Minar is a 73-metre tall tapering tower '
        'of five storeys, with a 14.3 metres base diameter, reducing to 2.7 metres '
        'at the top of the peak.',
    topAttractions: [
      'Qutub Minar itself',
      'Quwwat-ul-Islam Mosque',
      'Iron Pillar of Delhi',
    ],
    nearbySites: [
      'Lotus Temple',
      'Humayun\'s Tomb',
    ],
  ),
];
