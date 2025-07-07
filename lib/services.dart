import 'package:flutter/material.dart';

class FeaturedServicesSection extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  const FeaturedServicesSection(
      {super.key,
      this.padding =
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0)});

  @override
  Widget build(BuildContext context) {
    final cardData = [
      {
        'image': 'assets/hydratingserum.jpg',
        'title': 'Hydrating Skin Therapy',
        'subtitle': 'Restore moisture balance to your skin',
        'description':
            'Our advanced hydrating therapy uses hyaluronic acid and marine extracts to deeply moisturize and rejuvenate dehydrated skin.',
      },
      {
        'image': 'assets/facialtreatment.jpg',
        'title': 'Skin Analysis & Consultation',
        'subtitle': 'Personalized skin assessment',
        'description':
            'Get a comprehensive skin analysis using advanced diagnostic tools to identify your unique skin concerns and receive a personalized treatment plan.',
      },
      {
        'image': 'assets/laserhairremoval.jpg',
        'title': 'Laser Skin Rejuvenation',
        'subtitle': 'Advanced laser treatment',
        'description':
            'Experience our state-of-the-art laser skin rejuvenation to reduce fine lines, wrinkles, and improve skin texture for a youthful glow.',
      },
    ];
    return Padding(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Featured Services',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          AllFeaturedServicesPage(cardData: cardData),
                    ),
                  );
                },
                child: Row(
                  children: const [
                    Text('View all', style: TextStyle(color: Colors.pink)),
                    SizedBox(width: 4),
                    Icon(Icons.arrow_forward, color: Colors.pink, size: 18),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 320,
            child: PageView.builder(
              itemCount: cardData.length,
              controller: PageController(viewportFraction: 0.88),
              itemBuilder: (context, index) {
                final data = cardData[index];
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.pink[100]!),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.withOpacity(0.07),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: Stack(
                          children: [
                            Image.asset(
                              data['image']!,
                              height: 140,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              left: 0,
                              right: 0,
                              bottom: 0,
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.transparent,
                                      Colors.black.withOpacity(0.45),
                                    ],
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      data['title']!,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        shadows: [
                                          Shadow(
                                              blurRadius: 2,
                                              color: Colors.black26)
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      data['subtitle']!,
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    data['description']!,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.black87),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.pink,
                                    foregroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 14),
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                    elevation: 0,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            BookAppointmentPage(
                                                serviceData: data),
                                      ),
                                    );
                                  },
                                  child: const Text('Book Appointment'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class AllFeaturedServicesPage extends StatelessWidget {
  final List<Map<String, String>> cardData;
  const AllFeaturedServicesPage({super.key, required this.cardData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Featured Services'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: cardData.length,
        itemBuilder: (context, index) {
          final data = cardData[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.pink[100]!),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.pink.withOpacity(0.07),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: Stack(
                    children: [
                      Image.asset(
                        data['image']!,
                        height: 170,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.45),
                              ],
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data['title']!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  shadows: [
                                    Shadow(blurRadius: 2, color: Colors.black26)
                                  ],
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                data['subtitle']!,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['description']!,
                        style: const TextStyle(
                            fontSize: 14, color: Colors.black87),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                            elevation: 0,
                          ),
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    BookAppointmentPage(serviceData: data),
                              ),
                            );
                          },
                          child: const Text('Book Appointment'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class SkincareServicesSection extends StatelessWidget {
  const SkincareServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Skincare Services',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Discover our range of premium dermatology treatments and services',
                  style: TextStyle(fontSize: 16, color: Colors.pink),
                ),
                const SizedBox(height: 24),
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 24,
                  runSpacing: 24,
                  children: const [
                    _ServiceCard(
                      icon: Icons.calendar_today,
                      title: 'Easy Booking',
                      description: 'Book online 24/7 at your convenience',
                    ),
                    _ServiceCard(
                      icon: Icons.person_outline,
                      title: 'Expert Providers',
                      description:
                          'All services performed by certified dermatologists',
                    ),
                    _ServiceCard(
                      icon: Icons.access_time,
                      title: 'Flexible Scheduling',
                      description:
                          'Early morning and evening appointments available',
                    ),
                    _ServiceCard(
                      icon: Icons.credit_card,
                      title: 'Insurance Accepted',
                      description:
                          'We work with most major insurance providers',
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const FeaturedServicesSection(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0)),
        ],
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 400;
    final cardWidth = isMobile ? screenWidth - 48 : 250.0;
    return Container(
      width: cardWidth,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.pink[100]!),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment:
            isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.pink, size: 32),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
            textAlign: isMobile ? TextAlign.center : TextAlign.start,
          ),
        ],
      ),
    );
  }
}

class BookAppointmentPage extends StatefulWidget {
  final Map<String, String> serviceData;
  const BookAppointmentPage({super.key, required this.serviceData});

  @override
  State<BookAppointmentPage> createState() => _BookAppointmentPageState();
}

class _BookAppointmentPageState extends State<BookAppointmentPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void submitForm() {
    if (_formKey.currentState!.validate() &&
        selectedDate != null &&
        selectedTime != null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Appointment Booked'),
          content: const Text('Your appointment has been booked successfully!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Appointment'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (widget.serviceData['image'] != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    widget.serviceData['image']!,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              const SizedBox(height: 24),
              Text(
                widget.serviceData['title'] ?? '',
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 28),
              Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pink.withOpacity(0.07),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) => value == null || value.isEmpty
                              ? 'Please enter your name'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Please enter your email'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          controller: phoneController,
                          decoration: const InputDecoration(
                            labelText: 'Phone Number',
                            border: OutlineInputBorder(),
                          ),
                          keyboardType: TextInputType.phone,
                          validator: (value) => value == null || value.isEmpty
                              ? 'Please enter your phone number'
                              : null,
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: pickDate,
                                child: Text(selectedDate == null
                                    ? 'Select Date'
                                    : '${selectedDate!.year}-${selectedDate!.month.toString().padLeft(2, '0')}-${selectedDate!.day.toString().padLeft(2, '0')}'),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: pickTime,
                                child: Text(selectedTime == null
                                    ? 'Select Time'
                                    : selectedTime!.format(context)),
                              ),
                            ),
                          ],
                        ),
                        if (selectedDate == null || selectedTime == null)
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('Please select date and time',
                                style: TextStyle(color: Colors.red)),
                          ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            onPressed: submitForm,
                            child: const Text('Submit'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
