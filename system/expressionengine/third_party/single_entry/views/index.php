<?php if (count($channels) > 0): ?>
	<?=form_open($action_url)?>
	<h2><?= lang('single_entry_title'); ?></h2>
	<p><?= lang('single_entry_instructions'); ?></p>
	<table class="mainTable" border="0" cellspacing="0">
		<thead>
			<tr>
				<th scope="col"><?= lang('channel'); ?></th>
				<th scope="col"><?= lang('single_entry_question'); ?></th>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($channels as $channel) : ?>
				<tr>
					<td>
						<?=form_label($channel['channel_title'],'single_entry['.$site_id.']['.$channel['channel_id'].']'); ?>
					</td>
					<td>
						<?=form_checkbox('single_entry['.$site_id.']['.$channel['channel_id'].']', '1',  ! empty($settings['single_entry'][$site_id][$channel['channel_id']])); ?>
					</td>
				</tr>
			<?php endforeach; ?>
		<tbody>
	</table>

	<h2><?= lang('single_entry_preferences_title'); ?></h2>
	<table class="mainTable" border="0" cellspacing="0">
		<thead>
			<tr>
				<th scope="col"><?= lang('preference'); ?></th>
				<th scope="col"><?= lang('setting'); ?></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><?=form_label(lang('single_entry_nav_title_heading'), 'single_entry_nav_title');?></td>
				<td><?=form_input('single_entry_nav_title', $settings['single_entry_nav_title']);?></td>
			</tr>
		</tbody>
	</table>

	<div class="tableFooter">
		<div class="tableSubmit">
			<?=form_submit(array('name' => 'submit', 'value' => lang('submit'), 'class' => 'submit'))?>
		</div>
	</div>	
	<?=form_close()?>
<?php else: ?>
	<p>No channels</p>
<?php endif; ?>