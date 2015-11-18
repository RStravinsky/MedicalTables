#ifndef ITEMSLIST_H
#define ITEMSLIST_H

#include <QObject>
#include <QDebug>
#include <QMap>
#include <QDir>
#include <QFile>
#include <QFileInfo>
#include <QMessageBox>
#include <QTextStream>
#include <medicaltable.h>
#include <mainimagesource.h>
#include <array>
#include <tabledialog.h>
//#include <QAxBase>
//#include <QAxObject>
//#include <QAxWidget>

class ItemsList : public QObject
{
    Q_OBJECT
    Q_PROPERTY (QQmlListProperty<QObject> itemsList READ getItemsList NOTIFY itemsListChanged)
    Q_PROPERTY (QQmlListProperty<QObject> imagesList READ getImagesList NOTIFY imagesListChanged)

    QList<QObject*> m_itemsList;
    QList<QObject*> m_imagesList;
    QString m_actualTable{};
    QString m_topColor{"6099"};
    QString m_bottomColor{"9006"};
    QString m_quantity{"1"};
    QString m_order{};
    QString m_recipient{};
    QString m_year{};
    QString m_month{};
    QString m_day{};
    QString m_notes{};
    std::array <int,13> m_statesArray;
    TableDialog * tableDialog;
    QStandardItemModel * model;
    QFile * csvFile{NULL};
    bool mainOrderActive{false};

    void setItemsState();
    void setItemsList(const QString & _buttonName);
    void setImagesList(const QString & _buttonName);
    void clear();

public:
    explicit ItemsList(QObject *parent = 0); 
    ~ItemsList() {
        if(csvFile) {
        csvFile->remove();
        delete csvFile;
        }
    }
    Q_INVOKABLE QQmlListProperty<QObject> getItemsList() { return QQmlListProperty<QObject>(this, m_itemsList); }
    Q_INVOKABLE QQmlListProperty<QObject> getImagesList() { return QQmlListProperty<QObject>(this, m_imagesList); }
    Q_INVOKABLE void setAdditionalSettings( const QString _quantity, const QString _notes);
    Q_INVOKABLE void setText(const QString _colorText, const int & _itemIndex );
    Q_INVOKABLE void setColor(QString _color,  const int & _itemIndex );
    Q_INVOKABLE bool generateSchedule();
    Q_INVOKABLE void generateCSV();
    Q_INVOKABLE void showTable();
    Q_INVOKABLE bool checkData();

signals:
    void itemsListChanged(QQmlListProperty<QObject> _itemsList);
    void imagesListChanged(QQmlListProperty<QObject> _imagesList);

public slots:
    void onMainButtonClicked(const QString & _buttonName);
    void onItemClicked(const int & _itemIndex, const QString _itemState);
    void onOrderChanged(const QString _order);
    void onRecipientChanged(const QString _recipient);
    void onDateChanged(const QString _deliveryTime, QString _type );
};

#endif // ITEMSLIST_H
