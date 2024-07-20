import 'package:currency_converter/currency.dart';
import 'package:currency_converter/currency_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrencyProvider extends StateNotifier<Currency>{
 CurrencyProvider(this.ref): super (Currency(currencyResult: '00', selectedCurrency: 'USD'));

final Ref ref;

 Future getCurrencyData(bool isForList) async{
final currentRate= await ref.read(CurrencyRepoProvider).getCurrencyList(isForList);
state=state.copyWith(currencyRate: currentRate);
 }
    
   calculateCurrencyData(String selectedCurrency, String number)
 {
  final rate= state.currencyRate?[selectedCurrency];
  final inrCurrency=int.parse(number);
  final currencyResult=(inrCurrency * rate).toStringAsFixed(2);
  state= state.copyWith(currencyResult:  currencyResult);
 }

 updateSelectedCurrency(String selectedCurrency){
  state=state.copyWith(selectedCurrency: selectedCurrency);
 }

}
final currencyProvider= StateNotifierProvider<CurrencyProvider, Currency>((ref) => CurrencyProvider(ref));