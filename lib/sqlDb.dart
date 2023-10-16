import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class SqlDb {
  static Database? _db;
  Future<Database?> get db async{
  if (_db==null) {
    _db =await initialDb();
    return _db;
  }else{
    return _db;
  }
  }

  initialDb() async{
    String  databasePath=await getDatabasesPath();
    String path =join(databasePath , 'moody.db');
    Database myDb=await openDatabase(path,onCreate: _onCreate ,version: 1, onUpgrade:_onUpgrade );
    return myDb;
  }
  _onUpgrade(Database db ,int oldversion,int newversion){
 print("onUpgrade =======================================");
  }
  _onCreate(Database db , int version) async{
  await db.execute('''sql
  CREATE TABLE "person"(
    "id" INTEGER  NOT NULL PRIMARY Key AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    "date" DATE ,
    "loacation" TEXT NOT NULL,
    "phone " INTEGER NOT NULL,
    ),
    CREATE TABLE "Questions"(
    "id" INTEGER  NOT NULL PRIMARY Key AUTOINCREMENT,
    "Question" TEXT NOT NULL,
    
    "Answer " TEXT NOT NULL,
    ),
  ''');
  print("onCreate ==============================");
}
readData(String sql) async{
    Database? myDb=await db;
    List<Map> response=await myDb!.rawQuery(sql);
    return response;
}
  insertData(String sql) async{
    Database? myDb=await db;
    int response=await myDb!.rawInsert(sql);
    return response;
  }
  updateData(String sql) async{
    Database? myDb=await db;
    int response=await myDb!.rawUpdate(sql);
    return response;
  }
  deleteData(String sql) async{
    Database? myDb=await db;
    int response=await myDb!.rawDelete(sql);
    return response;
  }
//SELECT
//DELETE
//UDATE
//INSERT
}