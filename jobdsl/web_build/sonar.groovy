pipelineJob('sonarqube') {
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
}
