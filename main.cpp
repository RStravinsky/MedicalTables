#include <QApplication>
#include <QQmlApplicationEngine>
#include <QIcon>
#include <QRect>
#include <QDebug>
#include <QDesktopWidget>
#include "myclass.h"
#include <QQmlContext>

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    app.setWindowIcon(QIcon("qrc:/images/logo.ico"));
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    //MyClass myClass;  // A class containing my functions

    QList<QObject*> dataList;
    dataList.append(new MyClass("/images/images/zaglowek.png"));
    dataList.append(new MyClass("/images/images/zaglowek.png"));
    dataList.append(new MyClass("/images/images/zaglowek.png"));
    dataList.append(new MyClass("/images/images/zaglowek.png"));
    engine.rootContext()->setContextProperty("myModel", QVariant::fromValue(dataList));

    return app.exec();
}
