FROM quay.io/fedora/fedora-bootc:40

RUN dnf -y install httpd && systemctl enable httpd
RUN dnf -y install neofetch vim && dnf clean all
RUN echo "neofetch" > /etc/profile.d/z-welcome.sh
RUN systemctl enable bootc-fetch-apply-updates.timer

RUN useradd -m -G wheel admin && \
    echo "admin:redhat" | chpasswd
