<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Faculty.aspx.cs" Inherits="University.Faculty" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <asp:Label ID="lblfaculty" Text="Enter the Instructor's Last Name" runat="server" Font-Bold="True"></asp:Label>
    </div>
    <div>
        <asp:Label ID="lblinstname" runat="server" Text="Last Name"></asp:Label>
        <asp:TextBox ID="txtlastname" runat="server" Width="90px" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="reqnetid"  ControlToValidate="txtlastname" ErrorMessage="Please enter a name to search." runat="server" Font-Bold="True" CssClass="field-validation-error"></asp:RequiredFieldValidator> 
        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
    </div>
        <div>
            <asp:Label ID="lblinvalidname" runat="server" Text="The entered name does not exist.Please enter another value." Visible="false" Font-Bold="True" CssClass="field-validation-error"></asp:Label>
             
        </div>
    <div>
        
       <asp:GridView ID="gridfaculty" runat="server" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
           <AlternatingRowStyle BackColor="#F7F7F7" />
           <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
           <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
           <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
           <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
           <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
           <SortedAscendingCellStyle BackColor="#F4F4FD" />
           <SortedAscendingHeaderStyle BackColor="#5A4C9D" />
           <SortedDescendingCellStyle BackColor="#D8D8F0" />
           <SortedDescendingHeaderStyle BackColor="#3E3277" />
        </asp:GridView>
    </div>

</asp:Content>
