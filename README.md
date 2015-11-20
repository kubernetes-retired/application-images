# application-images

This repository houses the Docker image build contents for (some) applications
that run on Kubernetes. Specifically, it houses the build content and rules for
any applications that require custom built Docker images.

## Structure

Each directory should include:
* a top-level README describing the contents
* a Makefile with a `make push` rule that will push to
  `gcr.io/google_containers` (it has to be something that @k8s-oncall can push
  to).

## Contributing

When in doubt, see the official Kubernetes
[contributing guidelines](https://github.com/kubernetes/kubernetes/blob/80569e8866966c554a0c293df907f1bf9de368d2/CONTRIBUTING.md).

## Merge guidelines

You or the reviewer can merge on a single LGTM. After you submit a PR, mention
@k8s-oncall to get the image pushed (if you or the merger aren't able).

## Joining the team

If you've submitted an image to this repo and will maintain it actively,
consider asking to join the
[application-images-maintainers](https://github.com/orgs/kubernetes/teams/application-images-maintainers)
team.
