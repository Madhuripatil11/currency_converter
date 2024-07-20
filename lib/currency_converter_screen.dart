import 'package:currency_converter/currency_list_screen.dart';
import 'package:currency_converter/currency_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrencyConverterScreen extends ConsumerStatefulWidget {
    const CurrencyConverterScreen({super.key,});

  @override
  ConsumerState<CurrencyConverterScreen> createState() => _CurrencyConverterScreenState();
}

class _CurrencyConverterScreenState extends ConsumerState<CurrencyConverterScreen> {

@override
  void initState() {
    super.initState();
    final currenyNotifier=ref.read(currencyProvider);

    dropdownItem=currenyNotifier.currencyRate!.entries.map((e){
      return DropdownMenuItem(
        value: e.key,
        child: Text(e.key),);
    }).toList();

  }
  final currencyTextEditingController= TextEditingController();
  // String currencyResult='00';
  // String selectedCurrency='USD';
  List <DropdownMenuItem> dropdownItem=[];


  @override
  Widget build(BuildContext context) {
    final currencyNotifier=ref.watch(currencyProvider);
    return  Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        centerTitle: true,
       backgroundColor: Colors.blue,
        title: const Text('Currency Converter',
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),
       actions: [
        IconButton(onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => const CurrencyListScreen() ));
          
        }, icon: const Icon(
          Icons.currency_bitcoin, 
          color: Colors.white,))
       ],),

       body:  Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('INR : ', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
               SizedBox(
                width: 100,
                child: Center(
                  child: TextField(
                    controller:currencyTextEditingController,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.white,
                    style:const  TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                    decoration:  const  InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white,
                        width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white,
                        width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white,
                        width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10),
                        ),
                      ),
                      fillColor: Colors.blue,
                      filled: true,
                    ),
                   ),
                ),
                
               ),
             
             DropdownButton(
              iconEnabledColor: Colors.white,
              style:  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              dropdownColor: Colors.blue,
              value:currencyNotifier.selectedCurrency ,
              items: dropdownItem, 
              onChanged: (value){
                ref.read(currencyProvider.notifier).updateSelectedCurrency(value);
              // selectedCurrency=value.toString();
              // setState(() {
              // });
             }
             ),
               
             Text(currencyNotifier.currencyResult, 
             style:const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),

            ],
          ),
          const SizedBox(
            height: 50,
          ),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,

              child: ElevatedButton(onPressed: () {

                ref.read(currencyProvider.notifier).calculateCurrencyData(
                  currencyNotifier.selectedCurrency, currencyTextEditingController.text);
                // setState(() {     
                // });
              },
               style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )
               ),
               child: const Text('Convert',
              style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),
              ),),
            ),
          ) ],
       ),
    );
  }
}