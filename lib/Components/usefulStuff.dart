import 'package:flutter/material.dart';


String AddCommasAfterEvery3Numbers(double x){
  String ans;
  String xString = x.toString();
  RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  String Function(Match) mathFunc = (Match match) => '${match[1]},';
  ans = xString.replaceAllMapped(reg, mathFunc);
  return ans;
}
String GreaterThan100kHelper(String input) {
  double number = double.tryParse(input) ?? 0.0;
  if (number >= 1000000000) {
    return '${(number / 1000000000).toStringAsFixed(2)}B';
  } else if (number >= 1000000) {
    return '${(number / 1000000).toStringAsFixed(2)}M';
  } else if (number >= 1000) {
    return '${(number / 1000).toStringAsFixed(2)}k';
  } else {
    return number.toStringAsFixed(2);
  }
}

class FilledCard extends StatelessWidget {
  final String ProductName;
  final double Price;
  final String ProductImg;
  var onTap;


  FilledCard({Key? key, required this.ProductName, required this.Price, required this.onTap, required String this.ProductImg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
        color: Color(0xFFEEEEEE),
        // color: Theme.of(context).cardColor,

        height: 260,
        width: 200,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: SizedBox(
                  height: 140,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image(
                        image: NetworkImage(ProductImg),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0,top: 16,right: 16.0),
                child: Text(ProductName,
                  style: const TextStyle(fontSize: 18),
                overflow: TextOverflow.ellipsis,),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(('\u{20B9}${GreaterThan100kHelper(Price.toString())}'),
                    style: TextStyle(
                      fontWeight: Theme.of(context).textTheme.subtitle1!.fontWeight,
                      color: Theme.of(context).textTheme.subtitle1!.color
                    ),),
                    ElevatedButton(
                        onPressed: () => onTap,
                        child: const Icon(Icons.add_shopping_cart),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )
                      ),
                    ),

                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OutlinedCard extends StatelessWidget {
  final String ProductName;
  final double Price;
  final String ProductImg;
  var onTap;


  OutlinedCard({Key? key, required this.ProductName, required this.Price, required this.onTap, required String this.ProductImg}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0xFFEEEEEE),
      decoration: BoxDecoration(
            border: Border.all(width: 3,color: Color(0xFFCACACA)),
            borderRadius: BorderRadius.circular(12)
      ),
      // color: Theme.of(context).cardColor,

      height: 260,
      width: 200,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: SizedBox(
                height: 140,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image(
                    image: NetworkImage(ProductImg),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0,top: 16,right: 16.0),
              child: Text(ProductName,
                style: const TextStyle(fontSize: 18),
                overflow: TextOverflow.ellipsis,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0,right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(('\u{20B9}${GreaterThan100kHelper(Price.toString())}'),
                    style: TextStyle(
                        fontWeight: Theme.of(context).textTheme.subtitle1!.fontWeight,
                        color: Theme.of(context).textTheme.subtitle1!.color
                    ),),
                  IconButton(
                      onPressed: () => onTap,
                      icon: const Icon(Icons.add_shopping_cart))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class WideFilledCard extends StatelessWidget {
  final String ProductName;
  final double Price;
  final String ProductImg;
  final String PurchaseDate;
  final String Seller;

  var onTap;


  WideFilledCard({Key? key, required this.ProductName,
    required this.Price,
    required this.onTap,
    required String this.ProductImg,
    required String this.PurchaseDate, required String this.Seller
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          color: Color(0xFFEEEEEE),
          // color: Theme.of(context).cardColor,
          height: 224,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: SizedBox(
                          width: 175,
                          child: Text(ProductName,
                            style: const TextStyle(fontSize: 24),
                            overflow: TextOverflow.ellipsis,),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 0.0),
                        child: SizedBox(
                          width: 175,
                            child: Text(Seller, overflow: TextOverflow.ellipsis,),
                        ),
                      ),
                      Text(('\u{20B9}${GreaterThan100kHelper(Price.toString())}'),
                        style: TextStyle(
                            fontWeight: FontWeight.w200,
                            color: Theme.of(context).textTheme.subtitle1!.color
                        ),),
                      Spacer(flex: 4,),
                      Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(100)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16),
                          child: Text(PurchaseDate),
                        ),
                      ),
                      Spacer(flex: 1,)
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 36,right: 16),
                      child: SizedBox(
                        height: 120,
                        width: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image(
                            image: NetworkImage(ProductImg),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Row(
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
                          ElevatedButton(onPressed: (){}, child: Text("Add to cart")),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}


