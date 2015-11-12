#ifndef ITEMSLIST_H
#define ITEMSLIST_H

#include <QObject>
#include <QDebug>
#include <QMap>
#include <QDir>
#include <QFile>
#include <QMessageBox>
#include <QTextStream>
#include <medicaltable.h>
#include <imagespath.h>
#include <array>
#include <QAxBase>
#include <QAxObject>
#include <QAxWidget>

class ItemsList : public QObject
{
    Q_OBJECT
    Q_PROPERTY (QQmlListProperty<QObject> itemsList READ getItemsList NOTIFY itemsListChanged)
    Q_PROPERTY (QQmlListProperty<QObject> imagesList READ getImagesList NOTIFY imagesListChanged)
    QList<QObject*> itemsList;
    QList<QObject*> imagesList;
    QString actualTable;
    QString topColor{"6099"};
    QString bottomColor{"9006"};
    std::array<int,14> indexArray;
    void setArray();
    void generateCSV();

public:
    explicit ItemsList(QObject *parent = 0); 

    Q_INVOKABLE QQmlListProperty<QObject> getItemsList() {

       return QQmlListProperty<QObject>(this, itemsList);
    }


    Q_INVOKABLE void setItemsList(const QString & buttonName);
    Q_INVOKABLE void clearList();

    Q_INVOKABLE QQmlListProperty<QObject> getImagesList() {

       return QQmlListProperty<QObject>(this, imagesList);
    }

    Q_INVOKABLE void setImagesList(const QString & buttonName);

    Q_INVOKABLE void generateSchedule();

    Q_INVOKABLE void setColor(QString color,  const int &itemIndex );

    Q_INVOKABLE void setText( const QString text, const int &itemIndex );

signals:
    void itemsListChanged(QQmlListProperty<QObject> _itemsList);
    void imagesListChanged(QQmlListProperty<QObject> _imagesList);

public slots:
    void mainButtonClicked(const QString &buttonName);
    void itemClicked(const int &itemIndex, const QString state);
};

#endif // ITEMSLIST_H
