using System;
using System.Windows;
using System.Windows.Documents;
using System.Windows.Media;
using MySqlConnector;
namespace DMCourceWork
{
    public partial class Admin : Window
    {
        MySqlConnection conn;
        public Admin(MySqlConnection connection)
        {
            InitializeComponent();
            conn = connection;
        }
        ///добавление нового документа; 
        private void FirstCommand_Click(object sender, RoutedEventArgs e) => new DocAdder(this).ShowDialog();
        ///изменение номера телефона указанного отдела; 
        private void SecondCommand_Click(object sender, RoutedEventArgs e) => new ChangeNumber(this).ShowDialog();
        ///удаление экземпляра некоторого документа
        private void ThirdCommand_Click(object sender, RoutedEventArgs e) => new RemoveDoc(this).ShowDialog();
        ///справка об абонентах отдела, пользующихся архивом
        private void FourthCommand_Click(object sender, RoutedEventArgs e) => new HelpForSubscribers(conn).ShowDialog();
        ///отчета о работе архива (число единиц хранения, названия документов, поступивших в архив за последний месяц, количество экземпляров каждого документа, место его хранения)
        private void FifthCommand_Click(object sender, RoutedEventArgs e) => new Report(conn).ShowDialog();
        public string Req(string req, string Startinfo = "")
        {
            TextRange tr = new TextRange(Log.Document.ContentEnd, Log.Document.ContentEnd);
            tr.Text = req + "; ";
            tr.ApplyPropertyValue(TextElement.ForegroundProperty, Brushes.White);
            try
            {
                MySqlCommand cmd = new(req, conn);
                cmd.ExecuteNonQuery();
                MySqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                    for (int i = 0; i < reader.FieldCount; i++)
                        Startinfo += $" {reader.GetName(i)}: {reader[i]}.\n";
                reader.Close();
                TextRange t = new (Log.Document.ContentEnd, Log.Document.ContentEnd);
                t.Text += "Success!\n";
                t.ApplyPropertyValue(TextElement.ForegroundProperty, Brushes.Green);
                t.ApplyPropertyValue(TextElement.FontWeightProperty, FontWeights.Bold);
                t.ApplyPropertyValue(TextElement.BackgroundProperty, Brushes.White);
            }
            catch (Exception e)
            {
                TextRange tt = new (Log.Document.ContentEnd, Log.Document.ContentEnd);
                tt.Text = $"Error:{e.Message}\n";
                tt.ApplyPropertyValue(TextElement.ForegroundProperty, Brushes.Red);
                tt.ApplyPropertyValue(TextElement.BackgroundProperty, Brushes.Black);
            }
            return Startinfo;
        }
        public MySqlDataReader REQ(string req, bool isReturn = true)
        {
            TextRange tr = new TextRange(Log.Document.ContentEnd, Log.Document.ContentEnd);
            tr.Text = req + "; ";
            tr.ApplyPropertyValue(TextElement.ForegroundProperty, Brushes.White);
            try
            {
                MySqlCommand cmd = new(req, conn);
                cmd.ExecuteNonQuery();
                TextRange t = new (Log.Document.ContentEnd, Log.Document.ContentEnd);
                t.Text += "Success!\n";
                t.ApplyPropertyValue(TextElement.ForegroundProperty, Brushes.Green);
                t.ApplyPropertyValue(TextElement.FontWeightProperty, FontWeights.Bold);
                t.ApplyPropertyValue(TextElement.BackgroundProperty, Brushes.White);
                if (!isReturn) return null;
                return cmd.ExecuteReader();
            }
            catch (Exception e)
            {
                TextRange tt = new (Log.Document.ContentEnd, Log.Document.ContentEnd);
                tt.Text = $"Error:{e.Message}\n";
                tt.ApplyPropertyValue(TextElement.ForegroundProperty, Brushes.Red);
                tt.ApplyPropertyValue(TextElement.BackgroundProperty, Brushes.Black);
                return null;
            }
        }
    }
}