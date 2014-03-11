<div class="text-container">
{exp:channel:entries channel="take_action" dynamic="no" limit="1" disable="{global:param_disable_default}"}
  {exp:hundies_shortcode}{ta_volunteer}{/exp:hundies_shortcode}
{/exp:channel:entries}

  <p><a href ng-click="toggleForm()">Stay Connected and Join Our Volunteer Directory <span class="arrow">&gt;</span></a></p>
    <br/>
    <div class="reveal outer-container" ng-show="showForm==true">
        {exp:freeform:form form_id="3" form:id="volunteer-form" form:class="flatform invert" return="/#thank_you"}
        <ul>
            <li class="leftHalf">
                {freeform:field:first_name attr:placeholder="First Name"}
            </li>

            <li class="rightHalf">
                {freeform:field:last_name attr:placeholder="Last Name"}
            </li>

            <li class="leftFourth">
               {freeform:field:address attr:placeholder="Address"}
            </li>

            <li class="middleFourthFirst">
               {freeform:field:city attr:placeholder="City"}
            </li>

            <li class="middleFourthSecond">
               {freeform:field:state attr:placeholder="State"}
            </li>

            <li class="rightFourth">
               {freeform:field:zip attr:placeholder="Zip"}
            </li>


            <li class="leftFourth">
                {freeform:field:email attr:placeholder="Email"}
            </li>

            <li class="middleFourthFirst">
               {freeform:field:phone attr:placeholder="Phone"}
            </li>

            <li class="full">
              <br/>
                {freeform:submit attr:id="volunteer_submit"}
            </li>
        </ul>
      {/exp:freeform:form}
    </div>
</div>