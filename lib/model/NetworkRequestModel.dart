class NetworkRequestModel {
//These are the values that this Demo model can store
  bool success = true;
  String message = "";

//default Constructor
  NetworkRequestModel(this.success, this.message);

  bool getSuccess() {
    return success;
  }

  String getMessage() {
    return message;
  }
}
