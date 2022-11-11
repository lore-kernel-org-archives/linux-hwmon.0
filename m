Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13376C4332F
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Nov 2022 21:34:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233363AbiKKVeH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Nov 2022 16:34:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232825AbiKKVeG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Nov 2022 16:34:06 -0500
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CB246417
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Nov 2022 13:34:05 -0800 (PST)
Received: by mail-qt1-x82c.google.com with SMTP id h21so3427047qtu.2
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Nov 2022 13:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/7/PI412/3zEOnKsPmK9aqXPT3MG+lTX90ML1rH4VRo=;
        b=DPX9R6yVp4vRkimb3UNPQD7dwHQ1fj2hlRsKCl2uR9fEWLLtDRNtl+BNPGqxnJnshp
         aO+2IeUvB4dTINC6a4Dhx5+VSRRezuOSIDN+HMKGrcQO7X3y9Uai2W8lWpdt7elMTtaJ
         K6Hj5cTbRzwjGqRYQEr1VBCiFxUoNFSu7PH6juQDKGShxWmtqWd7AnN3HnC9jhH3Y811
         fvkdvy8C60CqwLjtrWjZLr1pQY2qGpjuKxkjtsSKWifOi478JpOCU60zCxIL90NyTz4V
         NgO/FlOHn+nxeTyKw5VjRG7Ix7zCljQWV+xmS0S1zpWiO0MebMm/nlkVCexFnbaqM62B
         dtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/7/PI412/3zEOnKsPmK9aqXPT3MG+lTX90ML1rH4VRo=;
        b=KiWOmwbx9PfIcLuVF0hzlGBa8zt2OIlZAFqOX1kBF55Zavtm9qf/hO1dhklcVc8EyE
         GZwwoBTVbmR/7p18zZ+YONBt333+2+m31lrlc/IN+LTC/OaSHVB7dQiWqYiA6u8mjqQ1
         N69pdh2q/Q3Uauu8KT/MM20zw8Pq4ONKz1o7FnfHZZ27OSvNjoFG3vUPxgresKc9HrLi
         GY4m3viLoDRf3oDld1r77aX0xQ5fYbon9owdOr26CgPGJ6+MwLlY+Yy2+8uBtrhX4rG+
         97qTYsfHcqsSA0sk83e6FMFnPqL7Nj88WOWCV6arqrejbbL6eKTQ3FQyf3VYGV0+FrYP
         5tGQ==
X-Gm-Message-State: ANoB5pkFYZCyHrjL/mbhKwWycM/N5HgtBU5DHXv/MSyYLZfNvxNCSDBh
        tLkCRUmkT4gMkmqBAGcEtA8=
X-Google-Smtp-Source: AA0mqf4HX6t+XxkPzViYVjR35BGPbcha/S7zOi7quiAyj9oEzF4jlAEys5BpZz+u9aY0AUDXQc3r8A==
X-Received: by 2002:ac8:4d0a:0:b0:3a5:9dc:d83f with SMTP id w10-20020ac84d0a000000b003a509dcd83fmr3190728qtv.28.1668202444378;
        Fri, 11 Nov 2022 13:34:04 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s1-20020a05620a0bc100b006faaf6dc55asm2133784qki.22.2022.11.11.13.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 13:34:03 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 11 Nov 2022 13:34:02 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Zhang Rui <rui.zhang@intel.com>
Cc:     jdelvare@suse.com, fenghua.yu@intel.com,
        linux-hwmon@vger.kernel.org, srinivas.pandruvada@linux.intel.com
Subject: Re: [PATCH 3/3] hwmon (coretemp): Add support for dynamic ttarget
Message-ID: <20221111213402.GA1059716@roeck-us.net>
References: <20221108075051.5139-1-rui.zhang@intel.com>
 <20221108075051.5139-4-rui.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108075051.5139-4-rui.zhang@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Nov 08, 2022 at 03:50:51PM +0800, Zhang Rui wrote:
> Tjmax value retrieved from MSR_IA32_TEMPERATURE_TARGET can be changed at
> runtime when the Intel SST-PP (Intel Speed Select Technology -
> Performance Profile) level is changed. As a result, the ttarget value
> also becomes dyamic.
> 
> Improve the code to always get updated ttarget value.
> 
> Signed-off-by: Zhang Rui <rui.zhang@intel.com>
> ---
>  drivers/hwmon/coretemp.c | 69 ++++++++++++++++++++++++++++------------
>  1 file changed, 48 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
> index 5292f7844860..d6084600862f 100644
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
> @@ -96,6 +95,7 @@ struct platform_data {
>  };
>  
>  static int get_tjmax(struct temp_data *tdata, struct device *dev);
> +static int get_ttarget(struct temp_data *tdata, struct device *dev);

Please rearrange to code to avoid forward declarations.

>  
>  /* Keep track of how many zone pointers we allocated in init() */
>  static int max_zones __read_mostly;
> @@ -150,8 +150,17 @@ static ssize_t show_ttarget(struct device *dev,
>  {
>  	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>  	struct platform_data *pdata = dev_get_drvdata(dev);
> +	struct temp_data *tdata = pdata->core_data[attr->index];
> +	int ttarget;
> +
> +	mutex_lock(&tdata->update_lock);

Is that mutex really necessary ? I don't immediately see the need
for it.

> +	ttarget = get_ttarget(tdata, dev);
> +	mutex_unlock(&tdata->update_lock);
>  
> -	return sprintf(buf, "%d\n", pdata->core_data[attr->index]->ttarget);
> +	if (ttarget >= 0)
> +		return sprintf(buf, "%d\n", ttarget);
> +	else
> +		return ttarget;

else after return is unnecessary. Much better would be

	if (ttarget < 0)
		return ttarget;
	return sprintf(buf, "%d\n", ttarget);

>  }
>  
>  static ssize_t show_temp(struct device *dev,
> @@ -393,6 +402,38 @@ static int get_tjmax(struct temp_data *tdata, struct device *dev)
>  	return tdata->tjmax;
>  }
>  
> +static int get_ttarget(struct temp_data *tdata, struct device *dev)
> +{
> +	u32 eax, edx;
> +	struct cpuinfo_x86 *c = &cpu_data(tdata->cpu);
> +	int tj_max, ttarget_offset, ret;

Please use tjmax for consistency.

> +
> +	/*
> +	 * ttarget is valid only if tjmax can be retrieved from
> +	 * MSR_IA32_TEMPERATURE_TARGET
> +	 */
> +	if (tdata->tjmax)
> +		return -ENODEV;
> +
> +	if (c->x86_model <= 0xe || c->x86_model == 0x1c)
> +		return -ENODEV;
> +

Does it really make sense to re-check this each time the target temperature
is read ?

> +	/*
> +	 * Read the still undocumented bits 8:15 of IA32_TEMPERATURE_TARGET.
> +	 * The target temperature is available on older CPUs but not in this
> +	 * register. Atoms don't have the register at all.
> +	 */
> +	ret = rdmsr_safe_on_cpu(tdata->cpu, MSR_IA32_TEMPERATURE_TARGET,
> +					&eax, &edx);

Please watch multi-line alignment.

> +	if (ret)
> +		return ret;
> +
> +	tj_max = (eax >> 16) & 0xff;
> +	ttarget_offset = (eax >> 8) & 0xff;
> +
> +	return (tj_max - ttarget_offset) * 1000;
> +}
> +
>  static int create_core_attrs(struct temp_data *tdata, struct device *dev,
>  			     int attr_no)
>  {
> @@ -468,9 +509,8 @@ static int create_core_data(struct platform_device *pdev, unsigned int cpu,
>  {
>  	struct temp_data *tdata;
>  	struct platform_data *pdata = platform_get_drvdata(pdev);
> -	struct cpuinfo_x86 *c = &cpu_data(cpu);
>  	u32 eax, edx;
> -	int err, index, attr_no, tjmax;
> +	int err, index, attr_no;
>  
>  	/*
>  	 * Find attr number for sysfs:
> @@ -504,23 +544,10 @@ static int create_core_data(struct platform_device *pdev, unsigned int cpu,
>  	if (err)
>  		goto exit_free;
>  
> -	/* We can access status register. Get Critical Temperature */
> -	tjmax = get_tjmax(tdata, &pdev->dev);
> -
> -	/*
> -	 * Read the still undocumented bits 8:15 of IA32_TEMPERATURE_TARGET.
> -	 * The target temperature is available on older CPUs but not in this
> -	 * register. Atoms don't have the register at all.
> -	 */
> -	if (c->x86_model > 0xe && c->x86_model != 0x1c) {
> -		err = rdmsr_safe_on_cpu(cpu, MSR_IA32_TEMPERATURE_TARGET,
> -					&eax, &edx);
> -		if (!err) {
> -			tdata->ttarget
> -			  = tjmax - ((eax >> 8) & 0xff) * 1000;
> -			tdata->attr_size++;
> -		}
> -	}
> +	/* Make sure tdata->tjmax is a valid indicator for dynamic/static tjmax */
> +	get_tjmax(tdata, &pdev->dev);
> +	if (get_ttarget(tdata, &pdev->dev) >= 0)
> +		tdata->attr_size++;
>  
>  	pdata->core_data[attr_no] = tdata;
>  
