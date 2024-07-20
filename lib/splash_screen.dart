
import 'package:currency_converter/currency_converter_screen.dart';
import 'package:currency_converter/currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
  
}

class _SplashScreenState extends ConsumerState<SplashScreen> {

    @override
   void initState(){
    super.initState();
    // getCurrencyData();
  
  Future.microtask(() async {
         await ref.read(currencyProvider.notifier).getCurrencyData(false).then((value){
         Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CurrencyConverterScreen()));
      } );
  });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset('images/currency_convrt.png'),
            ),
            const Text('Currency Converter',
            style: TextStyle(fontSize: 35,
            color: Colors.white,
            fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
