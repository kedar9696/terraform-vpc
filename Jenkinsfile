def REPO_MAP = [
    "terraform": [repo: "devops/terraform.git", projectID: 1],
    "inframap": [repo: "devops/inframap.git", projectID: 2]
]

pipeline {
    agent any

    parameters {
        choice(name: 'LOCK_OR_UNLOCK', choices: ['lock', 'unlock'], description: 'Choose to lock or unlock the branch')
    }

    environment {
        GITLAB_API_URL = "http://kedarj-pc.example.com:81/api/v4"
        PRIVATE_TOKEN = "glpat-XGRT3DSc1hoRwifX29pd"  // Update with your private token
        BRANCH = "main"   // Branch to protect/unprotect
    }

    stages {
        stage('Process All Repositories') {
            steps {
                script {
                    // Loop through each repository in the REPO_MAP
                    REPO_MAP.each { repoName, repoDetails ->
                        echo "Processing repository: ${repoName} (Project ID: ${repoDetails.projectID}, Git Repo: ${repoDetails.repo})"

                        // Fetch the rule ID for the protected branch
                        def response = httpRequest(
                            acceptType: 'APPLICATION_JSON',
                            contentType: 'APPLICATION_JSON',
                            url: "${GITLAB_API_URL}/projects/${repoDetails.projectID}/protected_branches/${BRANCH}",
                            customHeaders: [
                                [name: 'PRIVATE-TOKEN', value: PRIVATE_TOKEN]
                            ]
                        )
                        
                        // Ensure the response is in string format (using getContent() if needed)
                        def responseText = response.getContent()  // Use getContent() to extract text
                        echo "Response: ${responseText}"

                        // Parse the JSON response
                        def jsonResponse = readJSON(text: responseText)
                        echo "Parsed JSON: ${jsonResponse}"

                        // Fetch the ruleId for the push access levels
                        def ruleId = jsonResponse.push_access_levels[0]?.id
                        if (!ruleId) {
                            error "No push access levels found in the response for ${repoDetails.repo}. Exiting."
                        }

                        // Determine the access level based on the LOCK_OR_UNLOCK choice
                        def accessLevel = (params.LOCK_OR_UNLOCK == 'lock') ? 0 : 40

                        // Updating according to the chosen action (lock or unlock)
                        def updateResponse = httpRequest(
                            acceptType: 'APPLICATION_JSON',
                            contentType: 'APPLICATION_JSON',
                            httpMode: 'PATCH',
                            url: "${GITLAB_API_URL}/projects/${repoDetails.projectID}/protected_branches/${BRANCH}",
                            customHeaders: [
                                [name: 'PRIVATE-TOKEN', value: PRIVATE_TOKEN]
                            ],
                            requestBody: """{
                                "allowed_to_push": [{"id": ${ruleId}, "access_level": ${accessLevel} }]
                            }"""
                        )

                        echo "Update Response: ${updateResponse}"
                    }
                }
            }
        }
    }
}
