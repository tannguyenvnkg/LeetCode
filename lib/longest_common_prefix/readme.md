# Longest Common Prefix Function

This repository contains a function to find the **longest common prefix** string among an array of strings.

## Problem Description

Given an array of strings, the function returns the longest common prefix shared among all the strings. If no common prefix exists, the function returns an empty string (`""`).

### Example 1:

- **Input**: `["flower", "flow", "flight"]`
- **Output**: `"fl"`

### Example 2:

- **Input**: `["dog", "racecar", "car"]`
- **Output**: `""`
- **Explanation**: There is no common prefix among the input strings.

## Constraints

- The number of strings in the input array (`strs.length`) is between 1 and 200.
- Each string (`strs[i]`) has a length between 0 and 200.
- The strings consist only of lowercase English letters.

