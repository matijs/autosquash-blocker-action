# Autosquash-blocker

[![CI](https://github.com/matijs/autosquash-blocker-action/actions/workflows/ci.yml/badge.svg)](https://github.com/matijs/autosquash-blocker-action/actions/workflows/ci.yml)

This action can be used as a blocking status check on pull requests that contain
commits that should have been auto-squashed.

## Usage

```yaml
- name: Check for 'amend!', 'fixup!', or 'squash!' commits
  uses: matijs/autosquash-blocker-action@v1
```

This action will only run on pull requests and will fail when used on for
example pushes. There is one input. There are no outputs.

It is not necessary to use
[actions/checkout](https://github.com/actions/checkout) first. This action
already takes care of that and can be used on its own. See below if you want to
do the checkout yourself.

## If you want to skip the checkout

Make sure to pass `fetch-depth` and `ref` to the checkout action and let
autosquash-blocker-action know it can skip the checkout like so:

```yaml
- name: Checkout
  uses: actions/checkout@v4
  with:
    fetch-depth: 0
    ref: ${{ github.event.pull_request.head.sha }}
- name: Check for 'amend!', 'fixup!', or 'squash!' commits
  uses: matijs/autosquash-blocker-action@v1
  with:
    skip-checkout: true
```

## License

The scripts and documentation in this project are released under the [MIT
License](LICENSE.md)
