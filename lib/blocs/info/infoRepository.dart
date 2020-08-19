class InfoRepository {
  InfoRepository();

  String id; //?

  int currentWeight; 
  int goalWeight; //ok
  int gender; // id, gender ok
  int height; // ok
  String dateOfBirth; //ok
  int activity; // id, activity
  
  int goal; // id, goal
  int dailyIntakeCalorie;

  void saveGender({int gender}) {
    this.gender = gender;
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
  void saveActivity({int activity}) {
    this.activity = activity;
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

  int getGender() {
    return this.gender;
  }
  int getHeight() {
    return this.height;
  }
  int getGoal() {
    return this.goal;
  }
  int getActivity() {
    return this.activity;
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

