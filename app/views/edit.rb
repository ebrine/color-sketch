<div class="container">
  <form action="/entries/save/<%= @entry.id %>" method="POST">
    <label>Title</label>
    <input type="textbox" name="title" value="<%= @entry.title %>" />
    <label>Body</label>
    <input type="textbox" name="body" value="<%= @entry.body %>" />
    <input type="submit" value="Submit"/>
  </form>
</div>
