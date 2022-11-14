Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79B23C4332F
	for <linux-hwmon@archiver.kernel.org>; Mon, 14 Nov 2022 23:25:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbiKNXZc (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 14 Nov 2022 18:25:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230212AbiKNXZb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 14 Nov 2022 18:25:31 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B75917E21
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Nov 2022 15:25:30 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id b11so11758545pjp.2
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Nov 2022 15:25:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTfMW5uqpoD+yFUaPzaxWbNPfAyHrbTcWBTiMzUlrqo=;
        b=UpmS63ai2ElZdzTIuXcIpQBxqnoMWYPocFS68N4yePBST274od7ybzJKzo46BjUwGx
         yipPwXpJej1Ly1JQHOZ4BHdBl0MTulxwIJq1RQ0/GZOucXY6zwmbPMvkhQErQXGEkXPG
         81DOkuop+fpBN/ipmOXOmO3J6yF9IpI2zMsaonOE+eOZYAimXfLgyNMdh33ZeYyPKZpS
         /urUMsHh0Wpj1aNoZVlUmcJSxOiOvAuac00PMsDd+Sa+eI+35c2J/5BUHok8uxPD6Z1A
         EOX40wApwjCvf4sfW2FQTYYf6maC3j3+KSUTKCOtvd87sFMNNLmbOlLQdagUXT7fTD/q
         coLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WTfMW5uqpoD+yFUaPzaxWbNPfAyHrbTcWBTiMzUlrqo=;
        b=mxlIxHrciGnQR3+D1QFqYByke8b2trMnXHmA4BnvVKQwxccujlQVPIHTkBnDDcdLxz
         +UmxIprYAQFVQcJ4l03TqcDRKyLMfX0dS7QTwC0aoYy7ZY9YnDbi8wGq2+hRWBd8pUMN
         LjZihEcbRcUt3qvgiwp78DNiKV2IICHtZpgWDqIE+OXxds3vjuahbWFbyy/W48KqzwdE
         a+hYJGak7GwWsoCVfezV6yFr5ks3NXkJkuZtmLAWHXJiMSsZ2Z8nnVtQ9YF3dlMgWxes
         BCkqPZSQ3CYwJNdWdXbtFCnuPIMaWnxcDnxqs19ouNZKLw2Eg0OLfYz6zJ5J/f+v6Qm7
         lTMg==
X-Gm-Message-State: ANoB5plTYiHOE7IGHWEUDt5DbqCsV+QFxk40u9f/cC9Qph9donqvyB4Y
        ZGcXE1neTh5UGzSXmQDgGt4=
X-Google-Smtp-Source: AA0mqf7oUw4FO/T9EUQKE7OwMLp7BOuMiufMgWYNnaO3yKBaGZ34VF36yPO9sEtqh5nYrDsibMfQpw==
X-Received: by 2002:a17:90a:9d8a:b0:212:de1a:355b with SMTP id k10-20020a17090a9d8a00b00212de1a355bmr16063411pjp.1.1668468329906;
        Mon, 14 Nov 2022 15:25:29 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l12-20020a170903244c00b0017f5ba1fffasm8082893pls.297.2022.11.14.15.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 15:25:29 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 14 Nov 2022 15:25:28 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Zhang Rui <rui.zhang@intel.com>
Cc:     jdelvare@suse.com, fenghua.yu@intel.com,
        linux-hwmon@vger.kernel.org, srinivas.pandruvada@linux.intel.com
Subject: Re: [PATCH V2 3/3] hwmon (coretemp): Add support for dynamic ttarget
Message-ID: <20221114232528.GA2290298@roeck-us.net>
References: <20221113153145.32696-1-rui.zhang@intel.com>
 <20221113153145.32696-4-rui.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221113153145.32696-4-rui.zhang@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Nov 13, 2022 at 11:31:45PM +0800, Zhang Rui wrote:
> Tjmax value retrieved from MSR_IA32_TEMPERATURE_TARGET can be changed at
> runtime when the Intel SST-PP (Intel Speed Select Technology -
> Performance Profile) level is changed. As a result, the ttarget value
> also becomes dyamic.
> 
> Improve the code to always get updated ttarget value.
> 
> Signed-off-by: Zhang Rui <rui.zhang@intel.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/coretemp.c | 57 +++++++++++++++++++++++++++++-----------
>  1 file changed, 41 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
> index 573ac8c5ed42..e537ab0d0422 100644
> --- a/drivers/hwmon/coretemp.c
> +++ b/drivers/hwmon/coretemp.c
> @@ -69,7 +69,6 @@ MODULE_PARM_DESC(tjmax, "TjMax value in degrees Celsius");
>   */
>  struct temp_data {
>  	int temp;
> -	int ttarget;
>  	int tjmax;
>  	unsigned long last_updated;
>  	unsigned int cpu;
> @@ -303,6 +302,30 @@ static int get_tjmax(struct temp_data *tdata, struct device *dev)
>  	return tdata->tjmax;
>  }
>  
> +static int get_ttarget(struct temp_data *tdata, struct device *dev)
> +{
> +	u32 eax, edx;
> +	int tjmax, ttarget_offset, ret;
> +
> +	/*
> +	 * ttarget is valid only if tjmax can be retrieved from
> +	 * MSR_IA32_TEMPERATURE_TARGET
> +	 */
> +	if (tdata->tjmax)
> +		return -ENODEV;
> +
> +	ret = rdmsr_safe_on_cpu(tdata->cpu, MSR_IA32_TEMPERATURE_TARGET, &eax, &edx);
> +	if (ret)
> +		return ret;
> +
> +	tjmax = (eax >> 16) & 0xff;
> +
> +	/* Read the still undocumented bits 8:15 of IA32_TEMPERATURE_TARGET. */
> +	ttarget_offset = (eax >> 8) & 0xff;
> +
> +	return (tjmax - ttarget_offset) * 1000;
> +}
> +
>  /* Keep track of how many zone pointers we allocated in init() */
>  static int max_zones __read_mostly;
>  /* Array of zone pointers. Serialized by cpu hotplug lock */
> @@ -356,8 +379,16 @@ static ssize_t show_ttarget(struct device *dev,
>  {
>  	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>  	struct platform_data *pdata = dev_get_drvdata(dev);
> +	struct temp_data *tdata = pdata->core_data[attr->index];
> +	int ttarget;
>  
> -	return sprintf(buf, "%d\n", pdata->core_data[attr->index]->ttarget);
> +	mutex_lock(&tdata->update_lock);
> +	ttarget = get_ttarget(tdata, dev);
> +	mutex_unlock(&tdata->update_lock);
> +
> +	if (ttarget < 0)
> +		return ttarget;
> +	return sprintf(buf, "%d\n", ttarget);
>  }
>  
>  static ssize_t show_temp(struct device *dev,
> @@ -466,7 +497,7 @@ static int create_core_data(struct platform_device *pdev, unsigned int cpu,
>  	struct platform_data *pdata = platform_get_drvdata(pdev);
>  	struct cpuinfo_x86 *c = &cpu_data(cpu);
>  	u32 eax, edx;
> -	int err, index, attr_no, tjmax;
> +	int err, index, attr_no;
>  
>  	/*
>  	 * Find attr number for sysfs:
> @@ -500,23 +531,17 @@ static int create_core_data(struct platform_device *pdev, unsigned int cpu,
>  	if (err)
>  		goto exit_free;
>  
> -	/* We can access status register. Get Critical Temperature */
> -	tjmax = get_tjmax(tdata, &pdev->dev);
> +	/* Make sure tdata->tjmax is a valid indicator for dynamic/static tjmax */
> +	get_tjmax(tdata, &pdev->dev);
>  
>  	/*
> -	 * Read the still undocumented bits 8:15 of IA32_TEMPERATURE_TARGET.
> -	 * The target temperature is available on older CPUs but not in this
> -	 * register. Atoms don't have the register at all.
> +	 * The target temperature is available on older CPUs but not in the
> +	 * MSR_IA32_TEMPERATURE_TARGET register. Atoms don't have the register
> +	 * at all.
>  	 */
> -	if (c->x86_model > 0xe && c->x86_model != 0x1c) {
> -		err = rdmsr_safe_on_cpu(cpu, MSR_IA32_TEMPERATURE_TARGET,
> -					&eax, &edx);
> -		if (!err) {
> -			tdata->ttarget
> -			  = tjmax - ((eax >> 8) & 0xff) * 1000;
> +	if (c->x86_model > 0xe && c->x86_model != 0x1c)
> +		if (get_ttarget(tdata, &pdev->dev) >= 0)
>  			tdata->attr_size++;
> -		}
> -	}
>  
>  	pdata->core_data[attr_no] = tdata;
>  
