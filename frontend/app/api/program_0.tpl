{exp:channel:entries channel="programs" limit="1" dynamic="no" limit="1" disable="{global:param_disable_default}"}
<article class='operation-change text-container'>
    <h1>Operation change</h1>

    {exp:hundies_shortcode}{operation_change_content}{/exp:hundies_shortcode}
    <br/>
    <h2>Our Partnerships</h2>
</article>

{/exp:channel:entries}

<section class='carousel thumblist'>
  <thumblist-nav>

{exp:channel:entries channel="programs" backspace="6"}{operation_change_partnerships}
    <slide
      image-url="{operation_change_partnerships:image}"
      video-url=""
      link-url="{operation_change_partnerships:link}"
      link-text="{operation_change_partnerships:cta}"
      headline="{operation_change_partnerships:title}"
      body-copy=""
      thumblist="true"
      date="{operation_change_partnerships:date format='%F %d%S %Y'}"
      blog-category=""
      quote=""
      background-color=""
      logo-image-url=""
      link-style="align-right"
    ></slide>
    {/operation_change_partnerships}
{/exp:channel:entries}
</thumblist-nav>
</section>