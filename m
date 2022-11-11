Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AF74C433FE
	for <linux-hwmon@archiver.kernel.org>; Fri, 11 Nov 2022 21:14:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233750AbiKKVOh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 11 Nov 2022 16:14:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231911AbiKKVOh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 11 Nov 2022 16:14:37 -0500
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41C2E6EB72
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Nov 2022 13:14:36 -0800 (PST)
Received: by mail-qt1-x82d.google.com with SMTP id jr19so3379044qtb.7
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Nov 2022 13:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/0wntlKhpymLohyiSQtUWQoSGtbyU58tp9wuLP3590=;
        b=Ji6yi/YuEo5QPIRs6+YqxBBuVI0Kvy8/8kqDJNPGGMcPJEBNGagSWNVPSCwmx+216u
         0017g12k5q1CP6t1dhMucD7lmCAJSDgTrWYXfp+N4T7nvynDtvAN63OBgRamVgfvgauG
         iVg26xnU7ojshwLytH2lc6Vv0NOMzvQQaBEd88tvmuBa8Dc6JjDQUnhMjx7jpqnyXp1A
         Rm5HGKxyk64u92pvpEMMa8PB3mak9dFeuUX8n2lXIOssX/2kvcTw0E4+4vzLKAxbl4hD
         FWLIYWtWKiwMXBO5M9zcyal+wtFpPEfMpVwwPSD9iTjBj+WHmeyVXcqCm9yqQoIYnjFC
         ha9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/0wntlKhpymLohyiSQtUWQoSGtbyU58tp9wuLP3590=;
        b=mAmZ0wrRhYvMlUQgv+Zq8VwTRhcMb2Uz/vpQRWgCk/9ljiPcpD06tJYXlat+r7JBqq
         OBKSUITo81Nmm1xWfkIn+yQ18XtSnJvl+SDEAs0+fON9TbuVAyQug5mNE0882/vBQURo
         mtzzkvIgUR8um6SnWEDtjI8Vo32QmjzBmBJXsGIf+dKv8ORs3ivQkE/1mC0p4l1Sondl
         EKtpu/4FNJDIa1BMj18ebhPtzNrsUVlKLmc7zrPF5LtjeBxOPIrlr5dliw9PcMhgaa+Y
         RIY8nIIFetfbz9djpiFuVAvnhXMPMdwWUFvz6LALc2G9RP7iau8sObcINQjQz7Vk2Don
         awrQ==
X-Gm-Message-State: ANoB5pmRyKj3GAS7YNUpNpX+n9GzKYiS1hWGiGQtbtIXckzfolek/vur
        oaiw//R/08/3hsl3G88vF18=
X-Google-Smtp-Source: AA0mqf5vxqxDoh/PuU0Of4T2IHQADeZcdFCzmnR81huR0pUjdTZDzevrC/pFlNN6Ngxijv+Qqd290w==
X-Received: by 2002:a05:622a:8cc:b0:3a5:5987:42c6 with SMTP id i12-20020a05622a08cc00b003a5598742c6mr3073009qte.147.1668201275366;
        Fri, 11 Nov 2022 13:14:35 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id s19-20020a05620a0bd300b006bb8b5b79efsm2035305qki.129.2022.11.11.13.14.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 13:14:34 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Fri, 11 Nov 2022 13:14:32 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Zhang Rui <rui.zhang@intel.com>
Cc:     jdelvare@suse.com, fenghua.yu@intel.com,
        linux-hwmon@vger.kernel.org, srinivas.pandruvada@linux.intel.com
Subject: Re: [PATCH 1/3] hwmon (coretemp): Remove obsolete temp_data->valid
Message-ID: <20221111211432.GA1059403@roeck-us.net>
References: <20221108075051.5139-1-rui.zhang@intel.com>
 <20221108075051.5139-2-rui.zhang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221108075051.5139-2-rui.zhang@intel.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Nov 08, 2022 at 03:50:49PM +0800, Zhang Rui wrote:
> Checking for the valid bit of IA32_THERM_STATUS is removed in commit
> bf6ea084ebb5 ("hwmon: (coretemp) Do not return -EAGAIN for low
> temperatures"), and temp_data->valid is set and never cleared when the
> temperature has been read once.
> 
> Remove the obsolete temp_data->valid field.
> 
> Signed-off-by: Zhang Rui <rui.zhang@intel.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/coretemp.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
> index 8bf32c6c85d9..ec35ada68455 100644
> --- a/drivers/hwmon/coretemp.c
> +++ b/drivers/hwmon/coretemp.c
> @@ -64,7 +64,6 @@ MODULE_PARM_DESC(tjmax, "TjMax value in degrees Celsius");
>   * @attr_size:  Total number of pre-core attrs displayed in the sysfs.
>   * @is_pkg_data: If this is 1, the temp_data holds pkgtemp data.
>   *		Otherwise, temp_data holds coretemp data.
> - * @valid: If this is 1, the current temperature is valid.
>   */
>  struct temp_data {
>  	int temp;
> @@ -76,7 +75,6 @@ struct temp_data {
>  	u32 status_reg;
>  	int attr_size;
>  	bool is_pkg_data;
> -	bool valid;
>  	struct sensor_device_attribute sd_attrs[TOTAL_ATTRS];
>  	char attr_name[TOTAL_ATTRS][CORETEMP_NAME_LENGTH];
>  	struct attribute *attrs[TOTAL_ATTRS + 1];
> @@ -157,7 +155,7 @@ static ssize_t show_temp(struct device *dev,
>  	mutex_lock(&tdata->update_lock);
>  
>  	/* Check whether the time interval has elapsed */
> -	if (!tdata->valid || time_after(jiffies, tdata->last_updated + HZ)) {
> +	if (time_after(jiffies, tdata->last_updated + HZ)) {
>  		rdmsr_on_cpu(tdata->cpu, tdata->status_reg, &eax, &edx);
>  		/*
>  		 * Ignore the valid bit. In all observed cases the register
> @@ -166,7 +164,6 @@ static ssize_t show_temp(struct device *dev,
>  		 * really help at all.
>  		 */
>  		tdata->temp = tdata->tjmax - ((eax >> 16) & 0x7f) * 1000;
> -		tdata->valid = true;
>  		tdata->last_updated = jiffies;
>  	}
>  
