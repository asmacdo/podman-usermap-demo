FILENAME=out/root-to-me.txt

sanity:
	podman run -it docker.io/busybox

clean:
	@rm out/* || true

maproot-to-me: clean
	@echo "When using the default podman mapping, the user outside the container that executes podman, \`$$(whoami)\`, maps to \`root\` inside."
	@podman run -it \
		-v ${PWD}:/bound:Z \
		docker.io/busybox \
		/bin/sh -c "echo \"I am \$$(whoami) inside the container\"" > ${FILENAME}
		@owner=$$(stat -c '%U' ${FILENAME}); \
		echo "I am $$owner outside of the container." >> ${FILENAME}
		@cat ${FILENAME}


maproot-to-nome: clean
maproot-to-notme:


