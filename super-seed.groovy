job('super-seed') {
  scm {
    git {
      remote {
        url ('https://github.com/shvkmr536/JCASC-jobsl.git')
        credentials('github')
      }
    }
  }
  steps {
    dsl {
      external('jobdsl/**/*.groovy')
      removeAction('DELETE')
    }
  }
}
