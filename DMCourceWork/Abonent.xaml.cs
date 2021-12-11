using MySqlConnector;
using System;
using System.Windows;
using System.Windows.Documents;
using System.Windows.Media;
namespace DMCourceWork
{
    public partial class Abonent : Window
    {
        MySqlConnection conn;
        public Abonent(MySqlConnection connection)
        {
            InitializeComponent();
            conn = connection;
        }
        public string Req(string req, string Startinfo = "")
        {
            TextRange tr = new (Log.Document.ContentEnd, Log.Document.ContentEnd);
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
            catch (Exception e) {
                TextRange tt = new (Log.Document.ContentEnd, Log.Document.ContentEnd);
                tt.Text = $"Error:{e.Message}\n";
                tt.ApplyPropertyValue(TextElement.ForegroundProperty, Brushes.Red);
                tt.ApplyPropertyValue(TextElement.BackgroundProperty, Brushes.Black);
            }
            return Startinfo;
        }
        /// определить название наиболее часто требуемого документа; наиболее требуемый документ
        private void FirstCommand_Click(object sender, RoutedEventArgs e)=>
            FirstRes.Text = Req("select * from `наиболее требуемый документ`");
        /// определить общее количество документов на заданную тему
        private void SecondCommand_Click(object sender, RoutedEventArgs e) =>
            SecondRes.Text = Req($"select * from `количество документов по темам` where тема = {SecondInput.Text}");
        /// Определить тему по названию документа
        private void ThirdCommand_Click(object sender, RoutedEventArgs e)=>
            ThirdRes.Text = Req($"select Номер, Название from Тема where Номер=(" +
                $"select Тема from Документация where Название=\"{ThirdInput.Text}\")");
        /// определять название документа, который имеется в максимальном количестве экземпляров
        private void FourthCommand_Click(object sender, RoutedEventArgs e) =>
            FourthRes.Text = Req("select * from `документ с наибольшим количеством экземпляров`");
        /// определять отдел, работники которого наиболее часто обращаются к архиву
        private void FifthCommand_Click(object sender, RoutedEventArgs e)=>
            FifthRes.Text = Req("select отдел as ID, (select Название from Отделы where Номер=отдел) as Отдел from `отдел, работники которого наиболее часто обращаются к архиву`");
        /// установить ФИО абонента, обращавшегося последним к указанному документу
        private void SixCommand_Click(object sender, RoutedEventArgs e) =>
            SixRes.Text = Req("select ФИО from абоненты where Номер=(" +
                "select  абонент FROM(" +
                "select Номер, абонент from `запросы к документам` where документ = (" +
                $"select `Инвентарный номер` from Документация where Название = \"{SixInput.Text}\" )) " +
                "as t " +
                "ORDER BY Номер DESC LIMIT 1)");
    }
}
