{exp:channel:entries channel="galla_overview" dynamic="no" limit="1" disable="{global:param_disable_default}"}
  {exp:stash:set name="upcoming_id" parse_tags="yes"}{gala_upcoming:entry_id}{/exp:stash:set}
{/exp:channel:entries}

{exp:stash:parse process="end"}
  {exp:channel:entries channel="galla" dynamic="no" limit="1" disable="{global:param_disable_default}" entry_id="{exp:stash:upcoming_id}" parse="inward"}
  <div class="gala-tab-content text-container gala-upcoming-content">
    <h1>{galla_intro_title}</h1>
    <div>
      <p>{galla_intro_text}</p>
    </div>
    <p>{exp:hundies_shortcode parse="inward"}[gallery id="{galla_gallery_code:url_title}"]{/exp:hundies_shortcode}</p>
  </div>

    {exp:stash:set_list name="panels" parse_tags="yes" parse_depth="3" context="current"}
      {galla_panel}
        {stash:label}{galla_panel:tab_label}{/stash:label}
        {stash:panel_id}{galla_panel:tab_content:entry_id}{/stash:panel_id}
      {/galla_panel}
    {/exp:stash:set_list}

  {/exp:channel:entries}
{/exp:stash:parse}

{exp:stash:parse process="end" priority="2"}
  <accordion>
    {exp:stash:get_list name="panels" context="current"}
    <expander class='expander' title='{label}'>
        {exp:channel:entries channel="galla_panel" entry_id="{panel_id}" parse="inward"}
          {exp:switchee variable = "{display_type}" parse="inward"}

              {!-- If this is just a single text block --}
              {case value="single"}
                <div class="outer-container">
                  {content_block}
                </div>
              {/case}


              {!-- If this is a three column text row --}
              {case value="text_3col"}
                  {col3_text}
                  <accordion-list title="{col3_text:row_title}" {if col3_text:count == 1}ng-class="{active: showMe==tr}"{/if}>
                    <div class="outer-container">
                      <accordion-list-item>{col3_text:col1}</accordion-list-item>
                      <accordion-list-item>{col3_text:col2}</accordion-list-item>
                      <accordion-list-item>{col3_text:col3}</accordion-list-item>
                    </div>
                  </accordion-list>
                  {/col3_text}
              {/case}

              {!-- If this is a three column image row --}
              {case value="images_3col"}
                  {col3_img}
                  <accordion-list title="{col3_img:row_title}" {if col3_img:count == 1}ng-class="{active: showMe==tr}"{/if}>
                    <div class="outer-container">
                      <accordion-list-item>
                        <div class="image" ng-style="{'background-image': 'url({col3_img:col1})'}">
                        </div>
                      </accordion-list-item>
                      <accordion-list-item>
                        <div class="image" ng-style="{'background-image': 'url({col3_img:col2})'}">
                        </div>
                      </accordion-list-item>
                      <accordion-list-item>
                        <div class="image" ng-style="{'background-image': 'url({col3_img:col3})'}">
                        </div>
                      </accordion-list-item>
                    </div>
                  </accordion-list>
                  {/col3_img}
              {/case}

          {/exp:switchee}
        {/exp:channel:entries}
    </expander>
    {/exp:stash:get_list}
  </accordion>
{/exp:stash:parse}