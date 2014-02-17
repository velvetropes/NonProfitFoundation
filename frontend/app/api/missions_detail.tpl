{exp:channel:next_entry channel="hearing_missions" url_title="{segment_3}"}
   {exp:stash:set_value parse_tags="yes" name="next_entry" value="{url_title}"}
{/exp:channel:next_entry}

{exp:channel:prev_entry channel="hearing_missions" url_title="{segment_3}"}
    {exp:stash:set_value parse_tags="yes" name="prev_entry" value="{url_title}"}
{/exp:channel:prev_entry}

{exp:channel:entries channel="hearing_missions" dynamic="no" url_title="{segment_3}" limit="1"}
<div class="article-header-image">
  <div class="image" style="background-image:url('{mission_image:url}');">
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
          <p class="article-item-category">{categories show_group="1" backspace="2"}{category_name}, {/categories}</p>
          <h1  class="article-title">{title}</h1>
          <p>{entry_date format="%F %d, %Y"} | {author}</p>
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
        <a href="#">
          <span class="icon starkey-share-twitter"></span>
        </a>
      </li>
      <li>
        <a href="#">
          <span class="icon starkey-share-fb"></span>
        </a>
      </li>
      <li>
        <a href="#">
          <span class="icon starkey-share-email"></span>
        </a>
      </li>
    </ul>
  </div>

  <h3 class="section-title centered">Related posts</h3>
  <section class='carousel'>
    <thumblist-nav>
      {mission_rel}
      <div>
        <slide
          thumblist="true"
          image-url="{mission_rel:mission_thumb_image:url}"
          video-url=""
          link-url="#/missions/{url_title}"
          headline="{title}"
          link-style=""
          date="{entry_date format='%F %d, %Y'}"
        ></slide>
      </div>
      {/mission_rel}
    </thumblist-nav>
  </section>
</div>
<br/>
{/exp:channel:entries}