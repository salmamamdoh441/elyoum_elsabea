abstract class NewStates {}

class NewsInitialState extends NewStates {}

class NewsBottomNavState extends NewStates {}

class NewsLoadingState extends NewStates {}

class NewsGetBusinessSuccessState extends NewStates {}

class NewsGetBusinessErrorState extends NewStates {
  final String error;
  NewsGetBusinessErrorState(this.error);
}

class NewsGetSportsSuccessState extends NewStates {}

class NewsGetSportsErrorState extends NewStates {
  final String error;
  NewsGetSportsErrorState(this.error);
}

class NewsGetScienceSuccessState extends NewStates {}

class NewsGetScienceErrorState extends NewStates {
  final String error;
  NewsGetScienceErrorState(this.error);
}
class NewsChangeAppModeState extends NewStates {}

class NewsGetSearchSuccessState extends NewStates {}

class NewsGetSearchErrorState extends NewStates {
  final String error;
  NewsGetSearchErrorState(this.error);
}