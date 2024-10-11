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
  final apiService = ApiService();
  Location? location;
  bool isLoading = false;

  void _fetchLocation() async {
    setState(() {
      isLoading = true;
    });

    final result = await apiService.getLocation("100.42.176.0");

    if (result is Success<Location, Exception>) {
      setState(() {
        location = result.value;
        isLoading = false;
      });
    } else if (result is Failure<Location, Exception>) {
      setState(() {
        print("Error is: ${result.exception}");
        isLoading = false;
      });
    }
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('IP Location'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
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
          ElevatedButton(
              onPressed: () => _fetchLocation(),
              child: const Text("Get Location"))
        ],
      ),
    );
  }
}
