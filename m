Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA39C6379D
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Nov 2020 15:55:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 09DEB22242
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Nov 2020 15:55:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.b="p0WZ1J04"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731037AbgK0Pzn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 27 Nov 2020 10:55:43 -0500
Received: from gproxy6-pub.mail.unifiedlayer.com ([67.222.39.168]:42718 "EHLO
        gproxy6-pub.mail.unifiedlayer.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730563AbgK0Pzm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 27 Nov 2020 10:55:42 -0500
Received: from cmgw11.unifiedlayer.com (unknown [10.9.0.11])
        by gproxy6.mail.unifiedlayer.com (Postfix) with ESMTP id C0BEB1E06D7
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2020 08:55:40 -0700 (MST)
Received: from bh-25.webhostbox.net ([208.91.199.152])
        by cmsmtp with ESMTP
        id ig60kLSb2dCH5ig60kQLDY; Fri, 27 Nov 2020 08:55:40 -0700
X-Authority-Reason: nr=8
X-Authority-Analysis: v=2.3 cv=cYj8UELM c=1 sm=1 tr=0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=dLZJa+xiwSxG16/P+YVxDGlgEgI=:19 a=kj9zAlcOel0A:10:nop_charset_1
 a=nNwsprhYR40A:10:nop_rcvd_month_year
 a=evQFzbml-YQA:10:endurance_base64_authed_username_1 a=k-42gJp3AAAA:8
 a=8i6-b8GgAAAA:8 a=vk7IAVoQ5Q416_JcCXwA:9 a=CjuIK1q_8ugA:10:nop_charset_2
 a=uCSXFHLys93vLW5PjgO_:22 a=XAGLwFu5sp1jj7jejlXE:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
        :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
        :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=24JwXc9p0cGraJOxApDab5/UcwY3XgsncsXaaVh6hzo=; b=p0WZ1J04jsZNOFxTtzgWQwsGLp
        /AxMRAUAhIQRGPn0e4R1+FNml826jYfyDx1iVNnJyzwDbFvfY9lr5wNTHdaloRjpz6EEG5rGW4nDB
        AWXdxp28UbfG1IQFO+0lrJy6VWLeUmk4PoFrk8pEBWWumW28J8NigWGUV9wcwYyo0Eg7QoJCfzDbG
        7PZkJgq/O5dWmBYLaEt2rb/FCozP/7b8KxiiXvaDBuLrjSRBCk1dqa/uW8XPpaCyqPzUZt1s3e/0n
        65eP0iEfkYZm+6eI/WFPstd/MB3zNp/6AMru4qylwk5jpxbtjpW2MPB8G5/yd+6l9sNCrArlzuFC6
        gHSP5Z0g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:43408 helo=localhost)
        by bh-25.webhostbox.net with esmtpa (Exim 4.93)
        (envelope-from <linux@roeck-us.net>)
        id 1kig5z-002fFj-RA; Fri, 27 Nov 2020 15:55:39 +0000
Date:   Fri, 27 Nov 2020 07:55:39 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Paul Barker <pbarker@konsulko.com>
Cc:     Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: pwm-fan: Convert to
 hwmon_device_register_with_info API
Message-ID: <20201127155539.GA9519@roeck-us.net>
References: <20201126174408.755-1-pbarker@konsulko.com>
 <20201126174408.755-3-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201126174408.755-3-pbarker@konsulko.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1kig5z-002fFj-RA
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (localhost) [108.223.40.66]:43408
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 10
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Nov 26, 2020 at 05:44:08PM +0000, Paul Barker wrote:
> The pwm-fan driver is updated to use the recommended API.
> 
> Signed-off-by: Paul Barker <pbarker@konsulko.com>
> ---
>  drivers/hwmon/pwm-fan.c | 112 +++++++++++++++++++++++++---------------
>  1 file changed, 71 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
> index efe2764f42d3..c8a1d41d6f06 100644
> --- a/drivers/hwmon/pwm-fan.c
> +++ b/drivers/hwmon/pwm-fan.c
> @@ -8,7 +8,6 @@
>   */
>  
>  #include <linux/hwmon.h>
> -#include <linux/hwmon-sysfs.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/mutex.h>
> @@ -39,6 +38,28 @@ struct pwm_fan_ctx {
>  	unsigned int pwm_fan_max_state;
>  	unsigned int *pwm_fan_cooling_levels;
>  	struct thermal_cooling_device *cdev;
> +
> +	struct hwmon_chip_info info;
> +};
> +
> +static const u32 pwm_fan_channel_config_pwm[] = {
> +	HWMON_PWM_INPUT,
> +	0
> +};
> +
> +static const struct hwmon_channel_info pwm_fan_channel_pwm = {
> +	.type = hwmon_pwm,
> +	.config = pwm_fan_channel_config_pwm,
> +};
> +
> +static const u32 pwm_fan_channel_config_fan[] = {
> +	HWMON_F_INPUT,
> +	0
> +};
> +
> +static const struct hwmon_channel_info pwm_fan_channel_fan = {
> +	.type = hwmon_fan,
> +	.config = pwm_fan_channel_config_fan,
>  };

In general I'd suggest to use the HWMON_CHANNEL_INFO() macro instead,
but I think this is to prepare for a dynamic number of channels.
With that in mind, it is ok.

>  
>  /* This handler assumes self resetting edge triggered interrupt. */
> @@ -103,14 +124,14 @@ static void pwm_fan_update_state(struct pwm_fan_ctx *ctx, unsigned long pwm)
>  	ctx->pwm_fan_state = i;
>  }
>  
> -static ssize_t pwm_store(struct device *dev, struct device_attribute *attr,
> -			 const char *buf, size_t count)
> +static int pwm_fan_write(struct device *dev, enum hwmon_sensor_types type,
> +			 u32 attr, int channel, long val)
>  {
>  	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
> -	unsigned long pwm;
> +	unsigned long pwm = val;
>  	int ret;
>  
> -	if (kstrtoul(buf, 10, &pwm) || pwm > MAX_PWM)
> +	if (pwm > MAX_PWM)
>  		return -EINVAL;

This happens to catch negative values, but it is odd and somewhat difficult
to review and understand. I would suggest to drop the pwm variable and use
	if (val < 0 || val > MAX_PWM)
		return -EINVAL;
instead.

>  
>  	ret = __set_pwm(ctx, pwm);
> @@ -118,55 +139,50 @@ static ssize_t pwm_store(struct device *dev, struct device_attribute *attr,
>  		return ret;
>  
>  	pwm_fan_update_state(ctx, pwm);
> -	return count;
> +	return 0;
>  }
>  
> -static ssize_t pwm_show(struct device *dev, struct device_attribute *attr,
> -			char *buf)
> +static int pwm_fan_read(struct device *dev, enum hwmon_sensor_types type,
> +			u32 attr, int channel, long *val)
>  {
>  	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
>  
> -	return sprintf(buf, "%u\n", ctx->pwm_value);
> -}
> +	switch (type) {
> +	case hwmon_pwm:
> +		*val = ctx->pwm_value;
> +		return 0;
>  
> -static ssize_t rpm_show(struct device *dev,
> -			struct device_attribute *attr, char *buf)
> -{
> -	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
> +	case hwmon_fan:
> +		*val = ctx->rpm;
> +		return 0;
>  
> -	return sprintf(buf, "%u\n", ctx->rpm);
> +	default:
> +		return -EINVAL;

		return -EOPNOTSUPP;

> +	}
>  }
>  
> -static SENSOR_DEVICE_ATTR_RW(pwm1, pwm, 0);
> -static SENSOR_DEVICE_ATTR_RO(fan1_input, rpm, 0);
> +static umode_t pwm_fan_is_visible(const void *data,
> +				  enum hwmon_sensor_types type,
> +				  u32 attr, int channel)
> +{
> +	struct pwm_fan_ctx *ctx = (struct pwm_fan_ctx *)data;
>  
> -static struct attribute *pwm_fan_attrs[] = {
> -	&sensor_dev_attr_pwm1.dev_attr.attr,
> -	&sensor_dev_attr_fan1_input.dev_attr.attr,
> -	NULL,
> -};
> +	switch (type) {
> +	case hwmon_pwm:
> +		return 0644;
>  
> -static umode_t pwm_fan_attrs_visible(struct kobject *kobj, struct attribute *a,
> -				     int n)
> -{
> -	struct device *dev = container_of(kobj, struct device, kobj);
> -	struct pwm_fan_ctx *ctx = dev_get_drvdata(dev);
> +	case hwmon_fan:
> +		return 0444;
>  
> -	/* Hide fan_input in case no interrupt is available  */
> -	if (n == 1 && ctx->irq <= 0)
> +	default:
>  		return 0;
> -
> -	return a->mode;
> +	}
>  }
>  
> -static const struct attribute_group pwm_fan_group = {
> -	.attrs = pwm_fan_attrs,
> -	.is_visible = pwm_fan_attrs_visible,
> -};
> -
> -static const struct attribute_group *pwm_fan_groups[] = {
> -	&pwm_fan_group,
> -	NULL,
> +static const struct hwmon_ops pwm_fan_hwmon_ops = {
> +	.is_visible = pwm_fan_is_visible,
> +	.read = pwm_fan_read,
> +	.write = pwm_fan_write,
>  };
>  
>  /* thermal cooling device callbacks */
> @@ -287,6 +303,8 @@ static int pwm_fan_probe(struct platform_device *pdev)
>  	int ret;
>  	struct pwm_state state = { };
>  	int tach_count;
> +	size_t sz;
> +	const struct hwmon_channel_info **channels;
>  
>  	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>  	if (!ctx)
> @@ -340,6 +358,13 @@ static int pwm_fan_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, tach_count,
>  				     "Could not get number of fan tachometer inputs\n");
>  
> +	sz = (2 + tach_count) * sizeof(struct hwmon_channel_info *);
> +	channels = devm_kzalloc(dev, sz, GFP_KERNEL);

devm_kcalloc() is preferred.
	channels = devm_kcalloc(dev, tach_count + 2,
				sizeof(struct hwmon_channel_info *), GFP_KERNEL);

> +	if (!channels)
> +		return -ENOMEM;
> +
> +	channels[0] = &pwm_fan_channel_pwm;
> +
>  	if (tach_count > 0) {
>  		u32 ppr = 2;
>  
> @@ -371,10 +396,15 @@ static int pwm_fan_probe(struct platform_device *pdev)
>  
>  		ctx->sample_start = ktime_get();
>  		mod_timer(&ctx->rpm_timer, jiffies + HZ);
> +
> +		channels[1] = &pwm_fan_channel_fan;
>  	}
>  
> -	hwmon = devm_hwmon_device_register_with_groups(dev, "pwmfan",
> -						       ctx, pwm_fan_groups);
> +	ctx->info.ops = &pwm_fan_hwmon_ops;
> +	ctx->info.info = channels;
> +
> +	hwmon = devm_hwmon_device_register_with_info(dev, "pwmfan",
> +						     ctx, &ctx->info, NULL);
>  	if (IS_ERR(hwmon)) {
>  		dev_err(dev, "Failed to register hwmon device\n");
>  		return PTR_ERR(hwmon);
