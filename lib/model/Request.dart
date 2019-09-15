class Request {
  String id;
  String amount;
  String duration;
  String loanStatus;
  String paybackStatus;
  String payback;
  String requestTime;
  Request({this.id, this.amount, this.duration, this.loanStatus, this.paybackStatus, this.payback, this.requestTime});

  Request.fromJSON(data);
}