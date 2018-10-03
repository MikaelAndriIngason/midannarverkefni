% rebase('base.tpl', title=nafn)

% tel = 0

<table>
    <tr>
        <th>Staðsetning</th>
        <th>95 Bensín</th>
        <th>Díesel</th>
    </tr>
    % for x in range(0,len(data['results'])):
        % if data['results'][x]['company'] == nafn:
            % tel += 1
            <tr>
                <td>{{data['results'][x]['name']}}</td>
                <td>{{data['results'][x]['bensin95']}}</td>
                <td>{{data['results'][x]['diesel']}}</td>
            </tr>
        % end
    % end
    <p>Fjöldi staðsetninga: {{tel}}</p>
</table>

% mark = ""
% tel2 = 0
% for z in range(0,len(data['results'])):
    % if data['results'][z]['company'] == nafn:
        % mark += "&markers=size:mid%7Ccolor:0xff0000%7Clabel:" + str(tel2 + 1) + "%7C" + data['results'][z]['name'].replace(" ", "+")
        % tel2 += 1
        % if tel2 == 15:
            % break
        % end
    % end
% end

<h3>Kort</h3>
<a href="https://www.google.com/maps/place/iceland/"><img src="https://maps.googleapis.com/maps/api/staticmap?center=iceland&zoom=6&scale=1&size=600x350&maptype=roadmap&format=png&visual_refresh=true{{mark}}" alt="Google Map of iceland"></a>
<p>* Sýnir bara fyrstu 15 staðsetningarnar</p>
