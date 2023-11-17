import 'package:amazonn/common/widgets/loader.dart';
import 'package:amazonn/features/admin/models/sales.dart';
import 'package:amazonn/features/admin/services/admin_services.dart';
import 'package:flutter/material.dart';

class AnalysticsScreen extends StatefulWidget {
  const AnalysticsScreen({Key? key}) : super(key: key);

  @override
  State<AnalysticsScreen> createState() => _AnalysticsScreenState();
}

class _AnalysticsScreenState extends State<AnalysticsScreen> {
  final AdminServices adminServices = AdminServices();
  int? totalSales;
  List<Sales>? earnings;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getEarnings();
  }

  @override
  void dispose() {
    super.dispose();
    // Clean up resources, cancel requests, etc.
  }

  Future<void> getEarnings() async {
    try {
      var earningData = await adminServices.getEarnings(context);
      setState(() {
        totalSales = earningData['totalEarnings'];
        earnings = earningData['sales'];
        isLoading = false;
      });
    } catch (e) {
      // Handle error
      print(e.toString());
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Loader()
        : earnings == null || totalSales == null
            ? const Text('Data not available')
            : Column(
                children: [
                  Text(
                    '\$$totalSales',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
  }
}
