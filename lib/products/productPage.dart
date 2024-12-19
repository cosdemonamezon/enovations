import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class Product {
  final String name;
  final double price;
  final int stock;
  final String imageUrl;

  Product({required this.name, required this.price, required this.stock, required this.imageUrl});
}

class _ProductPageState extends State<ProductPage> {
  final List<Product> products = [
    Product(name: "Ultrasound Machine", price: 5000.0, stock: 10, imageUrl: "assets/images/ipr9TnT5NsM7U4UxWi2FRR5JOX4q.jpg"),
    Product(name: "Surgical Lights", price: 1200.0, stock: 15, imageUrl: "assets/images/two-surgical-lamps-in-operation-room-blue-cast-light-represent-purity.jpg"),
    Product(name: "ECG Machine", price: 3000.0, stock: 5, imageUrl: "assets/images/LLSBpJucqC474Fw7wLy.jpg"),
    Product(name: "X-Ray Machine", price: 8000.0, stock: 3, imageUrl: "assets/images/8plNswQPdD2CXDc8qZ8T2TbtRZZqCVBe.jpg"),
    Product(name: "Hospital Bed", price: 1500.0, stock: 20, imageUrl: "assets/images/ELo4iAY9op4cIXqNdo4YhN0xG7HuaXVe.jpg"),
    Product(name: "Defibrillator", price: 2500.0, stock: 8, imageUrl: "assets/images/Life-point_plus_defibrillator.jpg"),
    Product(name: "Patient Monitor", price: 2000.0, stock: 12, imageUrl: "assets/images/istockphoto-1351287260-612x612.jpg"),
    Product(name: "Oxygen Concentrator", price: 1800.0, stock: 7, imageUrl: "assets/images/360_F_417010782_vMkzKBlQ2vVbZKIxSjHnvEUw5nBMTUTF.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Products', style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xff3c61a9),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 2 / 3,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 1,
                    child: Padding(
                      padding: EdgeInsets.all(6.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: Image.asset(
                              product.imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            product.name,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff3c61a9),
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "Price: \$${product.price.toStringAsFixed(2)}",
                            style: TextStyle(fontSize: 14, color: Colors.black87),
                          ),
                          Text(
                            "Stock: ${product.stock}",
                            style: TextStyle(fontSize: 14, color: Colors.black54),
                          ),
                          //Spacer(),
                          // Align(
                          //   alignment: Alignment.bottomRight,
                          //   child: ElevatedButton(
                          //     onPressed: () {},
                          //     style: ElevatedButton.styleFrom(
                          //       backgroundColor: Color(0xff3c61a9),
                          //     ),
                          //     child: Text("View"),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
