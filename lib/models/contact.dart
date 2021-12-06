class Contact{
  late int id;
  late String name;
  late String phone;
  Contact();
  ///used to read table row data and convert it to a model
/*تستخدم لقراءة البيانات وتحويلها لmodel*/
Contact.fromMap(Map<String,dynamic>rowMap){
  id=rowMap['id'];
  name=rowMap['name'];
  phone=rowMap['phone'];
}
///used to save data in a database table
  /*تخزين ف الداتا بيز*/
Map<String ,dynamic>toMap(){
  Map<String,dynamic>rowMap=<String,dynamic>{};
  rowMap['name']=name;
  rowMap['phone']=phone;
  return rowMap;
}
}