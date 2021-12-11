using System;
using System.Windows;
using System.Windows.Input;
namespace DMCourceWork
{
    public partial class MainWindow : Window
    {
        public MainWindow() => InitializeComponent();
        private void Grid_PreviewKeyUp(object sender, KeyEventArgs e) {
            if (e.Key == Key.Escape) Environment.Exit(0);
        }
        private void Admin_Click(object sender, RoutedEventArgs e)
        {
            Hide();
            new Admin(new Login(@"/AdminLogin").GetConnect()).ShowDialog();
            Environment.Exit(0);
        }
        private void Abonent_Click(object sender, RoutedEventArgs e)
        {
            Hide();
            new Abonent(new Login(@"/AbonentLogin").GetConnect()).ShowDialog();
            Environment.Exit(0);
        }
    }
}
