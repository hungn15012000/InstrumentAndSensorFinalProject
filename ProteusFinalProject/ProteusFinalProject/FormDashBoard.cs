using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Windows.Forms.DataVisualization.Charting;
using uPLibrary.Networking.M2Mqtt;
using uPLibrary.Networking.M2Mqtt.Messages;

namespace ProteusFinalProject
{
    public partial class FormDashBoard : Form
    {
        MqttClient mqttClient;
        int ClientLoop;
        CharacteristicLoadcell Item = new CharacteristicLoadcell();
        public FormDashBoard()
        {
            InitializeComponent();
        }

        private void FormDashBoard_Load(object sender, EventArgs e)
        {
            Control.CheckForIllegalCrossThreadCalls = false;
            InitChart();
            chartRealtime();
            mqttClient = new MqttClient(currentIpValue.Text);
            mqttClient.Connect("Application2");
            mqttClient.MqttMsgPublishReceived += MqttClient_MqttMsgPublishReceived;
            mqttClient.Subscribe(new string[] { "Application2/ADC" }, new byte[] { MqttMsgBase.QOS_LEVEL_EXACTLY_ONCE });
            mqttClient.Subscribe(new string[] { "Application2/Volt" }, new byte[] { MqttMsgBase.QOS_LEVEL_EXACTLY_ONCE });
            mqttClient.Subscribe(new string[] { "Application2/Weight" }, new byte[] { MqttMsgBase.QOS_LEVEL_EXACTLY_ONCE });
            chart1.Series[0].Points.Add(Item.AdcValue);
            chart1.Series[1].Points.Add(Item.VoltValue);
            chart1.Series[2].Points.Add(Item.Weight);
        }
        private void chartRealtime()
        {
            double AdcValue = 0, VoltValue = 0, WeightValue = 0;
            string SubData0, SubData1, SubData2;
            SubData0 = adcValue.Text;
            SubData1 = voltValue.Text;
            SubData2 = weightValue.Text;
            AdcValue = double.Parse(SubData0);
            VoltValue = double.Parse(SubData1);
            WeightValue = double.Parse(SubData2);
            Series series1 = chart1.Series.Add("Volt");
            Series series2 = chart1.Series.Add("Weight");
            Series series3 = chart1.Series.Add("ADC");
            series1.ChartType = SeriesChartType.FastLine;
            series2.ChartType = SeriesChartType.FastLine;
            series3.ChartType = SeriesChartType.FastLine;
            series1.Color = Color.Red;
            series2.Color = Color.Blue;
            series3.Color = Color.Yellow;
            series1.BorderWidth = 8;
            series2.BorderWidth = 8;
            series3.BorderWidth = 8;
        }
        private void InitChart()
        {
            chart1.Series.Clear();
            adcValue.Text = "0";
            voltValue.Text = "0";
            weightValue.Text = "0";
        }
        public void MqttClient_MqttMsgPublishReceived(object sender, uPLibrary.Networking.M2Mqtt.Messages.MqttMsgPublishEventArgs e)
        {
            var message = Encoding.UTF8.GetString(e.Message);
            switch (ClientLoop)
            {
                case 1:
                    voltValue.Invoke((MethodInvoker)(() => voltValue.Text = message));
                    Item.VoltValue = double.Parse(message);
                    chart1.Series[0].Points.Add(Item.VoltValue);
                    break;
                case 2:
                    weightValue.Invoke((MethodInvoker)(() => weightValue.Text = message));
                    Item.Weight = double.Parse(weightValue.Text);
                    chart1.Series[1].Points.Add(Item.Weight);
                    break;
                case 3:
                    adcValue.Invoke((MethodInvoker)(() => adcValue.Text = message));
                    Item.AdcValue = double.Parse(adcValue.Text);
                    chart1.Series[2].Points.Add(Item.AdcValue);
                    ClientLoop = 0;
                    break;
            }
            ClientLoop++;
            
        }

        private void disconnectButton_Click(object sender, EventArgs e)
        {
            mqttClient.Disconnect();
        }

        private void chart1_Click(object sender, EventArgs e)
        {

        }
    }
}
