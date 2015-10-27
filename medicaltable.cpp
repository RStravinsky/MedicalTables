#include "medicaltable.h"

MedicalTable::MedicalTable(QObject *parent) : QObject(parent)
{

}

void MedicalTable::buttonClicked(const int &in)
{
    qDebug() << in;
}

void MedicalTable::mainButtonClicked( const QString &in)
{
    qDebug() << in;
}

QQmlListProperty<QObject> MedicalTable::getDataList()
{
    return QQmlListProperty<QObject>( this, dataList );
}

void MedicalTable::setDataList(const QString &button)
{


    if(button == "T2")
    {

        dataList.clear();
        dataList.append(new MedicalTable("/images/images/zaglowek.png", "CHECKED", true));
        dataList.append(new MedicalTable("/images/images/zaglowek.png", "CHECKED", true));
        dataList.append(new MedicalTable("/images/images/zaglowek.png", "CHECKED", true));
        dataList.append(new MedicalTable("/images/images/zaglowek.png", "CHECKED", true));
        dataList.append(new MedicalTable("/images/images/zaglowek.png", "CHECKED", true));
        emit signalQmlDataListChanged(getDataList());
    }
    else if(button == "T3")
    {

        dataList.clear();
        dataList.append(new MedicalTable("/images/images/uklad_jezdny.png", "CHECKED", true));
        dataList.append(new MedicalTable("/images/images/uklad_jezdny.png", "CHECKED", true));
        dataList.append(new MedicalTable("/images/images/uklad_jezdny.png", "CHECKED", true));
        dataList.append(new MedicalTable("/images/images/uklad_jezdny.png", "CHECKED", true));
        dataList.append(new MedicalTable("/images/images/uklad_jezdny.png", "CHECKED", true));
        emit signalQmlDataListChanged(getDataList());
    }
    else if(button == "T7")
    {

        dataList.clear();
        dataList.append(new MedicalTable("/images/images/pilot.png", "CHECKED", true));
        dataList.append(new MedicalTable("/images/images/pilot.png", "CHECKED", true));
        dataList.append(new MedicalTable("/images/images/pilot.png", "CHECKED", true));
        dataList.append(new MedicalTable("/images/images/pilot.png", "CHECKED", true));
        dataList.append(new MedicalTable("/images/images/pilot.png", "CHECKED", true));
        emit signalQmlDataListChanged(getDataList());
    }
    else
        return;
}

void MedicalTable::clearList()
{
    QList<QObject*> tmpList = dataList;
    // we have to notify QML that content changed before actually deleting objects
    dataList.clear();
    emit signalQmlDataListChanged(getDataList());
    qDeleteAll(tmpList);
    tmpList.clear();
    emit signalQmlDataListChanged(getDataList());
}
