PROCEDURE render_region (
    p_plugin IN            apex_plugin.t_plugin,
    p_region IN            apex_plugin.t_region,
    p_param  IN            apex_plugin.t_region_render_param,
    p_result IN OUT NOCOPY apex_plugin.t_region_render_result
) IS
    l_html           CLOB;
    l_dom_id         VARCHAR2(200);
    l_js_code        VARCHAR2(1000);
    l_img_url        VARCHAR2(4000);

    -- Plugin-specific attributes
    attr_contract_addr    VARCHAR2(4000) := p_region.attributes.get_varchar2('contract_address'); -- Smart contract address
    attr_personal_addr    VARCHAR2(4000) := p_region.attributes.get_varchar2('personal_address'); -- Wallet address
    attr_text_connecting  VARCHAR2(4000) := p_region.attributes.get_varchar2('text_connecting'); -- Message when connecting
    attr_text_error       VARCHAR2(4000) := p_region.attributes.get_varchar2('text_error'); -- Message on connection error
BEGIN
    if apex_application.g_debug then
        apex_plugin_util.debug_region(p_plugin => p_plugin, p_region => p_region);
    end if;

    -- Assign default messages if plugin attributes are empty
    IF attr_text_connecting IS NULL THEN
        attr_text_connecting := 'Connecting to blockchain...';
    END IF;

    IF attr_text_error IS NULL THEN
        attr_text_error := 'Error connecting to the blockchain...';
    END IF;

    -- Generate unique DOM ID for the region container
    l_dom_id := p_region.static_id || '_CONTAINER';

    l_img_url := 'novocoin_balance/icon.png';

    -- Build the HTML content for the region
    l_html := '<div id="' || apex_escape.html_attribute(l_dom_id) || '">';
    l_html := l_html || '<p class="novocoin-status-message"><i class="fas fa-circle"></i>' || apex_escape.html(attr_text_connecting) || '</p>';
    l_html := l_html || '<p class="novocoin-balance" style="display:none;"> Novocoin balance 0</p>';
    l_html := l_html || '<p class="novocoin-error" style="display:none;">' || apex_escape.html(attr_text_error) || '</p>';
    l_html := l_html || '</div>';

    -- Output the HTML content to the browser
    htp.p(l_html);

    -- Set the navigable DOM ID for the region
    p_result.navigable_dom_id := l_dom_id;

    -- JavaScript code to initialize the NovocoinBalancePlugin
    l_js_code := 'window.NovocoinBalancePlugin({ containerId: ''' || l_dom_id || ''', contractAddress: ''' || attr_contract_addr || ''', personalAddress: ''' || attr_personal_addr || ''' });';

    -- Add the JavaScript code to be executed on page load
    apex_javascript.add_onload_code(p_code => l_js_code);
END render_region;