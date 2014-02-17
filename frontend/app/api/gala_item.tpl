<p>Timeline item content</p>

<h1>{title}</h1>
<p>
  {body}
  <!-- body includes [gallery id="timeline-item-gallery-id"] which EE turns into a <swiper> element with <slide> child nodes-->
  <br/>
</p>

<accordion>
  <!-- Kara: EE should populate the accordion-sections below -->
  <accordion-section>
    <header>
      {title}
    </header>
    <content>
      <ul>
        <li>
          {date}
          <ul>
            <li>
              <p class="time">{time}</p>
              <p class="title">{title}</p>
              <p class="blurb">{content</p>
            </li>
          </ul>
        </li>
      </ul>
    </content>
  </accordion-section>
</accordion>