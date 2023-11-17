import 'package:amazonn/features/account/services/account_services.dart';
import 'package:amazonn/features/widgets/account_button.dart';
import 'package:flutter/material.dart';

class TopButton extends StatelessWidget {
  const TopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: 'Your Orders', 
              onTap: (){},
              ),
            AccountButton(
              text: 'Turn Seller', 
              onTap: (){},
              ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            AccountButton(
              text: 'Log out', 
              onTap: ()=> AccountServices().logOut(context),
              ),
            AccountButton(
              text: 'Your Wish List', 
              onTap: (){},
              ),
          ],
        )
      ],
    );
  }
}