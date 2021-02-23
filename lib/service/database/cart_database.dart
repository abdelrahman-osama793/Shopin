import 'package:path/path.dart';
import 'package:shopin/constants.dart';
import 'package:shopin/model/cart_model.dart';
import 'package:shopin/model/product_model.dart';
import 'package:sqflite/sqflite.dart';

class CartDatabase {
  CartDatabase._();

  static final CartDatabase db = CartDatabase._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initializeDB();
    return _database;
  }

  initializeDB() async {
    String path = join(await getDatabasesPath(), dbName);
    return await openDatabase(
      path,
      version: dbVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $cartTableName (
      $columnId TEXT NOT NULL,
      $columnName TEXT NOT NULL,
      $columnImage TEXT NOT NULL,
      $columnPrice TEXT NOT NULL,
      $columnQuantity INTEGER NOT NULL)
      ''');
  }

  insert(CartModel cartModel) async {
    Database dbInstance = await database;
    await dbInstance.insert(
      cartTableName,
      cartModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<CartModel>> getAllItems() async {
    var dbInstance = await database;
    List<Map> items = await dbInstance.query(cartTableName);
    List<CartModel> cartList = items.isNotEmpty
        ? items.map((item) => CartModel.fromJson(item)).toList()
        : [];
    return cartList;
  }

  updateCartItems(CartModel cartModel) async {
    Database dbInstance = await database;
    return await dbInstance.update(
      cartTableName,
      cartModel.toJson(),
      where: '$columnId = ?',
      whereArgs: [cartModel.productId],
    );
  }
}
