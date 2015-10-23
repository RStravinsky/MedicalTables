import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1

ApplicationWindow {
    title: qsTr("Hello World")
    visibility: "Maximized"
    visible: true

    MainForm {

            StatusBar{
                    anchors.bottom: parent.bottom
                    Label { text: "Read Only" }
            }
        anchors.fill: parent


        //Tbutton { titleSource: "images/t2logo.png"; pictureSource: "images/noxi-T2 mod 1.jpg" }
        Tbutton {
            titleImg: "/images/logo.ico"
            tableImg: "/images/logo.ico"
            bWidth: parent.width/3
            bHeight: parent.height/8

        }

    }



    MessageDialog {
        id: messageDialog
        title: qsTr("May I have your attention, please?")

        function show(caption) {
            messageDialog.text = caption;
            messageDialog.open();
        }

    }
}
