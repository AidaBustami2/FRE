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
            h 'docker run -d --privileged=true  -ti --name AIDA -e container=docker  -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /run   -v /var/www/html:/var/www/html    -p 7070:8899 img1 '
            sh 'docker exec -it AIDA ./isInstalled.sh'
            sh 'docker exec -it AIDA ./isRunnung.sh'
            
            
        }
    }
    

}
