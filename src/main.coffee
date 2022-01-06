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

dateOptions = year: 'numeric', month: 'long'

posts = [
  {% for post in site.posts %}
  {
    url: '{{post.url}}'
    id: '{{post.permalink}}'
    title: '{{post.title}}'
    description: '{{post.description}}'
    date: new Date '{{post.date | date_to_rfc822}}'
    meta: {{ post.meta | jsonify}}
    chips: '{% include chips.html content=post.meta.tags %}'
  }{% unless forloop.last %},{% endunless %}
  {% endfor %}]

data.events = (for post in posts
  inverted = if post.meta.inverted then 'inverted' else ''
  end = if post.meta.inProgress? then new Date() else if post.meta.end? then new Date post.meta.end else null
  result =
    text:
      headline: "<a class='#{inverted}' href='#{post.url}'>#{post.title}</a>"
      text: "<p class='#{inverted}'>#{post.description}</p>#{post.chips}"
    media:
      url: "{{site.url}}/image/#{post.meta.timelineImage or post.meta.image}"
    start_date:
      year: post.date.getFullYear()
      month: post.date.getMonth()
      day: post.date.getDate()
      display_date: "<span class='#{inverted}'>#{post.date.toLocaleString undefined, dateOptions }</p>"
    unique_id: post.id
    background: if post.meta.background? then post.meta.background else color: 'transparent'
  if end
    result.end_date =
      year: end.getFullYear()
      month: end.getMonth()
      day: end.getDate()
      display_date: "<span class='#{inverted}'>#{end.toLocaleString undefined, dateOptions }</p>"
  result)

timeline = new TL.Timeline 'timeline', data, default_bg_color: 'transparent', hash_bookmark: true, start_at_end: true

window.onresize = () -> timeline.updateDisplay()
