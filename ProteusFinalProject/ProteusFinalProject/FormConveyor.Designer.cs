
namespace ProteusFinalProject
{
    partial class FormConveyor
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.Windows.Forms.DataVisualization.Charting.ChartArea chartArea7 = new System.Windows.Forms.DataVisualization.Charting.ChartArea();
            System.Windows.Forms.DataVisualization.Charting.Legend legend7 = new System.Windows.Forms.DataVisualization.Charting.Legend();
            System.Windows.Forms.DataVisualization.Charting.Series series7 = new System.Windows.Forms.DataVisualization.Charting.Series();
            this.buttonKd = new System.Windows.Forms.Button();
            this.buttonKi = new System.Windows.Forms.Button();
            this.buttonKp = new System.Windows.Forms.Button();
            this.button4x = new System.Windows.Forms.Button();
            this.button2x = new System.Windows.Forms.Button();
            this.button1x = new System.Windows.Forms.Button();
            this.setButton = new System.Windows.Forms.Button();
            this.textBoxKd = new System.Windows.Forms.TextBox();
            this.textBoxKi = new System.Windows.Forms.TextBox();
            this.textBoxSetPoint = new System.Windows.Forms.TextBox();
            this.textBoxKp = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.chart1 = new System.Windows.Forms.DataVisualization.Charting.Chart();
            this.outputValue = new System.Windows.Forms.TextBox();
            this.refValue = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.disconnectButton = new System.Windows.Forms.Button();
            this.currentIpValue = new System.Windows.Forms.ComboBox();
            this.currentIpLabel = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.chart1)).BeginInit();
            this.SuspendLayout();
            // 
            // buttonKd
            // 
            this.buttonKd.Location = new System.Drawing.Point(1017, 328);
            this.buttonKd.Name = "buttonKd";
            this.buttonKd.Size = new System.Drawing.Size(75, 35);
            this.buttonKd.TabIndex = 34;
            this.buttonKd.Text = "Kd";
            this.buttonKd.UseVisualStyleBackColor = true;
            this.buttonKd.Click += new System.EventHandler(this.buttonKd_Click);
            // 
            // buttonKi
            // 
            this.buttonKi.Location = new System.Drawing.Point(1017, 277);
            this.buttonKi.Name = "buttonKi";
            this.buttonKi.Size = new System.Drawing.Size(75, 32);
            this.buttonKi.TabIndex = 33;
            this.buttonKi.Text = "Ki";
            this.buttonKi.UseVisualStyleBackColor = true;
            this.buttonKi.Click += new System.EventHandler(this.buttonKi_Click);
            // 
            // buttonKp
            // 
            this.buttonKp.Location = new System.Drawing.Point(1017, 215);
            this.buttonKp.Name = "buttonKp";
            this.buttonKp.Size = new System.Drawing.Size(75, 32);
            this.buttonKp.TabIndex = 32;
            this.buttonKp.Text = "Kp";
            this.buttonKp.UseVisualStyleBackColor = true;
            this.buttonKp.Click += new System.EventHandler(this.buttonKp_Click);
            // 
            // button4x
            // 
            this.button4x.Location = new System.Drawing.Point(1017, 131);
            this.button4x.Name = "button4x";
            this.button4x.Size = new System.Drawing.Size(75, 23);
            this.button4x.TabIndex = 31;
            this.button4x.Text = "4x";
            this.button4x.UseVisualStyleBackColor = true;
            this.button4x.Click += new System.EventHandler(this.button4x_Click);
            // 
            // button2x
            // 
            this.button2x.Location = new System.Drawing.Point(920, 131);
            this.button2x.Name = "button2x";
            this.button2x.Size = new System.Drawing.Size(75, 23);
            this.button2x.TabIndex = 30;
            this.button2x.Text = "2x";
            this.button2x.UseVisualStyleBackColor = true;
            this.button2x.Click += new System.EventHandler(this.button2x_Click);
            // 
            // button1x
            // 
            this.button1x.Location = new System.Drawing.Point(825, 131);
            this.button1x.Name = "button1x";
            this.button1x.Size = new System.Drawing.Size(75, 23);
            this.button1x.TabIndex = 29;
            this.button1x.Text = "1x";
            this.button1x.UseVisualStyleBackColor = true;
            this.button1x.Click += new System.EventHandler(this.button1x_Click);
            // 
            // setButton
            // 
            this.setButton.Location = new System.Drawing.Point(999, 71);
            this.setButton.Name = "setButton";
            this.setButton.Size = new System.Drawing.Size(75, 23);
            this.setButton.TabIndex = 28;
            this.setButton.Text = "set";
            this.setButton.UseVisualStyleBackColor = true;
            this.setButton.Click += new System.EventHandler(this.setButton_Click);
            // 
            // textBoxKd
            // 
            this.textBoxKd.Location = new System.Drawing.Point(895, 341);
            this.textBoxKd.Multiline = true;
            this.textBoxKd.Name = "textBoxKd";
            this.textBoxKd.Size = new System.Drawing.Size(100, 22);
            this.textBoxKd.TabIndex = 27;
            // 
            // textBoxKi
            // 
            this.textBoxKi.Location = new System.Drawing.Point(895, 287);
            this.textBoxKi.Multiline = true;
            this.textBoxKi.Name = "textBoxKi";
            this.textBoxKi.Size = new System.Drawing.Size(100, 22);
            this.textBoxKi.TabIndex = 26;
            // 
            // textBoxSetPoint
            // 
            this.textBoxSetPoint.Location = new System.Drawing.Point(877, 72);
            this.textBoxSetPoint.Multiline = true;
            this.textBoxSetPoint.Name = "textBoxSetPoint";
            this.textBoxSetPoint.Size = new System.Drawing.Size(100, 22);
            this.textBoxSetPoint.TabIndex = 25;
            // 
            // textBoxKp
            // 
            this.textBoxKp.Location = new System.Drawing.Point(895, 220);
            this.textBoxKp.Multiline = true;
            this.textBoxKp.Name = "textBoxKp";
            this.textBoxKp.Size = new System.Drawing.Size(100, 22);
            this.textBoxKp.TabIndex = 24;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label6.Location = new System.Drawing.Point(834, 346);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(25, 17);
            this.label6.TabIndex = 23;
            this.label6.Text = "Kd";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label5.Location = new System.Drawing.Point(834, 292);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(20, 17);
            this.label5.TabIndex = 22;
            this.label5.Text = "Ki";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label4.Location = new System.Drawing.Point(834, 230);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(25, 17);
            this.label4.TabIndex = 21;
            this.label4.Text = "Kp";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label3.Location = new System.Drawing.Point(796, 75);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(58, 17);
            this.label3.TabIndex = 20;
            this.label3.Text = "setpoint";
            // 
            // chart1
            // 
            chartArea7.Name = "ChartArea1";
            this.chart1.ChartAreas.Add(chartArea7);
            legend7.Name = "Legend1";
            this.chart1.Legends.Add(legend7);
            this.chart1.Location = new System.Drawing.Point(79, 69);
            this.chart1.Name = "chart1";
            series7.ChartArea = "ChartArea1";
            series7.ChartType = System.Windows.Forms.DataVisualization.Charting.SeriesChartType.Spline;
            series7.Legend = "Legend1";
            series7.Name = "Series1";
            series7.ShadowColor = System.Drawing.Color.FromArgb(((int)(((byte)(255)))), ((int)(((byte)(192)))), ((int)(((byte)(192)))));
            this.chart1.Series.Add(series7);
            this.chart1.Size = new System.Drawing.Size(679, 294);
            this.chart1.TabIndex = 35;
            this.chart1.Text = "chart1";
            // 
            // outputValue
            // 
            this.outputValue.Location = new System.Drawing.Point(323, 397);
            this.outputValue.Multiline = true;
            this.outputValue.Name = "outputValue";
            this.outputValue.Size = new System.Drawing.Size(100, 22);
            this.outputValue.TabIndex = 39;
            // 
            // refValue
            // 
            this.refValue.Location = new System.Drawing.Point(143, 397);
            this.refValue.Multiline = true;
            this.refValue.Name = "refValue";
            this.refValue.Size = new System.Drawing.Size(100, 22);
            this.refValue.TabIndex = 38;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label2.Location = new System.Drawing.Point(271, 402);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(48, 17);
            this.label2.TabIndex = 37;
            this.label2.Text = "output";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label1.Location = new System.Drawing.Point(91, 402);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(30, 17);
            this.label1.TabIndex = 36;
            this.label1.Text = "Ref";
            // 
            // disconnectButton
            // 
            this.disconnectButton.Location = new System.Drawing.Point(947, 485);
            this.disconnectButton.Name = "disconnectButton";
            this.disconnectButton.Size = new System.Drawing.Size(145, 48);
            this.disconnectButton.TabIndex = 40;
            this.disconnectButton.Text = "Disconnect Form";
            this.disconnectButton.UseVisualStyleBackColor = true;
            this.disconnectButton.Click += new System.EventHandler(this.disconnectButton_Click);
            // 
            // currentIpValue
            // 
            this.currentIpValue.FormattingEnabled = true;
            this.currentIpValue.Location = new System.Drawing.Point(895, 26);
            this.currentIpValue.Name = "currentIpValue";
            this.currentIpValue.Size = new System.Drawing.Size(217, 24);
            this.currentIpValue.TabIndex = 42;
            this.currentIpValue.Text = "192.168.1.9";
            // 
            // currentIpLabel
            // 
            this.currentIpLabel.AutoSize = true;
            this.currentIpLabel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.currentIpLabel.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.currentIpLabel.Location = new System.Drawing.Point(779, 26);
            this.currentIpLabel.Name = "currentIpLabel";
            this.currentIpLabel.Size = new System.Drawing.Size(110, 25);
            this.currentIpLabel.TabIndex = 41;
            this.currentIpLabel.Text = "Current IP";
            // 
            // FormConveyor
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(30)))), ((int)(((byte)(33)))), ((int)(((byte)(74)))));
            this.ClientSize = new System.Drawing.Size(1139, 595);
            this.Controls.Add(this.currentIpValue);
            this.Controls.Add(this.currentIpLabel);
            this.Controls.Add(this.disconnectButton);
            this.Controls.Add(this.outputValue);
            this.Controls.Add(this.refValue);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.chart1);
            this.Controls.Add(this.buttonKd);
            this.Controls.Add(this.buttonKi);
            this.Controls.Add(this.buttonKp);
            this.Controls.Add(this.button4x);
            this.Controls.Add(this.button2x);
            this.Controls.Add(this.button1x);
            this.Controls.Add(this.setButton);
            this.Controls.Add(this.textBoxKd);
            this.Controls.Add(this.textBoxKi);
            this.Controls.Add(this.textBoxSetPoint);
            this.Controls.Add(this.textBoxKp);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Name = "FormConveyor";
            this.Text = "FormConveyor";
            this.Load += new System.EventHandler(this.FormConveyor_Load);
            ((System.ComponentModel.ISupportInitialize)(this.chart1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button buttonKd;
        private System.Windows.Forms.Button buttonKi;
        private System.Windows.Forms.Button buttonKp;
        private System.Windows.Forms.Button button4x;
        private System.Windows.Forms.Button button2x;
        private System.Windows.Forms.Button button1x;
        private System.Windows.Forms.Button setButton;
        private System.Windows.Forms.TextBox textBoxKd;
        private System.Windows.Forms.TextBox textBoxKi;
        private System.Windows.Forms.TextBox textBoxSetPoint;
        private System.Windows.Forms.TextBox textBoxKp;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.DataVisualization.Charting.Chart chart1;
        private System.Windows.Forms.TextBox outputValue;
        private System.Windows.Forms.TextBox refValue;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button disconnectButton;
        private System.Windows.Forms.ComboBox currentIpValue;
        private System.Windows.Forms.Label currentIpLabel;
    }
}