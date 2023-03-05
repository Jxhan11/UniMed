import 'package:flutter/material.dart';

class FilledCard extends StatelessWidget {
  const FilledCard({Key? key}) : super(key: key);

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
                    child: const Image(
                        image: NetworkImage("https://cdn.i-scmp.com/sites/default/files/styles/1200x800/public/d8/images/canvas/2021/03/17/22363a3f-997f-48c1-aeae-1b7dfab42fbc_11447408.jpg?itok=_FO2Onpt&v=1615972333"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0,top: 16),
                child: Text("Product Name",style: TextStyle(fontSize: 18),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0,right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(('\u{20B9}205'),
                    style: TextStyle(
                      fontWeight: FontWeight.w400
                    ),),
                    ClipRRect(child: ElevatedButton(onPressed: (){}, child: Icon(Icons.add_shopping_cart))),
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
