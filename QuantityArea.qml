import QtQuick 2.2
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.3

Item {

    id: quantityArea

    Row {
        id: quantityRow
        width: quantityArea.width
        height: quantityArea.height
        spacing: 20

        Image {
            id: addImage
            source: "/images/images/quantity.png"
            anchors.verticalCenter: quantityRow.verticalCenter
            height: quantityRow.height/1.5
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
            focus: quantityLineEdit.hovered == true ? true : false
            font { family: "Arial"; pointSize: 17  }
            style: TextFieldStyle {
                    textColor: "gray"
                    background: Rectangle {
                        implicitWidth: quantityLineEdit.width
                        implicitHeight: quantityLineEdit.height
                        radius: 20
                        border.color: quantityLineEdit.hovered == true ? "#569ffd" : "lightgray"
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

        }
    }


}
