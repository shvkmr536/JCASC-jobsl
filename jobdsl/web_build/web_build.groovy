pipelineJob('web_build') {
  definition {
    cpsScm {
        scm {
          git {
            remote {
              url ('https://github.com/shvkmr536/JCASC-jenkinsfile.git')
              credentials('github')
            }
          }
        }
        scriptPath("web_build/Jenkinsfile")
    }
  }
  configure { project ->
    project / 'properties' / 'org.jenkinsci.plugins.workflow.job.properties.PipelineTriggersJobProperty' / 'triggers' / 'hudson.triggers.SCMTrigger' {
       'spec'('* * * * *')
    }
  }
}
