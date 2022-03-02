node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("img1" , "./test2")
    }

    
    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            h 'docker run -it img1 ./isRunnung.sh'
            sh 'docker exec -it img1 ./isInstalled.sh'
            sh 'docker exec -it img1 ./isRunnung.sh'
            
            
        }
    }
    

}
