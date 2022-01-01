
namespace ProteusFinalProject
{
    partial class ModeForm
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
            this.currentIpValue = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.mode1Button = new FontAwesome.Sharp.IconButton();
            this.mode2Button = new FontAwesome.Sharp.IconButton();
            this.disconnectButton = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // currentIpValue
            // 
            this.currentIpValue.FormattingEnabled = true;
            this.currentIpValue.Location = new System.Drawing.Point(1014, 12);
            this.currentIpValue.Name = "currentIpValue";
            this.currentIpValue.Size = new System.Drawing.Size(217, 24);
            this.currentIpValue.TabIndex = 4;
            this.currentIpValue.Text = "192.168.1.9";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.label1.Location = new System.Drawing.Point(889, 11);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(110, 25);
            this.label1.TabIndex = 3;
            this.label1.Text = "Current IP";
            // 
            // mode1Button
            // 
            this.mode1Button.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.mode1Button.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.mode1Button.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.mode1Button.IconChar = FontAwesome.Sharp.IconChar.Markdown;
            this.mode1Button.IconColor = System.Drawing.Color.White;
            this.mode1Button.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.mode1Button.Location = new System.Drawing.Point(280, 141);
            this.mode1Button.Name = "mode1Button";
            this.mode1Button.Size = new System.Drawing.Size(244, 149);
            this.mode1Button.TabIndex = 5;
            this.mode1Button.Text = "MODE 1";
            this.mode1Button.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.mode1Button.UseVisualStyleBackColor = true;
            this.mode1Button.Click += new System.EventHandler(this.mode1Button_Click);
            // 
            // mode2Button
            // 
            this.mode2Button.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.mode2Button.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.mode2Button.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.mode2Button.IconChar = FontAwesome.Sharp.IconChar.Markdown;
            this.mode2Button.IconColor = System.Drawing.Color.White;
            this.mode2Button.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.mode2Button.Location = new System.Drawing.Point(660, 141);
            this.mode2Button.Name = "mode2Button";
            this.mode2Button.Size = new System.Drawing.Size(244, 149);
            this.mode2Button.TabIndex = 5;
            this.mode2Button.Text = "MODE 2";
            this.mode2Button.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.mode2Button.UseVisualStyleBackColor = true;
            this.mode2Button.Click += new System.EventHandler(this.mode2Button_Click);
            // 
            // disconnectButton
            // 
            this.disconnectButton.Location = new System.Drawing.Point(511, 376);
            this.disconnectButton.Name = "disconnectButton";
            this.disconnectButton.Size = new System.Drawing.Size(163, 71);
            this.disconnectButton.TabIndex = 9;
            this.disconnectButton.Text = "Disconnect Form";
            this.disconnectButton.UseVisualStyleBackColor = true;
            this.disconnectButton.Click += new System.EventHandler(this.disconnectButton_Click);
            // 
            // ModeForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(30)))), ((int)(((byte)(33)))), ((int)(((byte)(74)))));
            this.ClientSize = new System.Drawing.Size(1251, 635);
            this.Controls.Add(this.disconnectButton);
            this.Controls.Add(this.mode2Button);
            this.Controls.Add(this.mode1Button);
            this.Controls.Add(this.currentIpValue);
            this.Controls.Add(this.label1);
            this.Name = "ModeForm";
            this.Text = "ModeForm";
            this.Load += new System.EventHandler(this.ModeForm_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.ComboBox currentIpValue;
        private System.Windows.Forms.Label label1;
        private FontAwesome.Sharp.IconButton mode1Button;
        private FontAwesome.Sharp.IconButton mode2Button;
        private System.Windows.Forms.Button disconnectButton;
    }
}