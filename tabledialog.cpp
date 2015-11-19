#include "tabledialog.h"
#include "ui_tabledialog.h"

TableDialog::TableDialog(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::TableDialog)
{
    ui->setupUi(this);
    model = new QStandardItemModel;
    model->setHorizontalHeaderItem( 0, new QStandardItem("Rodzaj stołu"));
    model->setHorizontalHeaderItem( 1, new QStandardItem("Elektryczna regulacja wysokości"));
    model->setHorizontalHeaderItem( 2, new QStandardItem("Uchwyty do pasów"));
    model->setHorizontalHeaderItem( 3, new QStandardItem("Regulacja kąta odchylenia"));
    model->setHorizontalHeaderItem( 4, new QStandardItem("Elektrycznie łamane leżysko"));
    model->setHorizontalHeaderItem( 5, new QStandardItem("Układ jezdny z hamulcami"));
    model->setHorizontalHeaderItem( 6, new QStandardItem("Zagłowek 3-elementowy"));
    model->setHorizontalHeaderItem( 7, new QStandardItem("Pozycja fotela"));
    model->setHorizontalHeaderItem( 8, new QStandardItem("Sterowanie nożne"));
    model->setHorizontalHeaderItem( 9, new QStandardItem("Pilot podblatowy"));
    model->setHorizontalHeaderItem( 10, new QStandardItem("Kołki do stabilizacji"));
    model->setHorizontalHeaderItem( 11, new QStandardItem("Uchwyt na prześcieradło"));
    model->setHorizontalHeaderItem( 12, new QStandardItem("Zatycznka"));
    model->setHorizontalHeaderItem( 13, new QStandardItem("Stal nierdzewna"));
    model->setHorizontalHeaderItem( 14, new QStandardItem("Ilość sztuk"));
    model->setHorizontalHeaderItem( 15, new QStandardItem("Kolor tapicerki"));
    model->setHorizontalHeaderItem( 16, new QStandardItem("Kolor stelaża"));
    model->setHorizontalHeaderItem( 17, new QStandardItem("Uwagi"));


    ui->tableView->setEditTriggers(QAbstractItemView::NoEditTriggers);
    ui->tableView->horizontalHeader()->setFixedHeight( 60 );
    ui->tableView->verticalHeader()->setFixedWidth( 40 );
    ui->tableView->horizontalHeader()->setStretchLastSection( true );
    ui->tableView->setSelectionBehavior(QAbstractItemView::SelectRows);
    ui->tableView->horizontalHeader()->setHighlightSections(false);
    ui->tableView->verticalHeader()->setHighlightSections(false);
    ui->tableView->setModel(model);
    for ( int i = 0 ; i < 17 ; ++i ) ui -> tableView -> setColumnWidth( i, 220);
}

void TableDialog::deleteRecord()
{

    QItemSelection selection( ui->tableView->selectionModel()->selection() );
    QList<int> rows;
    foreach( const QModelIndex & index, selection.indexes() ) {
       rows.append( index.row() );
    }
    qSort( rows );

    int prev = -1;
    for( int i = rows.count() - 1; i >= 0; i -= 1 ) {
       int current = rows[i];
       if( current != prev ) {
          model->removeRows( current, 1 );
          prev = current;
       }
       else
           QMessageBox::information(this,"Informacja","Nie zaznaczono wiersza do usunięcia.");
    }
//    if(ui->tableView->currentIndex().row()!=-1)
//        {
//            QMessageBox msgBox;
//            QPushButton yes_button;
//            QPushButton no_button;
//            yes_button.setText("TAK");
//            no_button.setText("NIE");
//            msgBox.addButton(&yes_button, QMessageBox::YesRole);
//            msgBox.addButton(&no_button, QMessageBox::NoRole);
//            msgBox.setWindowTitle("Informacja");
//            msgBox.setText("Czy na pewno USUNĄĆ?");
//            msgBox.exec();
//            if (msgBox.clickedButton()!=&yes_button){
//                return;
//            };
//         model->removeRow(ui->tableView->currentIndex().row());
//    }
//    else
//        QMessageBox::information(this,"Informacja","Nie zaznaczono wiersza do usunięcia.");
}

void TableDialog::keyPressEvent(QKeyEvent *e)
{
    if ( e->key () == Qt::Key_Delete) {
        qDebug ("Return/enter pressed");
        deleteRecord();
    }

    else
        QDialog::keyPressEvent (e);
}

TableDialog::~TableDialog()
{
    delete ui;
}
