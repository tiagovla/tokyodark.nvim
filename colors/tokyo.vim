lua << EOF
for k in pairs(package.loaded) do
    if k:match(".*tokyo.*") then package.loaded[k] = nil end
end
EOF

lua require('tokyo').setup()

