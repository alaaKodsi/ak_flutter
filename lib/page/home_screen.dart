// ignore_for_file: library_private_types_in_public_api, avoid_print
import 'package:aktest/api/location_api.dart';
import 'package:aktest/model/location.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService apiService = ApiService();
  Location? location;
  bool isLoading = false;

  void _fetchLocation() async {
    setState(() {
      isLoading = true;
    });

    try {
      final result = await apiService.getLocation("ipAddress");
      setState(() {
        location = result;
      });
    } catch (e) {
      print('Error fetching location: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IP Location'),
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : location != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Country: ${location!.country}'),
                      Text('City: ${location!.city}'),
                      Text('Region: ${location!.regionName}'),
                      Text('ISP: ${location!.isp}'),
                      Text('Timezone: ${location!.timezone}'),
                    ],
                  )
                : const Text('No location data available'),
      ),
    );
  }
}
