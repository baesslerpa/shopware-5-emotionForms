{extends file='parent:frontend/forms/index.tpl'}

{* Breadcrumb *}
{block name='frontend_index_start'}
    {$sBreadcrumb = [['name' => $sSupport.name, 'link' => {url controller=forms sFid=$sSupport.id}]]}
    {$smarty.block.parent}
{/block}
{block name='frontend_index_content_left'}{/block}
{block name="frontend_index_header"}  {include file="frontend/forms/header.tpl"}{/block}
{* Sidebar left *}
{if !$sSupport.attribute.showEmotion}

    {include file="frontend/index/sidebar.tpl"}
  

{/if}

{* Main content *}
{block name='frontend_index_content'}
{if $sSupport.attribute.showEmotion}
    <div class="emotion--wrapper emotion--non-ajax">
        {action module="widgets" controller="emotion" action="index" emotionId=$sSupport.attribute.showEmotion}
    </div>
{/if}


    
    <div class="forms--content {if $sSupport.attribute.showEmotion} container {else} content right {/if}">

        {* Form error *}
        {block name='frontend_forms_elements_error'}
            {if $sSupport.sErrors.e || $sSupport.sErrors.v}
                {$errorContent=""}
                <div class="error">
                    {if $sSupport.sErrors.v}
                        {foreach from=$sSupport.sErrors.v key=sKey item=sError}
                            {if $sKey !=0&&$sSupport.sElements.$sError.error_msg}{$errorContent="{$errorContent}<br />"}{/if}
                            {$errorContent="{$errorContent}{$sSupport.sElements.$sError.error_msg}"}
                        {/foreach}
                        {if $sSupport.sErrors.e}
                            {$errorContent="{$errorContent}<br />"}
                        {/if}
                    {/if}

                    {if $sSupport.sErrors.e}
                        {if $sSupport.sErrors.e['sCaptcha'] == true}
                            {$errorContent="{$errorContent}{s name='SupportInfoFillCaptcha' namespace="frontend/forms/elements"}{/s}"}
                        {else}
                            {$errorContent="{$errorContent}{s name='SupportInfoFillRedFields' namespace="frontend/forms/elements"}{/s}"}
                        {/if}
                    {/if}

                    {block name='frontend_forms_elements_error_messages'}
                        {include file="frontend/_includes/messages.tpl" type='error' content=$errorContent}
                    {/block}
                </div>
            {/if}
        {/block}

        {* Forms headline *}
        {block name='frontend_forms_index_headline'}
        {if !$sSupport.attribute.showEmotion}
            <div class="forms--headline panel panel--body is--wide has--border is--rounded">
                {if $sSupport.sElements}
                    <h1 class="forms--title">{$sSupport.name}</h1>
                    <div class="forms--text">{$sSupport.text}</div>
                {elseif $sSupport.text2}
                    {include file="frontend/_includes/messages.tpl" type="success" content=$sSupport.text2}
                {/if}
            </div>

        {/if}
         {/block}

        {* Forms Content *}
        {block name='frontend_forms_index_content'}
            {if $sSupport.sElements}
                <div class="forms--container panel has--border is--rounded">
                    <div class="panel--title is--underline">{$sSupport.name}</div>
                    <div class="panel--body">
                        {block name='frontend_forms_index_form_elements'}
                            {include file="frontend/forms/form-elements.tpl"}
                        {/block}
                    </div>
                </div>
            {/if}
        {/block}

    </div>
{/block}

{* Hide sidebar right *}
{block name='frontend_index_content_right'}{/block}
