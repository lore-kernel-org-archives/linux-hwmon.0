Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D5AC64EC4
	for <linux-hwmon@archiver.kernel.org>; Sat, 18 Feb 2023 10:44:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbjBRKoF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 18 Feb 2023 05:44:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229823AbjBRKoD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 18 Feb 2023 05:44:03 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0367813DC1
        for <linux-hwmon@vger.kernel.org>; Sat, 18 Feb 2023 02:43:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676716996;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LQPC+W/GGOaiPhupQkL+fioSZnAdQgjaIafObYt5jdo=;
        b=Q9GxZReFRAUbv5BnjhfvczSmWJZtwGKHzsoH1jB7u+pj5dNc/8fmKzzQNSHojhzIed23Ot
        iEuYOJMMwfKyZNASEm+rGvLsHDgZHO/GjhG/mLU/I5rnMPkXusCaMB+gQQy7woB2SIiUYT
        SIKTHaqtsKmB+QhT+0cwtnIeSoOVpJM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-279-dF33nE2gMByeD5SSzl2NBw-1; Sat, 18 Feb 2023 05:43:14 -0500
X-MC-Unique: dF33nE2gMByeD5SSzl2NBw-1
Received: by mail-ed1-f69.google.com with SMTP id y7-20020a056402440700b004a6c2f6a226so343642eda.15
        for <linux-hwmon@vger.kernel.org>; Sat, 18 Feb 2023 02:43:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LQPC+W/GGOaiPhupQkL+fioSZnAdQgjaIafObYt5jdo=;
        b=UtRTcuG0cdUEJ+ICDs+D/QQlz5BivQ9vcs8JkW1jJka8JhsW4vq+RM2WejF/eNPM/C
         D7VzK1ugliqfHKEDqnYvZXUFuKPJu+RNFJ2ldqAzl5pyUCwrb4z18rNwcsX/65VCEkDq
         QMXqMiyi38/zPFJBuO8ED0i2maOAtAs9TIepbA2oVq0+pHlTFRtE1usqowWmVceNcmK1
         3cPQaTR0d7TcW6DpQ/EjcysfbWeDdPzUGwej6wbnvlJe9GC4OJYcW0nKr1pMrXV0+vlC
         Veef/U9KvA1KJRFFVUrZxqYmxFHKWwnD+dGxT59W96czEzbCjUdTdwjgy77pLi5xueRk
         wOqw==
X-Gm-Message-State: AO0yUKXrpq2cCmOu5q+2yX5zdPNpKf8exrPZE1b7/bmTJ6TXVAeJ5dW/
        BKkR0i21uT/W4kqe4mcQSAF1QEMoQRFExQ/xfBR57txg8xpBFJ4/YCZM7YUI3TygoOhBKhloUZ3
        1RGCVdzu7td3Dpd5gRMWOxbCflATR
X-Received: by 2002:a17:906:9f25:b0:8b1:2eef:154c with SMTP id fy37-20020a1709069f2500b008b12eef154cmr7620898ejc.0.1676716992930;
        Sat, 18 Feb 2023 02:43:12 -0800 (PST)
X-Google-Smtp-Source: AK7set+hLeFT07Usv4u1EkM1gYgFZeoXCyWmGNpNmdKLWF/8jBaMBmtOx0UaGDU283iz13s90G3Q/w==
X-Received: by 2002:a17:906:9f25:b0:8b1:2eef:154c with SMTP id fy37-20020a1709069f2500b008b12eef154cmr7620882ejc.0.1676716992636;
        Sat, 18 Feb 2023 02:43:12 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id z7-20020a170906714700b008b17b0f5d07sm2390553ejj.217.2023.02.18.02.43.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 02:43:11 -0800 (PST)
Message-ID: <eee025e7-be05-92cb-854c-ece82eb23552@redhat.com>
Date:   Sat, 18 Feb 2023 11:43:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] platform/x86: dell-ddv: Fix cache invalidation on
 resume
To:     Armin Wolf <W_Armin@gmx.de>, markgross@kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net,
        platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230213182215.53703-1-W_Armin@gmx.de>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230213182215.53703-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Armin,

On 2/13/23 19:22, Armin Wolf wrote:
> If one or both sensor buffers could not be initialized, either
> due to missing hardware support or due to some error during probing,
> the resume handler will encounter undefined behaviour when
> attempting to lock buffers then protected by an uninitialized or
> destroyed mutex.
> Fix this by introducing a "active" flag which is set during probe,
> and only invalidate buffers which where flaged as "active".
> 
> Tested on a Dell Inspiron 3505.
> 
> Fixes: 3b7eeff93d29 ("platform/x86: dell-ddv: Add hwmon support")
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Can you move the "if (...active)" check to inside
dell_wmi_ddv_hwmon_cache_invalidate() please ?

Otherwise this patch as well as patch 2/2 look good to me.

Regards,

Hans



> ---
>  drivers/platform/x86/dell/dell-wmi-ddv.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platform/x86/dell/dell-wmi-ddv.c
> index d547c9d09725..58f996b3b374 100644
> --- a/drivers/platform/x86/dell/dell-wmi-ddv.c
> +++ b/drivers/platform/x86/dell/dell-wmi-ddv.c
> @@ -96,6 +96,7 @@ struct combined_chip_info {
>  };
> 
>  struct dell_wmi_ddv_sensors {
> +	bool active;
>  	struct mutex lock;	/* protect caching */
>  	unsigned long timestamp;
>  	union acpi_object *obj;
> @@ -530,6 +531,7 @@ static void dell_wmi_ddv_hwmon_cache_destroy(void *data)
>  {
>  	struct dell_wmi_ddv_sensors *sensors = data;
> 
> +	sensors->active = false;
>  	mutex_destroy(&sensors->lock);
>  	kfree(sensors->obj);
>  }
> @@ -549,6 +551,7 @@ static struct hwmon_channel_info *dell_wmi_ddv_channel_init(struct wmi_device *w
>  		return ERR_PTR(ret);
> 
>  	mutex_init(&sensors->lock);
> +	sensors->active = true;
> 
>  	ret = devm_add_action_or_reset(&wdev->dev, dell_wmi_ddv_hwmon_cache_destroy, sensors);
>  	if (ret < 0)
> @@ -852,9 +855,12 @@ static int dell_wmi_ddv_resume(struct device *dev)
>  {
>  	struct dell_wmi_ddv_data *data = dev_get_drvdata(dev);
> 
> -	/* Force re-reading of all sensors */
> -	dell_wmi_ddv_hwmon_cache_invalidate(&data->fans);
> -	dell_wmi_ddv_hwmon_cache_invalidate(&data->temps);
> +	/* Force re-reading of all active sensors */
> +	if (data->fans.active)
> +		dell_wmi_ddv_hwmon_cache_invalidate(&data->fans);
> +
> +	if (data->temps.active)
> +		dell_wmi_ddv_hwmon_cache_invalidate(&data->temps);
> 
>  	return 0;
>  }
> --
> 2.30.2
> 

