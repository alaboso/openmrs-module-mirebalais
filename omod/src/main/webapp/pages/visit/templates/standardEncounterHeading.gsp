<i ng-show="icon" class="{{ icon }}"></i>
<span class="title">{{ encounterStub.encounterType | omrs.display }}</span>
<span>{{ encounterStub.encounterDatetime | date:encounterDateFormat }}</span>