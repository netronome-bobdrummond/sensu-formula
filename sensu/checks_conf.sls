{% from "sensu/pillar_map.jinja" import sensu with context %}

{%- if salt['pillar.get']('sensu:checks') %}

{{ sensu.paths.checks_file }}:
  file.serialize:
    - dataset:
        checks: {{ salt['pillar.get']('sensu:checks') }}
    - formatter: json
    - require:
      - pkg: sensu

{%- endif %}
