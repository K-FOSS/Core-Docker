# Core Docker agent guidance

This file applies to the entire repository. A more specific `AGENTS.md` may add
rules for its subtree but must not weaken these repository-wide requirements.

## Repository and publishing model

- Treat this repository as a collection of independent Docker build contexts,
  not as one application. Start work in the relevant directory under
  `Images/` and inspect every local file copied by its Dockerfile.
- Before changing an image, find its build step in
  `.github/workflows/Daily.yaml` or `.github/workflows/KubeCTL.yaml`. Confirm
  the context, build arguments, platforms, cache tag, and published tag.
- A Dockerfile is not proof that an image is active. Several build steps are
  commented out or absent from CI; preserve that distinction in code and docs.
- Pushes to `main` can trigger image publication. Do not change tags,
  credentials, registry targets, schedules, or `push: true` behavior without
  treating the change as a release and reviewing every affected image.
- Keep image changes independent. Do not couple unrelated image upgrades or
  cleanup unless the task explicitly spans them.

## Documentation

- Keep the root `README.md`, the nearest image README, and workflow behavior in
  sync when a change alters a build context, published tag, platform, build
  argument, entrypoint, health check, or operator workflow.
- Link external base images, applications, plugins, and downloaded tools to
  authoritative upstream documentation or source. Prefer a component-specific
  release or README over a registry search or project homepage.
- Describe current behavior separately from intended behavior. Dockerfiles and
  active workflows are authoritative when older README content or captured
  build logs disagree.
- Document prerequisites, build arguments, supported platforms, runtime
  configuration, mounts, ports, entrypoints, health checks, and a useful smoke
  test when they are non-obvious.
- Do not present an image as published merely because its directory exists.
  Name its registry and tag only when an active workflow or other repository
  automation establishes them.

## Secrets and sensitive data

- Never add, decode, print, log, document, or commit registry credentials,
  tokens, private keys, production configuration, or secret values.
- GitHub Actions must continue to obtain Docker Hub credentials from
  `DH_USER` and `DH_TOKEN`. Do not replace secret references with literals or
  expose them through build arguments, labels, cache metadata, or debug output.
- Assume every Docker build layer, build argument, copied file, and command
  output may be retained. Use BuildKit secret mounts for any future build-time
  secret and ensure it is absent from the final image and build cache.
- Review configuration examples before documenting them. Use unmistakable
  placeholders and never add deployable default passwords or tokens.

## Dependencies and supply chain

- Pin base images and downloaded source, binaries, plugins, and Git revisions
  to immutable versions or digests where supported. Avoid `latest`, moving
  branches, unversioned clones, and dynamically selected releases unless their
  mutability is intentional and documented.
- Verify upgrades against the authoritative upstream release, checksum or
  signature, compatibility notes, and supported platforms. Do not infer a
  download URL or archive format from an older release.
- Prefer HTTPS downloads. Add checksum or signature verification for fetched
  artifacts where upstream publishes it; a successful download is not an
  integrity check.
- When changing a multi-stage build, confirm that the runtime stage receives
  only the intended artifacts and all required runtime libraries. Keep build
  dependencies out of the final image where practical.
- Treat remote Git repositories, mutable container tags, package repositories,
  and BuildKit cache sources as supply-chain inputs. Do not broaden their trust
  or mutability as incidental cleanup.

## Dockerfile implementation

- Follow the local Dockerfile style and preserve unrelated worktree changes.
  Do not reformat, revert, stage, or include another author's edits.
- Use the smallest build context that contains the Dockerfile and its required
  files. Never solve a missing `COPY` by broadening context to the repository
  root without reviewing what that exposes to the build.
- Preserve target-platform behavior. Use BuildKit-provided `TARGETOS` and
  `TARGETARCH` when downloading or compiling architecture-specific artifacts,
  and test every platform declared in CI.
- Keep `ENTRYPOINT`, `CMD`, health checks, exposed ports, users, ownership, and
  filesystem paths stable unless changing runtime behavior is intentional and
  documented.
- Avoid adding debugging commands such as `ls`, `cat`, `printenv`, or shell
  tracing when they can disclose build inputs or remain as unnecessary layers.
- Clean package-manager indexes and temporary build artifacts in the layer
  where they are created when practical. Do not trade correctness or useful
  cache boundaries for cosmetic layer reduction.

## Validation

- Run `git diff --check` and inspect the final diff for secrets, unexpected
  context files, mutable dependencies, platform regressions, entrypoint
  changes, and publishing side effects.
- Build the changed context with `docker build --pull` or `docker buildx build`.
  Match the workflow's build arguments and platforms; a native-only build does
  not validate a multi-platform image.
- Smoke-test the resulting image using its version command, entrypoint, health
  check, or a minimal representative invocation. Do not claim runtime
  validation from a successful build alone.
- For workflow edits, validate the YAML, inspect all affected build steps, and
  confirm contexts, tags, cache references, matrices, conditions, and secret
  references remain aligned.
- If Docker, emulation, network access, registry credentials, or an upstream
  artifact is unavailable, complete all safe static checks and report the
  exact validation that remains outstanding.
