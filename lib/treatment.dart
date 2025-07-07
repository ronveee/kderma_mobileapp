import 'package:flutter/material.dart';
// ...existing code...

class TreatmentTimelineSection extends StatefulWidget {
  const TreatmentTimelineSection({super.key});

  @override
  _TreatmentTimelineSectionState createState() => _TreatmentTimelineSectionState();
}

class _TreatmentTimelineSectionState extends State<TreatmentTimelineSection> {
  final List<Map<String, String>> _allTreatments = [
    {
      'treatmentName': 'Laser Hair Removal',
      'date': 'April 20, 2025',
      'status': 'Completed',
      'type': 'Laser',
      'aesthetician': 'Daniel De Asis'
    },
    {
      'treatmentName': 'Chemical Peel',
      'date': 'May 15, 2025',
      'status': 'Completed',
      'type': 'Peel',
      'aesthetician': 'Daniel De Asis'
    },
    {
      'treatmentName': 'Facial Treatment',
      'date': 'June 27, 2025',
      'status': 'Completed',
      'type': 'Facial',
      'aesthetician': 'Daniel De Asis'
    },
    {
      'treatmentName': 'Acne Therapy',
      'date': 'July 5, 2025',
      'status': 'Completed',
      'type': 'Acne',
      'aesthetician': 'Daniel De Asis'
    },
    {
      'treatmentName': 'Microdermabrasion',
      'date': 'August 10, 2025',
      'status': 'Completed',
      'type': 'Exfoliation',
      'aesthetician': 'Daniel De Asis'
    },
    {
      'treatmentName': 'Microdermabrasion',
      'date': 'August 10, 2025',
      'status': 'Completed',
      'type': 'Exfoliation',
      'aesthetician': 'Ace Sinag'
    },
    {
      'treatmentName': 'Microdermabrasion',
      'date': 'August 10, 2025',
      'status': 'Completed',
      'type': 'Exfoliation',
      'aesthetician': 'Ace Sinag'
    },
  ];

  List<Map<String, String>> _filteredTreatments = [];
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Sort by date ascending
    _allTreatments.sort((a, b) {
      final dateA = DateTime.parse(_convertToIso(a['date']!));
      final dateB = DateTime.parse(_convertToIso(b['date']!));
      return dateA.compareTo(dateB);
    });
    _filteredTreatments = List.from(_allTreatments);
    _searchController.addListener(_filterTreatments);
  }

  String _convertToIso(String date) {
    final months = {
      'January': '01',
      'February': '02',
      'March': '03',
      'April': '04',
      'May': '05',
      'June': '06',
      'July': '07',
      'August': '08',
      'September': '09',
      'October': '10',
      'November': '11',
      'December': '12',
    };
    final parts = date.split(' ');
    final month = months[parts[0]]!;
    final day = parts[1].replaceAll(',', '').padLeft(2, '0');
    final year = parts[2];
    return '$year-$month-$day';
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterTreatments() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredTreatments = _allTreatments.where((treatment) {
        final treatmentName = treatment['treatmentName']!.toLowerCase();
        final treatmentType = treatment['type']!.toLowerCase();
        final aesthetician = treatment['aesthetician']!.toLowerCase();
        return treatmentName.contains(query) ||
            treatmentType.contains(query) ||
            aesthetician.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Treatment Timeline',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Track your skincare treatments and progress',
            style: TextStyle(fontSize: 16, color: Colors.pink),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Search treatments...',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: Colors.grey[200],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _filteredTreatments.isEmpty
                ? const Center(child: Text('No treatments found'))
                : ListView.builder(
                    itemCount: _filteredTreatments.length,
                    itemBuilder: (context, index) {
                      final treatment = _filteredTreatments[index];
                      return TreatmentTimelineItem(
                        treatmentName: treatment['treatmentName']!,
                        date: treatment['date']!,
                        status: treatment['status']!,
                        type: treatment['type']!,
                        aesthetician: treatment['aesthetician']!,
                        beforeImage: _getBeforeImage(treatment['treatmentName']!),
                        afterImage: _getAfterImage(treatment['treatmentName']!),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  // Helper methods to provide before/after images by treatment name
  String? _getBeforeImage(String treatmentName) {
    switch (treatmentName) {
      case 'Laser Hair Removal':
        return 'assets/bf/laser hair removal1.jpg';
      case 'Chemical Peel':
        return 'assets/bf/chemical peel1.jpg';
      case 'Facial Treatment':
        return 'assets/bf/facial treatment1.jpg';
      case 'Acne Therapy':
        return 'assets/bf/acne therapy1.jpg';
      case 'Microdermabrasion':
        return 'assets/bf/dermabrasion.jpg';
      default:
        return null;
    }
  }

  String? _getAfterImage(String treatmentName) {
    switch (treatmentName) {
      case 'Laser Hair Removal':
        return 'assets/bf/laser hair removal2.jpg';
      case 'Chemical Peel':
        return 'assets/bf/chemical peel2.jpg';
      case 'Facial Treatment':
        return 'assets/bf/facial treatment2.jpg';
      case 'Acne Therapy':
        return 'assets/bf/acne therapy2.jpg';
      case 'Microdermabrasion':
        return 'assets/bf/dermabrasion2.jpg';
      default:
        return null;
    }
  }
}

class TreatmentTimelineItem extends StatefulWidget {
  final String treatmentName;
  final String date;
  final String status;
  final String type;
  final String aesthetician;
  final String? beforeImage;
  final String? afterImage;

  const TreatmentTimelineItem({
    Key? key,
    required this.treatmentName,
    required this.date,
    required this.status,
    required this.type,
    required this.aesthetician,
    this.beforeImage,
    this.afterImage,
  }) : super(key: key);

  @override
  _TreatmentTimelineItemState createState() => _TreatmentTimelineItemState();
}

class _TreatmentTimelineItemState extends State<TreatmentTimelineItem> {
  bool _showDetails = false;
  bool _showBeforeAfter = false;

  final Map<String, String> _treatmentImages = {
    'Laser Hair Removal': 'assets/laserhairremoval.jpg',
    'Chemical Peel': 'assets/chemicalpeel.jpg',
    'Facial Treatment': 'assets/facialtreatment.jpg',
    'Acne Therapy': 'assets/acnetherapy.jpg',
    'Microdermabrasion': 'assets/microdermabrasion.jpg',
  };

  final Map<String, Map<String, String>> _productRecommendations = {
    'laser': {
      'name': 'Soothing Aloe Gel',
      'image': 'assets/aloegel.jpg',
    },
    'peel': {
      'name': 'Hydrating Serum',
      'image': 'assets/hydratingserum.jpg',
    },
    'facial': {
      'name': 'Gentle Cleanser',
      'image': 'assets/gentlecleanser.jpg',
    },
    'acne': {
      'name': 'Acne Spot Treatment',
      'image': 'assets/acnespot.jpg',
    },
    'exfoliation': {
      'name': 'Moisturizing Cream',
      'image': 'assets/moisturizingcream.jpg',
    },
    'default': {
      'name': 'General Skincare Product',
      'image': 'assets/default_product.jpg',
    },
  };

  Map<String, String> _getProductRecommendation(String type) {
    return _productRecommendations[type.toLowerCase()] ?? _productRecommendations['default']!;
  }

  @override
  Widget build(BuildContext context) {
    final recommendation = _getProductRecommendation(widget.type);
    final treatmentImage = _treatmentImages[widget.treatmentName] ?? 'assets/images/acnetherapy.jpg';

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          ListTile(
            isThreeLine: true,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: CircleAvatar(
                      radius: 32,
                      backgroundImage: AssetImage(treatmentImage),
                      backgroundColor: Colors.grey[200],
                    ),
                  ),
                ),
                Text(widget.treatmentName, style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.date),
                Text('Type: ${widget.type}', style: TextStyle(color: Colors.grey[600])),
                Text('Aesthetician: ${widget.aesthetician}', style: TextStyle(color: Colors.blueGrey[700])),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    widget.status,
                    style: TextStyle(
                      color: Colors.green[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            trailing: TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Colors.pink,
              ),
              onPressed: () {
                setState(() {
                  _showDetails = !_showDetails;
                });
              },
              icon: Icon(_showDetails ? Icons.arrow_drop_up : Icons.arrow_drop_down),
              label: const Text('Details'),
            ),
          ),
          if (_showDetails)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              child: Column(
                children: [
                  Text(
                    widget.treatmentName,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text('Date: ${widget.date}'),
                  Text('Type: ${widget.type}'),
                  Text('Aesthetician: ${widget.aesthetician}'),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.green[100],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      widget.status,
                      style: TextStyle(
                        color: Colors.green[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  // --- Before & After Dropdown Section ---
                  if (widget.status.toLowerCase() == 'completed')
                    Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: const Text(
                            'Before & After',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              _showBeforeAfter ? Icons.expand_less : Icons.expand_more,
                              color: Colors.pink,
                            ),
                            onPressed: () {
                              setState(() {
                                _showBeforeAfter = !_showBeforeAfter;
                              });
                            },
                          ),
                        ),
                        if (_showBeforeAfter)
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    const Text('Before', style: TextStyle(fontSize: 12)),
                                    const SizedBox(height: 4),
                                    widget.beforeImage != null
                                        ? ClipRRect(
                                            borderRadius: BorderRadius.circular(8),
                                            child: Image.asset(
                                              widget.beforeImage!,
                                              height: 80,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error, stackTrace) =>
                                                  const Icon(Icons.image_not_supported, size: 48, color: Colors.grey),
                                            ),
                                          )
                                        : Container(
                                            height: 80,
                                            color: Colors.grey[200],
                                            child: const Center(child: Text('No Image')),
                                          ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  children: [
                                    const Text('After', style: TextStyle(fontSize: 12)),
                                    const SizedBox(height: 4),
                                    widget.afterImage != null
                                        ? ClipRRect(
                                            borderRadius: BorderRadius.circular(8),
                                            child: Image.asset(
                                              widget.afterImage!,
                                              height: 80,
                                              fit: BoxFit.cover,
                                              errorBuilder: (context, error, stackTrace) =>
                                                  const Icon(Icons.image_not_supported, size: 48, color: Colors.grey),
                                            ),
                                          )
                                        : Container(
                                            height: 80,
                                            color: Colors.grey[200],
                                            child: const Center(child: Text('No Image')),
                                          ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  // --- End Before & After Dropdown Section ---
                  if (widget.status.toLowerCase() == 'completed')
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.pink[50],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.pink.shade100),
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              recommendation['image']!,
                              width: 48,
                              height: 48,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.image_not_supported, size: 48, color: Colors.grey),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Icon(Icons.recommend, color: Colors.pink),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              'Recommended: ${recommendation['name']}',
                              style: const TextStyle(
                                color: Colors.pink,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
// ...existing code...