import 'package:flutter/material.dart';

Color LBoxFill=Color(0xFFFFFFFF);
Color DBoxFill=Color(0xFF313131);
Color DIconBg=Color(0xFF474747);
Color LIconBg=Color(0xFFE3E3E3);
//ForYou Cards Icons

// Color DBoxFill=Color(0xFF181818);


class GeneralizedPadding{
  final BuildContext context;
  GeneralizedPadding(this.context);

  double horizontal({required double value}){
    double toReturn = 0;
    double screenWidth = MediaQuery.of(context).size.width;
    double offset = value/screenWidth;
    toReturn = offset * screenWidth;
    return toReturn;
  }
  double vertical({required double value}){
    double toReturn = 0;
    double screenHeight = MediaQuery.of(context).size.height;
    double offset = value/screenHeight;
    toReturn = offset * screenHeight;
    return toReturn;
  }
}
class UsefulBigText extends StatelessWidget {
  final text;
  const UsefulBigText({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
      fontSize: 22
    ),);
  }
}
class UsefulMediumText extends StatelessWidget {
  final text;
  const UsefulMediumText({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
        fontSize: 18
    ),);
  }
}
class UsefulSmolText extends StatelessWidget {
  final text;
  const UsefulSmolText({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
        fontSize: 16
    ),);
  }
}

class UsefulSubheading extends StatelessWidget {
  final text;
  const UsefulSubheading({Key? key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(
        fontSize: 14,
      color: Colors.grey[600],
    ),);
  }
}




PoggiesM3List(
    {required List<String> itemNames,
      List<Icon>? leadingIcons,
      List<Icon>? trailingIcons,
    required BuildContext ctx,
    required List<Function> theTrailingAction,
      required List<Function> onTapTile}) {
  double basicRadius = 0;
  double basicRadiusDelta = 20;
  double lastOnesRadius = 0;
  double spaceBetweenTiles = 3.0;
  int iLen = itemNames.length;

  List<Widget> widgetsToAdd = [];
  if (iLen > 2) {
    widgetsToAdd.add(PoggiesM3ListTile(
        itemNames: itemNames[0],
        leadingIcons: leadingIcons?[0],
        trailingIcons: trailingIcons?[0],
        MainAction: () => onTapTile[0](),
        ctx: ctx,
        TL: basicRadius + basicRadiusDelta,
        TR: basicRadius + basicRadiusDelta,
        BL: lastOnesRadius,
        BR: lastOnesRadius,
        TrailingAction: () => theTrailingAction[0]()));
    widgetsToAdd.add(SizedBox(
      height: spaceBetweenTiles,
    ));
    for (int i = 1; i < iLen - 1; i++) {
      widgetsToAdd.add(PoggiesM3ListTile(
          MainAction: () => onTapTile[i](),
          itemNames: itemNames[i],
          leadingIcons: leadingIcons?[i],
          trailingIcons: trailingIcons?[i],
          ctx: ctx,
          TL: basicRadius,
          TR: basicRadius,
          BL: basicRadius,
          BR: basicRadius,
          TrailingAction: () => theTrailingAction[i]()));
      widgetsToAdd.add(SizedBox(
        height: spaceBetweenTiles,
      ));
    }
    widgetsToAdd.add(PoggiesM3ListTile(
        MainAction: () => onTapTile[iLen-1](),
        itemNames: itemNames[iLen - 1],
        leadingIcons: leadingIcons?[iLen - 1],
        trailingIcons: trailingIcons?[iLen - 1],
        ctx: ctx,
        TL: lastOnesRadius,
        TR: lastOnesRadius,
        BL: basicRadius + basicRadiusDelta,
        BR: basicRadius + basicRadiusDelta,
        TrailingAction: () => theTrailingAction[iLen-1]()));
  } else if (iLen == 2) {
    widgetsToAdd.add(PoggiesM3ListTile(
        MainAction: () => onTapTile[0](),
        itemNames: itemNames[0],
        leadingIcons: leadingIcons?[0],
        trailingIcons: trailingIcons?[0],
        ctx: ctx,
        TL: basicRadius + basicRadiusDelta,
        TR: basicRadius + basicRadiusDelta,
        BL: lastOnesRadius,
        BR: lastOnesRadius,
        TrailingAction: () => theTrailingAction[0]()));
    widgetsToAdd.add(SizedBox(
      height: spaceBetweenTiles,
    ));
    widgetsToAdd.add(PoggiesM3ListTile(
        MainAction: () => onTapTile[iLen-1](),
        itemNames: itemNames[iLen - 1],
        leadingIcons: leadingIcons?[iLen - 1],
        trailingIcons: trailingIcons?[iLen - 1],
        ctx: ctx,
        TL: lastOnesRadius,
        TR: lastOnesRadius,
        BL: basicRadius + basicRadiusDelta,
        BR: basicRadius + basicRadiusDelta,
        TrailingAction: () => theTrailingAction[iLen-1]()));
  } else {
    widgetsToAdd.add(PoggiesM3ListTile(
        MainAction: () => onTapTile[0](),
        itemNames: itemNames[0],
        leadingIcons: leadingIcons?[0],
        trailingIcons: trailingIcons?[0],
        ctx: ctx,
        TL: basicRadius + basicRadiusDelta,
        TR: basicRadius + basicRadiusDelta,
        BL: basicRadius + basicRadiusDelta,
        BR: basicRadius + basicRadiusDelta,
        TrailingAction: () => theTrailingAction[0]()));
  }

  return Column(
    children: widgetsToAdd,
  );
}

PoggiesM3ListTile(
    {required itemNames,
    required leadingIcons,
    required trailingIcons,
    required BuildContext ctx,
    required double TL,
    required double TR,
    required double BL,
    required double BR,
    required void Function()? TrailingAction,
      required void Function()? MainAction}) {


  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(TL),
          topRight: Radius.circular(TR),
          bottomLeft: Radius.circular(BL),
          bottomRight: Radius.circular(BR),
        ),
        child: Material(
          color: Theme.of(ctx).brightness == Brightness.light? LBoxFill : DBoxFill,
          child: ListTile(
              onTap: MainAction,
              title: Text(itemNames),
              leading: leadingIcons!= null ? leadingIcons : null,
              trailing: trailingIcons!=null ? IconButton(onPressed: TrailingAction, icon: trailingIcons) : null,
            ),
        ),
      ),
  );
}

String AddCommasAfterEvery3Numbers(double x) {
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

class Title2 extends StatelessWidget {
  final String title;
  const Title2({Key? key, required String this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(fontSize: 22),
    );
  }
}

class FilledCard extends StatelessWidget {
  final String ProductName;
  final double Price;
  final String ProductImg;
  var onTap;

  FilledCard(
      {Key? key,
      required this.ProductName,
      required this.Price,
      required this.onTap,
      required String this.ProductImg})
      : super(key: key);

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
                padding:
                    const EdgeInsets.only(left: 16.0, top: 16, right: 16.0),
                child: Text(
                  ProductName,
                  style: const TextStyle(fontSize: 18),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ('\u{20B9}${GreaterThan100kHelper(Price.toString())}'),
                      style: TextStyle(
                          fontWeight:
                              Theme.of(context).textTheme.subtitle1!.fontWeight,
                          color: Theme.of(context).textTheme.subtitle1!.color),
                    ),
                    ElevatedButton(
                      onPressed: () => onTap,
                      child: const Icon(Icons.add_shopping_cart),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
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

  OutlinedCard(
      {Key? key,
      required this.ProductName,
      required this.Price,
      required this.onTap,
      required String this.ProductImg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color(0xFFEEEEEE),
      decoration: BoxDecoration(
          border: Border.all(width: 3, color: Color(0xFFCACACA)),
          borderRadius: BorderRadius.circular(12)),
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
              padding: const EdgeInsets.only(left: 16.0, top: 16, right: 16.0),
              child: Text(
                ProductName,
                style: const TextStyle(fontSize: 18),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0, right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ('\u{20B9}${GreaterThan100kHelper(Price.toString())}'),
                    style: TextStyle(
                        fontWeight:
                            Theme.of(context).textTheme.subtitle1!.fontWeight,
                        color: Theme.of(context).textTheme.subtitle1!.color),
                  ),
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

  WideFilledCard(
      {Key? key,
      required this.ProductName,
      required this.Price,
      required this.onTap,
      required String this.ProductImg,
      required String this.PurchaseDate,
      required String this.Seller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
            color: Color(0xFFEEEEEE),
            // color: Theme.of(context).cardColor,
            height: 224,
            width: double.infinity,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
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
                            child: Text(
                              ProductName,
                              style: const TextStyle(fontSize: 24),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0.0),
                          child: SizedBox(
                            width: 175,
                            child: Text(
                              Seller,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Text(
                          ('\u{20B9}${GreaterThan100kHelper(Price.toString())}'),
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              color:
                                  Theme.of(context).textTheme.subtitle1!.color),
                        ),
                        Spacer(
                          flex: 4,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: BorderRadius.circular(100)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8.0, horizontal: 16),
                            child: Text(PurchaseDate),
                          ),
                        ),
                        Spacer(
                          flex: 1,
                        )
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 36, right: 16),
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
                            IconButton(
                                onPressed: () {}, icon: Icon(Icons.more_vert)),
                            ElevatedButton(
                              onPressed: () {},
                              child: Text(
                                "Add to cart",
                                style: TextStyle(fontSize: 10),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }
}
