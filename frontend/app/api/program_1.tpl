{exp:channel:entries channel="programs" limit="1"}
<article class='listen-carefully text-container'>
    <!--(bake-start _if="server")-->
    <h1>Listen Carefully</h1>
    <!--(bake-end)-->
    <!--(bake-start _if="dist")-->
    {exp:hundies_shortcode}{listen_carefully_content}{/exp:hundies_shortcode}
    <!--(bake-end)-->

    <br/>
    <h2>Additional Resources</h2>
</article>
{/exp:channel:entries}

<section class='carousel thumblist'>
  <thumblist-nav>

  {exp:channel:entries channel="programs" backspace="6"}{listen_carefully_additional_reso}
      <slide
        image-url="{listen_carefully_additional_reso:image}"
        video-url=""
        link-url="{listen_carefully_additional_reso:link}"
        link-text="{listen_carefully_additional_reso:cta}"
        headline="{listen_carefully_additional_reso:title}"
        body-copy=""
        thumblist="true"
        date="{listen_carefully_additional_reso:date format='%F %d%S %Y'}"
        blog-category=""
        quote=""
        background-color=""
        logo-image-url=""
        link-style="align-right"
      ></slide>
      {/listen_carefully_additional_reso}
    {/exp:channel:entries}
</thumblist-nav>
</section>