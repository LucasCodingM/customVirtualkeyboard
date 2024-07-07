import QtQuick

Rectangle {
    id: root
    property Item target
    //width: windowMain.width
    height: 0.4 * windowMain.height
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    color: "#9ea3a8"

    property double rowSpacing:     0.01 * width  // horizontal spacing between keyboard
    property double columnSpacing:  0.02 * height // vertical   spacing between keyboard
    property bool   shift:          false
    property bool   symbols:        false
    property double columns:        10
    property double rows:           4

    property string strShift: '\u2191'
    property string strBackspace: '\u2190'

    property var modelKeyboard: {
        "row_1" : [
                    {text: 'a', symbol: '1', width: 1},
                    {text: 'z', symbol: '2', width: 1},
                    {text: 'e', symbol: '3', width: 1},
                    {text: 'r', symbol: '4', width: 1},
                    {text: 't', symbol: '5', width: 1},
                    {text: 'y', symbol: '6', width: 1},
                    {text: 'u', symbol: '7', width: 1},
                    {text: 'i', symbol: '8', width: 1},
                    {text: 'o', symbol: '9', width: 1},
                    {text: 'p', symbol: '0', width: 1},
       ],
        "row_2" : [
                    {text: 'q', symbol: '-', width: 1},
                    {text: 's', symbol: '/', width: 1},
                    {text: 'd', symbol: ':', width: 1},
                    {text: 'f', symbol: ';', width: 1},
                    {text: 'g', symbol: '(', width: 1},
                    {text: 'h', symbol: ')', width: 1},
                    {text: 'j', symbol: '€', width: 1},
                    {text: 'k', symbol: '&', width: 1},
                    {text: 'l', symbol: '@', width: 1},
                    {text: 'm', symbol: '"', width: 1}
                ],
        "row_3" : [
                    {text: strShift, symbol: strShift, width: 1.5},
                    {text: 'w', symbol: '.', width: 1},
                    {text: 'x', symbol: ',', width: 1},
                    {text: 'c', symbol: '?', width: 1},
                    {text: 'v', symbol: '!', width: 1},
                    {text: 'b', symbol: "'", width: 1},
                    {text: 'n', symbol: "%", width: 1},
                    {text: "'", symbol: "*", width: 1},
                    {text: strBackspace, symbol: strBackspace, width: 1.5}
                ],
        "row_4" : [
                    {text: '123', symbol: 'ABC', width: 1.5},
                    {text: ' ', symbol: ' ', width: 6},
                    {text: '.', symbol: '.', width: 1},
                    {text: 'return', symbol: 'return', width: 1.5},
                ]
    }

    property var tableKeyEvent: {
        "_0" : Qt.Key_0,
        "_1" : Qt.Key_1,
        "_2" : Qt.Key_2,
        "_3" : Qt.Key_3,
        "_4" : Qt.Key_4,
        "_5" : Qt.Key_5,
        "_6" : Qt.Key_6,
        "_7" : Qt.Key_7,
        "_8" : Qt.Key_8,
        "_9" : Qt.Key_9,

        "_a" : Qt.Key_A,
        "_b" : Qt.Key_B,
        "_c" : Qt.Key_C,
        "_d" : Qt.Key_D,
        "_e" : Qt.Key_E,
        "_f" : Qt.Key_F,
        "_g" : Qt.Key_G,
        "_h" : Qt.Key_H,
        "_i" : Qt.Key_I,
        "_j" : Qt.Key_J,
        "_k" : Qt.Key_K,
        "_l" : Qt.Key_L,
        "_m" : Qt.Key_M,
        "_n" : Qt.Key_N,
        "_o" : Qt.Key_O,
        "_p" : Qt.Key_P,
        "_q" : Qt.Key_Q,
        "_r" : Qt.Key_R,
        "_s" : Qt.Key_S,
        "_t" : Qt.Key_T,
        "_u" : Qt.Key_U,
        "_v" : Qt.Key_V,
        "_w" : Qt.Key_W,
        "_x" : Qt.Key_X,
        "_y" : Qt.Key_Y,
        "_z" : Qt.Key_Z,

        "_\u2190": Qt.Key_Backspace
    }

    Column {
        spacing: columnSpacing
        Row {
            Item {
                width: root.width
                height: columnSpacing/2
            }
        }

        Row {
            id:row_1
            spacing: rowSpacing
            Repeater {
                model: modelKeyboard["row_1"]
                delegate: CustomButtonKeyboard {
                    text: symbols? modelData.symbol: shift? modelData.text.toUpperCase():  modelData.text
                    buttonWidth: modelData.width * keyboard.width / columns - rowSpacing
                    buttonHeight: keyboard.height / rows - (columnSpacing * 1.5)

                    onClicked: root.clicked(text)
                }
            }
        }
        Row {
            id:row_2
            spacing: rowSpacing
            Repeater {
                model: modelKeyboard["row_2"]
                delegate: CustomButtonKeyboard {
                    text: symbols? modelData.symbol: shift? modelData.text.toUpperCase():  modelData.text
                    buttonWidth: modelData.width * keyboard.width / columns - rowSpacing
                    buttonHeight: keyboard.height / rows - (columnSpacing * 1.5)

                    onClicked: root.clicked(text)
                }
            }
        }
        Row {
            id:row_3
            spacing: rowSpacing
            Repeater {
                model: modelKeyboard["row_3"]
                delegate: CustomButtonKeyboard {
                    text: symbols? modelData.symbol: shift? modelData.text.toUpperCase():  modelData.text
                    buttonWidth: modelData.width * keyboard.width / columns - rowSpacing
                    buttonHeight: keyboard.height / rows - (columnSpacing * 1.5)

                    onClicked: root.clicked(text)
                }
            }
        }
        Row {
            id:row_4
            spacing: rowSpacing
            Repeater {
                model: modelKeyboard["row_4"]
                delegate: CustomButtonKeyboard {
                    text: symbols? modelData.symbol: shift? modelData.text.toUpperCase():  modelData.text
                    buttonWidth: modelData.width * keyboard.width / columns - rowSpacing
                    buttonHeight: keyboard.height / rows - (columnSpacing * 1.5)

                    onClicked: root.clicked(text)
                }
            }
        }
    }

    signal clicked(string text)

    Connections {
           target: root
           function onClicked(text) {
               var position
               // if( text === strBackspace) { // LEFTWARDS ARROW (backspace)
               //     position = textInput.cursorPosition
               //     textInput.text = textInput.text.substring(0, textInput.cursorPosition - 1) +
               //                      textInput.text.substring(textInput.cursorPosition, textInput.text.length)
               //     textInput.cursorPosition = position - 1
               // }
               if(text === strShift)  shift   = !shift // UPWARDS ARROW (shift)
               else if(text === '123')     symbols = true
               else if(text === 'ABC')   symbols = false
               else if(text === 'return')  accepted(textInput.text) // DOWNWARDS ARROW WITH CORNER LEFTWARDS (enter)
               else { // insert text
                   // position = textInput.cursorPosition
                   // textInput.text = textInput.text.substring(0, textInput.cursorPosition) + text +
                   //                  textInput.text.substring(textInput.cursorPosition, textInput.text.length)
                   // textInput.cursorPosition = position + 1

                   keyEmitter.keyPressed(textInput,tableKeyEvent['_'+text])

                   shift = false // momentary
               }
           }
       }


}