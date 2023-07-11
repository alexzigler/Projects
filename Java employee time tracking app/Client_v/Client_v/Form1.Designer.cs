namespace Client_v
{
    partial class Form1
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
            this.backgroundWorker1 = new System.ComponentModel.BackgroundWorker();
            this.hScrollBar1 = new System.Windows.Forms.HScrollBar();
            this.textSearch = new System.Windows.Forms.TextBox();
            this.myListBox = new System.Windows.Forms.ListBox();
            this.selectButton = new System.Windows.Forms.Button();
            this.button_in = new System.Windows.Forms.Button();
            this.button_out = new System.Windows.Forms.Button();
            this.name_label = new System.Windows.Forms.Label();
            this.back_button = new System.Windows.Forms.Button();
            this.button_in_now = new System.Windows.Forms.Button();
            this.button_out_now = new System.Windows.Forms.Button();
            this.labe_date = new System.Windows.Forms.Label();
            this.label_time = new System.Windows.Forms.Label();
            this.text_date = new System.Windows.Forms.TextBox();
            this.text_time = new System.Windows.Forms.TextBox();
            this.button_in_manual = new System.Windows.Forms.Button();
            this.button_out_manual = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // hScrollBar1
            // 
            this.hScrollBar1.Location = new System.Drawing.Point(536, 179);
            this.hScrollBar1.Name = "hScrollBar1";
            this.hScrollBar1.Size = new System.Drawing.Size(8, 8);
            this.hScrollBar1.TabIndex = 1;
            // 
            // textSearch
            // 
            this.textSearch.Cursor = System.Windows.Forms.Cursors.IBeam;
            this.textSearch.Location = new System.Drawing.Point(251, 100);
            this.textSearch.Name = "textSearch";
            this.textSearch.Size = new System.Drawing.Size(331, 22);
            this.textSearch.TabIndex = 3;
            this.textSearch.Text = "Search";
            this.textSearch.Click += new System.EventHandler(this.textSearch_Click);
            this.textSearch.TextChanged += new System.EventHandler(this.textSearch_TextChanged);
            // 
            // myListBox
            // 
            this.myListBox.FormattingEnabled = true;
            this.myListBox.ItemHeight = 16;
            this.myListBox.Location = new System.Drawing.Point(251, 128);
            this.myListBox.Name = "myListBox";
            this.myListBox.ScrollAlwaysVisible = true;
            this.myListBox.Size = new System.Drawing.Size(331, 132);
            this.myListBox.Sorted = true;
            this.myListBox.TabIndex = 4;
            // 
            // selectButton
            // 
            this.selectButton.Location = new System.Drawing.Point(366, 275);
            this.selectButton.Name = "selectButton";
            this.selectButton.Size = new System.Drawing.Size(100, 51);
            this.selectButton.TabIndex = 5;
            this.selectButton.Text = "Select";
            this.selectButton.UseVisualStyleBackColor = true;
            this.selectButton.Click += new System.EventHandler(this.selectButton_Click);
            // 
            // button_in
            // 
            this.button_in.Location = new System.Drawing.Point(251, 275);
            this.button_in.Name = "button_in";
            this.button_in.Size = new System.Drawing.Size(100, 51);
            this.button_in.TabIndex = 6;
            this.button_in.Text = "Check in";
            this.button_in.UseVisualStyleBackColor = true;
            this.button_in.Click += new System.EventHandler(this.button_in_Click);
            // 
            // button_out
            // 
            this.button_out.Location = new System.Drawing.Point(482, 275);
            this.button_out.Name = "button_out";
            this.button_out.Size = new System.Drawing.Size(100, 51);
            this.button_out.TabIndex = 7;
            this.button_out.Text = "Check out";
            this.button_out.UseVisualStyleBackColor = true;
            this.button_out.Click += new System.EventHandler(this.button_out_Click);
            // 
            // name_label
            // 
            this.name_label.AutoSize = true;
            this.name_label.Location = new System.Drawing.Point(363, 62);
            this.name_label.Name = "name_label";
            this.name_label.Size = new System.Drawing.Size(37, 16);
            this.name_label.TabIndex = 8;
            this.name_label.Text = "label";
            // 
            // back_button
            // 
            this.back_button.Location = new System.Drawing.Point(151, 343);
            this.back_button.Name = "back_button";
            this.back_button.Size = new System.Drawing.Size(100, 51);
            this.back_button.TabIndex = 9;
            this.back_button.Text = "Back";
            this.back_button.UseVisualStyleBackColor = true;
            this.back_button.Click += new System.EventHandler(this.back_button_Click);
            // 
            // button_in_now
            // 
            this.button_in_now.Location = new System.Drawing.Point(357, 343);
            this.button_in_now.Name = "button_in_now";
            this.button_in_now.Size = new System.Drawing.Size(120, 51);
            this.button_in_now.TabIndex = 10;
            this.button_in_now.Text = "Check in now";
            this.button_in_now.UseVisualStyleBackColor = true;
            this.button_in_now.Click += new System.EventHandler(this.button_in_now_Click);
            // 
            // button_out_now
            // 
            this.button_out_now.Location = new System.Drawing.Point(357, 343);
            this.button_out_now.Name = "button_out_now";
            this.button_out_now.Size = new System.Drawing.Size(120, 51);
            this.button_out_now.TabIndex = 11;
            this.button_out_now.Text = "Check out now";
            this.button_out_now.UseVisualStyleBackColor = true;
            this.button_out_now.Click += new System.EventHandler(this.button_out_now_Click);
            // 
            // labe_date
            // 
            this.labe_date.AutoSize = true;
            this.labe_date.Location = new System.Drawing.Point(130, 106);
            this.labe_date.Name = "labe_date";
            this.labe_date.Size = new System.Drawing.Size(121, 16);
            this.labe_date.TabIndex = 12;
            this.labe_date.Text = "Date [yyyy-mm-dd]";
            // 
            // label_time
            // 
            this.label_time.AutoSize = true;
            this.label_time.Location = new System.Drawing.Point(133, 170);
            this.label_time.Name = "label_time";
            this.label_time.Size = new System.Drawing.Size(88, 16);
            this.label_time.TabIndex = 13;
            this.label_time.Text = "Time [hh:mm]";
            // 
            // text_date
            // 
            this.text_date.Location = new System.Drawing.Point(273, 103);
            this.text_date.Name = "text_date";
            this.text_date.Size = new System.Drawing.Size(155, 22);
            this.text_date.TabIndex = 14;
            // 
            // text_time
            // 
            this.text_time.Location = new System.Drawing.Point(273, 164);
            this.text_time.Name = "text_time";
            this.text_time.Size = new System.Drawing.Size(155, 22);
            this.text_time.TabIndex = 15;
            // 
            // button_in_manual
            // 
            this.button_in_manual.Location = new System.Drawing.Point(219, 218);
            this.button_in_manual.Name = "button_in_manual";
            this.button_in_manual.Size = new System.Drawing.Size(120, 51);
            this.button_in_manual.TabIndex = 17;
            this.button_in_manual.Text = "Check in manually";
            this.button_in_manual.UseVisualStyleBackColor = true;
            this.button_in_manual.Click += new System.EventHandler(this.button_in_manual_Click);
            // 
            // button_out_manual
            // 
            this.button_out_manual.Location = new System.Drawing.Point(219, 218);
            this.button_out_manual.Name = "button_out_manual";
            this.button_out_manual.Size = new System.Drawing.Size(120, 51);
            this.button_out_manual.TabIndex = 18;
            this.button_out_manual.Text = "Check out manually";
            this.button_out_manual.UseVisualStyleBackColor = true;
            this.button_out_manual.Click += new System.EventHandler(this.button_out_manual_Click);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.button_out_manual);
            this.Controls.Add(this.button_in_manual);
            this.Controls.Add(this.text_time);
            this.Controls.Add(this.text_date);
            this.Controls.Add(this.label_time);
            this.Controls.Add(this.labe_date);
            this.Controls.Add(this.button_out_now);
            this.Controls.Add(this.button_in_now);
            this.Controls.Add(this.back_button);
            this.Controls.Add(this.name_label);
            this.Controls.Add(this.button_out);
            this.Controls.Add(this.button_in);
            this.Controls.Add(this.selectButton);
            this.Controls.Add(this.myListBox);
            this.Controls.Add(this.textSearch);
            this.Controls.Add(this.hScrollBar1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.ComponentModel.BackgroundWorker backgroundWorker1;
        private System.Windows.Forms.HScrollBar hScrollBar1;
        private System.Windows.Forms.TextBox textSearch;
        private System.Windows.Forms.ListBox myListBox;
        private System.Windows.Forms.Button selectButton;
        private System.Windows.Forms.Button button_in;
        private System.Windows.Forms.Button button_out;
        private System.Windows.Forms.Label name_label;
        private System.Windows.Forms.Button back_button;
        private System.Windows.Forms.Button button_in_now;
        private System.Windows.Forms.Button button_out_now;
        private System.Windows.Forms.Label labe_date;
        private System.Windows.Forms.Label label_time;
        private System.Windows.Forms.TextBox text_date;
        private System.Windows.Forms.TextBox text_time;
        private System.Windows.Forms.Button button_in_manual;
        private System.Windows.Forms.Button button_out_manual;
    }
}

