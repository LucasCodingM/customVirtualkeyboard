#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "keyEmitter.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("customVirtualKeyboard", "Main");
    KeyEmitter keyEmitter;
    engine.rootContext()->setContextProperty("keyEmitter", &keyEmitter);

    return app.exec();
}
