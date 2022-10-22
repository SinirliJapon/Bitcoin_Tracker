import 'networking.dart';

const apiKey = 'C55955FC-E8EC-45A0-B911-76828713FCA3';
const bitcoinTickerURL = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future<dynamic> getRate(String coinUnit,String currencyUnit) async {
    var url = '$bitcoinTickerURL/$coinUnit/$currencyUnit?apikey=$apiKey';
    NetworkHelper networkHelper = NetworkHelper(url);

    var rateData = await networkHelper.getData();
    return rateData;
  }
}

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'TRY',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];


