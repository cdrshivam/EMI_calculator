import 'package:flutter/material.dart';

class EMIForm extends StatefulWidget {
  @override
  _EMIFormState createState() => _EMIFormState();
}

class _EMIFormState extends State<EMIForm> {

  final _formKey = GlobalKey<FormState>();

  static TextEditingController _amount= new TextEditingController();
  static TextEditingController _interest= new TextEditingController();
  static TextEditingController _time= new TextEditingController();

  String emi;
  String totalInterest;
  String totalAmount;




  //--------------------------------emi calculate function-------------------------------------------
  calculate(){
    double _amountDouble=double.parse(_amount.text);
    double _interestDouble=double.parse(_interest.text);
    int _timeInt=int.parse(_time.text);

    totalInterest=((_amountDouble*_interestDouble*_timeInt)/1200).toStringAsFixed(3);
    totalAmount=(double.parse(totalInterest)+_amountDouble).toStringAsFixed(3);
    emi=(double.parse(totalAmount)/_timeInt).toStringAsFixed(3);
  }



  //------------------------------ ----build-------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[

              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
                width: MediaQuery.of(context).size.width,
              ),

              //---------------------------amount txt field---------------------------

              Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width*0.35,
                    height: MediaQuery.of(context).size.height/11 ,
                    padding: EdgeInsets.fromLTRB(20, 20, 5, 10),
                    child:  Text('Loan Amount',
                          softWrap: true,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                    ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.625,
                    height: MediaQuery.of(context).size.height/11 ,
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _amount,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                        hintText: 'Enter Loan Amount',
                      ),
                      validator: (value){
                        if(value.isEmpty){
                          return 'please enter some value';
                        }
                        if(double.parse(value)<=0){
                          return 'please return a valid amount';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(
                height: 10,
              ),


              //---------------------------interest txt field---------------------------

              Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width*0.35,
                    height: MediaQuery.of(context).size.height/11 ,
                    padding: EdgeInsets.fromLTRB(20, 20, 5, 10),
                    child: Text('Interest',
                          softWrap: true,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                    ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.625,
                    height: MediaQuery.of(context).size.height/11 ,
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _interest,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        hintText: 'Enter Interest percentage',
                      ),
                      validator: (value){
                        if(value.isEmpty){
                          return 'please enter some value';
                        }
                        if(double.parse(value)<=0 || double.parse(value)>100){
                          return 'please enter a valid pecentage value';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),


              SizedBox(
                height: 10,
              ),



              //---------------------------time txt field---------------------------

              Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width*0.35,
                    height: MediaQuery.of(context).size.height/10 ,
                    padding: EdgeInsets.fromLTRB(20, 20, 5, 10),
                    child: Text('Time Period',
                          textAlign: TextAlign.left,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                    ),
                  Container(
                    width: MediaQuery.of(context).size.width*0.625,
                    height: MediaQuery.of(context).size.height/10 ,
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _time,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        hintText: 'Enter Time (in months)',
                      ),
                      validator: (value){
                        var arr = value.contains('.');
                        if(value.isEmpty){
                          return 'please enter some value';
                        }
                        if(double.parse(value)<=0){
                          return 'please enter a valid time in months';
                        }
                        if(arr==true){
                          return 'please enter a non decimal number';
                        }

                        return null;
                      },
                    ),
                  ),

                ],
              ),



              SizedBox(
                height: 15,
                width: MediaQuery.of(context).size.width,
              ),



              //---------------------------buttons---------------------------

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[

                  //---------------------------calculate button---------------------------

                  RaisedButton(
                    child: Text('Calculate',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: (){
                      if(_formKey.currentState.validate()){
                        calculate();
                        setState(() {

                        });

                        print('${(_amount.text=='')?'null':_amount.text} is amount');
                        print('${(_interest.text=='')?'null':_interest.text} is interset');
                        print('${(_time.text=='')?'null':_time.text} is time');
                        print('$emi is emi calculated' );
                        print('$totalInterest is total interested calculated' );
                        print('$totalAmount is total amount calculated' );
                      }
                    },
                    elevation: 10,
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),


                  //---------------------------empty space---------------------------

                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.02,
                    width: 50,
                  ),


                  //---------------------------reset button---------------------------

                  RaisedButton(
                    child: Text('Reset',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: (){
                      _amount.text='';
                      _time.text='';
                      _interest.text='';
                      print('${_amount.text} is amount reset');
                      print('${_interest.text} is interset reset');
                      print('${_time.text} is time reset');
                    },
                    elevation: 10,
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ],
              ),

              //------------------------------SizedBox--------------------------------------------

              SizedBox(
                height: MediaQuery.of(context).size.height*0.04,
                width: MediaQuery.of(context).size.width*0.02,
              ),


          //------------------------------table------------------------------------------

           SizedBox(
                  height: MediaQuery.of(context).size.height*0.40,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: <Widget>[
                      DataTable(
                        columns:  [
                          DataColumn(
                            label: Text('MONTHLY EMI ',style: TextStyle(color: Colors.black,fontSize: 15),softWrap: true),
                          ),
                          DataColumn(
                            label: Text('\$ ${emi==null?0:emi}',style: TextStyle(color: Colors.black,fontSize: 15),softWrap: true,),
                          )
                        ],
                        rows: [
                          DataRow(
                            cells: [
                              DataCell(Text('TOTAL INTEREST ',style: TextStyle(color: Colors.black,fontSize: 15),softWrap: true)),
                              DataCell(Text('\$  ${totalInterest==null?0:totalInterest}',style: TextStyle(color: Colors.black,fontSize: 15),softWrap: true)),
                            ],
                          ),

                          DataRow(
                            cells: [
                              DataCell(Text('TOTAL PAYMENT ',style: TextStyle(color: Colors.black,fontSize: 15),softWrap: true)),
                              DataCell(Text('\$  ${totalAmount==null?0:totalAmount}',style: TextStyle(color: Colors.black,fontSize: 15),softWrap: true)),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),


            ],
          ),
      ),
    );
  }
}
