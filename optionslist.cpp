#include "optionslist.h"

OptionsList::OptionsList(QObject *parent) : QObject(parent)
{

}

int OptionsList::getTemp() const
{
    return m_temp;
}

void OptionsList::setTemp(int temp)
{
    if(m_temp != temp)
    {
        m_temp = temp;
        emit tempChanged();
    }
}

