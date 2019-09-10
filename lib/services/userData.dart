userData(String value) async {
   var arr =value.split(',');
      var id = arr[0].split(':')[1].trim();
      var phone =arr[1].split(':')[1].trim();
      var first = arr[2].split(':')[1].trim();
      var last = arr[3].split(':')[1].trim();
      var email = arr[4].split(':')[1].trim();
      var address = arr[5].split(':')[1].trim().split('}')[0];
      return{ 'user_id': id, 'phone': phone, 'firstName': first, 'lastName':last, 'email': email, 'address': address};
      
}

//  user(String value) {
//      var arr =value.split(',');
//      setState(() {
//        this.id = arr[0].split(':')[1].trim();
//        this.firstName = arr[2].split(':')[1].trim();
//        this.lastName = arr[3].split(':')[1].trim();
//        this.email = arr[4].split(':')[1].trim();
//      });
      
//       var address = arr[5].split(':')[1].trim().split('}')[0];
//   } 