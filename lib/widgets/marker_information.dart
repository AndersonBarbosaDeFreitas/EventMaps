import 'package:flutter/material.dart';

class MarkernInformationWidget extends StatefulWidget {
  final String nameEvent;
  final String addressEvent;
  final Color colorCategory;

  MarkernInformationWidget(
      {this.nameEvent, this.addressEvent, this.colorCategory});

  @override
  _MarkernInformationWidgetState createState() =>
      _MarkernInformationWidgetState();
}

class _MarkernInformationWidgetState extends State<MarkernInformationWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20),
              topRight: const Radius.circular(20),
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: widget.colorCategory,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(20),
                    topRight: const Radius.circular(20),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(6)),
                        Text(
                          '${widget.nameEvent}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${widget.addressEvent}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        Padding(padding: EdgeInsets.all(6)),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Padding(padding: EdgeInsets.all(6)),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Wrap(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Descrição',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Descrição do Evento selecionado que aumenta de acordo com o tamanho do texto',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(right: 6),
                                  child: Icon(
                                    Icons.location_on,
                                    size: 28,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Endereço do evento detalhadamente detalhado",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(right: 6),
                                  child: Icon(
                                    Icons.access_time,
                                    size: 28,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "Aberto",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(right: 6),
                                  child: Icon(
                                    Icons.phone,
                                    size: 28,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "(00) 0000-0000",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.only(right: 6),
                                  child: Icon(
                                    Icons.link,
                                    size: 28,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "https://www.siteevento.com.br",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
