#!/usr/bin/env cwl-runner
cwlVersion: v1.0
label: QIIME2 - FeatureTable tabulate seqs command
class: CommandLineTool

hints:
  - class: DockerRequirement
    dockerPull: umigs/chiron-qiime2

inputs:
  rep_seqs:
    inputBinding:
      prefix: --i-data
    type: File
  in_prefix:
    type: string?
  seqs_visualization:
    inputBinding:
      prefix: --o-visualization
      valueFrom: $(inputs.in_prefix + 'rep-seqs.qzv')
    type: string
    default: 'rep-seqs.qzv'

outputs:
  out_seqs_visual:
    type: File
    outputBinding:
      glob: $('*' + inputs.seqs_visualization)

baseCommand: ["qiime", "feature-table", "tabulate-seqs"]
