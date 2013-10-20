import QtQuick 2.1
import Qt.labs.presentation 1.0

OpacityTransitionPresentation {
    id:kryptografiaId
    fontFamily: "Oxygen"
    codeFontFamily: "OxygenMono"

    BackgroundSwirls{
        /*color2: "green"
        color1: "greenyellow"*/
        color1:"darkcyan"
        color2:"darkgreen"
        //paricles: false
        paricles: true
    }
    SlideCounter{
        opacity: (currentSlide==0) ? 0.0: 1.0;
        Behavior on opacity{
            NumberAnimation{
                duration: 3000
            }
        }
    }
    Text{
        id:who
        color: "#bbb" //parent.textColor != undefined ? parent.textColor : "#bbb"
        font.family: parent.fontFamily != undefined ? parent.fontFamily : "Helvetica"
        font.pixelSize: parent.height * 0.05 * 0.45 //ostatnia zmienna to skala
        text:"Radosław Wicik <radoslaw@wicik.pl>"
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: font.pixelSize
        opacity: (currentSlide==0) ? 0.0: 1.0;
        Behavior on opacity{
            NumberAnimation{
                duration: 3000
            }
        }
    }

    Component.onCompleted: {
        //console.log("parent:" + parent)
        goToSlide(7);
    }
    Slide{
        centeredText: "Kryptografia"
        fontScale: 4
        Text{
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            text:"Radosław Wicik <radoslaw@wicik.pl>
v 1.0"
            color:"#bbb"
        }
    }

    Slide{
        title: "Kryptografia"
        //centeredText: "Who am I?"
        content:[
            "Edward Snowden, NSA...",
            "Kto jeszcze może słuchać?",
            "A z kim ja właściwie rozmawiam?"
        ]
        notes: "http://www.techdirt.com/articles/20130909/04383424450/latest-leak-shows-nsa-engaging-economic-espionage-not-fighting-terrorism.shtml
brazylijski Petrobras"
    }
    Slide{
        title: "Pojęcia podstawowe"
        content:[
            "Szyfry Symetryczne",
            "Szyfry Asymetryczne",
            "Szyfry Mieszane",
            "Jednokierunkowe funkcje skrótu",
            "Podpis cyfrowy"
        ]
    }
    Slide{
        title: "Szyfry Symetryczne"
        content:[
            "Zalety",
            " Jeden klucz do szyfrowania i deszyfrowania",
            " Bardzo szybkie szyfrowanie",
            " Ogromne przestrzenie klucza",
            "  128-bitowy klucz jest praktyzcznie nie do złamania",
            "Wady",
            " Uzgodnienie i wymiana klucza",
            " Ilość kluczy: n(n-1)/2",
        ]
        ListModel{
            id:iloscKluczy
            ListElement{src:"Keys_02.svg"}
            ListElement{src:"Keys_03.svg"}
            ListElement{src:"Keys_04.svg"}
            ListElement{src:"Keys_05.svg"}
        }
//        Rectangle{

//            anchors.right: parent.right
//            anchors.bottom: parent.bottom
//            width:350
//            height: 350
//            color:"transparent"
            Image{
                id:kluczeImg
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                //source: "Keys_01.svg"
                width: 350
                height: width
            }
            Timer{
                id:keysTimer
                interval: 1000
                repeat: true
                property int current:0
                onTriggered: {

                    if(current>=iloscKluczy.count){
                        current=0;
                    }
                    kluczeImg.source = iloscKluczy.get(current).src
                    current++;
                    //console.log("i:"+current)
                }
            }
            onVisibleChanged: {
                //console.log("visible:" + visible)
                if(visible){
                    keysTimer.current = 0;
                    keysTimer.start();
                }else
                    keysTimer.stop();
            }

//        }
    }
    Slide{
        title: "Szyfry Asymetryczne"
        content: [
            "Zalety",
            " Jeden klucz na osobę",
            " Klucze można wymieniać niezaufanym kanłem (Internet?)",
            "Wady",
            " Małe przestrzenie klucza",
            "  3000 bitów to przestrzeń porównywalna do 128bitowego klucza symtrycznego",
            " Bardzo wolne operacje szyfowania i deszyfrowania (ok 1000x)"
        ]
    }
    Slide{
        title: "Szyfry Asymetryczne"

        Column{
            anchors.fill: parent
            SlideText{
                id:t1
                text:"Każda osoba generuje parę kluczy:"
            }
            Row{
                width: parent.width
                spacing: 50
                Column{
                    width: parent.width/2
//                    height: 300
                    Image{
                        id: i2
                        width:100
                        height:100
                        source: "barretr_Key.svg"
                    }
                    SlideText{
                        anchors.horizontalCenter: i2.horizontalCenter
                        text:"Prywatny"
                    }
                    SlideText{
                        width:parent.width-20
                        wrapMode: Text.WordWrap
                        fontScale: 0.9
                        text: "Służy do deszyfrowania (otwiera kłódkę) lub podpisywania wiadomości.
Powinien być zabezpieczony hasłem."
                    }
                    Rectangle{
                        x:parent.x - 20
                        width: parent.width+20
                        height: t2.height+20
                        color: "#80FFFF00"
                        //color:"blue"
                        //border.color: "Yellow"
                        //border.width: 1
                        SlideText{
                            id:t2
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.leftMargin: 15
                            //width: parent.width
                            //wrapMode: Text.WordWrap
                            fontScale:0.9
                            text:"Kluczem prywatnym nie wolno się dzielić."
                        }
                    }
                }
                Column{
                    width: parent.width/2
//                    width: 300
//                    height: 300

                    Image{
                        id: i1
                        width:100
                        height:100
                        source: "Secure_Light_Silver_open.svg"
                    }
                    SlideText{
                        anchors.horizontalCenter: i1.horizontalCenter
                        text:"Publiczny"
                    }
                    SlideText{
                        width:parent.width-20
                        wrapMode: Text.WordWrap
                        fontScale: 0.9
                        text: "Klucz rozdaje się wszystkim, najłatwiej poprzez serwer kluczy.
Wszyscy szyfrują naszym kluczem publicznym wiadomości do nas. Tylko odpowiedni klucz prywatny może
odszyfrować wiadomość zaszyfrowaną kluczem publicznym."
                    }
                }
            }
        }
    }
    Slide{
        title: "Szyfry Mieszane"
        content:[
            "W praktyce używa się rodzajów algorytmów na raz:",
            " Wiadomość szyfrujemy symetrycznie, losowym kluczem tzw kluczem sesji.",
            " klucz sesji szyfrujemy kluczem publicznym odbiorcy",
            " łączymy zaszyfrowną wiadomość i zaszyfrowany klucz sesji",
            " przygotowane dane wysyłamy odbiorcy"
        ]
    }
    Slide{
        title: "Algorytmy szyfrujące"
        Row{
            anchors.fill: parent
            spacing: 50
            Column{
                width: parent.width/2
                SlideText{
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"Symetryczne"
                }
                SlideText{
                    fontScale:0.6
                    text: "- DES
- 3DES
- IDEA
- ASE
- Blowfish
- Serpent
- Twofish"
                }
            }
            Column{
                width: parent.width/2
                SlideText{
                    anchors.horizontalCenter: parent.horizontalCenter
                    text:"Asymetryczne (pubilic key)"
                }
                SlideText{
                    fontScale:0.6
                    text:"- RSA
- Diffie-hellman (wimana kluczy sym.)
- DSA
- ElGamal"
                }
            }
        }
    }
}
