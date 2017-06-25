namespace View
{
    partial class frmMVTC
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
            this.lblTituloListView = new System.Windows.Forms.Label();
            this.lvControlGP = new System.Windows.Forms.ListView();
            this.gp = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.valor_capi = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.debito_deduzido = ((System.Windows.Forms.ColumnHeader)(new System.Windows.Forms.ColumnHeader()));
            this.SuspendLayout();
            // 
            // lblTituloListView
            // 
            this.lblTituloListView.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.lblTituloListView.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.lblTituloListView.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTituloListView.ForeColor = System.Drawing.Color.White;
            this.lblTituloListView.Location = new System.Drawing.Point(135, 26);
            this.lblTituloListView.Name = "lblTituloListView";
            this.lblTituloListView.Size = new System.Drawing.Size(163, 23);
            this.lblTituloListView.TabIndex = 281;
            this.lblTituloListView.Text = "Controle de Débito";
            this.lblTituloListView.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // lvControlGP
            // 
            this.lvControlGP.Columns.AddRange(new System.Windows.Forms.ColumnHeader[] {
            this.gp,
            this.valor_capi,
            this.debito_deduzido});
            this.lvControlGP.FullRowSelect = true;
            this.lvControlGP.GridLines = true;
            this.lvControlGP.HideSelection = false;
            this.lvControlGP.Location = new System.Drawing.Point(135, 52);
            this.lvControlGP.MultiSelect = false;
            this.lvControlGP.Name = "lvControlGP";
            this.lvControlGP.Size = new System.Drawing.Size(163, 462);
            this.lvControlGP.TabIndex = 280;
            this.lvControlGP.UseCompatibleStateImageBehavior = false;
            this.lvControlGP.View = System.Windows.Forms.View.Details;
            // 
            // gp
            // 
            this.gp.Text = "GP";
            this.gp.Width = 35;
            // 
            // valor_capi
            // 
            this.valor_capi.Text = "Contabil";
            this.valor_capi.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            this.valor_capi.Width = 61;
            // 
            // debito_deduzido
            // 
            this.debito_deduzido.Text = "Deduzido";
            this.debito_deduzido.TextAlign = System.Windows.Forms.HorizontalAlignment.Right;
            // 
            // frmMVTC
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(432, 540);
            this.Controls.Add(this.lblTituloListView);
            this.Controls.Add(this.lvControlGP);
            this.MaximizeBox = false;
            this.MinimizeBox = false;
            this.Name = "frmMVTC";
            this.Text = "PROJEEM - Controle de Dedução de Débito por MVTC";
            this.ResumeLayout(false);

        }

        #endregion

        protected System.Windows.Forms.Label lblTituloListView;
        protected System.Windows.Forms.ListView lvControlGP;
        private System.Windows.Forms.ColumnHeader gp;
        private System.Windows.Forms.ColumnHeader valor_capi;
        private System.Windows.Forms.ColumnHeader debito_deduzido;
    }
}