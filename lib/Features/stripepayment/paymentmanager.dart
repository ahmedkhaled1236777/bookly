import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'apikey.dart';
abstract class paymentmanager{
  static Future makeapayment(int amount,String currency)async{
    try{
    String clientsecret=await getclientsecret((amount*100).toString(), currency);
    await initpaymentsheet(clientsecret);
    await Stripe.instance.presentPaymentSheet();
    
    }
    catch(e){
      throw Exception(e.toString());
    }
  }
  static Future<String>getclientsecret(String amount,String currency)async{
    Dio dio=Dio();
    var n=Random();
    var response=await dio.post("https://api.stripe.com/v1/payment_intents",
    
    data: {
      "amount":amount,
      "currency":currency
    },
    options: Options(
     
      headers: {
        "Authorization":"Bearer ${apikey.secretkey}",
        "Content-Type":"application/x-www-form-urlencoded"
      },
      
    )
    );
    return response.data["client_secret"];
    
  }
  static Future initpaymentsheet(String clientsecret)async{
  await  Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: clientsecret,
      merchantDisplayName: "bookly"
    ));
  }
}