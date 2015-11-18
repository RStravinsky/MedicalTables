import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.3

Item {

    id: quantityArea

    function clearQuantity() { quantityLineEdit.text = "" }
    property string text: quantityLineEdit.text

    Row {
        id: quantityRow
        width: quantityArea.width
        height: quantityArea.height
        spacing: 5

        Image {
            id: addImage
            source: "/images/images/add.png"
            anchors.verticalCenter: quantityRow.verticalCenter
            height: quantityRow.height
            width: height
        }

        TextField {
            id: quantityLineEdit
            height: quantityRow.height
            width: quantityRow.width - addImage.width - quantityRow.spacing
            horizontalAlignment: Text.AlignHCenter
            maximumLength: 4
            placeholderText: "Wpisz ilość sztuk"
            validator: IntValidator {}
            font { family: "Arial"; pixelSize: settingsArea.width * 0.05 }
            style: TextFieldStyle {
                    textColor: "gray"
                    background: Rectangle {
                        implicitWidth: quantityLineEdit.width
                        implicitHeight: quantityLineEdit.height
                        radius: 10
                        border.color: quantityLineEdit.focus == true ? "#69C0D9" : "lightgray"
                        border.width: 3
                    }      
            }

            Image {
                id: clearText
                anchors { right: quantityLineEdit.right; margins: 1; verticalCenter: parent.verticalCenter }
                source: "/images/images/clear.png"
                smooth: true
                visible: quantityLineEdit.text
                height: quantityLineEdit.height - 2*column.spacing
                width: height

                MouseArea {
                    id: clear
                    anchors.fill: clearText
                    height: clearText.height; width: clearText.height
                    onClicked: {
                        quantityLineEdit.text = ""
                        quantityLineEdit.forceActiveFocus()
                    }
                }
            }

        } // TextField

    } // Row

} // Item
