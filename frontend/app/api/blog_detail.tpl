{exp:bbr_prevnext_entry channel_name="blog" current_url_title="{segment_3}" orderby="blog_date" sort="desc" parse="inward" cycle="no"}
   {exp:stash:set parse_tags="yes" name="prev_entry"}{next_url_title}{/exp:stash:set}
   {exp:stash:set parse_tags="yes" name="next_entry"}{prev_url_title}{/exp:stash:set}
{/exp:bbr_prevnext_entry}

{exp:channel:entries channel="blog" orderby="blog_date" dynamic="no" limit="1"
  {if segment_1 != 'preview'}url_title="{segment_3}"{/if}
  {if segment_1 == 'preview'}entry_id="{segment_3}" status="open|closed"{/if}
}

{if no_results}<div class="text-container"><p style="text-align:center">No article was found</p></div>{/if}

<div class="article-header-image">
  <div class="image" style="background-image: url('{if blog_header_image}{blog_header_image}{if:else}{blog_image}{/if}');">
    {if segment_1 != 'preview'}
    <ul class="page-nav-links">
      {if {exp:stash:not_empty name="next_entry"} }
      <li>
        <a href="#/articles/{exp:stash:next_entry}" ng-disabled="'{exp:stash:next_entry}'==''">&larr;</a>
      </li>
      {/if}
      {if {exp:stash:not_empty name="prev_entry"} }
      <li>
        <a href="#/articles/{exp:stash:prev_entry}" ng-disabled="'{exp:stash:prev_entry}'=='{exp:stash:prev_entry}'" >&rarr;</a>
      </li>
      {/if}
      <li>
        <a href="#">X</a>
      </li>
    </ul>
    {/if}
    <div class="gradient-background"></div>
    <div class="outer-container">
      <div class="relative-container">
        <div class="banner">
          {categories limit="1"}
            <p class="article-item-category">{category_name}</p>
          {/categories}
          <h1  class="article-title">{title}</h1>
          <p>{blog_date format='%F %d, %Y'} {if blog_author}| {blog_author}{/if}</p>
        </div>
      </div>
    </div>
  </div>
</div>

<div class="text-container">
  {exp:hundies_shortcode}{blog_content}{/exp:hundies_shortcode}
</div>

<div class="outer-container">
  <div class="share-this-post">
    <ul>
      <li><span class="note">Share this post</span></li>
      <li>
        <a href="https://twitter.com/intent/tweet?url={{locationUrl()}}&text=Share on Twitter">
          <span class="icon starkey-share-twitter"></span>
        </a>
      </li>
      <li>
        <a href="http://www.facebook.com/sharer.php?u={{locationUrl()}}" target="_blank">
          <span class="icon starkey-share-fb"></span>
        </a>
      </li>
      <li>
        <a href="mailto:?subject=I wanted you to see this site&amp;body=Check out this site {{locationUrl()}}.">
          <span class="icon starkey-share-email"></span>
        </a>
      </li>
    </ul>
  </div>
</div>

{blog_related_items}
{if blog_related_items:count == 1}
<div class="no-container related-posts">
  <h3 class="section-title centered">Related posts</h3>
  <section class='carousel thumblist'>
    <div thumblist-nav>
{/if}
        <div slide
          thumblist="true"
          image-url="{blog_related_items:blog_image}"
          video-url=""
          link-url="#/articles/{blog_related_items:url_title}"
          headline="{exp:low_replace find="QUOTE|NEWLINE" replace="\QUOTE|SPACE" multiple="yes"}{blog_related_items:title}{/exp:low_replace}"
          link-style=""
          date="{blog_related_items:blog_date format='%F %d, %Y'}"
        ></div>
{if blog_related_items:count == blog_related_items:total_results}
    </div>
  </section>
</div>
{/if}
{/blog_related_items}

<section class="mobile-carousel carousel hero count{blog_related_items:total_results}">
  <div swiper
    continuous="true"
    speed="2000"
    identifier="swiper_3"
    size="short"
    paginator="true"
    >
    {blog_related_items}
    <div slide
      image-url="{blog_related_items:blog_image}"
      background-color=""
      quote=""
      video-url=""
      link-url="#/articles/{blog_related_items:url_title}"
      headline="{exp:low_replace find="QUOTE|NEWLINE" replace="\QUOTE|SPACE" multiple="yes"}{blog_related_items:title}{/exp:low_replace}"
      body-copy=""
      logo-image-url=""
      link-style=""
      link-text="Read More"
    > </div>
    {/blog_related_items}
  </div>
</section>
{/exp:channel:entries}

<hr class="separator padded"/>

<div paginated-article-list per-page="3" articles="blogArticles" filters="blogFilters"></div>
