import QtQuick 2.1
import Qt.labs.presentation 1.0
import QtGraphicalEffects 1.0

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
        goToSlide(18);
    }
    Slide{
        id:slide_00
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
        id:slide_01
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
        id:slide_02
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
        id:slide_03
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
        id:slide_04
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
        id:slide_05
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
                    Item{
                        width: parent.width
                        height: t2.height
                        //color: "transparent"
                    SlideText{
                        id:t2
//                        anchors.verticalCenter: parent.verticalCenter
//                        anchors.horizontalCenter: parent.horizontalCenter
//                        anchors.leftMargin: 15
                        //width: parent.width
                        //wrapMode: Text.WordWrap
                        fontScale:0.9
                        text:"Kluczem prywatnym nie wolno się dzielić."
                        visible: false
                    }
                    Glow{
                        source: t2
                        samples: 32
                        color:"Red"
                        anchors.fill: parent
                        spread:0.7
                        SequentialAnimation on radius {
                            NumberAnimation{
                                to: 16
                                duration:1300
                            }
                            NumberAnimation{
                                to:0
                                duration:800
                            }
                            loops: Animation.Infinite
                        }
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
        id:slide_06
        title: "Szyfry Mieszane"
        content:[
            "W praktyce używa się obu rodzajów algorytmów na raz:",
            " Wiadomość szyfrujemy symetrycznie, losowym kluczem (tzw. kluczem sesji).",
            " klucz sesji szyfrujemy kluczem publicznym odbiorcy",
            " łączymy zaszyfrowną wiadomość i zaszyfrowany klucz sesji",
            " przygotowane dane wysyłamy odbiorcy"
        ]
        Image {
            id: cryptFileAnimation
            property int currentFrame: 0
            source: cryptAnimationFrames.get(currentFrame).src
            width: parent.width*0.7
            height: parent.height/2
            anchors.bottom: parent.bottom
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    console.log("count:" + cryptAnimationFrames.count)
                    console.log("current:" + cryptFileAnimation.currentFrame)
//                    console.log("button:" + mouse.button)
                    if(mouse.button === Qt.LeftButton){
                        //if(cryptFileAnimation.currentFrame <= cryptAnimationFrames.count - 2)
                         cryptFileAnimation.currentFrame =(cryptFileAnimation.currentFrame == cryptAnimationFrames.count - 1) ? 0 : cryptFileAnimation.currentFrame+1
                    } else if( mouse.button === Qt.RightButton){
                        if(cryptFileAnimation.currentFrame >= 1)
                            cryptFileAnimation.currentFrame--;
                    }
                }
            }
        }
        ListModel{
            id:cryptAnimationFrames
            ListElement{src:"msg_crypt_hybrid_00.svg"}
            ListElement{src:"msg_crypt_hybrid_01.svg"}
            ListElement{src:"msg_crypt_hybrid_02.svg"}
            ListElement{src:"msg_crypt_hybrid_03.svg"}
            ListElement{src:"msg_crypt_hybrid_04.svg"}
            ListElement{src:"msg_crypt_hybrid_05.svg"}
            ListElement{src:"msg_crypt_hybrid_06.svg"}
            ListElement{src:"msg_crypt_hybrid_07.svg"}
            ListElement{src:"msg_crypt_hybrid_08.svg"}
            ListElement{src:"msg_crypt_hybrid_09.svg"}
            ListElement{src:"msg_crypt_hybrid_10.svg"}
            ListElement{src:"msg_crypt_hybrid_11.svg"}
            ListElement{src:"msg_crypt_hybrid_12.svg"}
        }
    }
    Slide{
        id:slide_07
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
                    text: "- ASE
- 3DES
- DES
- Blowfish
- IDEA
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
    Slide{
        id:slide_08
        title: "Funkcje Skrótu"
        content: [
            "Inne nazwy:",
            " funkcja haszująca",
            " funkcja mieszjąca",
            " \"odcisk palca\"",
            "Cechy",
            " Jednokierunkowość",
            " Odporność na kolizje",
            "W kryptografi służą do weryfikacji danych",
        ]
    }
    Slide{
        id:slide_09
        title: "Funkcje Skrótu"
        content:[
            "najpopularniejsze obecnie funkcje skrótu",
            " SHA-2 (Secure Hash Algorithm)",
            " MD5   (Message Digest) - złamany nie używać do szyforwania",
            " http://en.wikipedia.org/wiki/Comparison_of_cryptographic_hash_functions"
        ]
    }
    Slide{
        id: slide_10
        title: "Podpis cyfrowy"
        content:[
            "Podpis cyfrowy to nie jest skan ręcznego podpisu",
            "Najpopularniejsze algorytmy",
            " RSA - ten sam klucz może być użyty do szyfrowania i podpisywania",
            " DLSS - Discrete Logarithm Signature Systems - tylko podpisywanie.",
            "  ElGamal",
            "  DSA",
            "  Krzywe Eliptyczne"
        ]
    }
    Slide{
        id: slide_12
        title: "Podpis cyforwy"
        content:[
            "Jak działa podpis w RSA?",
            " oryginalny dokument \"deszyfrujemy\" swoim kluczem prywatnym",
            " wysyłamy wiadomość zawierającą oryginalny dokument i \"odszyfrowany\"",
            " odbiorca szyfruje \"odszyfrowany\" dokument i sprawdza z oryginałem",
            "  jeśli oba dokumenty są identyczne -> podpis zgadza się",
            "Wady?",
            " RSA jest baaaaardzo wolne"
        ]
    }
    Slide{
        id: slide_13
        title: "Podpis cyfrowy"
        content:[
            "Najważniejsze różnice między RSA a DLSS",
            " RSA służy do szyfrowania i podpisywania, DLSS tylko do podpisywania",
            " RSA jest szybsze",
            " dla RSA klucze długości od 768 do 1024 bitów są wystarczające",
            " DLSS wystarczają jeszcze którtsze klucze",
            " DLSS wymagają losowej liczby do każdego podpisu",
            " RSA wymage \"tylko\" losowego klucza"
        ]
    }
    Slide{
        id: slide_14
        title: "Podpis cyfrowy w praktyce"
        content:[
            "Podpisanie wiadomości z załączikiem może bardzo długo trwać",
            "Rozwiązanie:",
            " Generujemy \"odcisk\" wiadomości",
            " podpisujemy tylko \"hash\"",
        ]
    }
    Slide{
        id: slide_15
        title: "Narzędzia"
        content: [
            "PGP -> PGPCorporation -> Symantec",
            " rozwiązanei komercyjne",
            " kod źródłowy dostępny",
            "GnuPG",
            "GPG4Win"
        ]
        notes: "
http://www.symantec.com/connect/downloads/symantec-pgp-desktop-peer-review-source-code
http://www.gnupg.org/
http://www.gpg4win.org/
"
        Rectangle{
            width: parent.width * 0.03
            height: width
            color: "#5500dd00"
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    console.log("show notes:" + kryptografiaId.showNotes)
                    kryptografiaId.showNotes= !kryptografiaId.showNotes;
                }
            }
        }
    }
    Slide{
        id: slide_16
        title: "Generowanie klucza głównego"
        Column{
            anchors.fill: parent
            SlideText{
                width: parent.width
                text: "Tworzymy miejsce na tymczasowy pęk kluczy i eksportujemy GNUPGHOME. Zawartość zmiennej pokazuje katalog zawirający pliki gpg."
                wrapMode: Text.Wrap
            }
            CodeRect{
                width:parent.width
                height: 140
                code:"mkdir ~/.gpg_tmp
chmod 700 ~/.gpg_tmp
export GNUPGHOME=~/.gpg_tmp
gpg --gen-key"
            }
        }
    }
    Slide{
        id: slide_17
        title:"Generowanie klucza"
        Column{
            width: parent.width
            CodeRect{
                width: parent.width
                height: 125
                code:"gpg --gen-key"
            }
            SlideText{
                text:"Po drodze trzeba odpowiedzieć na kilka ptyań:
- Rodzaj generowanych kluczy
- Wielkość klucza
- okres ważności
- Imię Nazwisko
- Email
- Komentarz (psełdonim)
- Hasło
Na koniec program wypisze informacje o kluczach"
            }
        }
    }

    Slide{
        id: slide_18
        title: "Podklucze (subkeys)"
        content:[
            "Główny klucz to nasza tożsamość",
            "Podklucze można unieważniać - i nie tracić tożsamości",
            "Podklucze można wrzucać w miejsca mniej bezpieczne",
            " tablety",
            " telefony",
            " inne komputery"
        ]
    }
    Slide{
        id: slide_19
        title: "generowanie podkluczy"
        Column{
            width: parent.width
            spacing: height*0.1
            Row{
                width: parent.width
                spacing: width*0.01
                CodeRect{
                    width: parent.width/2
                    height: 130
                    code: "gpg --list-keys"
                }
                SlideText{
                    width: parent.width/2
                    text:"Znajdź sówj klucz (a właściwie ID klucza)"
                }
            }
            Row{
                width: parent.width
                spacing: width*0.01
                CodeRect{
                    width: parent.width/2
                    height: 130
                    code: "gpg --edit-key ID_klucza
gpg> addkey
gpg> save"
                }
                SlideText{
                    width: parent.width/2
                    text:"Edytujemy klucz główny, a następnie dodajemy nowy klucz zapisujemy wprowadzone zmiany."
                }
            }
            SlideText{
                width: parent.width
                text: "Po wykonaniu powyższych poleceń mamy przygotowany klucz, wraz z podkluczami, których będziemy używać na codzień. Dobrze jest zrobić kopię bezpieczeństwa: skopiować cały katalog na pendriva i wrzucić do sejfu."
            }
        }
    }

    Slide{
        id: slide_119
        title: "Eksport podkluczy"
    }
    Slide{
        id: slide_120
        title: "Nowy \"KeyRing\""
    }
    Slide{
        id: slide_121
        title: "Import podkluczy"
    }
    Slide{
        id: slide_122
        title: "Eksport kluczy publicznych"
    }
    Slide{
        id: slide_123
        title: "Import i weryfikacja kluczy publicznych"
    }
    Slide{
        id: slide_124
        title: "Podpiswanie kluczy - certyfikaty"
    }
    Slide{
        id: slide_125
        title: "Import certyfikatu"
    }
    Slide{
        id: slide_126
        title: "Szyfrowanie Pliku"
    }
    Slide{
        id: slide_127
        title: "Podpisywanie pliku"
    }
    Slide{
        id: slide_128
        title: "Sprawdzenie podpisu"
    }
    Slide{
        id: slide_129
        title: "Odszyfrowanie pliku"
    }
    Slide{
        id: slide_129_1
        title: "Links"
        content: [
            "https://wiki.debian.org/subkeys",
            "https://wiki.debian.org/Keysigning",
            "https://we.riseup.net/riseuplabs+paow/openpgp-best-practices",pr
        ]
    }

    Slide{
        id: slide_130
        title: "OpenSSL/EasyRsa"
    }
}
