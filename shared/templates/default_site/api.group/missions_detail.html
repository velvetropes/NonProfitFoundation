{exp:channel:next_entry channel="hearing_missions"
  {if segment_1 != 'preview'}url_title="{segment_3}"{/if}
  {if segment_1 == 'preview'}entry_id="{segment_3}" status="open|closed"{/if}
}
   {exp:stash:set_value parse_tags="yes" name="next_entry" value="{url_title}"}
{/exp:channel:next_entry}

{exp:channel:prev_entry channel="hearing_missions"
  {if segment_1 != 'preview'}url_title="{segment_3}"{/if}
  {if segment_1 == 'preview'}entry_id="{segment_3}" status="open|closed"{/if}
}
    {exp:stash:set_value parse_tags="yes" name="prev_entry" value="{url_title}"}
{/exp:channel:prev_entry}

{exp:channel:entries channel="hearing_missions" dynamic="no" limit="1"
  {if segment_1 != 'preview'}url_title="{segment_3}"{/if}
  {if segment_1 == 'preview'}entry_id="{segment_3}" status="open|closed"{/if}
}

{if no_results}<div class="text-container"><p style="text-align:center">No article was found</p></div>{/if}

<div class="article-header-image">
  <div class="image" style="background-image:url('{if mission_image}{mission_image}{if:else}{mission_thumb_image}{/if}');">
    <ul class="page-nav-links">
      {if {exp:stash:not_empty name="next_entry"} }
      <li>
        <a href="#/missions/{exp:stash:next_entry}" ng-disabled="'{exp:stash:next_entry}'==''">&larr;</a>
      </li>
      {/if}
      {if {exp:stash:not_empty name="prev_entry"} }
      <li>
        <a href="#/missions/{exp:stash:prev_entry}" ng-disabled="'{exp:stash:prev_entry}'=='{exp:stash:prev_entry}'" >&rarr;</a>
      </li>
      {/if}
      <li>
        <a href="#">X</a>
      </li>
    </ul>
    <div class="gradient-background"></div>
    <div class="outer-container">
      <div class="relative-container">
        <div class="banner">
          <p class="article-item-category">{mission_region}{option_name}{/mission_region}, {mission_country}{option_name}{/mission_country}</p>
          <h1  class="article-title">{if mission_display_title}{mission_display_title}{if:else}{title}{/if}</h1>
          <p>{mission_date format="%F %Y"}</p>
        </div>
      </div>
    </div>
  </div>
</div>

<br/>

<div class="text-container">
  {exp:hundies_shortcode}{mission_content}{/exp:hundies_shortcode}
</div>

<br/>
<div class="outer-container">

  <div class="share-this-post">
    <ul>
      <li><span class="note">Share this post</span></li>
      <li>
        <a href="http://twitter.com/share?url={{location.absUrl()}}&text=Share on Twitter">
          <span class="icon starkey-share-twitter"></span>
        </a>
      </li>
      <li>
        <a href="http://www.facebook.com/sharer.php?u={{location.absUrl()}}" target="_blank">
          <span class="icon starkey-share-fb"></span>
        </a>
      </li>
      <li>
        <a href="mailto:?subject=I wanted you to see this site&amp;body=Check out this site {{location.absUrl()}}.">
          <span class="icon starkey-share-email"></span>
        </a>
      </li>
    </ul>
  </div>
</div>


<div class="no-container">
  {mission_rel}
    {if mission_rel:count == 1}
    <h3 class="section-title centered">Related posts</h3>
    <section class='carousel thumblist'>
      <thumblist-nav>
    {/if}
        <div>
          <slide
            thumblist="true"
            image-url="{mission_rel:mission_thumb_image:url}"
            video-url=""
            link-url="#/missions/{mission_rel:url_title}"
            headline="{mission_rel:title}"
            link-style=""
            date="{mission_rel:mission_date format='%F %Y'}"
          ></slide>
        </div>
    {if mission_rel:count == mission_rel:total_results}
      </thumblist-nav>
    </section>
    {/if}
  {/mission_rel}
</div>
<br/>
{/exp:channel:entries}