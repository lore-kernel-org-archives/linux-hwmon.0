Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2905AC433EF
	for <linux-hwmon@archiver.kernel.org>; Sat, 15 Jan 2022 20:09:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233485AbiAOUJp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 15 Jan 2022 15:09:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbiAOUJp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 15 Jan 2022 15:09:45 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0563C061574
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jan 2022 12:09:44 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id bu18so19107027lfb.5
        for <linux-hwmon@vger.kernel.org>; Sat, 15 Jan 2022 12:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zSykjs8coDoVncVg24SCfBoFDgK7V6rwRpAeSusAre4=;
        b=WTTQq9iWkPYd+cdXTU4hAgv2/VvWWbAT7rp/ypRajFnv1Y5CopAwkwiZH9rNkDRqJi
         Zi+KCmD3lMCKZU33DhXkJ7qd/EcH0JMXbAoRGEzfarkYqz8h21+AurAKD5PHqmfS5R60
         uOOv4+b8YrVQd+nlg91ok4fS5q6Dgm9/LqxXxb+5IzzxxUx5bZ6WC85+A/h0pmgSbIqq
         LV/8uvs493s3XzWQpOnOROOgx7HghD7ERP4D1CUHQA6D1tptqceW/V+4+t5c/MR2QyI/
         9iNKM7VrFM0FK8PfemkUdHwe689cOAaoKx6WYhdKmB9HaaXeUSKXisUQUtfmvaG+8RqA
         XP1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zSykjs8coDoVncVg24SCfBoFDgK7V6rwRpAeSusAre4=;
        b=GUr0XnyHqu/vo21oeB+znqihepXzxAOyvQtatOCgw1d/cstARHjV2qqcNAUARecdY1
         LRotT6hHavSVIIRsuIH+9lEErh7sGfhGfEmvF4hHz0B5GMKYXgRpn6MpeJckBdOQazBn
         AIViqcUazIaHHtw7zDrcyt0LECqaraytCn9CE8rc1GAFl1XiPtwnAVmJl9Kt9IlRdxaE
         GlHBcLsZcHUgxVVEzdNlMRJ37ob3fAp/0KNypGjxGrLRgBk14Wr594A8Pt6YW+uiXniO
         3n+cbPQo64IpQwrf9iyiJobCccK9LYuaHeqNnjarfFYjsayiGfpZT7CdiGA6Rk/zVRfV
         VkKA==
X-Gm-Message-State: AOAM532OLHl8zH0bsgoqGNZqhyR/AQQ4MxHlDeHcalCkA7uLCIPrBfWK
        I1S6P5Gp1s948JTvo/4UVGAcgxNG+F4=
X-Google-Smtp-Source: ABdhPJyxD47URa/VA3331ASc7VdTLwFsUA+fyLMbT87I6qXnUQq77h5LxGJovPsOHTuiM2EKGN6NDQ==
X-Received: by 2002:a2e:a303:: with SMTP id l3mr9369772lje.261.1642277383081;
        Sat, 15 Jan 2022 12:09:43 -0800 (PST)
Received: from [192.168.2.145] (46-138-227-157.dynamic.spd-mgts.ru. [46.138.227.157])
        by smtp.googlemail.com with ESMTPSA id bf17sm804401ljb.135.2022.01.15.12.09.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Jan 2022 12:09:42 -0800 (PST)
Subject: Re: [PATCH 2/6] hwmon: (lm90) Re-enable interrupts after alert clears
To:     Guenter Roeck <linux@roeck-us.net>,
        Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc:     Jean Delvare <jdelvare@suse.com>
References: <20220111165116.1298459-1-linux@roeck-us.net>
 <20220111165116.1298459-3-linux@roeck-us.net>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <15765f82-b2d7-824b-aefd-4719bed981a1@gmail.com>
Date:   Sat, 15 Jan 2022 23:09:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20220111165116.1298459-3-linux@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

11.01.2022 19:51, Guenter Roeck пишет:
> If alert handling is broken, interrupts are disabled after an alert and
> re-enabled after the alert clears. However, if there is an interrupt
> handler, this does not apply if alerts were originally disabled and enabled
> when the driver was loaded. In that case, interrupts will stay disabled
> after an alert was handled though the alert handler even after the alert
> condition clears. Address the situation by always re-enabling interrupts
> after the alert condition clears if there is an interrupt handler.
> 
> Fixes: 2abdc357c55d9 ("hwmon: (lm90) Unmask hardware interrupt")
> Cc: Dmitry Osipenko <digetx@gmail.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/lm90.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index cc5e48fe304b..e4ecf3440d7c 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -848,7 +848,7 @@ static int lm90_update_device(struct device *dev)
>  		 * Re-enable ALERT# output if it was originally enabled and
>  		 * relevant alarms are all clear
>  		 */
> -		if (!(data->config_orig & 0x80) &&
> +		if ((client->irq || !(data->config_orig & 0x80)) &&
>  		    !(data->alarms & data->alert_alarms)) {
>  			if (data->config & 0x80) {
>  				dev_dbg(&client->dev, "Re-enabling ALERT#\n");
> 

Good catch!
