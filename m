Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC08DC433FE
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Oct 2022 15:30:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229484AbiJUPak (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 Oct 2022 11:30:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230523AbiJUP3g (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Oct 2022 11:29:36 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A62E99FCA
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Oct 2022 08:29:20 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id y10so2475833wma.0
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Oct 2022 08:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=VjZxqVwknh6rTHyizGvNMyan0rBuejjdovMyQ+KXz6Q=;
        b=PfPlpxaVD69iC/kMSPtqV9m9Du/JKNf7gFs5X95GrddDoi1ivdQq87vRJFCdd0tIfe
         sVLYLMgrAJivtuNepJjbZ9Kv2Y7qDv1O9aNJkguzTr71vYgfiokWBGqfIrpQOlZ+rBXN
         2j1SjU2b4QmBF4AYzpwJ2kPxQXtba+pevjuJFsjQMs/XUKcm82ZDo7Kf4hknClSlAhHW
         c1ClsChKLy2T7AP/QqyslmZFoI7DHKpGl3loWynWDI7ViI7tpRsH4sjT7cgGJAJ7QDwz
         YKqhaXvdcYV0zSEw28FabJn7IFk9Vy3cVWANB55q8PsvgF+tgLBN4WQSWET8xUuhb0kD
         QGOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VjZxqVwknh6rTHyizGvNMyan0rBuejjdovMyQ+KXz6Q=;
        b=T094I3E58iPrhNGrRgi2NuAAWb5DAF5JpTiSEp7/Qzo1J3DKDBzZDyTIxARvUz2mNa
         Jnxr9q97vYM78aPxabryV+PMUyv7bb/LuQByseXEovYvIDGEoi6dcjgACWf59LpWuKVc
         yRVC0+FNF9aoYbpDiovHobrgC83xKz8Srxhfyu2iR4KJCSHpAiRdNq/xhpAhz9yO23+C
         PUuzfVfPs/id984H3oXdLOKO7tgGN9VUS6f54xdiwB4Wz2z+QAkkRlTYlqSplHxNbrXS
         i/a42MombxswsYTh2q04D7EkxDNvlsO2sLC4ZQoo/7xmf3fMuy5uqGw6NFlVbd8Mms5q
         U/uw==
X-Gm-Message-State: ACrzQf2YCIyNgATEoGaDiFNIHJf/dIjXYG3HpRWa1V9uk9TZvpudCqhP
        E7uKu9DYnTRWFzr4SScxJkltoA==
X-Google-Smtp-Source: AMsMyM4hXGO9U8al2JzyTEC39tKZD6qIgNLNXyIQi+DLXxN292zU+X+E3Bq7kmxXYB+Xrq4wIyj8gg==
X-Received: by 2002:a05:600c:1614:b0:3c6:ca05:3e02 with SMTP id m20-20020a05600c161400b003c6ca053e02mr35430814wmn.116.1666366158507;
        Fri, 21 Oct 2022 08:29:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:8104:adb4:5d77:2050? ([2a01:e0a:982:cbb0:8104:adb4:5d77:2050])
        by smtp.gmail.com with ESMTPSA id b21-20020a05600c4e1500b003a83ca67f73sm3060390wmq.3.2022.10.21.08.29.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 08:29:18 -0700 (PDT)
Message-ID: <00d90039-c38a-ad8a-80a1-5a654a528756@linaro.org>
Date:   Fri, 21 Oct 2022 17:29:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 1/4] gpu: drm: meson: Use devm_regulator_*get_enable*()
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>
Cc:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Robert Foss <robert.foss@linaro.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org
References: <cover.1666357434.git.mazziesaccount@gmail.com>
 <c14058c4b7018556a78455ffef484a7ebe4d8ea2.1666357434.git.mazziesaccount@gmail.com>
 <Y1K0h4De8UsZJE7W@pendragon.ideasonboard.com>
Organization: Linaro Developer Services
In-Reply-To: <Y1K0h4De8UsZJE7W@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi,

On 21/10/2022 17:02, Laurent Pinchart wrote:
> Hi Matti,
> 
> On Fri, Oct 21, 2022 at 04:18:01PM +0300, Matti Vaittinen wrote:
>> Simplify using the devm_regulator_get_enable_optional(). Also drop the
>> seemingly unused struct member 'hdmi_supply'.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> ---
>> v3 => v4:
>> - split meson part to own patch
>>
>> RFCv1 => v2:
>> - Change also sii902x to use devm_regulator_bulk_get_enable()
>>
>> Please note - this is only compile-tested due to the lack of HW. Careful
>> review and testing is _highly_ appreciated.
>> ---
>>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 23 +++--------------------
>>   1 file changed, 3 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> index 5cd2b2ebbbd3..7642f740272b 100644
>> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
>> @@ -140,7 +140,6 @@ struct meson_dw_hdmi {
>>   	struct reset_control *hdmitx_apb;
>>   	struct reset_control *hdmitx_ctrl;
>>   	struct reset_control *hdmitx_phy;
>> -	struct regulator *hdmi_supply;
>>   	u32 irq_stat;
>>   	struct dw_hdmi *hdmi;
>>   	struct drm_bridge *bridge;
>> @@ -665,11 +664,6 @@ static void meson_dw_hdmi_init(struct meson_dw_hdmi *meson_dw_hdmi)
>>   
>>   }
>>   
>> -static void meson_disable_regulator(void *data)
>> -{
>> -	regulator_disable(data);
>> -}
>> -
>>   static void meson_disable_clk(void *data)
>>   {
>>   	clk_disable_unprepare(data);
>> @@ -723,20 +717,9 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>>   	meson_dw_hdmi->data = match;
>>   	dw_plat_data = &meson_dw_hdmi->dw_plat_data;
>>   
>> -	meson_dw_hdmi->hdmi_supply = devm_regulator_get_optional(dev, "hdmi");
>> -	if (IS_ERR(meson_dw_hdmi->hdmi_supply)) {
>> -		if (PTR_ERR(meson_dw_hdmi->hdmi_supply) == -EPROBE_DEFER)
>> -			return -EPROBE_DEFER;
>> -		meson_dw_hdmi->hdmi_supply = NULL;
>> -	} else {
>> -		ret = regulator_enable(meson_dw_hdmi->hdmi_supply);
>> -		if (ret)
>> -			return ret;
>> -		ret = devm_add_action_or_reset(dev, meson_disable_regulator,
>> -					       meson_dw_hdmi->hdmi_supply);
>> -		if (ret)
>> -			return ret;
>> -	}
>> +	ret = devm_regulator_get_enable_optional(dev, "hdmi");
>> +	if (ret != -ENODEV)
>> +		return ret;
> 
> As noted in the review of the series that introduced
> devm_regulator_get_enable_optional(), the right thing to do is to
> implement runtime PM in this driver to avoid wasting power.

While I agree, it's not really the same level of effort as this patch
should be functionally equivalent.

> 
>>   
>>   	meson_dw_hdmi->hdmitx_apb = devm_reset_control_get_exclusive(dev,
>>   						"hdmitx_apb");
> 

Neil
