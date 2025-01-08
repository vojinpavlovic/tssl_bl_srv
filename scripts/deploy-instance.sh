        ssh -T -i ~/.ssh/id_rsa ${{ secrets.SERVER_USER }}@${{ secrets.SERVER_IPV4 }} << EOF
        # Disable 'set -e' for more control
        set +e
        
        echo "Logging into Docker..."
        echo "${{ secrets.DOCKER_PASSWORD }}" | docker login -u "${{ secrets.DOCKER_USERNAME }}" --password-stdin
        
        echo "Pulling Docker image..."
        docker pull ${{ secrets.DOCKER_USERNAME }}/${{ secrets.DOCKER_REPOSITORY }}:${{ inputs.docker-image-version }}
        
        echo "Stopping existing container (if any)..."
        docker stop ${{ inputs.configuration-id }} || true
        docker rm ${{ inputs.configuration-id }} || true
        
        echo "Starting new Docker container..."

        echo "${{ secrets.MODULES }}"
        echo "${{ secrets.TICK_RATE }}"

        docker run -d --name ${{ inputs.configuration-id }} \
          -e TW_TOKEN=${{ secrets.TW_TOKEN }} \
          -e MODULES=${{ inputs.modules-str }} \
          -e TICK_RATE=${{ inputs.tick-rate }} \
          -e SERVER_CFG=${{inputs.server-cfg}} \
          -p 7210:7210/tcp \
          -p 7210:7210/udp \
          ${{ secrets.DOCKER_USERNAME }}/${{ secrets.DOCKER_REPOSITORY }}:${{ inputs.docker-image-version }}

        echo "Checking running containers..."
        docker ps
        
        echo "Deployment completed successfully."
        EOF