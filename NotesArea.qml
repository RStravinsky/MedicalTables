import QtQuick 2.2
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2
import QtQuick.Window 2.2
import QtQuick.Controls.Styles 1.3

Rectangle {

    function clearNotes() { textInput.text = "" } 
    property string text: textInput.text

    id: textArea
    height: parent.height
    width: parent.width
    border.width: 3
    border.color: {
        if( textInput.focus) "#69C0D9"
        else "lightgray"
    }
    radius: 10
    smooth: true

    Text {
        id: notesText
        text: "Uwagi:"
        width: column.width
        height: textArea.anchors.margins
        color: "gray"
        anchors.top: textArea.top
        anchors.left: textArea.left
        anchors.topMargin: 5
        anchors.leftMargin: 10
        font { family: "Arial"; pixelSize: settingsArea.width * 0.05 }
    }

    TextArea {
        id: textInput
        anchors.fill: textArea
        wrapMode: TextEdit.Wrap
        anchors.margins: parent.width/10
        frameVisible: false
        font { family: "Arial"; pixelSize: settingsArea.width * 0.05 }
        style: TextAreaStyle {
            backgroundColor : "transparent"
            textColor:  "gray"
        }
    }

} // Rectangle
