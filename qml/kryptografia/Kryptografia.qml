import QtQuick 2.1
import Qt.labs.presentation 1.0

OpacityTransitionPresentation {
    id:kryptografia
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

    //fontFamily: "OxygenSans"
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
            " Bardzo wolne operacje szyfowania i deszyfrowania"
        ]
    }
    Slide{
        title: "Szyfry Mieszane"
        content:[
            "Używamy klyczy symetrycznych i asymetrycznych jednocześnie",
            ""
        ]
    }
}
