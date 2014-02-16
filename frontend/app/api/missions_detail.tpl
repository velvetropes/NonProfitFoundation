<div class="article-header-image">
  <div class="image" ng-style="{'background-image': 'url(' + article.header_image_url + ')'}">
    <ul class="page-nav-links">
      <li>
        <a href="#/articles/{{article.prev_item}}" ng-disabled="currentPosition == article.prev_item">&larr;</a>
      </li>
      <li>
        <a href="#/articles/{{article.next_item}}" ng-disabled="currentPosition == article.next_item" >&rarr;</a>
      </li>
      <li>
        <a href="#">X</a>
      </li>
    </ul>
    <div class="gradient-background"></div>
    <div class="outer-container">
      <div class="relative-container">
        <div class="banner">
          <p class="article-item-category">{{article.mission_item_category}}</p>
          <h1  class="article-title">{{article.title}}</h1>
          <p>{{parseDate(article.date) | date:"MMMM d yyyy"}} | {{article.author}}</p>
        </div>
      </div>
    </div>
  </div>
</div>
<br/>
<div class="text-container">
{exp:hundies_shortcode}{mission_content}{/exp:hundies_shortcode}
</div>