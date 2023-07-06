abstract class HomeStates{

}

class HomeInitStete extends HomeStates{

}
class HomeGetSourcesLoadingState extends HomeStates {}
class HomeGetSourcesSuccessState extends HomeStates{}
class HomeGetSourcesErrorState extends HomeStates{
  String error;
  HomeGetSourcesErrorState(this.error);
}

class HomeGetNewsLoadingState extends HomeStates {}
class HomeChangeSourceState extends HomeStates {}
class HomeGetNewsSuccessState extends HomeStates{}
class HomeConnectionErrorState extends HomeStates{}
class HomeGetNewsErrorState extends HomeStates{
  String error;
  HomeGetNewsErrorState(this.error);
}