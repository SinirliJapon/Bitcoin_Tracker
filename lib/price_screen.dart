import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

  CoinData coinData = CoinData();
  String coinUnit;
  String currencyUnit;
  double rateUnit;

  void updateUI(dynamic rateData) {
    setState(() {
      double rate = rateData['rate'];
      rateUnit = rate;
      String coinUnit = rateData['asset_id_base'];
      this.coinUnit = coinUnit;
      String currencyUnit = rateData['asset_id_quote'];
      this.currencyUnit = currencyUnit;
    });
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      Text item = Text(currency);
      pickerItems.add(item);
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() async{
          currencyUnit = 'USD';
          currencyUnit = currenciesList[selectedIndex];
          var rateData = await coinData.getRate(coinUnit, currencyUnit);
          updateUI(rateData);
        });
        // print(selectedIndex);
      },
      children: pickerItems,
    );
  }

  CupertinoPicker iOSCoinPicker() {
    List<Text> pickerItems = [];
    for (String coin in cryptoList) {
      Text item = Text(coin);
      pickerItems.add(item);
    }

    return CupertinoPicker(
      itemExtent: 32.0,
      onSelectedItemChanged: (selectedIndex) {
        setState(() async{
          coinUnit = 'BTC';
          coinUnit = cryptoList[selectedIndex];
          var rateData = await coinData.getRate(coinUnit, currencyUnit);
          updateUI(rateData);
        });
        // print(selectedIndex);
      },
      children: pickerItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Center(
          child: Text('🤑 Coin Ticker'),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child:
            Card(
              color: Colors.lightGreen,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 $coinUnit = $rateUnit $currencyUnit',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),

          Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 200.0,
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(bottom: 30.0),
                  color: Colors.lightGreen,
                  child: iOSCoinPicker(),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 200.0,
                  alignment: Alignment.bottomCenter,
                  padding: const EdgeInsets.only(bottom: 30.0),
                  color: Colors.lightGreen,
                  child: iOSPicker(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}






