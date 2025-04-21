FROM abhishekf5/maven-abhishek-docker-agent:v1

USER root

# Install OpenJDK 17
RUN apt-get update && \
    apt-get install -y openjdk-17-jdk && \
    apt-get clean

# Set Java 17 as default
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Optional sanity check
RUN java -version && javac -version

USER jenkins  # If original image switches user
