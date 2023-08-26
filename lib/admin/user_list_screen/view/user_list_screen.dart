import 'package:ecommerce_firebase/admin/user%20details%20page/view/user_collection_details_screen.dart';import 'package:ecommerce_firebase/utils/user_collection.dart';import '../../../utils/all_instance.dart';import '../../../utils/export.dart';class UserAccountList extends StatefulWidget {  @override  State<UserAccountList> createState() => _UserAccountListState();}class _UserAccountListState extends State<UserAccountList> {  @override  Widget build(BuildContext context) {    return Scaffold(      body: SafeArea(          child: StreamBuilder<QuerySnapshot>(              stream: Collection.collectionProfile.snapshots(),              builder: (BuildContext context,                  AsyncSnapshot<QuerySnapshot> snapshot) {                if (snapshot.hasError) {                  return Text('Something went wrong');                }                if (snapshot.connectionState == ConnectionState.waiting) {                  return Text("Loading");                }                return ListView.builder(                  itemCount: snapshot.data!.docs.length,                  itemBuilder: (context, index) {                    var data = snapshot.data!.docs[index].id;                    return ListTile(                      onTap: () {                        Get.to(() =>                            UserCollectionDetailsScreen(documentId: data));                      },                      title: Text(data),                    );                  },                );              })),    );  }}