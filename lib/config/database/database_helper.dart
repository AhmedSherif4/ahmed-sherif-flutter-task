import 'package:otex_app_test/core/models/category_model.dart';
import 'package:otex_app_test/core/models/plan_model.dart';
import 'package:otex_app_test/core/models/product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('app_database.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    // categories table
    await db.execute('''
      CREATE TABLE categories (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        image TEXT
      )
    ''');

    // products table
    await db.execute('''
      CREATE TABLE products (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        image TEXT,
        name TEXT NOT NULL,
        price_before REAL,
        price_after REAL,
        sales_count REAL,
        category_id INTEGER,
        FOREIGN KEY (category_id) REFERENCES categories (id)
      )
    ''');

    // plans table
    await db.execute('''
      CREATE TABLE plans (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        offer_label TEXT NULL,
        price REAL NOT NULL,
        details TEXT,
        views_multiplier INTEGER
      )
    ''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<List<CategoryModel>> getAllCategories() async {
    final db = await instance.database;

    final result = await db.query('categories');
    return result.map((map) => CategoryModel.fromMap(map)).toList();
  }

  Future<List<ProductModel>> getProductsByCategory(int categoryId) async {
    final db = await instance.database;

    final result = await db.query(
      'products',
      where: 'category_id = ?',
      whereArgs: [categoryId],
    );

    return result.map((map) => ProductModel.fromMap(map)).toList();
  }

  Future<List<ProductModel>> getAllProducts() async {
    final db = await instance.database;
    final result = await db.query('products');
    return result.map((map) => ProductModel.fromMap(map)).toList();
  }

  Future<List<PlanModel>> getAllPlans() async {
    final db = await instance.database;
    final result = await db.query('plans');
    return result.map((map) => PlanModel.fromMap(map)).toList();
  }
}
