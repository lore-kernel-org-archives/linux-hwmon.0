Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91320C4332F
	for <linux-hwmon@archiver.kernel.org>; Mon, 14 Nov 2022 23:24:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231799AbiKNXYO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 14 Nov 2022 18:24:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230415AbiKNXYO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 14 Nov 2022 18:24:14 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EA3AFD6
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Nov 2022 15:24:13 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id b62so11663525pgc.0
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Nov 2022 15:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nh3G3z+BhF8UGEbTW5LerS+ETzlyDVOhPDJtz9mixvQ=;
        b=NllIm7TknG3XF3ZKLJUM9SE0sH478DQDQmtchd3KoBNog0z3FSa78i9Uph2gYzkvNp
         OczfStV+GZ/axF6rmmaV1tPsPKxzkFi6Sxc22A9I9rW3mRA6Qk0MpJ5YkDRZnFvWXNoy
         X1bW4zBTnR6hcMKrb7ktIQ8Ts4e2PLEywVYHXQ3zOf4s+v3gZXehQCRr+yltBOV55vdO
         51vqNq0kaKdH38fPDukX8F1wRNsyg/5zYqHK5J7EKmcATrRqdksge0mpvsdm8pWBhLNA
         Zai3tJIlww/w5pYg94lFly4EQPozoC4GYz7Qaa66Ai7tjymgm5c2/IgFzWCRpFRi86Gc
         lofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nh3G3z+BhF8UGEbTW5LerS+ETzlyDVOhPDJtz9mixvQ=;
        b=myQpVapzD1mcVXucFApbaHVAnfuJFfbWmdi1B0g/OwnOpaL6cXpF66go770WPduiA3
         Fw/Pk2ODxQQJX3YRJhfwVEFxUPWNCUSvOV/cbJ8/9Pveum/1q4GBP27sSwlvZaHcMbwA
         yYy7h++f2vrf1kD3zd631cd46Q1m9bWgSnycQCNz1ylZnB/cga0xL79h13U1fb/rynVO
         GB+bKuH+ftiZf1O8etEjSlzC5ASvF+Rv1vzzWimAi6tcfw2h52/QybhA75G3psb1wXgh
         ZmsFIvLpNKNGoPjcxPN65cYwr1PgU65/F1w6+f/9dYqX1BX3LKVGAblkgsiwcrj4F2w4
         2cfw==
X-Gm-Message-State: ANoB5plq6yi/S6bdXm3qzQ+V2hDT8e7obbx6PM6HTJo9ENJWpPJPO5JY
        EfXsDR2+r2pL3lxD1/zZPks=
X-Google-Smtp-Source: AA0mqf4N040jlOA62QRoc9VJKeH8AaCBf+m3q+U5ImcBe3RR1IwWsvKUFFjIOaZ0hcxKuF7rLHwSgg==
X-Received: by 2002:a63:1a59:0:b0:473:c377:b82 with SMTP id a25-20020a631a59000000b00473c3770b82mr14118406pgm.113.1668468252795;
        Mon, 14 Nov 2022 15:24:12 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i6-20020a17090332c600b0017a09ebd1e2sm8226478plr.237.2022.11.14.15.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Nov 2022 15:24:11 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 14 Nov 2022 15:24:10 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Zhang Rui <rui.zhang@intel.com>
Cc:     jdelvare@suse.com, fenghua.yu@intel.com,
        linux-hwmon@vger.kernel.org, srinivas.pandruvada@linux.intel.com
Subject: Re: [PATCH V2 2/3] hwmon (coretemp): Add support for dynamic tjmax
Message-ID: <20221114232410.GA2290176@roeck-us.net>
References: <20221113153145.32696-1-rui.zhang@intel.com>
 <20221113153145.32696-3-rui.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221113153145.32696-3-rui.zhang@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Nov 13, 2022 at 11:31:44PM +0800, Zhang Rui wrote:
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

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/coretemp.c | 46 +++++++++++++++++++++++++++-------------
>  1 file changed, 31 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
> index 50b640bfa504..573ac8c5ed42 100644
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
> @@ -256,20 +258,25 @@ static bool cpu_has_tjmax(struct cpuinfo_x86 *c)
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
> @@ -285,14 +292,15 @@ static int get_tjmax(struct cpuinfo_x86 *c, u32 id, struct device *dev)
>  	if (force_tjmax) {
>  		dev_notice(dev, "TjMax forced to %d degrees C by user\n",
>  			   force_tjmax);
> -		return force_tjmax * 1000;
> +		tdata->tjmax = force_tjmax * 1000;
> +	} else {
> +		/*
> +		 * An assumption is made for early CPUs and unreadable MSR.
> +		 * NOTE: the calculated value may not be correct.
> +		 */
> +		tdata->tjmax = adjust_tjmax(c, tdata->cpu, dev);
>  	}
> -
> -	/*
> -	 * An assumption is made for early CPUs and unreadable MSR.
> -	 * NOTE: the calculated value may not be correct.
> -	 */
> -	return adjust_tjmax(c, id, dev);
> +	return tdata->tjmax;
>  }
>  
>  /* Keep track of how many zone pointers we allocated in init() */
> @@ -333,8 +341,14 @@ static ssize_t show_tjmax(struct device *dev,
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
> @@ -353,9 +367,11 @@ static ssize_t show_temp(struct device *dev,
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
> @@ -365,7 +381,7 @@ static ssize_t show_temp(struct device *dev,
>  		 * Return it instead of reporting an error which doesn't
>  		 * really help at all.
>  		 */
> -		tdata->temp = tdata->tjmax - ((eax >> 16) & 0x7f) * 1000;
> +		tdata->temp = tjmax - ((eax >> 16) & 0x7f) * 1000;
>  		tdata->last_updated = jiffies;
>  	}
>  
> @@ -450,7 +466,7 @@ static int create_core_data(struct platform_device *pdev, unsigned int cpu,
>  	struct platform_data *pdata = platform_get_drvdata(pdev);
>  	struct cpuinfo_x86 *c = &cpu_data(cpu);
>  	u32 eax, edx;
> -	int err, index, attr_no;
> +	int err, index, attr_no, tjmax;
>  
>  	/*
>  	 * Find attr number for sysfs:
> @@ -485,7 +501,7 @@ static int create_core_data(struct platform_device *pdev, unsigned int cpu,
>  		goto exit_free;
>  
>  	/* We can access status register. Get Critical Temperature */
> -	tdata->tjmax = get_tjmax(c, cpu, &pdev->dev);
> +	tjmax = get_tjmax(tdata, &pdev->dev);
>  
>  	/*
>  	 * Read the still undocumented bits 8:15 of IA32_TEMPERATURE_TARGET.
> @@ -497,7 +513,7 @@ static int create_core_data(struct platform_device *pdev, unsigned int cpu,
>  					&eax, &edx);
>  		if (!err) {
>  			tdata->ttarget
> -			  = tdata->tjmax - ((eax >> 8) & 0xff) * 1000;
> +			  = tjmax - ((eax >> 8) & 0xff) * 1000;
>  			tdata->attr_size++;
>  		}
>  	}
