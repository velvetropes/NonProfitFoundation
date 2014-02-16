{exp:channel:next_entry channel="blog" url_title="{segment_3}"}
   {exp:stash:set_value parse_tags="yes" name="next_entry" value="{url_title}"}
{/exp:channel:next_entry}

{exp:channel:prev_entry channel="blog" url_title="{segment_3}"}
    {exp:stash:set_value parse_tags="yes" name="prev_entry" value="{url_title}"}
{/exp:channel:prev_entry}

{exp:channel:entries channel="blog" dynamic="no" url_title="{segment_3}" limit="1"}
<div class="article-header-image">
  <div class="image" style="background-image: url('{blog_image}');">
    <ul class="page-nav-links">
      {if {exp:stash:not_empty name="next_entry"} }
      <li>
        <a href="#/articles/{exp:stash:next_entry}" ng-disabled="currentPosition == article.next_item">&larr;</a>
      </li>
      {/if}
      {if {exp:stash:not_empty name="prev_entry"} }
      <li>
        <a href="#/articles/{exp:stash:prev_entry}" ng-disabled="currentPosition == article.prev_item" >&rarr;</a>
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
          {if blog_category}
            <p class="article-item-category">{blog_category}</p>
          {/if}
          <h1  class="article-title">{title}</h1>
          <p>{entry_date format='%M %d, %Y'} | {blog_author}</p>
        </div>
      </div>
    </div>
  </div>
</div>
<br/>
<div class="text-container">
{exp:hundies_shortcode}{blog_content}{/exp:hundies_shortcode}
</div>
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
</div>
<br/>
<div class="outer-container">
  <h3 class="section-title centered">Related posts</h3>
  <section class='carousel'>
    <thumblist-nav>
      <div ng-repeat="article in articles">
        <slide
          thumblist="true"
          image-url="{{article.thumbnail_image_url}}"
          video-url=""
          link-url="#/articles/{{article.id}}"
          headline="{{article.title}}"
          link-style=""
          date="{{article.date}}"
        ></slide>
      </div>
    </thumblist-nav>
  </section>
</div>
<br/>
<hr class="separator padded"/>

<div class="outer-container">
  <div class="pagination">
    <ul>
      <li ng-class="{disabled: currentPage == 0}">
        <a href ng-disabled="currentPage == 0" ng-click="currentPage=currentPage-1">Prev</a>
      </li>
      <li ng-class="{disabled: currentPage >= articles.length/pageSize - 1}">
        <a href ng-click="currentPage=currentPage+1">Next</a>
      </li>
    </ul>
  </div>
  <ul class="pagination-articles">
    <li ng-repeat="article in articles | startFrom:currentPage*pageSize | limitTo:pageSize">
      <div class='block'>
        <div class="image" ng-style="{'background-image': 'url(' + article.thumbnail_image_url + ')'}"></div>
        <h2 class="headline">{{article.title}}</h2>
        <p class='read-more'><a href="#/articles/{{article.id}}">Read more &rarr;</a></p>
      </div>
    </li>
  </ul>
</div>
{/exp:channel:entries}