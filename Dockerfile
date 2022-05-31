FROM klakegg/hugo:0.92.1


COPY hugo_site/ /src 
#COPY gcloud/ /app/gcloud/ 

# todo symlink corretto
RUN rm /src/content/cheatsheets
COPY cheatsheets/ /src/content/ 



CMD ["bash"]