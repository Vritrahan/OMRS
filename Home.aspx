<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    
</head>
<body>
    <form id="form1" runat="server">
        <div style="float:initial;">

            <asp:Label ID="Label1" runat="server" BorderStyle="Groove" BorderWidth="1px" Text="Home"></asp:Label>
            <asp:TextBox ID="bSearch" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Search" />

            <asp:Label ID="UserLabel" runat="server" Text="Welcome, "></asp:Label>

        </div>
    <div style="float:left; width:20%;">
    
        <asp:Panel ID="Panel1" runat="server" Height="344px" GroupingText="List">
        </asp:Panel>
    
    </div>
    <div style="float:right; width:79%; margin-left:2px; height: 341px;">
    
        <asp:Panel ID="Panel2" runat="server" GroupingText="Main" Height="344px">
            <asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" EnableTheming="True">
                <AlternatingItemTemplate>
                    <span style="background-color: #FFF8DC;">Title:
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                    <br />
                    Artist:
                    <asp:Label ID="ArtistLabel" runat="server" Text='<%# Eval("Artist") %>' />
                    <br />
                    Path:
                    <asp:Label ID="PathLabel" runat="server" Text='<%# Eval("Path") %>' />
                    <br />
                        <object type="application/x-shockwave-flash" data='dewplayer-vol.swf?mp3=<%# Eval("Path") %>'
                        width="240" height="20" id="dewplayer">
                        <param name="wmode" value="transparent" />
                        <param name="movie" value='dewplayer-vol.swf?mp3=<%# Eval("Path") %>'/>
                    </object>
                    <br />
                    </span>
                </AlternatingItemTemplate>
                <EditItemTemplate>
                    <span style="background-color: #008A8C; color: #FFFFFF;">Title:
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                    <br />
                    Artist:
                    <asp:TextBox ID="ArtistTextBox" runat="server" Text='<%# Bind("Artist") %>' />
                    <br />
                    Path:
                    <asp:TextBox ID="PathTextBox" runat="server" Text='<%# Bind("Path") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br />
                    <br />
                    </span>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">Title:
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                    <br />
                    Artist:
                    <asp:TextBox ID="ArtistTextBox" runat="server" Text='<%# Bind("Artist") %>' />
                    <br />
                    Path:
                    <asp:TextBox ID="PathTextBox" runat="server" Text='<%# Bind("Path") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                    <br />
                    <br />
                    </span>
                </InsertItemTemplate>
                <ItemTemplate>
                    <span style="background-color: #DCDCDC; color: #000000;">Title:
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                    <br />
                    Artist:
                    <asp:Label ID="ArtistLabel" runat="server" Text='<%# Eval("Artist") %>' />
                    <br />
                    Path:
                    <asp:Label ID="PathLabel" runat="server" Text='<%# Eval("Path") %>' />
                    <br />
                        <object type="application/x-shockwave-flash" data='dewplayer-vol.swf?mp3=<%# Eval("Path") %>'
                        width="240" height="20" id="dewplayer">
                        <param name="wmode" value="transparent" />
                        <param name="movie" value='dewplayer-vol.swf?mp3=<%# Eval("Path") %>'/>
                        </object>
                    <br />
                    </span>
                </ItemTemplate>
                <LayoutTemplate>
                    <div id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                        <span runat="server" id="itemPlaceholder" />
                    </div>
                    <div style="text-align: center;background-color: #CCCCCC; font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                        <asp:DataPager ID="DataPager1" runat="server">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <span style="background-color: #008A8C; font-weight: bold;color: #FFFFFF;">Title:
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                        <br />
                    Artist:
                    <asp:Label ID="ArtistLabel" runat="server" Text='<%# Eval("Artist") %>' />
                        
                    <br />
                    Path:
                    <asp:Label ID="PathLabel" runat="server" Text='<%# Eval("Path") %>' />
                    <br />
                    <br />
                    </span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:biscuitConnectionString %>" ProviderName="<%$ ConnectionStrings:biscuitConnectionString.ProviderName %>" SelectCommand="SELECT [Title], [Artist], [Path] FROM [Songs] ORDER BY [Title], [Artist]"></asp:SqlDataSource>
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>
