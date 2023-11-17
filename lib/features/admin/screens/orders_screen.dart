import 'package:amazonn/common/widgets/loader.dart';
import 'package:amazonn/features/widgets/single_product.dart';
import 'package:amazonn/features/admin/services/admin_services.dart';
import 'package:amazonn/features/order_details/screens/order_details.dart';
import 'package:amazonn/models/order.dart';
import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List<Order>? orders;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  void fetchOrders() async {
    orders = await adminServices.fetchAllOrders(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return orders == null
        ? const Loader()
        : GridView.builder(
            itemCount: orders!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            itemBuilder: (context, index) {
        if (orders![index].products.isNotEmpty) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          OrderDetailScreen.routeName,
          arguments: orders![index],
        );
      },
      child: SingleProduct(
        image: orders![index].products[0].images[0],
      ),
    );
  }
  // Xử lý trường hợp danh sách sản phẩm rỗng ở đây
  return SizedBox();
},

          );
  }
}