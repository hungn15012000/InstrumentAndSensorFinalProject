using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using uPLibrary.Networking.M2Mqtt;
using uPLibrary.Networking.M2Mqtt.Messages;
using System.Windows.Forms.DataVisualization.Charting;
namespace ProteusFinalProject
{
    public partial class FormConveyor : Form
    {
        MqttClient mqttClient;
        CharacteristicConveyor Conveyor = new CharacteristicConveyor();
        int ClientLoop;
        public FormConveyor()
        {
            InitializeComponent();
        }
        private void FormConveyor_Load(object sender, EventArgs e)
        {
            Control.CheckForIllegalCrossThreadCalls = false;
            InitChart();
            chartRealtime();
            mqttClient = new MqttClient(currentIpValue.Text);
            mqttClient.Connect("Application2");
            mqttClient.MqttMsgPublishReceived += MqttClient_MqttMsgPublishReceived;
            mqttClient.Subscribe(new string[] { "Application2/Ref" }, new byte[] { MqttMsgBase.QOS_LEVEL_EXACTLY_ONCE });
            mqttClient.Subscribe(new string[] { "Application2/Speed" }, new byte[] { MqttMsgBase.QOS_LEVEL_EXACTLY_ONCE });
            chart1.Series[0].Points.Add(Conveyor.Ref);
            chart1.Series[1].Points.Add(Conveyor.Output);

        }
        private void chartRealtime()
        {
            double RefValue = 0, OutputValue = 0;
            string SubData0, SubData1;
            SubData0 = refValue.Text;
            SubData1 = outputValue.Text;
            RefValue = double.Parse(SubData0);
            OutputValue = double.Parse(SubData1);
            Series series1 = chart1.Series.Add("Ref");
            Series series2 = chart1.Series.Add("Output");
            series1.ChartType = SeriesChartType.Spline;
            series2.ChartType = SeriesChartType.FastLine;
            series1.Color = Color.Red;
            series2.Color = Color.Blue;
            series1.BorderWidth = 8;
            series2.BorderWidth = 8;
        }
        private void InitChart()
        {
            chart1.Series.Clear();
            refValue.Text = "0";
            outputValue.Text = "0";
 
        }
        public void MqttClient_MqttMsgPublishReceived(object sender, uPLibrary.Networking.M2Mqtt.Messages.MqttMsgPublishEventArgs e)
        {
            var message = Encoding.UTF8.GetString(e.Message);
            switch (ClientLoop)
            {
                case 1:
                    refValue.Invoke((MethodInvoker)(() => refValue.Text = message));
                    Conveyor.Ref = double.Parse(message);
                    chart1.Series[0].Points.Add(Conveyor.Ref);
                    break;
                case 2:
                    outputValue.Invoke((MethodInvoker)(() => outputValue.Text = message));
                    Conveyor.Output = double.Parse(outputValue.Text);
                    chart1.Series[1].Points.Add(Conveyor.Output);
                    ClientLoop = 0;
                    break;
            }
            ClientLoop++;

        }
        

        private void disconnectButton_Click(object sender, EventArgs e)
        {
            mqttClient.Disconnect();
        }

        private void setButton_Click(object sender, EventArgs e)
        {
            int setspeed;
            setspeed = int.Parse(textBoxSetPoint.Text);
            string sending = "sp " + setspeed.ToString("00000");
            if (setspeed > 160)
            {
                MessageBox.Show("Over speed");
            }
            else
            {
                Task.Run(() =>
                {
                    if (mqttClient.IsConnected)
                    {
                        mqttClient.Publish("Application1/Message", Encoding.UTF8.GetBytes(sending));
                        MessageBox.Show("Ref is " + setspeed);
                    }
                }
                 );
            }
        }

        private void buttonKp_Click(object sender, EventArgs e)
        {
            int Kp_number;
            Kp_number = int.Parse(textBoxKp.Text);
            string sending = "Kp " + Kp_number.ToString("00000");
            if (Kp_number >= 50 && Kp_number < 0)
            {
                MessageBox.Show("Invalid Kp");
            }
            else
            {
                Task.Run(() =>
                {
                    if (mqttClient.IsConnected)
                    {
                        mqttClient.Publish("Application1/Message", Encoding.UTF8.GetBytes(sending));
                        MessageBox.Show("Kp is " + Kp_number);
                    }
                }
                );

            }
        }

        private void buttonKi_Click(object sender, EventArgs e)
        {
            int Ki_number;
            Ki_number = int.Parse(textBoxKi.Text);
            string sending = "Ki " + Ki_number.ToString("00000");
            if (Ki_number >= 50 && Ki_number < 0)
            {
                MessageBox.Show("Invalid Ki");
            }
            else
            {
                Task.Run(() =>
                {
                    if (mqttClient.IsConnected)
                    {
                        mqttClient.Publish("Application1/Message", Encoding.UTF8.GetBytes(sending));
                        MessageBox.Show("KP is " + Ki_number);
                    }
                }
                );
                
            }
        }

        private void buttonKd_Click(object sender, EventArgs e)
        {
            int Kd_number;
            Kd_number = int.Parse(textBoxKd.Text);
            string sending = "Kd " + Kd_number.ToString("00000");
            if (Kd_number >= 50 && Kd_number < 0)
            {
                MessageBox.Show("Invalid Kd");
            }
            else
            {
                Task.Run(() =>
                {
                    if (mqttClient.IsConnected)
                    {
                        mqttClient.Publish("Application1/Message", Encoding.UTF8.GetBytes(sending));
                        MessageBox.Show("KP is " + Kd_number);
                    }
                }
                );

            }
        }

        private void button1x_Click(object sender, EventArgs e)
        {
            string sending = "1x 00000";
            Task.Run(() =>
            {
                if (mqttClient.IsConnected)
                {
                    mqttClient.Publish("Application1/Message", Encoding.UTF8.GetBytes(sending));
                    MessageBox.Show("1X is executed");
                }
            }
                );
        }

        private void button2x_Click(object sender, EventArgs e)
        {
            string sending = "2x 00000";
            Task.Run(() =>
            {
                if (mqttClient.IsConnected)
                {
                    mqttClient.Publish("Application1/Message", Encoding.UTF8.GetBytes(sending));
                    MessageBox.Show("2X is executed");
                }
            }
                );
        }

        private void button4x_Click(object sender, EventArgs e)
        {
            string sending = "4x 00000";
            Task.Run(() =>
            {
                if (mqttClient.IsConnected)
                {
                    mqttClient.Publish("Application1/Message", Encoding.UTF8.GetBytes(sending));
                    MessageBox.Show("4X is executed");
                }
            }
                );
        }
    }
}
