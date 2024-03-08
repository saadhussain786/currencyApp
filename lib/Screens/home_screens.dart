import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:currencyexchange1/Services/currency_convert_service.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String baseCurrency='USD';
  List<String> baseDropdownItems = ["PKR", "AED", "AFN", "ALL", "AMD", "ANG", "AOA", "ARS", "AUD", "AWG", "AZN", "BAM", "BBD", "BDT", "BGN", "BHD", "BIF", "BMD", "BND", "BOB", "BRL", "BSD", "BTN", "BWP", "BYN", "BZD", "CAD", "CDF", "CHF", "CLP", "CNY", "COP", "CRC", "CUP", "CVE", "CZK", "DJF", "DKK", "DOP", "DZD", "EGP", "ERN", "ETB", "EUR", "FJD", "FKP", "FOK", "GBP", "GEL", "GGP", "GHS", "GIP", "GMD", "GNF", "GTQ", "GYD", "HKD", "HNL", "HRK", "HTG", "HUF", "IDR", "ILS", "IMP", "INR", "IQD", "IRR", "ISK", "JEP", "JMD", "JOD", "JPY", "KES", "KGS", "KHR", "KID", "KMF", "KRW", "KWD", "KYD", "KZT", "LAK", "LBP", "LKR", "LRD", "LSL", "LYD", "MAD", "MDL", "MGA", "MKD", "MMK", "MNT", "MOP", "MRU", "MUR", "MVR", "MWK", "MXN", "MYR", "MZN", "NAD", "NGN", "NIO", "NOK", "NPR", "NZD", "OMR", "PAB", "PEN", "PGK", "PHP", "PLN", "PYG", "QAR", "RON", "RSD", "RUB", "RWF", "SAR", "SBD", "SCR", "SDG", "SEK", "SGD", "SHP", "SLE", "SLL", "SOS", "SRD", "SSP", "STN", "SYP", "SZL", "THB", "TJS", "TMT", "TND", "TOP", "TRY", "TTD", "TVD", "TWD", "TZS", "UAH", "UGX", "USD", "UYU", "UZS", "VES", "VND", "VUV", "WST", "XAF", "XCD", "XDR", "XOF", "XPF", "YER", "ZAR", "ZMW", "ZWL"];
  String otherCurrency = 'PKR';
  List<String> otherDropdownItems = ["PKR", "AED", "AFN", "ALL", "AMD", "ANG", "AOA", "ARS", "AUD", "AWG", "AZN", "BAM", "BBD", "BDT", "BGN", "BHD", "BIF", "BMD", "BND", "BOB", "BRL", "BSD", "BTN", "BWP", "BYN", "BZD", "CAD", "CDF", "CHF", "CLP", "CNY", "COP", "CRC", "CUP", "CVE", "CZK", "DJF", "DKK", "DOP", "DZD", "EGP", "ERN", "ETB", "EUR", "FJD", "FKP", "FOK", "GBP", "GEL", "GGP", "GHS", "GIP", "GMD", "GNF", "GTQ", "GYD", "HKD", "HNL", "HRK", "HTG", "HUF", "IDR", "ILS", "IMP", "INR", "IQD", "IRR", "ISK", "JEP", "JMD", "JOD", "JPY", "KES", "KGS", "KHR", "KID", "KMF", "KRW", "KWD", "KYD", "KZT", "LAK", "LBP", "LKR", "LRD", "LSL", "LYD", "MAD", "MDL", "MGA", "MKD", "MMK", "MNT", "MOP", "MRU", "MUR", "MVR", "MWK", "MXN", "MYR", "MZN", "NAD", "NGN", "NIO", "NOK", "NPR", "NZD", "OMR", "PAB", "PEN", "PGK", "PHP", "PLN", "PYG", "QAR", "RON", "RSD", "RUB", "RWF", "SAR", "SBD", "SCR", "SDG", "SEK", "SGD", "SHP", "SLE", "SLL", "SOS", "SRD", "SSP", "STN", "SYP", "SZL", "THB", "TJS", "TMT", "TND", "TOP", "TRY", "TTD", "TVD", "TWD", "TZS", "UAH", "UGX", "USD", "UYU", "UZS", "VES", "VND", "VUV", "WST", "XAF", "XCD", "XDR", "XOF", "XPF", "YER", "ZAR", "ZMW", "ZWL"];
  final amountController=TextEditingController();
   double d1=0;

// Function to safely parse the text to double
  void parseTextToDouble() {
    String inputValue = amountController.text.trim();
    try {
      d1 = double.parse(inputValue);
      print('Parsed double value: $d1');
    } catch (e) {
      print('Error parsing double: $e');
      print('Invalid input value: $inputValue');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: CurrencyConvert.currencyApi(baseCurrency),
        builder: (context, snapshot) {
          if(snapshot.hasData)
            {
              Map map=jsonDecode(snapshot.data);
               double total_value=map["rates"][otherCurrency]*d1;


              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 15),
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: amountController,
                        onChanged: (value)
                        {
                          parseTextToDouble();
                          setState(() {
                            if(d1==0 || amountController.text.isEmpty || amountController.text=='')
                              {
                                  total_value=0;

                              }

                                total_value=total_value*d1;

                          });
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder()
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width:100,
                              child: DropdownSearch<dynamic>(  // we can pass string to it as well but then we've to make
                                // sure that the list of items are string like this List<String>
                                items: baseDropdownItems,

                                onChanged: (value) {
                                  setState(() {
                                    baseCurrency = value.toString();
                                  });
                                },
                                popupProps: PopupProps.menu(
                                  showSearchBox: true,
                                ),
                                dropdownButtonProps: DropdownButtonProps(color: Colors.purple,),
                                dropdownDecoratorProps: DropDownDecoratorProps(
                                  textAlignVertical: TextAlignVertical.center,
                                  dropdownSearchDecoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                ),

                                selectedItem: baseCurrency,
                              ),
                            ),
                           GestureDetector(
                              onTap: ()
                               {
                                 setState(() {
                                   String temp = baseCurrency;
                                   baseCurrency = otherCurrency;
                                   otherCurrency = temp;
                                 });

                               },
                               child: Icon(Icons.swap_horiz)),

                            SizedBox(
                              width:100,
                              child: DropdownSearch<dynamic>(  // we can pass string to it as well but then we've to make
                                // sure that the list of items are string like this List<String>
                                items: otherDropdownItems,

                                onChanged: (newValue) {
                                  setState(() {
                                    otherCurrency = newValue.toString();
                                    Map<String, dynamic> currencyHistory = {
                                      "baseCurrency" : baseCurrency,
                                      "convertCurrency" : otherCurrency,
                                      "value" : "$total_value"
                                    };
                                    FirebaseFirestore.instance.collection("History").add(currencyHistory);
                                  });
                                },
                                popupProps: PopupProps.menu(
                                  showSearchBox: true,

                                ),
                                dropdownButtonProps: DropdownButtonProps(color: Colors.purple,),
                                dropdownDecoratorProps: DropDownDecoratorProps(
                                  textAlignVertical: TextAlignVertical.center,
                                  dropdownSearchDecoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                ),

                                selectedItem: otherCurrency,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      Text('$total_value'),
                      SizedBox(height: 20,),
                      GestureDetector(
                          onTap: (){
                            showModalBottomSheet(context: context, builder: (context) {
                              return BottomSheet(onClosing: (){},enableDrag: true, builder: (context) {
                                return StreamBuilder(
                                    stream: FirebaseFirestore.instance.collection('History').snapshots(),
                                    builder: (context, snapshot) {
                                   if(snapshot.hasData)
                                     {
                                       var data_lenght=snapshot.data!.docs.length;
                                       return ListView.builder(
                                         itemCount: data_lenght,
                                         itemBuilder: (context, index) {
                                         return ListTile(
                                           title: Text('${snapshot.data!.docs[index]['baseCurrency']} - ${snapshot.data!.docs[index]['convertCurrency']}'),
                                           subtitle: Text('${snapshot.data!.docs[index]['value']}'),
                                         );
                                       },);
                                     }
                                   else if(snapshot.hasError)
                                     {
                                       return Center(
                                         child: Icon(Icons.error_outline),
                                       );
                                     }
                                   else
                                     {
                                       return Center(child: CircularProgressIndicator());
                                     }
                                    },);
                              },);
                            },);
                          },
                          child: Text('View History',style: TextStyle(
                            color: Colors.purple
                          ),))

                    ],
                  ),
                ),
              );

            }
          else if(snapshot.hasError)
            {
              return Center(
                child: Icon(Icons.error_outline),
              );
            }
          else
            {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
        },
      ),
    );
  }
}
