import QtQuick 2.15

Timer {
    id: moveTimer
    interval: 100
    running: true
    repeat: true
    property var targetButton: null

    onTriggered: {
        var currentSpeed = targetButton.customSpeed
        if (targetButton.containsMouse) {
            currentSpeed = targetButton.customSpeed * 2
        }

        targetButton.y += currentSpeed

        if (targetButton.y + targetButton.height >= mainWindow.height) {
            mainWindow.title = "YOU LOOSE!"
            mainWindow.backgroundColor = "red"
            targetButton.destroy()
            moveTimer.destroy()
        }
    }
}
