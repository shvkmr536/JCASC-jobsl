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
        scriptPath("auth_build/Jenkinsfile")
    }
  }
}
