{exp:channel:entries channel="galla_overview" dynamic="no" limit="1" disable="{global:param_disable_default}"}
<article class='gala-overview outer-container'>
  <div class="carousel half-wit">
    <swiper
      continuous="true"
      speed="2000"
      identifier="swiper_1"
      auto="8000"
      paginator="true"
      size="short narrow"
      >
      {galla_overview_carousel}
      <slide
          image-url='{galla_overview_carousel:image}'
          background-color=""
          quote=""
          video-url="{galla_overview_carousel:video_url}"
          link-url=""
          headline=""
          body-copy=""
          logo-image-url=""
          link-style=""
          link-text=""
        >
      </slide>
      {/galla_overview_carousel}
      </slide>
    </swiper>
  </div>

  <div class="main-story generic-article-typography">
    {galla_overview_intro}
  </div>
  <div class="highlights">
    <ul>
      {galla_overview_highlights}
      <li{if galla_overview_highlights:count == 1} class="first"{/if}>
        <div class="highlight-thumbnail" style="background: url('{galla_overview_highlights:image}');">
        </div>
        <div class="content">
          <h3>{galla_overview_highlights:title}</h3>
          <p>{galla_overview_highlights:body}</p>
          <p class="action-link"><a href="{galla_overview_highlights:link}">Read more &rarr;</a></p>
        </div>
      </li>
      {/galla_overview_highlights}
    </ul>
  </div>
</article>
{/exp:channel:entries}