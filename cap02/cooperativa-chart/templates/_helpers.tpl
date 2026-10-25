{{- define "cooperativa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "cooperativa.fullname" -}}
{{- printf "%s-%s" .Release.Name (include "cooperativa.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "cooperativa.labels" -}}
app.kubernetes.io/name: {{ include "cooperativa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ .Chart.Name }}-{{ .Chart.Version }}
{{- end -}}
