if exists('b:current_syntax')
  unlet b:current_syntax
endif
syntax include @Yaml syntax/yaml.vim
syntax region yamlFrontmatter start=/\%^---$/ end=/^---$/ keepend contains=@Yaml
