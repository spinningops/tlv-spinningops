# WP tlv.spinningops.com

1. add `dynamic.yml` and `uploads.ini`

2. modify `ip_unprivileged_port_start`

    ```bash
    sudo sysctl net.ipv4.ip_unprivileged_port_start
    # likely shows 1024

    echo "net.ipv4.ip_unprivileged_port_start=80" | sudo tee -a /etc/sysctl.conf
    sudo sysctl -p
    ```

3. enable linger `loginctl enable-linger $USER`

4. start podman-compose.yaml

    `podman-compose up -d &`

5. At the bottom of `wp-config.php` (before the `/* That's all, stop editing! */` line), add

    ```php
    @ini_set( 'upload_max_size' , '928M' );
    @ini_set( 'post_max_size', '928M' );
    @ini_set( 'memory_limit', '512M' );
    @ini_set( 'max_execution_time', '300' );
    @ini_set( 'max_input_time', '300' );
    ```

6. DualStack
    It's required to add A and AAAA records to the DNS
