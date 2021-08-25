import 'package:bloc/bloc.dart';
import 'package:cizo/models/public_card_model.dart';
import 'package:cizo/services/home/public_events.dart';

class FetchPublicBLoc extends Bloc<PublicEvents, List<PublicCardModel>> {
  FetchPublicBLoc() : super([]);

  List<PublicCardModel> cardList = [];

  @override
  Stream<List<PublicCardModel>> mapEventToState(PublicEvents event) async* {
    if (event is UpdatePublicCardList) {
      cardList = await event.getCards();
      yield cardList;
    }
  }
}
