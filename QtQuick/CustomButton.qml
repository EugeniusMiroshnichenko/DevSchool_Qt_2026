import QtQuick 2.15
import QtQuick.Controls 2.15

Button {
    property int customSpeed: 0
    width: 25
    height: 25
    Text { text: "*"; color: "white"; font.pixelSize: 16; anchors.centerIn: parent}

    property bool containsMouse: hovered

    background: Rectangle {
        color: "black"
    }

    onClicked: {
        destroy();
    }
}
