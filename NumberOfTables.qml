import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.3

Window {
    id: numberDialog
    width: 200
    height: 200

    Rectangle {
        id: rectangle
        width: numberDialog.width
        height: numberDialog.height

    Text {
        id: text
        width: rectangle.width - 20
        height: rectangle.height * .1
        anchors { top: rectangle.top; margins: 10; horizontalCenter: rectangle.horizontalCenter; verticalCenter: rectangle.verticalCenter }
        font { family: "Arial"; pointSize: 15 }
        color: "gray"
        text: "Proszę podać ilość sztuk:"
    }

    TextField {
        id: lineEdit
        width: rectangle.width - 20
        visible: true
        height: rectangle.height * .3
        anchors { top: text.bottom; margins: 10; horizontalCenter: rectangle.horizontalCenter }
        text:"1"
        font { family: "Arial"; pointSize: 15; bold: true}
        z: 1
        focus: true
        style: TextFieldStyle {
               background: Rectangle {
                   radius: 10
                   border.color: "gray"
                   border.width: 2
               }
           }

//        Image {
//            id: clearText
//            anchors { right: lineEdit.right; margins: 1; verticalCenter: rectangle.verticalCenter }
//            source: "/images/images/clear.png"
//            smooth: true
//            visible: lineEdit.text
//            height: 50
//            width: 50

//            MouseArea {
//                id: clear
//                anchors.fill: clearText
//                height: clearText.height; width: clearText.height
//                onClicked: {
//                    lineEdit.text = ""
//                    lineEdit.forceActiveFocus()
//                }
//            }
//        }
    }
}
}
