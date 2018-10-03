% rebase('base.tpl', title='Forsíða')

<h4>Söluaðilar</h4>
% for x in range(0,len(adili)):
    <a href="/soluadili/{{adili[x]}}" class="button">{{adili[x]}}</a>
% end
<hr>
<p>Ódýrasta bensín: {{data[0][0][1]}} kr. hjá {{data[0][0][0]}}</p>
<p>Ódýrasta Díesel: {{data[0][1][1]}} kr. hjá {{data[0][1][0]}}</p>

<p>Síðasta uppfærsla: {{tim[0][5:-3]}}/{{tim[0][8:]}}/{{tim[0][:4]}} - kl {{tim[1][:-7]}}</p>
