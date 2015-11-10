import QtQuick 1.0

Rectangle {
  id: delegateItem
  width: parent.width; height: 100
  color: "blue"

  Image {
    id: imageItem
    height: parent.height; width: 100
    anchors.left: parent.left
    // delegate can directly use ListElement role name
    source: imagePath
  }

  Text {
    id: itexItem
    anchors.left: imageItem.right
    anchors.leftMargin: 20
    anchors.verticalCenter: parent.verticalCenter
    font.pixelSize: 40
    // delegate can directly use ListElement role name
    text: imageName
  }
}
