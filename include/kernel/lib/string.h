#ifndef STD_STRING_H
#define STD_STRING_H

#include <stddef.h>

char* itoa(int i, char b[]);

long long int atoi(const char *c);

/// Concatenate strings
char* strcat(char *dest, const char *src);

/// Concatenate char to string
char* strccat(char* dest, char src);

/// Compares input strings
int strcmp(const char *lhs, const char *rhs);

/// Removes last character from string
char* delchar(char* str);

/// Extract tokens from string
char *strtok_r (char *s, const char *delim, char **save_ptr);

/// Returns token at index after delimiting str with delimiter
// char **strsplit(const char *string, const char *delim, size_t *out);

/// Get length of string
size_t strlen(const char* str);

/// Copies src into dest
char *strcpy(char *dest, const char *src);

/// Check if char is blank
int isblank(char c);

/// Check if char is space
int isspace(char c);

/// Duplicate string and strcpy it
// char *strdup (const char *s);

/// Search a string for a set of bytes
size_t strspn(const char *str, const char *accept);

/// Search a string for a set of bytes
size_t srtcspn(const char *str, const char *reject);

/// Search a string for any of a set of bytes
char *strpbrk(const char *s, const char *accept);

/// Locate character in string
char *strchr(const char *s, int c_in);

#endif // STD_STRING_H
