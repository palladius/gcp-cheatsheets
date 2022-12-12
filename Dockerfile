# Note: Hugo is in GOLANG., not Rubu 🤮
FROM klakegg/hugo:0.92.1

#PORT 8080

COPY hugo_site/ /src
#COPY gcloud/ /app/gcloud/

# todo symlink corretto
RUN rm /src/content/cheatsheets
COPY cheatsheets/ /src/content/

# how to change port to 8080 for example
# hugo server -b http://localhost/yoursite -p 8080

#CMD ["/bin/bash"]
# probably port is 1313
CMD ["server","-p","8080"]
