#include "schedule.h"
#include "itemslist.h"


void Schedule::generateSchedule()
{
    QAxObject* excel;
    QAxObject* wbooks;
    QAxObject* book;
    QAxObject* macro;
    QStringList verbList;

    excel = new QAxObject("Excel.Application", this);
    excel->setProperty("Visible", false);
    excel->setProperty("DisplayAlerts",0);

    wbooks = excel->querySubObject("Workbooks");
    book = wbooks->querySubObject("Open (const QString&)", "D:\\Bartlomiej Pokrzywa\\Projekty_QT\\MedicalTables_Apps\\scheduleM.xlsm");
    macro = excel->dynamicCall("Run(QVariant)", QVariant("tableTest"));
    macro->dynamicCall("Table", QVariant("T2"));

    delete book;
    delete wbooks;
    delete excel;
//    if(m_activeTable == "T7")
//    {

//    }
//    else if(m_activeTable == "T3")
//    {

//    }
//    else if(m_activeTable == "T2")
//    {

//    }
//    else
//        return;

//    m_schedule.saveAs(m_activeTable+".xlsx");
}

void Schedule::activeMainButton(const QString &buttonName)
{
    m_activeTable = buttonName;
    qDebug() << "Current table: " << activeTable();

}

void Schedule::gridState(const QString &state)
{
    qDebug() << state << endl;
}
