import 'dart:async';
import 'package:prezenty_card_app/models/card_fetch_reponse.dart';
import 'package:prezenty_card_app/reposistories/card_repository.dart';

class CardBloc {

  late CardRepository _repository;

  CardBloc() {
    _repository = CardRepository();
  }

  Future<CardFetchResponse> getCardDeatils(String card_number) async {
    try {
      CardFetchResponse response = await _repository.cardFetchDetails(card_number);
      print("Response->${response}");
      return  response;
    } catch (e, s) {
      Completer().completeError(e, s);
      throw e;
    }
  }


}