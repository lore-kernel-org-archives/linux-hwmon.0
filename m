Return-Path: <SRS0=sw0Y=ZV=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE4CFC432C3
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 Nov 2019 18:39:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8CE152158A
	for <linux-hwmon@archiver.kernel.org>; Fri, 29 Nov 2019 18:39:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTlvz765"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbfK2Sjf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 29 Nov 2019 13:39:35 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:34649 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726980AbfK2Sjf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 29 Nov 2019 13:39:35 -0500
Received: by mail-ot1-f65.google.com with SMTP id w11so25636468ote.1
        for <linux-hwmon@vger.kernel.org>; Fri, 29 Nov 2019 10:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YNKLnMxHAfhNyGbQSiklsbSPWI5eDpFicD2ZopFbWjE=;
        b=OTlvz765EQbGJMniKdxQBQN3pLsG5afp0JREdRTVcyXfqZc2NL+P6/PuO6VFsKz2At
         w/lE1ZNLsm7iUrbLb0oKhlmcZr9BEp+txi0CrMj9mHjrH5LXTrTJnFmnTowrSdSoPLJF
         il3Ldo2q/USSxHwq9/Tt/bLz+3+dNwRejgqf+5+I/gvvJsMVOOqTu6Xu2BmTsxSrv7BT
         bzJQbfA8NcF4iZvrRZVFyJ0vwwBV3Q1RHJljNUqcdpiabEkYTn+1NH7Y8nExu+24hLGU
         bHLD0b4gJ2uIeR6VfFpio/LTCEgBL5vae3ItfKCPT2Gg+qB1qxKmfiSZ8zA5KVTr+zpt
         OLcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=YNKLnMxHAfhNyGbQSiklsbSPWI5eDpFicD2ZopFbWjE=;
        b=LzTGZPloFauarIEWMG0t+hSyUEciqR7p9oKv541fRQXLWWtSWbs5gTjArtQckjJpyd
         IOrbcQeT6cP+2Zub6VtgkTT5fMs8eHFh8ztX53AWa5q1+TsMlMWc547p/NoeSZJ+Deo/
         9Gb24FmlviRhlUpPes1vj9le7RI8NZetbo7ZNjwMOKRaasTtPwTECrYFu5XQg8EHkPVb
         dDf9s75PwKTFroGdXcRAo/jfTN9Vjuv+aR7ezAKGVQyftQ4zFVBzngkoSNuXXDdpUlj2
         MVcCgR+UG9eTA6Q4D+4D6tExn2Ak9CGJHGgmS6pEl60elLWwZkgfF4SEOHnvf1PMxDJ5
         2oBA==
X-Gm-Message-State: APjAAAXwuZU/vb97IHaxrmj9HqholWAS76mmLp7kyAfPASscqZInLfr5
        7zkjtjIgpoFvCozb764Z4mQ=
X-Google-Smtp-Source: APXvYqxSlcTmSGNklwEz8lkOr8XcnHX+zjBh/PlCnqJ0JT1nzAqGZr3gta5wlsqGY+NeG3S9oJtbBg==
X-Received: by 2002:a9d:5d1a:: with SMTP id b26mr12231346oti.139.1575052774281;
        Fri, 29 Nov 2019 10:39:34 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id j2sm7543609otn.20.2019.11.29.10.39.33
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 29 Nov 2019 10:39:33 -0800 (PST)
Date:   Fri, 29 Nov 2019 10:39:32 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     "Dr. David Alan Gilbert" <linux@treblig.org>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: Add intrusion templates
Message-ID: <20191129183932.GA7110@roeck-us.net>
References: <20191124202030.45360-1-linux@treblig.org>
 <20191124202030.45360-2-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191124202030.45360-2-linux@treblig.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Nov 24, 2019 at 08:20:29PM +0000, Dr. David Alan Gilbert wrote:
> Add templates for intrusion%d_alarm and intrusion%d_beep.
> Note, these start at 0.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/hwmon.c | 9 ++++++++-
>  include/linux/hwmon.h | 8 ++++++++
>  2 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index 1f3b30b085b9..95a1ae178213 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -171,7 +171,7 @@ static int hwmon_thermal_add_sensor(struct device *dev,
>  
>  static int hwmon_attr_base(enum hwmon_sensor_types type)
>  {
> -	if (type == hwmon_in)
> +	if (type == hwmon_in || type == hwmon_intrusion)
>  		return 0;
>  	return 1;
>  }
> @@ -458,6 +458,11 @@ static const char * const hwmon_pwm_attr_templates[] = {
>  	[hwmon_pwm_freq] = "pwm%d_freq",
>  };
>  
> +static const char * const hwmon_intrusion_attr_templates[] = {
> +	[hwmon_intrusion_alarm] = "intrusion%d_alarm",
> +	[hwmon_intrusion_beep]  = "intrusion%d_beep",
> +};
> +
>  static const char * const *__templates[] = {
>  	[hwmon_chip] = hwmon_chip_attrs,
>  	[hwmon_temp] = hwmon_temp_attr_templates,
> @@ -468,6 +473,7 @@ static const char * const *__templates[] = {
>  	[hwmon_humidity] = hwmon_humidity_attr_templates,
>  	[hwmon_fan] = hwmon_fan_attr_templates,
>  	[hwmon_pwm] = hwmon_pwm_attr_templates,
> +	[hwmon_intrusion] = hwmon_intrusion_attr_templates,
>  };
>  
>  static const int __templates_size[] = {
> @@ -480,6 +486,7 @@ static const int __templates_size[] = {
>  	[hwmon_humidity] = ARRAY_SIZE(hwmon_humidity_attr_templates),
>  	[hwmon_fan] = ARRAY_SIZE(hwmon_fan_attr_templates),
>  	[hwmon_pwm] = ARRAY_SIZE(hwmon_pwm_attr_templates),
> +	[hwmon_intrusion] = ARRAY_SIZE(hwmon_intrusion_attr_templates),
>  };
>  
>  static int hwmon_num_channel_attrs(const struct hwmon_channel_info *info)
> diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
> index 72579168189d..dcda9589cdaf 100644
> --- a/include/linux/hwmon.h
> +++ b/include/linux/hwmon.h
> @@ -27,6 +27,7 @@ enum hwmon_sensor_types {
>  	hwmon_humidity,
>  	hwmon_fan,
>  	hwmon_pwm,
> +	hwmon_intrusion,
>  	hwmon_max,
>  };
>  
> @@ -306,6 +307,13 @@ enum hwmon_pwm_attributes {
>  #define HWMON_PWM_MODE			BIT(hwmon_pwm_mode)
>  #define HWMON_PWM_FREQ			BIT(hwmon_pwm_freq)
>  
> +enum hwmon_intrusion_attributes {
> +	hwmon_intrusion_alarm,
> +	hwmon_intrusion_beep,
> +};
> +#define HWMON_INTRUSION_ALARM		BIT(hwmon_intrusion_alarm)
> +#define HWMON_INTRUSION_BEEP		BIT(hwmon_intrusion_beep)
> +
>  /**
>   * struct hwmon_ops - hwmon device operations
>   * @is_visible: Callback to return attribute visibility. Mandatory.
