class InfoRepository {
  InfoRepository();

  String id; //?

  int currentWeight; 
  int goalWeight; //ok
  String genderType; // id, gender ok
  int height; // ok
  String dateOfBirth; //ok
  String activityType; // id, activity
  String goalType;
  
  int goal; // id, goal
  int dailyIntakeCalorie;

  void saveGenderType({String genderType}) {
    this.genderType = genderType;
    return;
  }
  void saveHeight({int height}) {
    this.height = height;
    return;
  }
  void saveGoal({int goal}) {
    this.goal = goal;
    return;
  }
  void saveActivityType({String activityType}) {
    this.activityType = activityType;
    return;
  }
  void saveDateOfBirth({String dateOfBirth}) {
    this.dateOfBirth = dateOfBirth;
    return;
  }
  void saveDailyIntakeCalorie({int dailyIntakeCalorie}) {
    this.dailyIntakeCalorie = dailyIntakeCalorie;
    return;
  }
  void saveCurrentWeight({int currentWeight}) {
    this.currentWeight = currentWeight;
    return;
  }
  void saveGoalWeight({int goalWeight}) {
    this.goalWeight = goalWeight;
    return;
  }
  void saveGoalType({String goalType}){
    this.goalType = goalType;
    return;
  }

  String getGenderType() {
    return this.genderType;
  }
  int getHeight() {
    return this.height;
  }
  int getGoal() {
    return this.goal;
  }
  String getActivityType() {
    return this.activityType;
  }
  String getDateOfBirth() {
    return this.dateOfBirth;
  }
  int getDailyIntakeCalorie() {
    return this.dailyIntakeCalorie;
  }
  int getCurrentWeight() {
    return this.currentWeight;
  }
  int getGoalWeight() {
    return this.goalWeight;
  }
  String getGoalType(){
    return this.goalType;
  }
  
}

/*
{
  "userInfoRequest": {
    "currentWeight":50,
    "goalWeight": 70,
    "height":180,
    "dateOfBirth": "1990-12-21",
    "gender": 1,
    "goal": 1,
    "activity": 1
  }
}
  String id_;
  int currentWeight_;
  int dailyIntakeCalorie_;
  String dateOfBirth_;
  int goalWeight_;
  int height_;
  int gender_; // id, gender
  int goal_; // id, goal
  int activity_; // id, activity

  
 */

