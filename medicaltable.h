#ifndef MEDICALTABLE_H
#define MEDICALTABLE_H

#include <QDebug>
#include <QObject>
#include <QQmlListProperty>


class MedicalTable : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString imagePath READ imagePath WRITE setImagePath NOTIFY pathChanged)
    Q_PROPERTY(QString imageState READ imageState WRITE setImageState NOTIFY stateChanged)
    Q_PROPERTY(bool animationActive READ animationActive WRITE setAnimationActive NOTIFY animationActiveChanged)
    Q_PROPERTY(QQmlListProperty<QObject> dataList READ getDataList NOTIFY signalQmlDataListChanged)

public:
    explicit MedicalTable(QObject *parent = 0);
    MedicalTable(QString path, QString state, bool animationActive): m_imagePath(path),
    m_imageState(state), m_animationActive(animationActive){}

    inline QString imagePath()
    {
        return m_imagePath;
    }

    inline void setImagePath( const QString & path )
    {
        if ( path != m_imagePath )
        {
           m_imagePath = path;
           emit pathChanged( path );
        }
    }

    inline QString imageState()
    {
        return m_imageState;
    }

    inline void setImageState( const QString & state )
    {
        if ( state != m_imageState )
        {
           m_imageState = state;
           emit stateChanged( state );
        }
    }

    inline bool animationActive()
    {
        return m_animationActive;
    }

    inline void setAnimationActive( const bool & active )
    {
        if ( active != m_animationActive )
        {
           m_animationActive = active;
           emit animationActiveChanged( active );
        }
    }

    Q_INVOKABLE QQmlListProperty<QObject> getDataList();
    Q_INVOKABLE void setDataList(const QString & button);
    Q_INVOKABLE void clearList();


public slots:
    void buttonClicked(const int &in);
    void mainButtonClicked( const QString &in);

signals:
    void pathChanged( QString path );
    void stateChanged( QString state );
    void animationActiveChanged( bool active );
    void signalQmlDataListChanged(QQmlListProperty<QObject> aList );

private:
    QString m_imagePath;
    QString m_imageState;
    bool m_animationActive;
    QList<QObject*> dataList;

};

#endif // MEDICALTABLE_H
