Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CAEDC4338F
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Aug 2021 04:39:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7436860F21
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Aug 2021 04:39:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234093AbhHLEjz (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 Aug 2021 00:39:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234086AbhHLEjz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 Aug 2021 00:39:55 -0400
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com [IPv6:2607:f8b0:4864:20::82d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94712C0613D3
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Aug 2021 21:39:30 -0700 (PDT)
Received: by mail-qt1-x82d.google.com with SMTP id y9so4090801qtv.7
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Aug 2021 21:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=kiQ079EHnE9JQ1mQZ19KS5hU4xvHtD4WpiOEAv4mGXQ=;
        b=vIbSo1e0Gl7LYljr/dDovllEAt6UXCMQBxvifj6XpfR6x3lAfxzd08Wxg4tBDkeKOy
         CoVPvwDIokWqUKIuJVl8mhYTUoy+uVVZOxUgnxC4Uy+qv8+qxoKkw29NNE8fQiP6Dgzd
         L5YvISZgAUx+BDJSSUZG0pBsVZCcZwx4hjTcgWf6XXxulcv5wJWgLIMyd9+l1nTvWxQr
         jnBEiSB/nb3Yxa3jQ3WQgYHqGYuG+Ha4ypZtg5pKBnlWG+lybJG68toolxF3koX5zjO6
         nkVSmgNnUTKFgJLEoMCDT1YccxA6BlrRlDcssBfO7es7npSF/pWIDIUrpdl4BRjCs5LP
         pvxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to;
        bh=kiQ079EHnE9JQ1mQZ19KS5hU4xvHtD4WpiOEAv4mGXQ=;
        b=d+Q8iVWxqahfgM3FoAntW6eNtX3qOUaokwRAEecinTCn+P8nSh7g+QCAQiOdtHpFV1
         rBQEKhOXejbfUZrMCQ7BwOlqqJ/ZnCAJa5gxT5wTWmg9JmZNmmzWlFGUXAh0T1RxupiA
         cJkBcPiK3Z1HmrVI4XABXUkc1wnmr9D8nVXddsfxPTfoADZD60dKjwA62zkMavih8qhv
         ipbfHEYgNPnvrSrsSlAkJ4Sm93kalpMdb7qVd673vL2HsG71iMxBkV3lQM4EVqDTh4Ye
         F2Y+V3wKYjJVgmcthKPomACa+vGHX0t8+1Jhyb51UlXSIRJkC0K755k4VcRRUDq3cP9U
         +PAA==
X-Gm-Message-State: AOAM5330C+A9LTSTpJMyk8f6xLZubR39gISIviriA06FQf7CnZQfCvmL
        mOREvbLxVm6JVOLNLqEdeJ4=
X-Google-Smtp-Source: ABdhPJzUZ+sKxs7JALRnrNsBzFOuEGL/LAPalGW0br/qCM2MhQU4Hrc8UHODrpDAUQ6fW8WHxHUdCA==
X-Received: by 2002:ac8:5948:: with SMTP id 8mr2048026qtz.113.1628743169805;
        Wed, 11 Aug 2021 21:39:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x25sm700011qkj.31.2021.08.11.21.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 21:39:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 11 Aug 2021 21:39:27 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 3/3] hwmon: axi-fan-control: support temperature vs pwm
 points
Message-ID: <20210812043927.GA1115747@roeck-us.net>
References: <20210811114853.159298-1-nuno.sa@analog.com>
 <20210811114853.159298-4-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210811114853.159298-4-nuno.sa@analog.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Wed, Aug 11, 2021 at 01:48:53PM +0200, Nuno Sá wrote:
> The HW has some predefined points where it will associate a PWM value.
> However some users might want to better set these points to their
> usecases. This patch exposes these points as pwm auto_points:
> 
>  * pwm1_auto_point1_temp_hyst: temperature threshold below which PWM should
>    be 0%;
>  * pwm1_auto_point1_temp: temperature threshold above which PWM should be
>    25%;
>  * pwm1_auto_point2_temp_hyst: temperature threshold below which PWM should
>    be 25%;
>  * pwm1_auto_point2_temp: temperature threshold above which PWM should be
>    50%;
>  * pwm1_auto_point3_temp_hyst: temperature threshold below which PWM should
>    be 50%;
>  * pwm1_auto_point3_temp: temperature threshold above which PWM should be
>    75%;
>  * pwm1_auto_point4_temp_hyst: temperature threshold below which PWM should
>    be 75%;
>  * pwm1_auto_point4_temp: temperature threshold above which PWM should be
>    100%;
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/axi-fan-control.c | 74 ++++++++++++++++++++++++++++++++-
>  1 file changed, 73 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-control.c
> index c898ad121dc7..d2092c17d993 100644
> --- a/drivers/hwmon/axi-fan-control.c
> +++ b/drivers/hwmon/axi-fan-control.c
> @@ -8,6 +8,7 @@
>  #include <linux/clk.h>
>  #include <linux/fpga/adi-axi-common.h>
>  #include <linux/hwmon.h>
> +#include <linux/hwmon-sysfs.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
> @@ -23,6 +24,14 @@
>  #define ADI_REG_PWM_PERIOD	0x00c0
>  #define ADI_REG_TACH_MEASUR	0x00c4
>  #define ADI_REG_TEMPERATURE	0x00c8
> +#define ADI_REG_TEMP_00_H	0x0100
> +#define ADI_REG_TEMP_25_L	0x0104
> +#define ADI_REG_TEMP_25_H	0x0108
> +#define ADI_REG_TEMP_50_L	0x010c
> +#define ADI_REG_TEMP_50_H	0x0110
> +#define ADI_REG_TEMP_75_L	0x0114
> +#define ADI_REG_TEMP_75_H	0x0118
> +#define ADI_REG_TEMP_100_L	0x011c
>  
>  #define ADI_REG_IRQ_MASK	0x0040
>  #define ADI_REG_IRQ_PENDING	0x0044
> @@ -62,6 +71,39 @@ static inline u32 axi_ioread(const u32 reg,
>  	return ioread32(ctl->base + reg);
>  }
>  
> +/*
> + * The core calculates the temperature as:
> + *	T = /raw * 509.3140064 / 65535) - 280.2308787
> + */
> +static ssize_t axi_fan_control_show(struct device *dev, struct device_attribute *da, char *buf)
> +{
> +	struct axi_fan_control_data *ctl = dev_get_drvdata(dev);
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
> +	u32 temp = axi_ioread(attr->index, ctl);
> +
> +	temp = DIV_ROUND_CLOSEST_ULL(temp * 509314ULL, 65535) - 280230;
> +
> +	return sprintf(buf, "%u\n", temp);
> +}
> +
> +static ssize_t axi_fan_control_store(struct device *dev, struct device_attribute *da,
> +				     const char *buf, size_t count)
> +{
> +	struct axi_fan_control_data *ctl = dev_get_drvdata(dev);
> +	struct sensor_device_attribute *attr = to_sensor_dev_attr(da);
> +	u32 temp;
> +	int ret;
> +
> +	ret = kstrtou32(buf, 10, &temp);
> +	if (ret)
> +		return ret;
> +
> +	temp = DIV_ROUND_CLOSEST_ULL((temp + 280230) * 65535ULL, 509314);
> +	axi_iowrite(temp, attr->index, ctl);
> +
> +	return count;
> +}
> +
>  static long axi_fan_control_get_pwm_duty(const struct axi_fan_control_data *ctl)
>  {
>  	u32 pwm_width = axi_ioread(ADI_REG_PWM_WIDTH, ctl);
> @@ -375,6 +417,36 @@ static const struct hwmon_chip_info axi_chip_info = {
>  	.info = axi_fan_control_info,
>  };
>  
> +/* temperature threshold below which PWM should be 0% */
> +static SENSOR_DEVICE_ATTR_RW(pwm1_auto_point1_temp_hyst, axi_fan_control, ADI_REG_TEMP_00_H);
> +/* temperature threshold above which PWM should be 25% */
> +static SENSOR_DEVICE_ATTR_RW(pwm1_auto_point1_temp, axi_fan_control, ADI_REG_TEMP_25_L);
> +/* temperature threshold below which PWM should be 25% */
> +static SENSOR_DEVICE_ATTR_RW(pwm1_auto_point2_temp_hyst, axi_fan_control, ADI_REG_TEMP_25_H);
> +/* temperature threshold above which PWM should be 50% */
> +static SENSOR_DEVICE_ATTR_RW(pwm1_auto_point2_temp, axi_fan_control, ADI_REG_TEMP_50_L);
> +/* temperature threshold below which PWM should be 50% */
> +static SENSOR_DEVICE_ATTR_RW(pwm1_auto_point3_temp_hyst, axi_fan_control, ADI_REG_TEMP_50_H);
> +/* temperature threshold above which PWM should be 75% */
> +static SENSOR_DEVICE_ATTR_RW(pwm1_auto_point3_temp, axi_fan_control, ADI_REG_TEMP_75_L);
> +/* temperature threshold below which PWM should be 75% */
> +static SENSOR_DEVICE_ATTR_RW(pwm1_auto_point4_temp_hyst, axi_fan_control, ADI_REG_TEMP_75_H);
> +/* temperature threshold above which PWM should be 100% */
> +static SENSOR_DEVICE_ATTR_RW(pwm1_auto_point4_temp, axi_fan_control, ADI_REG_TEMP_100_L);
> +
> +static struct attribute *axi_fan_control_attrs[] = {
> +	&sensor_dev_attr_pwm1_auto_point1_temp_hyst.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point1_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point2_temp_hyst.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point2_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point3_temp_hyst.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point3_temp.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point4_temp_hyst.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_auto_point4_temp.dev_attr.attr,
> +	NULL,
> +};
> +ATTRIBUTE_GROUPS(axi_fan_control);
> +
>  static const u32 version_1_0_0 = ADI_AXI_PCORE_VER(1, 0, 'a');
>  
>  static const struct of_device_id axi_fan_control_of_match[] = {
> @@ -459,7 +531,7 @@ static int axi_fan_control_probe(struct platform_device *pdev)
>  							 name,
>  							 ctl,
>  							 &axi_chip_info,
> -							 NULL);
> +							 axi_fan_control_groups);
>  
>  	return PTR_ERR_OR_ZERO(ctl->hdev);
>  }
