import 'dart:convert';
import 'dart:developer';

import 'package:currency_converter/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class CurrencyRepo {
  var currencyRate;
    Future <Map<String, dynamic>> getCurrencyList( bool isForList) async{
      String url;
      if(isForList){
       url='https://api.freecurrencyapi.com/v1/currencies?apikey=$API_KEY';
      }else{
        url='https://api.freecurrencyapi.com/v1/latest?apikey=$API_KEY&base_currency=INR';
      }

          Uri uri= Uri.parse(url);
          await http.get(uri).then((response){
            if(response.statusCode==200){
            final decodedData=jsonDecode(response.body);
            currencyRate=decodedData['data'];
            }else{
              //handle the error as per status code 
              //statuscode==401 : Invalid API key
            }
          }
          ).catchError((error){
            log('Failde to get data $error');
          });

     return currencyRate;
  }
}
final CurrencyRepoProvider= Provider((ref)=> CurrencyRepo());