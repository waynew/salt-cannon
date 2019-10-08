This should help with smoke testing pre-release artifacts.

Navigate to one of the directories and run `docker-compose`. Here's what that
could look like:

    cd centos6-py2
    docker-compose build --no-cache \
                   --build-arg repo_user=salt
                   --build-arg repo_pass=somepassword

    docker-compose kill
    docker-compose down -v
    docker-compose up

---

**NOTE**: Replace `salt` and `somepassword` with the actual user/pass for the
staging repositories. Also note that this is only meant to keep the credentials
out of the repository - they **will** be available in the Docker image. So
don't be pushing your images anywhere.

---

Now in another window you can:

    cd centos6-py2
    ../testy.sh

This will run a series of tests:

- `salt-call --local grains.items` and `salt-call --local test.version`, on the
  minion
- accept the minion key on the master
- run `salt \* grains.items` and `salt \* test.version` on the minion. This
  should return the same information as the command from the minion.
- Runs `salt-run --versions-report` on the master, to check that dependencies
  (e.g. cherrypy) are not installed yet.
- Installs
  - `salt-cloud`
  - `salt-api`
  - `salt-syndic`
  - `salt-ssh`
- Re-runs `--versions-report` to check that new deps have been installed.

This is not an exhaustive test scenario, but it's enough to confirm that at
least we can install and communicate between the master & minions - the QA
process runs more of these tests. It would be great to have things a bit more
automated.
