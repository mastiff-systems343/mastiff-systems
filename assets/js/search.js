class JekyllSearch {
  constructor(searchInput, resultsContainer, jsonData) {
      this.searchInput = searchInput;
      this.resultsContainer = resultsContainer;
      this.searchData = [];
      this.searchIndex = null;
      
      // Load the search data
      fetch(jsonData)
          .then(response => response.json())
          .then(data => {
              this.searchData = data;
              this.initSearchIndex();
              this.init();
          });
  }

  initSearchIndex() {
      // Create a simple index for faster searching
      this.searchIndex = this.searchData.map(item => ({
          ...item,
          searchContent: `${item.title} ${item.content} ${item.categories?.join(' ')} ${item.tags?.join(' ')}`.toLowerCase()
      }));
  }

  init() {
      this.searchInput.addEventListener('input', () => {
          this.performSearch(this.searchInput.value);
      });
  }

  performSearch(term) {
      if (!term) {
          this.resultsContainer.innerHTML = '';
          return;
      }

      const searchTerms = term.toLowerCase().split(' ').filter(t => t.length > 0);
      
      const results = this.searchIndex
          .map(item => {
              const matches = searchTerms.filter(term => 
                  item.searchContent.includes(term)
              ).length;
              return { item, relevance: matches };
          })
          .filter(result => result.relevance > 0)
          .sort((a, b) => b.relevance - a.relevance)
          .map(result => result.item);

      this.displayResults(results);
  }

  displayResults(results) {
      if (results.length === 0) {
          this.resultsContainer.innerHTML = '<p class="no-results">No results found</p>';
          return;
      }

      const html = results.map(item => `
          <div class="search-result ${item.type}">
              <h3><a href="${item.url}">${item.title}</a></h3>
              <div class="meta">
                  <span class="type">${this.capitalizeFirst(item.type)}</span>
                  ${item.date ? `<span class="date">${item.date}</span>` : ''}
                  ${item.collection ? `<span class="collection">${this.capitalizeFirst(item.collection)}</span>` : ''}
              </div>
              ${item.categories?.length ? `
                  <div class="categories">
                      ${item.categories.map(cat => `<span class="category">${cat}</span>`).join('')}
                  </div>
              ` : ''}
              ${item.tags?.length ? `
                  <div class="tags">
                      ${item.tags.map(tag => `<span class="tag">${tag}</span>`).join('')}
                  </div>
              ` : ''}
              <p class="excerpt">${this.truncate(item.content, 200)}</p>
          </div>
      `).join('');

      this.resultsContainer.innerHTML = html;
  }

  capitalizeFirst(string) {
      return string.charAt(0).toUpperCase() + string.slice(1);
  }

  truncate(text, length) {
      if (!text) return '';
      return text.length > length ? text.substr(0, length) + '...' : text;
  }
}