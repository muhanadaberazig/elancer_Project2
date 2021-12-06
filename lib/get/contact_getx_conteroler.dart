//
//
// import 'package:elancer_api/models/contact.dart';
// import 'package:get/get.dart';
// class ContactGetxControler extends GetxController{
//   RxList<Contact> contacts=<Contact>[].obs;
//   /*لتحميل الداتا انتظار*/
//   RxBool loading=false.obs;
//   final ContactDbController _contactDbController=ContactDbController();
//   static ContactGetxControler get to=>Get.find<ContactGetxControler>();
//   @override
//   void onInit() {
//
//   } //CRUD
//   /*عملنا تخزين لكل الcontacts  المخزنين في الداتا بيز في ال list*/
//   Future<void>readContact()async{
//     //loading.value=true;
//     contacts.value=await _contactDbController.read();
//     //loading.value=false;
//     // notifyListeners();
//     //update();
//   }
// /*ارسلت العنصر للاضافة contact*/
//   Future<bool> createContect(Contact contact) async {
//     /*رجعتلي ال id تعتو بعد الاضافة*/
//     int newRowId=await _contactDbController.create(contact);
//     /*تحقق انو تمت الاضافة*/
//     if(newRowId!=0){
//       /*اعطيتها للنصر الجديد id */
//       contact.id=newRowId;
//       /*وضفتها على listProvider*/
//       contacts.add(contact);
//       // notifyListeners();
//       /*بنحدد بين الاقواس لمين التعدييل الي بدو يصير*/
//       //update();
//     }
//     return newRowId!=0;
//   }
//   /*بعتنا الid */
//   Future<bool> deleteContect(int id)async{
//     bool deleted=await _contactDbController.delete(id);
//     if(deleted){
//       /*طريقة1*/
//       //contacts.removeWhere((element) => element.id==id);
//       /*طريقة2*/
//       /*معرفة موقع الرقمي للعنصر تاع الid*/
//       int index=contacts.indexWhere((element) => element.id==id);
//       if(index!=-1){
//         contacts.removeAt(index);
//        // notifyListeners();
//         //update();
//       }
//     }
//     return deleted;
//   }
//   Future<bool> updateContact(Contact contact)async{
//     bool updated=await _contactDbController.update(contact);
//     if(updated){
//       /*1*/
//       // int index=contacts.indexOf(contact);
//       /**/
//       int index=contacts.indexWhere((element) => element.id==contact.id);
//       if(index!=-1){
//         contacts[index]=contact;
//       // notifyListeners();
//        // update();
//       }
//     }
//     return updated;
//
//   }
// }