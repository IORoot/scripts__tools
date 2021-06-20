<?php

/**
 * Remove returns / newlines
 */
$wp_query = preg_replace("/\r|\n/", "", $query);

/**
 * Match Moustaches {{yo:word_01}}
 */
preg_match_all("/{{([\w|\d|_|:]+)}}/", $args, $matches);

/**
 * Match Double square brackets.
 * [[anything in here]]. 
 * Non-greedy (? character)
 * PREG_SET_ORDER = Orders results so that $matches[0] is an array of first 
 * set of matches, $matches[1] is an array of second set of matches, and so on.
 */
preg_match_all('/\[\[(.*?)\]\]/', $string, $matches, PREG_SET_ORDER);


/**
 * Matches {{command=any argument here}}
 * Non-greedy brackets, so anything matches.
 */
preg_match_all('/\{\{(.*?)\=(.*?)\}\}/', $string, $matches, PREG_SET_ORDER);

/**
 * Remove anything thats not a printable character.
 */
$no_emoji = preg_replace('/[[:^print:]]/', '', $scrape_id);

/**
 * Check for HTTP at beginning of string.
 */
$bool = preg_match('/^http/i', $url);

/**
 * Check for an image file in string.
 */
$bool = preg_match('/[^\?]+\.(jpg|JPG|jpe|JPE|jpeg|JPEG|gif|GIF|png|PNG)/', $url, $matches);

/**
 * Remove and non-digit characters.
 */
$x = preg_replace('/[^0-9|\.]/', '', $this->cell_width);

/**
 * Replace anything before wp-content with ../../../../
 */
$result = preg_replace('/.*wp-content/','../../../../wp-content', $path);

/**
 * Matches word45_here[12]
 * Captures (word45_here) and (12)
 */
preg_match("/([\w|\d|_]*)\[(\d)\]/", $match, $matches);

/**
 * Matches {{date: any string here}}
 */
preg_match_all("/{{date:([\w|\s]+)}}/", $string, $matches);

/**
 * Remove any file extension.
 */
$result = preg_replace('/\.[^.]+$/', '', $filename);