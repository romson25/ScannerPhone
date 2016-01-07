#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>

#include "cppconnector.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    CppConnector cpp;

    qmlRegisterType<CppConnector>("com.company.scannerphone",1,0,"Server");
    engine.rootContext()->setContextProperty("CppConnector",&cpp);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}

