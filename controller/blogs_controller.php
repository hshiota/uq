<?php

class BlogsController extends BlogsAppController
{
	// 記事の標準表示件数
	var $defaultLimit = 4;

	public function index($sort = null)
	{
		$sort = in_array($sort, array('votes', 'views')) ? $sort : null;
		$entries = $this->_getEntries($sort);

		$tokenName  = Configure::read('SecurityLite.tokenName');
		$tokenValue = $this->viewVars[$tokenName];

		$this->set('tags', array());
		$this->set(compact('sort', 'entries', 'tokenName', 'tokenValue'));

		//続きを読む、リンクの非表示用
		if($this->params['paging']['BlogsEntry']['nextPage']){
			$this->set('nextMoviePage',true);
		}else{
			$this->set('nextMoviePage',false);
		}
	}

	public function partial($sort = null)
	{
		if (empty($this->params['requested'])) {
			return $this->cakeError('error404');
		}

		$sort = in_array($sort, array('votes', 'views')) ? $sort : null;
		$entries = $this->_getEntries($sort);

		$tokenName  = Configure::read('SecurityLite.tokenName');
		$tokenValue = $this->viewVars[$tokenName];

		$this->set(compact('sort', 'entries', 'tokenName', 'tokenValue'));
		$this->autoLayout = false;
	}

	public function api_index($sort = null){
		$this->autoLayout = false;
		$ret_val = array();
		$_ret_val = $this->_getEntries($sort);

		foreach ($_ret_val as $key => $value) {//配列の階層をあさく
			$ret_val[] = $value['BlogsEntry'];
		}
		//続きを読む、リンクの非表示用
		if($this->params['paging']['BlogsEntry']['nextPage']){
			$ret_val[] = array('nextPage' => true);
		}else{
			$ret_val[] = array('nextPage' => false);
		}
		$this->_json($ret_val);
	}

	protected function _getEntries($sort)
	{
		$this->helpers[] = 'Paginator';
		$recursive  = -1;
		$conditions = array(
			'BlogsEntry.status' => BlogsEntry::STATUS_APPROVED,
		);
		//$defaultLimit = 10;
		//$defaultLimit = 9;
		$defaultLimit = $this->defaultLimit;
		if($this->is_Smartphone){//一覧の表示はindexとpartialから呼ばれているため、api_listからも呼ぶことにする。その際、スマホ用の件数５件にするため、この処理をいれる。
			$sp_plugins = array('areareports','servicearea','speed');
			$plugin_name = $this->params['plugin_url'];
			if(in_array($plugin_name,$sp_plugins)){
				//$defaultLimit = 3;
				$defaultLimit = $this->defaultLimit;
			}
		}

		if ($sort == 'votes' || $sort == 'views') {
			$params    = compact('recursive', 'conditions');
			$named     = $this->params['named'];
			$limit     = isset($named['limit']) ? (int)$named['limit'] : $defaultLimit;
			$limit     = min(max($limit, 1), 100);
			$count     = $this->BlogsEntry->find('count', $params);
			$pageCount = ceil($count / $limit);
			$page      = !empty($this->params['named']['page']) ? (int)$this->params['named']['page']: 1;
			$page      = min($pageCount, max(1, $page));
			$offset    = $limit * ($page - 1);
			$entries   = $sort == 'votes' ?
				$this->BlogsEntry->getRankingByVotes($limit, $offset, $params):
				$this->BlogsEntry->getRankingByViews($limit, $offset, $params);
			$this->params['paging'][$this->BlogsEntry->alias] = array(
				'page'      => $page,
				'current'   => count($entries),
				'count'     => $count,
				'prevPage'  => ($page > 1),
				'nextPage'  => ($count > ($page * $limit)),
				'pageCount' => $pageCount,
				'defaults'  => array('limit' => $defaultLimit, 'step' => 1),
				'options'   => array_merge($this->params['pass'], $this->params['named']),
				'limit' => $limit,
			);
		} else {
			$this->paginate['BlogsEntry'] = array(
				'recursive'  => $recursive,
				'conditions' => $conditions,
				'limit'      => $defaultLimit,
				'order'      => array('BlogsEntry.published DESC', 'BlogsEntry.id DESC'),
			);
			$entries = $this->paginate('BlogsEntry');
		}

		foreach ($entries as $i => $entry) {
			$entry['BlogsEntry']['tags'] = explode(BlogsEntry::TAG_SEPARATOR, $entry['BlogsEntry']['tags']);
			$entries[$i] = $entry;
		}
		return $entries;
	}

	public function tag($tags = null)
	{
		$args = func_get_args();
		if (count($args) > 1) {
			$tags = implode('/', $args);
		}
		if (!is_string($tags) || !strlen($tags)) {
			return $this->redirect(array('action' => 'index'));
		}
		$options = array();
		$options['conditions'] = array();
		$options['conditions']['BlogsEntry.status'] = BlogsEntry::STATUS_APPROVED;

		//$limit  = 10;
		$limit  = 9;
		if($this->is_Smartphone){
			//スマホ用の件数3件にするため、この処理をいれる。
			$limit = 3;
		}
		$page   = !empty($this->params['named']['page']) ? (int)$this->params['named']['page']: 1;
		$offset = $limit * ($page - 1);
		list ($total, $entries) = $this->BlogsEntry->getByTags($tags, $limit, $offset, $options);
		$this->params['paging']['BlogsEntry'] = array(
			'page'     => $page,
			'current'  => count($entries),
			'count'    => $total,
			'prevPage' => ($page > 1),
			'nextPage' => ($total > ($page * $limit)),
			'pageCount' => ceil($total / $limit),
			'defaults'  => array('limit' => $limit, 'step' => 1),
			'options' => array_merge(array('limit' => $limit), $this->params['pass'], $this->params['named']),
		);
		$this->helpers[] = 'Paginator';

		foreach ($entries as $i => $entry) {
			$entry['BlogsEntry']['tags'] = explode(BlogsEntry::TAG_SEPARATOR, $entry['BlogsEntry']['tags']);
			$entries[$i] = $entry;
		}

		$tokenName  = Configure::read('SecurityLite.tokenName');
		$tokenValue = $this->viewVars[$tokenName];
		$tags = explode(BlogsEntry::TAG_SEPARATOR, $tags);

		$this->set(compact('entries', 'tags', 'tokenName', 'tokenValue'));
	}

	/* 
	 * スマホ対応でpublic function tag の内容をJSON形式で返すURLを新設
	 * limitの値をスマホ用に5件に設定
	 */
	public function api_tag($tags = null)
	{
		$this->autoLayout = false;
		$val = array();
		$args = func_get_args();
		if (count($args) > 1) {
			$tags = implode('/', $args);
		}
		if (!is_string($tags) || !strlen($tags)) {
			return $this->redirect(array('action' => 'index'));
		}
		$options = array();
		$options['conditions'] = array();
		$options['conditions']['BlogsEntry.status'] = BlogsEntry::STATUS_APPROVED;

		$limit  = 3;
		$page   = !empty($this->params['named']['page']) ? (int)$this->params['named']['page']: 1;
		$offset = $limit * ($page - 1);
		list ($total, $entries) = $this->BlogsEntry->getByTags($tags, $limit, $offset, $options);
		$this->params['paging']['BlogsEntry'] = array(
				'page'     => $page,
				'current'  => count($entries),
				'count'    => $total,
				'prevPage' => ($page > 1),
				'nextPage' => ($total > ($page * $limit)),
				'pageCount' => ceil($total / $limit),
				'defaults'  => array('limit' => $limit, 'step' => 1),
				'options' => array_merge(array('limit' => $limit), $this->params['pass'], $this->params['named']),
		);
		$this->helpers[] = 'Paginator';
	
		foreach ($entries as $i => $entry) {
			$entry['BlogsEntry']['tags'] = explode(BlogsEntry::TAG_SEPARATOR, $entry['BlogsEntry']['tags']);
			$entries[$i] = $entry;
		}

		$_val = $entries;
		foreach ($_val as $key => $value) {
			//配列の階層をあさくする
			$val[] = $value['BlogsEntry'];
		}
		//続きを読む、リンクの非表示用
		if($this->params['paging']['BlogsEntry']['nextPage']){
			$val[] = array('nextPage' => true);
		}else{
			$val[] = array('nextPage' => false);
		}
		$this->_json($val);
	}

	public function jump($id = null)
	{
		if ($link = $this->BlogsEntry->view($id)) {
			$this->autoRender = false;
			$url  = Configure::read('SiteInfo.campaignEnv') == 'preview' ?
				'/jump.php?to=' . rawurlencode($link) :
				$link;
			header("Location: {$url}", true, 301);
			return;
		}
		return $this->cakeError('error404');
	}

	public function vote($id = null)
	{
		$res = false;
		if ($this->_isPost()) {
			$res = $this->BlogsEntry->vote($id);
		}
		if ($this->RequestHandler->isAjax()) {
			Configure::write('debug', 0);
			$this->autoRender = false;
			header('Content-Type: text/plain');
			echo $res ? 'voted' : 'error';
			return;
		} else {
			return $this->redirect(array('action' => 'index'));
		}
	}
}

