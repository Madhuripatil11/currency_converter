class Currency {
  final Map <String, dynamic>? currencyRate;
  String currencyResult;
  String selectedCurrency;


  Currency({
    this.currencyRate,
    required this.currencyResult,
    required this.selectedCurrency});


  Currency copyWith({
   Map <String, dynamic> ?currencyRate,
   String? currencyResult,
   String? selectedCurrency,

  }){
    return Currency(currencyRate: currencyRate ?? this.currencyRate,
     currencyResult: currencyResult ?? this.currencyResult,
     selectedCurrency: selectedCurrency ?? this.selectedCurrency) ;
  }
}