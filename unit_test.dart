import 'package:unit_test/unit_test.dart';
import 'package:test/test.dart';
void main() {

  test('send empty map sellProdcutViaCash func. expect return 0. ', () {     
    var soldProducts = Map('': 0);
    expect(sellProductViaCash( soldProducts, 0.0);
  };

  test('send unlisted product to sellProductViaCash func. expect 0.0 return ', () {     
    var soldProducts =  Map('sucuk': '2','havyar': '5');
    expect(sellProductViaCash( soldProducts, 0);
  });

  test('send full list to sellProduct func. expect return sum of price = 100. ', () {     
    var soldProducts =  Map('bread': '2','cookie': '5');
    expect(sellProductViaCash( soldProducts, 100.0);
  });

  test('send full list to sellProduct func. expect return sum of price = 100. ', () {     
    var soldProductsViaCreditCard =  Map('bread': '2','cookie': '5');
    expect(sellProductViaCreditCard( soldProducts, 100.0);
  });

  test('getTotalPrice without operation expect 0', () {     
    expect(getTotalPrice(), 0.0);
  });

  test('getTotalPrice with some operation expect 100', () {     
    var soldProducts =  Map('bread': '2','cookie': '5');
    sellProduct(products);
    expect(getTotalPrice(),100.0);
  });

  test('call getTotalCreditCard func without operation expect return 0 ', () {     
    expect(getTotalCreditCard(), 0.0);
  });

  test('call getTotalCreditCard func wit operation expect return 100.0 ', () {     
    var soldProductsViaCreditCard =  Map('bread': '2','cookie': '5');
    sellProductViaCreditCard( soldProductsViaCreditCard, 100.0);
    expect(getTotalCreditCard(), 100.0);
  });

  test('getTotalExpense', () { 
    getMoneyFromCase(0);    
    expect(getTotalExpense(), 0.0);
  });

  test('getTotalExpense', () { 
    getMoneyFromCase(10);    
    expect(getTotalExpense(), 10.0);
  });

  test('getTotalExpense', () { 
    getMoneyFromCase(10);
    getMoneyFromCase(18.50);   
    expect(getTotalExpense(), 28.50);
  });

  test('getTotalWorkersBread', () {     
  expect(getTotalWorkersBread(), 0);
  });

  test('getTotalWorkersBread', () { 
    getBreadForMe(5)    
    expect(getTotalWorkersBread(), 5);
  });

  test('getTotalWorkersBread', () { 
    getBreadForMe(5) 
    getBreadForMe(8)  
    expect(getTotalWorkersBread(), 13);
  });

  test('getTotalOnAccountBread()', () {     
    expect(getTotalOnAccountBread(), 0);
  });

  test('getTotalOnAccountBread()', () {
    setOnAccountBread("Yusuf", 5);
    expect(getTotalOnAccountBread(), 5);
  });

  test('getTotalOnAccountBread()', () {
    setOnAccountBread("Yusuf", 5);
    setOnAccountBread("Omer", 8);
    expect(getTotalOnAccountBread(), 13);
  });

  test('getProducedBread()', () {     
    expect(getProducedBread(), 0);
  });

  test('getProducedBread()', () { 
    addBread(150)    
    expect(getProducedBread(), 150);
  });

  test('getProducedBread()', () {  
    addBread(150)   
    addBread(50)      
    expect(getProducedBread(), 200);
  });

  test('getBalance without operation. expect 0', () {​​​​​
    expect(getBalance(), 0.0);
  });

  test('getBalance with some operations. expect 70', () {​​​​​
    var products =  Map('bread': 2,"breadPrice":10 ,'cookie': 5, "cookiePrice":10);
    sellProduct(products);
    expect(getBalance(), 70.0);
  });

  test('getTotalOnAccountPrice without operation. expect 0', () {​​​​​
    expect(getTotalOnAccountPrice(), 0.0);
  });

  test('getTotalOnAccountPrice with some operations. expect 55', () {​​​​​
    setOnAccountBread(Map("name:":"Yusuf", "price":5, "amount":11));
    expect(getTotalOnAccountPrice(), 55.0);
  });

  test('we expect getRemainingBread to return the remaining amount of bread without operations. expect 0', () {​​​​​
    expect(getRemainingBread(), 0.0);
  });

  test('we expect getRemainingBread to return the remaining amount of bread with operations. expect 5', () {​​​​​
    addBread(15);
    sellBread(10);
    expect(getRemainingBread(), 5.0);
  });

  test('we expect getRemainingBread to return the remaining amount of bread with operations. expect 0', () {​​​​​
    addBread(15);
    sellBread(15);
    expect(getRemainingBread(), 0.0);
  });

  test('getRemainingBred returns that the number of the unsold breads. So in this case it should be return 0 in test case under the given conditions', () {     
    var bakery = Bakery(name: "Omer Hodja's Bakery" remainingBread:0)
    expect(getRemainingBred(Person p), 0);
  });

  test('getPersonOnCredit returns that the credit debit of a person which is given as argument. It returns 1013 in test case under the given conditions', () {     
    var bakery = Bakery(name: "Omer Hodja's Bakery" remainingBread:0, breadPerPrice: 1.3)
    var person = Person(name : "Bilal Bayrakdar" debit:1000)
    giveBread(person: person, amount:10)
    expect(getPersonOnCredit(Person p), 1013);
  });

  test('getTotalMarketBread returns that the total amount of the sold bread to the market which is given as argument. It returns 100 in test under thte given conditions', () {     
    var market1 = Market(name:"Umit market",breadPerPrice:1.3)
    distBread(market1, 100)
    expect(getTotalMarketBread(Market m), 100);
  });

  test('getTotalBread methodu eger hic bir dagitim gerceklesmediyse 0 doner', () {
    expect(getTotalBread(), 0);
  });

  test('getTotalBread methodu dagitilan toplam ekmek sayisini 80 olarak doner', () {
    var market1 = Market(name:"Umit market",breadPerPrice:1.3)
    var market2 = Market(name:"Bilal market",breadPerPrice:1.3)
    distBread(market1,30);
    distBread(market2,50);
    expect(getTotalBread(), 80);
  });

  test('getTotalDistPrice methodu hic bir dagitim yapilmadiysa 0.0 doner', () {
    expect(getTotalDistPrice(), 0.0);
  });

  test('getTotalDistPrice methodu dagitilan 200 ekmegi 1.3 ile carparak 260.0 doner', () {
    var market1 = Market(name:"Umit market",breadPerPrice:1.3)
    var market2 = Market(name:"Bilal market",breadPerPrice:1.3)
    distBread(market1, 100)
    distBread(market2, 100)
    expect(getTotalDistPrice(), 260.0);

  });

  test('getMarketDebit methodu markete ekmek verilmediyse 0.0 doner', () {
    var market = Market(name:"Umit market",breadPerPrice:1.3)
    expect(getMarketDebit(market), 0.0);
  });

  test('getMarketDebit methodu dagitilan 100 ekmegi 1.3 ile carparak 130.0 doner', () {
    var market = Market(name:"Umit market",breadPerPrice:1.3)
    distBread(market, 100)
    expect(getMarketDebit(market), 130.0);
  });

}
