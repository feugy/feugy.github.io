---
---

data =
  title:
    text:
      headline: 'Notable projects'
      text: '''
        <p>Browse through this timeline the various projects I\'ve made.</p>
        <p>Click on project's name to jump to full description.</p>
      '''
    background:
      color: 'transparent'

posts = [
  {% for post in site.posts %}
  {
    url: '{{post.url}}'
    id: '{{post.permalink}}'
    title: '{{post.title}}'
    description: '{{post.description}}'
    date: new Date '{{post.date | date_to_rfc822}}'
    meta: {{ post.meta | jsonify}}
  }{% unless forloop.last %},{% endunless %}
  {% endfor %}]

data.events = (for post in posts
  inverted = if post.meta.inverted then 'inverted' else ''
  result =
    text:
      headline: "<a class='#{inverted}' href='#{post.url}'>#{post.title}</a>"
      text: "<p class='#{inverted}'>#{post.description}</p>"
    media:
      url: "{{site.url}}/image/#{post.meta.image}"
    start_date:
      year: post.date.getFullYear()
      month: post.date.getMonth()
      day: post.date.getDate()
    unique_id: post.id
    background: if post.meta.background? then post.meta.background else color: 'transparent'
  if post.meta.end?
    end = new Date post.meta.end
    result.end_date =
      year: end.getFullYear()
      month: end.getMonth()
      day: end.getDate()
  result)

timeline = new TL.Timeline 'timeline', data, default_bg_color: 'transparent', hash_bookmark: true

window.onresize = () -> timeline.updateDisplay()
