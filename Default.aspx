<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default"
    ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>代码生成器-Mysql版</title>
    <style>
        body
        {
            font-size: 12px;
        }
    </style>
    <script src="js/jquery-1.4.2.min.js" type="text/javascript"></script>
    <script>
        function check(checked) {
            $("input[name=cb3]").attr("checked", checked);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <table border="1" cellspacing="0" cellpadding="0" width="1000px">
        <tr width="200">
            <th colspan="4" scope="col" align="left">
                server:<asp:TextBox ID="txt_server" runat="server">10.0.0.80</asp:TextBox>&nbsp;database:<asp:TextBox
                    ID="txt_db" runat="server">amas</asp:TextBox>
                &nbsp;uid:<asp:TextBox ID="txt_uid" runat="server">root</asp:TextBox>
                pwd:<asp:TextBox ID="txt_pwd" runat="server">root</asp:TextBox>
                &nbsp;<asp:Button ID="Button1" runat="server" Text="Connection" OnClick="Button1_Click" />
            </th>
        </tr>
        <tr>
            <td valign="top" width="200px">
                Tables:<br />
                <asp:ListBox ID="lb_tables" runat="server" Height="321px" Width="200px" AutoPostBack="True"
                    OnSelectedIndexChanged="lb_tables_SelectedIndexChanged"></asp:ListBox>
            </td>
            <td valign="top" width="200px">
                <br />
                <br />
                <br />
                <asp:CheckBox ID="cb_add" runat="server" Text="增加" Checked="true" />
                <br />
                <asp:CheckBox ID="cb_delete" runat="server" Text="删除" Checked="true" />
                <br />
                <asp:CheckBox ID="cb_update" runat="server" Text="修改" Checked="true" />
                <br/>
                <asp:CheckBox ID="cb_getmodel" runat="server" Text="单条" Checked="true" />
                <br />
                <asp:CheckBox ID="cb_list" runat="server" Text="列表" Checked="true" />
                <br />
                <asp:CheckBox ID="cb_pagelist" runat="server" Text="分页" Checked="true" />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <asp:Button ID="Button3" runat="server" Text="生成语句" Width="104px" OnClick="Button3_Click" />
                <asp:Button ID="Button4" runat="server" Text="生成实体" OnClick="Button4_Click" />
                <br />
                <br />
                <a href="javascript:;" onclick="$('#div_pl').slideDown()">批量生成实体</a>
                <div style="display: none" id="div_pl">
                命名空间:<asp:TextBox ID="txt_namespace" Width="250px" runat="server">CiWong.ClassZone.Entities</asp:TextBox><br/>
                存放路径:<asp:TextBox ID="txt_file" Width="250px" runat="server">d:\modelcode\</asp:TextBox><br/>
                <asp:Button ID="Button2" runat="server" Text="批量生成" onclick="Button2_Click" />
                </div>
                <br />
            </td>
            <td valign="top" >
                Fileds:<asp:GridView ID="gv_fileds" runat="server" AutoGenerateColumns="False">
                    <Columns>
                        <asp:TemplateField HeaderText="排序" >
                            <ItemTemplate>
                                <input type="checkbox" name="cb_order" value="<%# Eval("name") %>" <%=(z++==0)?"checked":"" %> />
                                <select name="ddl_<%# Eval("name") %>">
                                <option value="desc">降序</option>
                                <option value="asc">升序</option>
                                </select>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="查询条件">
                            <ItemTemplate>
                                <input type="checkbox" name="cb2" value="<%# Eval("name") %>" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="字段<input type='checkbox' onclick='check(this.checked)' checked />">
                            <ItemTemplate>
                                <input type="checkbox" name="cb3" value="<%# Eval("name") %>" checked="checked" style="float: right" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="name" HeaderText="字段" />
                        <asp:BoundField DataField="type" HeaderText="类型" />
                         <asp:BoundField DataField="len" HeaderText="长度" />
                        <asp:BoundField DataField="info" HeaderText="备注" />
                    </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td colspan="4" align="right">
                <asp:TextBox ID="txt_content" runat="server" Height="610px" TextMode="MultiLine"
                    Width="1000px" Style="margin-top: 0px; font-family: @仿宋; font-size: 12px; color: blue"></asp:TextBox>
                <br />
                <label style="cursor: pointer; border: 1px solid red" onclick="copytext();">
                    复制</label>
                <label onclick="$('#txt_content').height($('#txt_content').height()+600)" style="cursor: pointer;
                    border: 1px solid red">
                    扩大↓</label>
                <label style="cursor: pointer; border: 1px solid red" onclick="$('#txt_content').height($('#txt_content').height()-300)">
                    缩小↑</label>
                <label style="cursor: pointer; border: 1px solid red" onclick="$('#txt_content').height(600)">
                    原始</label>
                <script>
                    function copytext() {
                        window.clipboardData.setData("Text", $("#txt_content").val());
                        alert("复制成功！");
                    }
                </script>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
