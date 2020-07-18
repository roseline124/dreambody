class IntakeInfo{
  const IntakeInfo({
    this.currentIntakeCalorie_ = 0,
    this.goalIntakeCalorie_ = 1,
    this.currentCarbohydrate_ = 0,
    this.currentFat_ = 0,
    this.currentProtein_ = 0,
    this.goalCarbohydrate_ = 1,
    this.goalFat_ = 1,
    this.goalProtein_ = 1,
    this.consumeCalorie_ = 0,
  });

  //칼로리
  final int currentIntakeCalorie_;
  final int goalIntakeCalorie_;
  final int consumeCalorie_;
  //탄수화물
  final int currentCarbohydrate_;
  final int goalCarbohydrate_;
  //단백질
  final int currentProtein_;
  final int goalProtein_;
  //지방
  final int currentFat_;
  final int goalFat_;

  IntakeInfo concat(Map<String,dynamic> json){
    final int _currentIntakeCalorie = json['currentIntakeCalorie'] == null ? currentIntakeCalorie_ : json['currentIntakeCalorie'];
    final int _goalIntakeCalorie = json['goalIntakeCalorie'] == null ? goalIntakeCalorie_ : json['goalIntakeCalorie'];
    final int _consumeCalorie = json['consumeCalorie'] == null ? consumeCalorie_ : json['consumeCalorie'];
    final int _currentCarbohydrate = json['currentCarbohydrate'] == null ? currentCarbohydrate_ : json['currentCarbohydrate'];
    final int _goalCarbohydrate = json['goalCarbohydrate'] == null ? goalCarbohydrate_ : json['goalCarbohydrate'];
    final int _currentProtein = json['currentProtein'] == null ? currentProtein_ : json['currentProtein'];
    final int _goalProtein = json['goalProtein'] == null ? goalProtein_ : json['goalProtein'];
    final int _currentFat = json['currentFat'] == null ? currentFat_ : json['currentFat'];
    final int _goalFat = json['goalFat'] == null ? goalFat_ : json['goalFat'];

    return IntakeInfo(
      currentIntakeCalorie_: _currentIntakeCalorie,
      goalIntakeCalorie_: _goalIntakeCalorie,
      currentCarbohydrate_: _currentCarbohydrate,
      currentFat_: _currentFat,
      currentProtein_: _currentProtein,
      goalCarbohydrate_: _goalCarbohydrate,
      goalFat_: _goalFat,
      goalProtein_: _goalProtein,
      consumeCalorie_: _consumeCalorie,
    );
  }
  
  int get currentIntakeCalorie => currentIntakeCalorie_;
  int get goalIntakeCalorie => goalIntakeCalorie_;
  int get currentCarbohydrate => currentCarbohydrate_;
  int get currentFat => currentFat_;
  int get currentProtein => currentProtein_;
  int get goalCarbohydrate => goalCarbohydrate_;
  int get goalFat => goalFat_; 
  int get goalProtein => goalProtein_; 
  int get consumeCalorie => consumeCalorie_;
}