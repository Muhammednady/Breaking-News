


abstract class NewsStates {}

class NewsInitialState extends NewsStates{}
class NewsBottomNavChangeState extends NewsStates{}

class NewsBrightnessModeChangeState extends NewsStates{}



class NewsGetBussinessSuccessState extends NewsStates{}
class NewsGetBussinessLoadingState extends NewsStates{}
class NewsGetBussinessErrorState extends NewsStates{
   final String error;

  NewsGetBussinessErrorState(this.error);
  
}

class NewsGetSportsSuccessState extends NewsStates{}
class NewsGetSportsLoadingState extends NewsStates{}
class NewsGetSportsErrorState extends NewsStates{
   final String error;

  NewsGetSportsErrorState(this.error);
  
}


class NewsGetScienceSuccessState extends NewsStates{}
class NewsGetScienceLoadingState extends NewsStates{}
class NewsGetScienceErrorState extends NewsStates{
   final String error;

  NewsGetScienceErrorState(this.error);
  
  
}

class NewsGetSearchSuccessState extends NewsStates{}
class NewsGetSearchLoadingState extends NewsStates{}
class NewsGetSearchErrorState extends NewsStates{
   final String error;

  NewsGetSearchErrorState(this.error);
  
  
}