Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3B44C433FE
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Nov 2022 21:28:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230114AbiKKV2N (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Nov 2022 16:28:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbiKKV2M (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Nov 2022 16:28:12 -0500
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D0681A22F
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Nov 2022 13:28:11 -0800 (PST)
Received: by mail-qt1-x82e.google.com with SMTP id c15so3396664qtw.8
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Nov 2022 13:28:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F66wR76zLzwIYxt9zAgc6pbW24I9rKsZKNl+M9RVPA4=;
        b=nivb5kTnukD9hAPYXAyPGyc5Ta5w6xgqDE+xZ2+WO/CeBdhKjbFuJMrmW/wK2h4/nB
         ROWXf/PFQ8np8p1thZe8goY3ApthN5M7crMs8VUtQyRUDZQi3vpW66PA79jVLlpCeRDr
         OHsCO9yNl3GMedq7IKgf17RAeLlT53GU71NyXSx9hFLGg6ckQ4f0zc6fsa7bokCiAJV4
         Rtwgn4QQlo9eV4j068rZaSB8vZYDyZIscN0Wa9unGYCdXJL1p0bE+Pe2+8WyGoQWNzaC
         DW4G21ZGg5m2cIuJqZ2tjP+4V4S3FhuFFIGZazddHcmkFSZ4g/ws3mWVCRnOj/B9mp6V
         5OTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F66wR76zLzwIYxt9zAgc6pbW24I9rKsZKNl+M9RVPA4=;
        b=5cNaThep+6iGuVXBr6KGQvL7I+KIB26VO7sxZFMMtFosbjlWtg836DJ9io6Em77qPA
         2YRf0nwf/rXJgXdWvLn5/EYHEaNd9kAmLaM4Fup+7STZJZiR72CG4IcpPSRkg9TQa39F
         NS/MupM0xpEHdGqxRrWPECIIjJ2DhV8ieArj5UnTYQ2LlIE7Ro9ZCdJCBySXbWhIkrsK
         v74WxMeYFB8qtRdcDQGF4PW/ONTBkax6a3CT1as9pVudZ2XDrAQzM0kkSjgAIVIEJr9e
         GjdgPlLRnu+f2yw7b8R/gJKeJA3scnFm6i2J1rlTkR9+cc9RfNs8/9cih7m+wxNDfx+U
         E0tg==
X-Gm-Message-State: ANoB5plZEn2lsu325giuflLmOHW+9T+7VP8v8PiDdqtGAD7+ssZ2vyLz
        asP4MZ7HoK6Q0uLNepSbMU9D07ZHRXY=
X-Google-Smtp-Source: AA0mqf7BxisKikP0L1YLHndmeQliwcXKgBJMYF1vhg6P+stNYBAacFO6me0IM4WFlG6L5nWqZHFLVw==
X-Received: by 2002:ac8:6f15:0:b0:3a5:78a9:7a2d with SMTP id bs21-20020ac86f15000000b003a578a97a2dmr3162595qtb.666.1668202007901;
        Fri, 11 Nov 2022 13:26:47 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j184-20020a3755c1000000b006f9ddaaf01esm1983202qkb.102.2022.11.11.13.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 13:26:47 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 11 Nov 2022 13:26:45 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Zhang Rui <rui.zhang@intel.com>
Cc:     jdelvare@suse.com, fenghua.yu@intel.com,
        linux-hwmon@vger.kernel.org, srinivas.pandruvada@linux.intel.com
Subject: Re: [PATCH 2/3] hwmon (coretemp): Add support for dynamic tjmax
Message-ID: <20221111212645.GA1059539@roeck-us.net>
References: <20221108075051.5139-1-rui.zhang@intel.com>
 <20221108075051.5139-3-rui.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108075051.5139-3-rui.zhang@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Nov 08, 2022 at 03:50:50PM +0800, Zhang Rui wrote:
> Tjmax value retrieved from MSR_IA32_TEMPERATURE_TARGET can be changed at
> runtime when the Intel SST-PP (Intel Speed Select Technology -
> Performance Profile) level is changed.
> 
> Improve the code to always use updated tjmax when it can be retrieved
> from MSR_IA32_TEMPERATURE_TARGET.
> 
> When tjmax can not be retrieved from MSR_IA32_TEMPERATURE_TARGET, still
> follow the previous logic and always use a static tjmax value.
> 
> Signed-off-by: Zhang Rui <rui.zhang@intel.com>
> ---
>  drivers/hwmon/coretemp.c | 40 ++++++++++++++++++++++++++++++----------
>  1 file changed, 30 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
> index ec35ada68455..5292f7844860 100644
> --- a/drivers/hwmon/coretemp.c
> +++ b/drivers/hwmon/coretemp.c
> @@ -55,6 +55,8 @@ MODULE_PARM_DESC(tjmax, "TjMax value in degrees Celsius");
>  
>  /*
>   * Per-Core Temperature Data
> + * @tjmax: The static tjmax value when tjmax cannot be retrieved from
> + *		IA32_TEMPERATURE_TARGET MSR.
>   * @last_updated: The time when the current temperature value was updated
>   *		earlier (in jiffies).
>   * @cpu_core_id: The CPU Core from which temperature values should be read
> @@ -93,6 +95,8 @@ struct platform_data {
>  	struct device_attribute name_attr;
>  };
>  
> +static int get_tjmax(struct temp_data *tdata, struct device *dev);
> +

Please rearrange the code to avoid the forward declaration.

>  /* Keep track of how many zone pointers we allocated in init() */
>  static int max_zones __read_mostly;
>  /* Array of zone pointers. Serialized by cpu hotplug lock */
> @@ -131,8 +135,14 @@ static ssize_t show_tjmax(struct device *dev,
>  {
>  	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>  	struct platform_data *pdata = dev_get_drvdata(dev);
> +	struct temp_data *tdata = pdata->core_data[attr->index];
> +	int tjmax;
> +
> +	mutex_lock(&tdata->update_lock);
> +	tjmax = get_tjmax(tdata, dev);
> +	mutex_unlock(&tdata->update_lock);
>  
> -	return sprintf(buf, "%d\n", pdata->core_data[attr->index]->tjmax);
> +	return sprintf(buf, "%d\n", tjmax);
>  }
>  
>  static ssize_t show_ttarget(struct device *dev,
> @@ -151,9 +161,11 @@ static ssize_t show_temp(struct device *dev,
>  	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>  	struct platform_data *pdata = dev_get_drvdata(dev);
>  	struct temp_data *tdata = pdata->core_data[attr->index];
> +	int tjmax;
>  
>  	mutex_lock(&tdata->update_lock);
>  
> +	tjmax = get_tjmax(tdata, dev);
>  	/* Check whether the time interval has elapsed */
>  	if (time_after(jiffies, tdata->last_updated + HZ)) {
>  		rdmsr_on_cpu(tdata->cpu, tdata->status_reg, &eax, &edx);
> @@ -163,7 +175,7 @@ static ssize_t show_temp(struct device *dev,
>  		 * Return it instead of reporting an error which doesn't
>  		 * really help at all.
>  		 */
> -		tdata->temp = tdata->tjmax - ((eax >> 16) & 0x7f) * 1000;
> +		tdata->temp = tjmax - ((eax >> 16) & 0x7f) * 1000;
>  		tdata->last_updated = jiffies;
>  	}
>  
> @@ -334,20 +346,25 @@ static bool cpu_has_tjmax(struct cpuinfo_x86 *c)
>  	       model != 0x36;
>  }
>  
> -static int get_tjmax(struct cpuinfo_x86 *c, u32 id, struct device *dev)
> +static int get_tjmax(struct temp_data *tdata, struct device *dev)
>  {
> +	struct cpuinfo_x86 *c = &cpu_data(tdata->cpu);
>  	int err;
>  	u32 eax, edx;
>  	u32 val;
>  
> +	/* use static tjmax once it is set */
> +	if (tdata->tjmax)
> +		return tdata->tjmax;
> +
>  	/*
>  	 * A new feature of current Intel(R) processors, the
>  	 * IA32_TEMPERATURE_TARGET contains the TjMax value
>  	 */
> -	err = rdmsr_safe_on_cpu(id, MSR_IA32_TEMPERATURE_TARGET, &eax, &edx);
> +	err = rdmsr_safe_on_cpu(tdata->cpu, MSR_IA32_TEMPERATURE_TARGET, &eax, &edx);
>  	if (err) {
>  		if (cpu_has_tjmax(c))
> -			dev_warn(dev, "Unable to read TjMax from CPU %u\n", id);
> +			dev_warn(dev, "Unable to read TjMax from CPU %u\n", tdata->cpu);
>  	} else {
>  		val = (eax >> 16) & 0xff;
>  		/*
> @@ -363,14 +380,17 @@ static int get_tjmax(struct cpuinfo_x86 *c, u32 id, struct device *dev)
>  	if (force_tjmax) {
>  		dev_notice(dev, "TjMax forced to %d degrees C by user\n",
>  			   force_tjmax);
> -		return force_tjmax * 1000;
> +		tdata->tjmax = force_tjmax * 1000;
> +		goto end;

This added goto doesn't add any value and is just a manual replacement
for if/else. Please drop and return immediately, or use if/else.

	if (force_tjmax) {
		...
		tdata->tjmax = force_tjmax * 1000;
	} else {
		/*
		 * An assumption is made for early CPUs and unreadable MSR.
		 * NOTE: the calculated value may not be correct.
		 */
		tdata->tjmax = adjust_tjmax(c, tdata->cpu, dev);
	}
	return tdata->tjmax;

Thanks,
Guenter

>  	}
>  
>  	/*
>  	 * An assumption is made for early CPUs and unreadable MSR.
>  	 * NOTE: the calculated value may not be correct.
>  	 */
> -	return adjust_tjmax(c, id, dev);
> +	tdata->tjmax = adjust_tjmax(c, tdata->cpu, dev);
> +end:
> +	return tdata->tjmax;
>  }
>  
>  static int create_core_attrs(struct temp_data *tdata, struct device *dev,
> @@ -450,7 +470,7 @@ static int create_core_data(struct platform_device *pdev, unsigned int cpu,
>  	struct platform_data *pdata = platform_get_drvdata(pdev);
>  	struct cpuinfo_x86 *c = &cpu_data(cpu);
>  	u32 eax, edx;
> -	int err, index, attr_no;
> +	int err, index, attr_no, tjmax;
>  
>  	/*
>  	 * Find attr number for sysfs:
> @@ -485,7 +505,7 @@ static int create_core_data(struct platform_device *pdev, unsigned int cpu,
>  		goto exit_free;
>  
>  	/* We can access status register. Get Critical Temperature */
> -	tdata->tjmax = get_tjmax(c, cpu, &pdev->dev);
> +	tjmax = get_tjmax(tdata, &pdev->dev);
>  
>  	/*
>  	 * Read the still undocumented bits 8:15 of IA32_TEMPERATURE_TARGET.
> @@ -497,7 +517,7 @@ static int create_core_data(struct platform_device *pdev, unsigned int cpu,
>  					&eax, &edx);
>  		if (!err) {
>  			tdata->ttarget
> -			  = tdata->tjmax - ((eax >> 8) & 0xff) * 1000;
> +			  = tjmax - ((eax >> 8) & 0xff) * 1000;
>  			tdata->attr_size++;
>  		}
>  	}
