# README

First test repo on the complete Ruby on Rails Developer course by Gabriel Castrin

im a ruby developer
<td><%= button_to 'Show', article_path(article.id), method: :get %></td>
<td><%= button_to 'Edit', edit_article_path(article.id), method: :get %></td>
<td><%= button_to 'Delete', article_path(article.id), method: :delete, data: { confirm: "Are you sure?" } %></td>
</tr>
