<?php
/**
	function.paginagor_navi.php


*/

/**
 *  Pagination links using Paginator helper
 *
 *   {paginator_navi}
 *   {paginator_navi model="ModelName"}
 *   {paginator_navi prevTitle="<< 前" nextTitle="次 >>" }
 *
 */
function smarty_function_paginator_navi($options, &$smarty)
{
	$paginator = isset($options['paginator']) ? $options['paginator'] : $smarty->get_template_vars('paginator');
	$ellipsis  = isset($options['ellipsis'])  ? $options['ellipsis']  : '・・・';

	if (!$paginator->hasPage(null, 2)) {
		return;
	}

	$options += array(
		'model'     => $paginator->defaultModel(),
		'prevTitle' => '前へ', //'prev',
		'nextTitle' => '次へ', //'next',
	);
	extract($options, EXTR_SKIP);
	unset($options['model'],
		  $options['prevTitle'], $options['nextTitle'],
		  $options['paginator'], $options['ellipsis']);

	$params = array_merge(array('page' => 1), $paginator->params($model));

	$current = $paginator->current($model);
	$last    = $params['pageCount'];
	$size    = isset($options['defaultPageCountSize'])  ? $options['defaultPageCountSize']  : 4;
	$isNonSpan    = isset($options['isNonSpan'])  ? $options['isNonSpan']  : false;

	if ($current < 1) {
		$current = 1;
	} else if ($current > $last) {
		$current = $last;
	}

	$start = $current - $size;
	if ($start < 1) {
		$start = 1;
	}

	$end = $current + $size;
	if ($end > $last) {
		$end = $last;
	}

	if ($end - $start < $size * 2) {
		$end = $start + $size * 2;
		if ($end > $last) {
			$end = $last;
			$start = $end - $size * 2;
			if ($start < 1) {
				$start = 1;
			}
		}
	}

	if ($start <= 3) {
		$start = 1;
	}

	if ($last - $end < 3) {
		$end = $last;
	}

	$out = array();
	$out[] = '<ul>';

	$extra = array('tag' => 'span', 'model' => $model);
	
	$prev = $paginator->prev($prevTitle, $extra, $prevTitle, $extra);
	preg_match("/href=\"(.*?)\"/", $prev, $m);
	if (count($m) > 1) {
		$querystring = '';
		$exploded = explode('?', $_SERVER['REQUEST_URI']);
		if (count($exploded) > 1) {
			$querystring = '?' . $exploded[1];
		}
		$prev = str_replace($m[1], $m[1].$querystring, $prev);
	}
	
	$out[] = sprintf('<li class="prev%s">%s</li>',
		($current > 1 ? '' : ' disabled'),
		$prev
	);

	if ($start > 1) {
		if ($isNonSpan) {
			$out[] = $paginator->Html->tag('li', $paginator->link(1, array('page' => 1 . $querystring), $options));
		} else {
			$out[] = sprintf('<li>%s</li>',
				$paginator->first(1, $extra + array('separator' => '', 'after' => ''))
			);
		}
		$out[] = sprintf('<li class="spc">%s</li>', $ellipsis);
	}
	for ($i = $start; $i <= $end; $i++) {
		if ($i == $current) {
			$out[] = sprintf('<li class="current"><span>%s</span></li>',
				$paginator->Html->tag('em', $i, $options)
			);
		} else {
			$querystring = '';
			$exploded = explode('?', $_SERVER['REQUEST_URI']);
			if (count($exploded) > 1) {
				$querystring = '?' . $exploded[1];
			}
			$out[] = $paginator->Html->tag('li', $paginator->link($i, array('page' => $i . $querystring), $options));
		}
	}

	if ($end < $last) {
		$out[] = sprintf('<li class="spc">%s</li>', $ellipsis);
		if ($isNonSpan) {
			$out[] = $paginator->Html->tag('li', $paginator->link($last, array('page' => $last . $querystring), $options));
		} else {
			$out[] = sprintf('<li>%s</li>',
				$paginator->last($last, $extra + array('separator' => '', 'before' => ''))
			);
		}
	}
	
	$next = $paginator->next($nextTitle, $extra, $nextTitle, $extra);
	preg_match("/href=\"(.*?)\"/", $next, $m);
	if (count($m) > 1) {
		$querystring = '';
		$exploded = explode('?', $_SERVER['REQUEST_URI']);
		if (count($exploded) > 1) {
			$querystring = '?' . $exploded[1];
		}
		$next = str_replace($m[1], $m[1].$querystring, $next);
	}

	$out[] = sprintf('<li class="next%s">%s</li>',
		($current < $last ? '' : ' disabled'),
		$next
	);

	$out[] = '</ul>';

	return implode('', $out);
}


