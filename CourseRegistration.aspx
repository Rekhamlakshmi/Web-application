<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CourseRegistration.aspx.cs" Inherits="University.CourseRegistration" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    
    
    
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div>
    <asp:Label ID="lbl1" Text="Enter the Class Number to view the availability of seats." runat="server" Font-Bold="True"></asp:Label>
</div>
       <p>   
            <asp:Label ID="lblClassNumber" Text="Class Number" runat="server"  ></asp:Label> 
            <asp:TextBox ID="txtClassNumber" runat="server" ></asp:TextBox>
           <asp:RequiredFieldValidator ID="reqclassnum"  ControlToValidate="txtClassNumber" ErrorMessage="Class Number is required." runat="server" Font-Bold="True" CssClass="field-validation-error"></asp:RequiredFieldValidator>
           <asp:Button ID="btnViewClassDetail" Text="View Class Detail" runat="server"  OnClick="btnViewClassDetail_Click"></asp:Button>
           </p>       
    <div>
            <asp:DataGrid ID="gridClassDetail" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
                <AlternatingItemStyle BackColor="#F7F7F7" />
                <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                <ItemStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" Mode="NumericPages" />
                <SelectedItemStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
            </asp:DataGrid>
     </div> 
    <p>
        <asp:Label ID="lblPrompt" Text="Enter the Student's Net ID to Enroll/Drop" runat="server" Visible="false" Font-Bold="true"></asp:Label>
    </p>
    <p>
        <asp:Label ID="lblStudentNetID" Text="Student Net ID" runat="server" Visible="false" ></asp:Label> 
            <asp:TextBox ID="txtSudentNetID1" runat="server"  Visible="false"></asp:TextBox>   
           <asp:RequiredFieldValidator ID="reqstudentID"  ControlToValidate="txtSudentNetID1" ErrorMessage="Student Net ID is required." runat="server" Font-Bold="True" CssClass="field-validation-error"></asp:RequiredFieldValidator>
         <asp:Button ID="btnEnroll" Text="Enroll" runat="server" Visible="false" OnClick="btnEnroll_Click" />
         <asp:Button ID="btnDrop" Text="Drop" runat="server" Visible="false" OnClick="btnDrop_Click" />
     </p>
</asp:Content>
