<div class="text-container">
{exp:channel:entries channel="take_action" dynamic="no" limit="1" disable="{global:param_disable_default}"}
  {exp:hundies_shortcode}{ta_share}{/exp:hundies_shortcode}
{/exp:channel:entries}

    <p><a href ng-click="toggleForm()">Share Your Story <span class="arrow">&gt;</span></a></p>
    <br/>
    <div class="reveal outer-container" ng-show="showForm==true">
       {exp:freeform:form 
        form_id="4" 
        form:id="share-your-story"
        form:name="share"
        form:class="flatform invert"
        form:valid-submit="valid-submit"
        form:novalidate="novalidate"
        return="/#thank_you"
      }
        <ul>
            <li class="full" ng-class="{'has-error': share.user_message.$invalid && share.$submitted }">
                {freeform:field:user_message attr:placeholder="Message*" attr:ng-model="message" attr:required="required"}
            </li>

            <li class="leftHalf" ng-class="{'has-error': share.first_name.$invalid && share.$submitted }">
                {freeform:field:first_name attr:placeholder="First Name*" attr:ng-model="firstName" attr:required="required"}
            </li>

            <li class="rightHalf" ng-class="{'has-error': share.last_name.$invalid && share.$submitted }">
                {freeform:field:last_name attr:placeholder="Last Name*" attr:ng-model="lastName" attr:required="required"}
            </li>

            <li class="leftFourth" ng-class="{'has-error': share.address.$invalid && share.$submitted }">
                {freeform:field:address attr:placeholder="Address*" attr:ng-model="address" attr:required="required"}
            </li>

            <li class="middleFourthFirst" ng-class="{'has-error': share.city.$invalid && share.$submitted }">
                {freeform:field:city attr:placeholder="City*" attr:ng-model="city" attr:required="required"}
            </li>

            <li class="middleFourthSecond" ng-class="{'has-error': share.state.$invalid && share.$submitted }">
                {freeform:field:state attr:placeholder="State*" attr:ng-model="state" attr:required="required"}
            </li>

            <li class="rightFourth" ng-class="{'has-error': share.zip.$invalid && share.$submitted }">
                {freeform:field:zip attr:placeholder="Zip*" attr:ng-model="zip" attr:required="required"}
            </li>

            <li class="leftFourth" ng-class="{'has-error': share.email.$invalid && share.$submitted }">
                {freeform:field:email attr:placeholder="Email*" attr:ng-model="email" attr:required="required" attr:type="email"}
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
