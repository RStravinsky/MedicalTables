#ifndef ITEMSLIST_H
#define ITEMSLIST_H

#include <QObject>
#include <QDebug>
#include <medicaltable.h>
#include <imagespath.h>

class ItemsList : public QObject
{
    Q_OBJECT
    Q_PROPERTY (QQmlListProperty<QObject> itemsList READ getItemsList NOTIFY itemsListChanged)
    Q_PROPERTY (QQmlListProperty<QObject> imagesList READ getImagesList NOTIFY imagesListChanged)
    QList<QObject*> itemsList;
    QList<QObject*> imagesList;

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

signals:
    void itemsListChanged(QQmlListProperty<QObject> _itemsList);
    void imagesListChanged(QQmlListProperty<QObject> _imagesList);

public slots:
    void mainButtonClicked(const QString &buttonName);
    void itemClicked(const int &itemIndex);
};

#endif // ITEMSLIST_H
