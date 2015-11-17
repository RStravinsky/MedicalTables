import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.3

Rectangle {
    id: textArea
    height: parent.height
    width: parent.width
    border.width: 3
    border.color: {
        if( mouseArea.containsMouse) "#569ffd"
        else "lightgray"
    }
    radius: 20
    smooth: true

    TextArea {
        id: textInput
        anchors.fill: textArea
        wrapMode: TextEdit.Wrap
        anchors.margins: 20
        frameVisible: false
        font { family: "Arial"; pointSize: 17 }
        style: TextAreaStyle {
            backgroundColor : "transparent"
        }

        MouseArea {
            id: mouseArea
            hoverEnabled: true
            anchors.fill: textInput
            onEntered: textInput.focus = true
        }
    }



} // Rectangle
