import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: mainWindow
    width: 800
    height: 600
    visible: true
    title: "WidgetMovement"

    property color backgroundColor: "white"

    Rectangle {
        anchors.fill: parent
        color: mainWindow.backgroundColor
    }

    Timer {
        id: createTimer
        interval: 100 + Math.floor(Math.random() * 900)
        running: true
        repeat: true
        onTriggered: {
            var button = buttonComponent.createObject(mainWindow)

            var buttonWidth = 25
            var maxX = mainWindow.width - buttonWidth
            var randomX = Math.floor(Math.random() * maxX)
            button.x = randomX
            var maxY = 100 - buttonWidth
            button.y = Math.floor(Math.random() * maxY)

            var speed = Math.floor(Math.random() * 5) + 1
            button.customSpeed = speed

            var moveTimer = moveTimerComponent.createObject(mainWindow)
            moveTimer.targetButton = button

            createTimer.interval = 100 + Math.floor(Math.random() * 900)
        }
    }

    Component {
        id: moveTimerComponent
        MoveTimer {}
    }

    Component {
        id: buttonComponent
        CustomButton {}
    }
}
