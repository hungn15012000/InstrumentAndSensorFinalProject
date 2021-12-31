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

namespace MQTTClientSend
{
    public partial class Form1 : Form
    {
        MqttClient mqttClient;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            Control.CheckForIllegalCrossThreadCalls = false;
            serialPort1.Open();
            Task.Run(() =>
            {
                mqttClient = new MqttClient("192.168.1.9");
                mqttClient.MqttMsgPublishReceived += MqttClient_MqttMsgPublishReceived;
                mqttClient.Subscribe(new string[] { "Application1/Message" }, new byte[] { MqttMsgBase.QOS_LEVEL_AT_LEAST_ONCE });
                mqttClient.Connect("Application1");
            }
                );

        }

        public void serialPort1_DataReceived(object sender, System.IO.Ports.SerialDataReceivedEventArgs e)
        {
            string rcv_data = serialPort1.ReadLine();
            string[] sub_data = rcv_data.Split(',');
            textBox1.Text = sub_data[0];
            textBox2.Text = sub_data[1];
            textBox3.Text = sub_data[2];
            textBox4.Text = sub_data[3];
            textBox5.Text = sub_data[4];
            double Ref, Speed, AdcValue, VoltValue, WeightValue;
            Ref = double.Parse(sub_data[0]);
            Speed = double.Parse(sub_data[1]);
            AdcValue = double.Parse(sub_data[2]);
            VoltValue = double.Parse(sub_data[3]);
            WeightValue = double.Parse(sub_data[4]);
            Task.Run(() =>
            {
                if (mqttClient.IsConnected)
                {
                    mqttClient.Publish("Application2/Ref", Encoding.UTF8.GetBytes(textBox1.Text));
                    mqttClient.Publish("Application2/Speed", Encoding.UTF8.GetBytes(textBox2.Text));
                    mqttClient.Publish("Application2/ADC", Encoding.UTF8.GetBytes(textBox3.Text));
                    mqttClient.Publish("Application2/Volt", Encoding.UTF8.GetBytes(textBox4.Text));
                    mqttClient.Publish("Application2/Weight", Encoding.UTF8.GetBytes(textBox5.Text));

                }
            }
                );
        }
        private void MqttClient_MqttMsgPublishReceived(object sender, uPLibrary.Networking.M2Mqtt.Messages.MqttMsgPublishEventArgs e)
        {
            var message = Encoding.UTF8.GetString(e.Message);
            listBox1.Invoke((MethodInvoker)(() => listBox1.Items.Add(message)));
            string sending = message;
            serialPort1.Write(sending);
        }
    }
}
