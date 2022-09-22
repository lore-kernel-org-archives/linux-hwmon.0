Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A1AEC54EE9
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Sep 2022 23:50:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiIVXun (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 22 Sep 2022 19:50:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229552AbiIVXul (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Sep 2022 19:50:41 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2DFD102538
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Sep 2022 16:50:40 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id t3so10278251ply.2
        for <linux-hwmon@vger.kernel.org>; Thu, 22 Sep 2022 16:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=KWEmmizT8APrRJkIXEJYoZf2rvQddvRzRF2oIbJ/jdI=;
        b=Qi+vs3b1mwaviUypbQhn9MzwcHEoTGjlS0kwkDXmVvRV4t3ZNtEZRVKaLIngYOw2g1
         kloxzmXKj/Plr/fS6T6DwtwOFx3Ut00uCiaQW+EYRSruxOGdjMo79fYK3u00nbz2Exn/
         Taw/JXPJsQ21jUggYqSgF4VmHA+1emGpogo3039Xtlb3olgrPtSavojruqhO1RsiSpgg
         c3J2EhQiAcmgnmBkq1NmoiwUbGQX2o6Rlcj6OgBeRelmwbrRP1v+8ZNfiyJq59YXobGc
         hrQzmZEDlig/CS7yquix9tQNbDM3O9pQBOMoOmfEUSxUY+vcuKYEtbS6v+9O7VGIE2jV
         +p4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=KWEmmizT8APrRJkIXEJYoZf2rvQddvRzRF2oIbJ/jdI=;
        b=iIwb0ikzx5c8kpuk9nKMzAjvVYQkmnTNQN8jAzaj/lY81esJzpRZWLJWVLIlIRqwKs
         CAsKYElbK0yXZWiqVX0U+DGZTbztu/uaiU4bCaRky4Bx3NyV4ZiFIyVygXwPGyfjpeBz
         QS0rLbOSsqeZU0bAvox7cnZDNBE8sanlS0tUJna3QXioOO3BfRyH2aTYyVC5fr34nPKL
         2E0/oEi+pNxR4FQ+H5mAlTxmYUzeuLGTT+dj3/fVQZrg/AOUQCyFRP9QAtDvDibPOtqZ
         EfUKDaROgQI/HmnVKhJZvQh/Rt8kFUI9wxEpORjjquBN9loIlksDuf6zK8xmxGZIbm7l
         CGXA==
X-Gm-Message-State: ACrzQf1qLWKWvZ6lKTO01Rhz6U+OuUTVsCIKxXwKkWOx/H35d71NdeCi
        i9Vj7EYP0FP851iHd8a37b4=
X-Google-Smtp-Source: AMsMyM4p8YI9gNwxssr/AQHi0oo+7rh2Aisb2PPTUeah1/WkZO3spVfhqcy1EIuJijtV9smHylAnGQ==
X-Received: by 2002:a17:90b:5096:b0:202:df4f:89a with SMTP id rt22-20020a17090b509600b00202df4f089amr6467849pjb.25.1663890640268;
        Thu, 22 Sep 2022 16:50:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a25-20020a656419000000b0042254fce5e7sm4370438pgv.50.2022.09.22.16.50.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Sep 2022 16:50:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <33a4f1d9-d74c-5309-cc64-bb95a64d60e2@roeck-us.net>
Date:   Thu, 22 Sep 2022 16:50:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] drivers/hwmon/adm9240: fix data race in
 adm9240_fan_read
Content-Language: en-US
To:     Li Zhong <floridsleeves@gmail.com>, linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com
References: <20220922234348.1714344-1-floridsleeves@gmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220922234348.1714344-1-floridsleeves@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 9/22/22 16:43, Li Zhong wrote:
> In
> adm9240_read()
>    adm9240_fan_read()
>      adm9240_write_fan_div(),
> 
> it assumes that the caller of adm9240_write_fan_div() must hold
> data->update_lock. Otherwise, it may cause data races when data is
> updated by other threads.
> 
> Signed-off-by: Li Zhong <floridsleeves@gmail.com>
> ---
> v2: add mutex_unlock() in error handling
> 
>   drivers/hwmon/adm9240.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/adm9240.c b/drivers/hwmon/adm9240.c
> index 483cd757abd3..d58999e186dc 100644
> --- a/drivers/hwmon/adm9240.c
> +++ b/drivers/hwmon/adm9240.c
> @@ -501,16 +501,22 @@ static int adm9240_fan_read(struct device *dev, u32 attr, int channel, long *val
>   
>   	switch (attr) {
>   	case hwmon_fan_input:
> +		mutex_lock(&data->update_lock);
>   		err = regmap_read(data->regmap, ADM9240_REG_FAN(channel), &regval);
> -		if (err < 0)
> +		if (err < 0) {
> +			mutex_unlock(&data->update_lock);
>   			return err;
> +		}
>   		if (regval == 255 && data->fan_div[channel] < 3) {
>   			/* adjust fan clock divider on overflow */
>   			err = adm9240_write_fan_div(data, channel,
>   						    ++data->fan_div[channel]);
> -			if (err)
> +			if (err) {
> +				mutex_unlock(&data->update_lock);
>   				return err;
> +			}
>   		}
> +		mutex_unlock(&data->update_lock);
>   		*val = FAN_FROM_REG(regval, BIT(data->fan_div[channel]));

Unfortunately, this is still racy. All accesses to data->fan_div[channel]
need to be included in the lock.

Thanks,
Guenter

>   		break;
>   	case hwmon_fan_div:

