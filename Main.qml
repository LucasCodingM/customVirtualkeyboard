import QtQuick

Window {
    id:windowMain
    objectName: "windowMain"
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")


    Rectangle {
        color: "red"
        width: parent.width
        height: 100

        TextInput {
            id: textInput
            anchors {left: parent.left;  right: parent.right;  top: parent.top;  margins: 10}
            font.pixelSize: 0.5 * parent.height
        }
    }

    Component.onCompleted: keyboardController.show()

    KeyboardController {
        id: keyboardController
        target: textInput
    }



}
