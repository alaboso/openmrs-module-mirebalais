<%
    ui.includeJavascript("coreapps", "fragments/patientdashboard/encountertemplate/defaultEncounterTemplate.js")
%>

<script type="text/template" id="consultEncounterTemplate">
    <li class="consult-encounter-template">
        <div class="encounter-date">
            <i class="icon-time"></i>
            <strong>
                {{- encounter.encounterTime }}
            </strong>
            {{- encounter.encounterDate }}
        </div>
        <ul class="encounter-details">
            <li>
                <div class="encounter-type">
                    <strong>
                        <i class="{{- config.icon }}"></i>
                        <span class="encounter-name" data-encounter-id="{{- encounter.encounterId }}">{{- encounter.encounterType.name }}</span>
                    </strong>
                </div>
            </li>
            <li>
                <div>
                    ${ ui.message("emr.by") }
                    <strong>
                        {{- encounter.primaryProvider ? encounter.primaryProvider : '' }}
                    </strong>
                    ${ ui.message("emr.in") }
                    <strong>{{- encounter.location }}</strong>
                </div>
            </li>
            <li>
                <div class="details-action">
                    <a class="view-details collapsed" href='javascript:void(0);' data-encounter-id="{{- encounter.encounterId }}" data-encounter-form="{{- encounter.form != null}}" data-target="#encounter-summary{{- encounter.encounterId }}" data-toggle="collapse" data-target="#encounter-summary{{- encounter.encounterId }}" data-display-template="consultEncounterDetailsTemplate">
                        <span class="show-details">${ ui.message("emr.patientDashBoard.showDetails")}</span>
                        <span class="hide-details">${ ui.message("emr.patientDashBoard.hideDetails")}</span>
                        <i class="icon-caret-right"></i>
                    </a>
                </div>
            </li>
        </ul>

        <span>
            {{ if (config.editable && encounter.canEdit) { }}
            <i class="editEncounter delete-item icon-pencil" data-patient-id="{{- patient.id }}" data-encounter-id="{{- encounter.encounterId }}" data-edit-url="htmlformentryui/htmlform/editHtmlFormWithStandardUi.page?patientId={{- patient.id }}&encounterId={{- encounter.encounterId }}&returnProvider=coreapps&returnPage=patientdashboard/patientDashboard" title="${ ui.message("coreapps.edit") }"></i>
            {{ } }}
            {{ if ( encounter.canDelete ) { }}
            <i class="deleteEncounterId delete-item icon-remove" data-encounter-id="{{- encounter.encounterId }}" title="${ ui.message("coreapps.delete") }"></i>
            {{  } }}
        </span>

        <div id="encounter-summary{{- encounter.encounterId }}" class="collapse">
            <div class="encounter-summary-container"></div>
        </div>
    </li>
</script>

<script type="text/template" id="consultEncounterDetailsTemplate">
    {{ _.each(_.filter(diagnoses, function(d) { return d.answer }), function(d) { }}
            <p><small>{{- d.question}}</small><span>{{- d.answer}}</span></p>
    {{ }); }}

    {{ _.each(_.filter(observations, function(o) { return o.answer }), function(observation) { }}
        <p><small>{{- observation.question}}</small><span>{{- observation.answer}}</span></p>
    {{ }); }}

    {{ _.each(orders, function(order) { }}
        <p><small>${ ui.message("emr.patientDashBoard.order")}</small><span>{{- order.concept }}</span></p>
    {{ }); }}

    {{ _.each(dispositions, function(d) { }}
        <p><small>${ ui.message("emr.consult.disposition") }</small><span>{{- d.disposition}}</span></p>
        {{ _.each(d.additionalObs, function(obs) { }}
            <p><small>{{- obs.question}}</small><span>{{- obs.answer}}</span></p>
        {{ }); }}
    {{ }); }}
</script>