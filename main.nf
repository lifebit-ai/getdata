#!/usr/bin/env nextflow

if(params.links_list) { ch_links = Channel.fromPath(params.files_list).splitText().map{ it }}

process print_name {

  publishDir "results"
  echo true
  tag "${link}"
  maxForks 1

  input: 
  val(link) from ch_links
  
  script:
  """
  wget $link
  ls -l
  """
}
