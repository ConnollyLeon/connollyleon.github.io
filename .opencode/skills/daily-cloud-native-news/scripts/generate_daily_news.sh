#!/bin/bash
# Daily Cloud Native News Generator
# Usage: ./generate_daily_news.sh [date] [categories]
# Example: ./generate_daily_news.sh 2026-01-20 cloud-native,tech,fintech

# Configuration
TARGET_DATE=${1:-$(date -d "yesterday" +%Y-%m-%d)}
CATEGORIES=${2:-"cloud-native,tech,fintech,politics,military"}
POSTS_DIR="_posts"
PAGES_DIR="_pages"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}Daily Cloud Native News Generator${NC}"
echo -e "${GREEN}========================================${NC}"
echo ""
echo -e "Target Date: ${YELLOW}$TARGET_DATE${NC}"
echo -e "Categories: ${YELLOW}$CATEGORIES${NC}"
echo ""

# Function to generate post filename
generate_filename() {
    local category=$1
    echo "${TARGET_DATE}-${category}-daily-news.md"
}

# Function to check if news exists for category
check_category_news() {
    local category=$1
    # Placeholder - in real implementation, this would query APIs
    echo "Checking news for category: $category"
}

# Generate posts for each category
generate_posts() {
    IFS=',' read -ra CATS <<< "$CATEGORIES"
    
    total_posts=0
    posts_created=()
    
    for cat in "${CATS[@]}"; do
        # Trim whitespace
        cat=$(echo "$cat" | xargs)
        
        # Check if category is valid
        valid_cats=("cloud-native" "tech" "fintech" "politics" "military")
        is_valid=false
        for valid in "${valid_cats[@]}"; do
            if [[ "$cat" == "$valid" ]]; then
                is_valid=true
                break
            fi
        done
        
        if [[ "$is_valid" == false ]]; then
            echo -e "${RED}Invalid category: $cat${NC}"
            continue
        fi
        
        # Generate filename
        filename=$(generate_filename "$cat")
        filepath="${POSTS_DIR}/${filename}"
        
        # Check if file already exists
        if [[ -f "$filepath" ]]; then
            echo -e "${YELLOW}File already exists: $filepath${NC}"
            continue
        fi
        
        # Create placeholder post (in real implementation, this would be generated from AI)
        echo "Creating post for $cat..."
        
        cat > "$filepath" << EOF
---
layout: post
title: "$(echo "$cat" | sed 's/-/ /g' | sed 's/\b./\U&/g') - Daily News"
date: $TARGET_DATE
author: "云原生观察"
source: "https://example.com/news/$TARGET_DATE/$cat"
categories:
  - $cat
tags:
  - news
  - daily
---

# $(echo "$cat" | sed 's/-/ /g' | sed 's/\b./\U&/g') News

*This is a template post. Please use the OpenCode skill to generate actual content.*

## Summary

Daily news updates for $TARGET_DATE in the $cat category.

## Key Developments

### Development 1

Description of key development...

[Source](https://example.com/article1)

### Development 2

Description of another development...

[Source](https://example.com/article2)

## Analysis

Analysis of the news and its implications for the industry.

## Conclusion

Key takeaways and forward outlook.

---
*Generated on $(date)*
EOF
        
        if [[ -f "$filepath" ]]; then
            echo -e "${GREEN}Created: $filepath${NC}"
            ((total_posts++))
            posts_created+=("$filepath")
        fi
    done
    
    echo ""
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}Summary${NC}"
    echo -e "${GREEN}========================================${NC}"
    echo -e "Total new posts: ${YELLOW}$total_posts${NC}"
    
    if [[ $total_posts -gt 0 ]]; then
        echo ""
        echo "Created files:"
        for post in "${posts_created[@]}"; do
            echo "  - $post"
        done
    fi
}

# Function to update category pages
update_category_pages() {
    echo ""
    echo -e "${YELLOW}Updating category pages...${NC}"
    
    # List of category pages
    cat_pages=(
        "category-cloud-native"
        "category-tech"
        "category-fintech"
        "category-politics"
        "category-military"
    )
    
    for page in "${cat_pages[@]}"; do
        filepath="${PAGES_DIR}/${page}.md"
        if [[ -f "$filepath" ]]; then
            # Touch the file to trigger rebuild
            touch "$filepath"
            echo -e "${GREEN}Updated: $filepath${NC}"
        fi
    done
}

# Function to show help
show_help() {
    echo "Usage: $0 [date] [categories]"
    echo ""
    echo "Arguments:"
    echo "  date       Target date in YYYY-MM-DD format (default: yesterday)"
    echo "  categories Comma-separated list of categories (default: all)"
    echo ""
    echo "Categories:"
    echo "  cloud-native  - Cloud native technology news"
    echo "  tech          - Technology news"
    echo "  fintech       - Financial technology news"
    echo "  politics      - Policy and regulation news"
    echo "  military      - Military application news"
    echo ""
    echo "Examples:"
    echo "  $0                                    # Yesterday, all categories"
    echo "  $0 2026-01-20                         # Specific date, all categories"
    echo "  $0 2026-01-20 cloud-native,tech      # Specific date, specific categories"
    echo "  $0 ""2026-01-20" "cloud-native,tech,fintech"   # Same as above with quotes"
}

# Main execution
case "$1" in
    -h|--help)
        show_help
        exit 0
        ;;
    *)
        generate_posts
        update_category_pages
        ;;
esac
