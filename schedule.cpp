#include "schedule.h"

Schedule::Schedule(QObject *parent) : QObject(parent)
{

}

void Schedule::testSave()
{
    m_schedule.write(1,1,"Morda");
    m_schedule.saveAs("Morda.xlsx");
}

