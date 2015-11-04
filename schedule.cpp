#include "schedule.h"

void Schedule::generateSchedule()
{
    m_schedule.write(1,1,"Morda");
    m_schedule.saveAs(activeTable+".xlsx");
}

void Schedule::activeMainButton(const QString &buttonName)
{
    activeTable = buttonName;
}

void Schedule::gridState(const QString &state)
{
    qDebug() << state << endl;
}
