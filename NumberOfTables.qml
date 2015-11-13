import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.3

Item {

    id: numberDialog  
    function clearText() { lineEdit.text = "1" }

    Rectangle {
        id: rectangle
        width: numberDialog.width
        height: numberDialog.height

        Image {
            id: clearText
            anchors.fill: rectangle
            source: "/images/images/number1.png"
            smooth: true
            antialiasing: true
        }


        Text {
            id: infoText
            width: rectangle.width
            height: rectangle.height * 0.01
            anchors.top: rectangle.top
            anchors.topMargin: rectangle.height * 0.15
            horizontalAlignment: Text.AlignHCenter
            text: "Ilość sztuk:"
            color: "gray"
            font { family: "Arial"; pixelSize: rectangle.height * .1 }
        }

        TextField {
            id: lineEdit
            width: rectangle.width
            height: rectangle.height * .9
            anchors.top: infoText.bottom
            anchors.bottom: rectangle.bottom
            anchors.bottomMargin: rectangle.height * 0.1
            text: "1"
            maximumLength: 4
            horizontalAlignment: Text.AlignHCenter
            focus: lineEdit.hovered == true ? true : false
            validator: IntValidator{ bottom: 1 }
            font { family: "Arial"; pixelSize: rectangle.height * .4; bold: true }
            style: TextFieldStyle {
                    textColor: "gray"
                    background: Rectangle {
                        implicitWidth: lineEdit.width
                        implicitHeight: lineEdit.height
                        color: "transparent"
                    }
            }
            onTextChanged: {
                if( text == "0" || text == "" ) text = "1";
                optList.onTextChanged(text)
            }
        }
    }
}
