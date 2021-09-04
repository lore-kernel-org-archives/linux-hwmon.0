Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03959C433F5
	for <linux-hwmon@archiver.kernel.org>; Sat,  4 Sep 2021 15:06:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D089E604D7
	for <linux-hwmon@archiver.kernel.org>; Sat,  4 Sep 2021 15:06:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236766AbhIDPHC (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 4 Sep 2021 11:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236607AbhIDPHA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 4 Sep 2021 11:07:00 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6B41C061575
        for <linux-hwmon@vger.kernel.org>; Sat,  4 Sep 2021 08:05:58 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id c19-20020a9d6153000000b0051829acbfc7so2677146otk.9
        for <linux-hwmon@vger.kernel.org>; Sat, 04 Sep 2021 08:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ezHFPIfY6M74cq2uYOKraYvRMmWbI+bkJT/EGUfdvPM=;
        b=itc5PtkjCJ3Q6kPUMZCglOeUTDuu9YaRUssy1a/WQ9qhTFQ5PYCjSkECH3FsUtuzUQ
         +FBtLBUYP7nNXEhrkWYCCaGAkcoBCRlV6fFcmpvBTMlpjMbS7fD/wWNc7nnhWr62P9u1
         MojfM804Ax/+YT61ZAq/H1wNRTKhivWXhQKwg0Y3LRiO8JbqLz5PBIxqDXDNXYQyTT5J
         4OnWDfkqPCAY18POY6KoR6Wh3+iGtDKUk/WwNnAD4006TriiJrfgpAyM/yoiLULHqBhq
         YgrHT7njkP0SIDOZu4QERKchugSQP3dWxE281w3kiDcpp8P6BIrn7dSWvNtuTXT/CHmH
         ULMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=ezHFPIfY6M74cq2uYOKraYvRMmWbI+bkJT/EGUfdvPM=;
        b=kPeaJuag3vLjOXtzN2LFS1uKF3B3ezWDpu9kQEd6rryCeVuX4NrA03/5mJ8M6Obvfe
         5iXIhRrkdESIt91UG9zTFb/X5YXL+bDtoDxm4WDyIL21F6pUKxvifXsI4SyxPNJNfGAr
         OSEYOIRxhg/dkuxA093DyBUEhs89b4nIL02CLAt4HwKDXCDmny2oLKyGVdunbZu9zC5g
         vQICiS7F3h9Q/IQ9CKZsP3cQn95JnREbZ7vbcuoRE033yTf0VPYuWJOiIBpgtNylgQRW
         OecWhTVKRCkKPR+obBGZMNeS9+wy8QP6fVd0hw14YP9XTq9w97QyoaAR/aLNtFVqDT5W
         uSEw==
X-Gm-Message-State: AOAM5317Z2nvorAhJJoD3gKZbQai8LC/xkwSejCe8T6D/kWLUH1UvhqZ
        pF/3328o3Hrmi6i23erkfJSk6/3dk0U=
X-Google-Smtp-Source: ABdhPJyydKmoyXUksf5O+Ez18699TPyzP7aFBH7DGqpPts5QSpGqGOe6njuX518tbO0OCB5g2NGE0A==
X-Received: by 2002:a9d:700c:: with SMTP id k12mr2534125otj.225.1630767958295;
        Sat, 04 Sep 2021 08:05:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bg38sm520315oib.26.2021.09.04.08.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Sep 2021 08:05:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Sat, 4 Sep 2021 08:05:56 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     W_Armin@gmx.de
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH RESEND] hwmon: (i5500_temp) Convert to
 devm_hwmon_device_register_with_info
Message-ID: <20210904150556.GA3637780@roeck-us.net>
References: <20210823170724.7662-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210823170724.7662-1-W_Armin@gmx.de>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Aug 23, 2021 at 07:07:24PM +0200, W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> Use devm_hwmon_device_register_with_info() to simplify code
> and use register defines instead of hardcoded values.
> Also use the BIT() macro for the alarms.
> 
> Only compile-tested.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

I'll queue this patch up for v5.16. Let's hope it gets some test
coverage.

Guenter

> ---
>  drivers/hwmon/i5500_temp.c | 114 ++++++++++++++++++++-----------------
>  1 file changed, 61 insertions(+), 53 deletions(-)
> 
> --
> 2.20.1
> 
> diff --git a/drivers/hwmon/i5500_temp.c b/drivers/hwmon/i5500_temp.c
> index 360f5aee1394..05f68e9c9477 100644
> --- a/drivers/hwmon/i5500_temp.c
> +++ b/drivers/hwmon/i5500_temp.c
> @@ -5,6 +5,7 @@
>   * Copyright (C) 2012, 2014 Jean Delvare <jdelvare@suse.de>
>   */
> 
> +#include <linux/bitops.h>
>  #include <linux/module.h>
>  #include <linux/init.h>
>  #include <linux/slab.h>
> @@ -12,7 +13,6 @@
>  #include <linux/device.h>
>  #include <linux/pci.h>
>  #include <linux/hwmon.h>
> -#include <linux/hwmon-sysfs.h>
>  #include <linux/err.h>
>  #include <linux/mutex.h>
> 
> @@ -29,69 +29,78 @@
>  #define REG_CTCTRL	0xF7
>  #define REG_TSTIMER	0xF8
> 
> -/*
> - * Sysfs stuff
> - */
> -
> -/* Sensor resolution : 0.5 degree C */
> -static ssize_t temp1_input_show(struct device *dev,
> -				struct device_attribute *devattr, char *buf)
> +static umode_t i5500_is_visible(const void *drvdata, enum hwmon_sensor_types type, u32 attr,
> +				int channel)
>  {
> -	struct pci_dev *pdev = to_pci_dev(dev->parent);
> -	long temp;
> -	u16 tsthrhi;
> -	s8 tsfsc;
> -
> -	pci_read_config_word(pdev, REG_TSTHRHI, &tsthrhi);
> -	pci_read_config_byte(pdev, REG_TSFSC, &tsfsc);
> -	temp = ((long)tsthrhi - tsfsc) * 500;
> -
> -	return sprintf(buf, "%ld\n", temp);
> +	return 0444;
>  }
> 
> -static ssize_t thresh_show(struct device *dev,
> -			   struct device_attribute *devattr, char *buf)
> +static int i5500_read(struct device *dev, enum hwmon_sensor_types type, u32 attr, int channel,
> +		      long *val)
>  {
>  	struct pci_dev *pdev = to_pci_dev(dev->parent);
> -	int reg = to_sensor_dev_attr(devattr)->index;
> -	long temp;
>  	u16 tsthr;
> +	s8 tsfsc;
> +	u8 ctsts;
> 
> -	pci_read_config_word(pdev, reg, &tsthr);
> -	temp = tsthr * 500;
> +	switch (type) {
> +	case hwmon_temp:
> +		switch (attr) {
> +		/* Sensor resolution : 0.5 degree C */
> +		case hwmon_temp_input:
> +			pci_read_config_word(pdev, REG_TSTHRHI, &tsthr);
> +			pci_read_config_byte(pdev, REG_TSFSC, &tsfsc);
> +			*val = (tsthr - tsfsc) * 500;
> +			return 0;
> +		case hwmon_temp_max:
> +			pci_read_config_word(pdev, REG_TSTHRHI, &tsthr);
> +			*val = tsthr * 500;
> +			return 0;
> +		case hwmon_temp_max_hyst:
> +			pci_read_config_word(pdev, REG_TSTHRLO, &tsthr);
> +			*val = tsthr * 500;
> +			return 0;
> +		case hwmon_temp_crit:
> +			pci_read_config_word(pdev, REG_TSTHRCATA, &tsthr);
> +			*val = tsthr * 500;
> +			return 0;
> +		case hwmon_temp_max_alarm:
> +			pci_read_config_byte(pdev, REG_CTSTS, &ctsts);
> +			*val = !!(ctsts & BIT(1));
> +			return 0;
> +		case hwmon_temp_crit_alarm:
> +			pci_read_config_byte(pdev, REG_CTSTS, &ctsts);
> +			*val = !!(ctsts & BIT(0));
> +			return 0;
> +		default:
> +			break;
> +		}
> +		break;
> +	default:
> +		break;
> +	}
> 
> -	return sprintf(buf, "%ld\n", temp);
> +	return -EOPNOTSUPP;
>  }
> 
> -static ssize_t alarm_show(struct device *dev,
> -			  struct device_attribute *devattr, char *buf)
> -{
> -	struct pci_dev *pdev = to_pci_dev(dev->parent);
> -	int nr = to_sensor_dev_attr(devattr)->index;
> -	u8 ctsts;
> -
> -	pci_read_config_byte(pdev, REG_CTSTS, &ctsts);
> -	return sprintf(buf, "%u\n", (unsigned int)ctsts & (1 << nr));
> -}
> +static const struct hwmon_ops i5500_ops = {
> +	.is_visible = i5500_is_visible,
> +	.read = i5500_read,
> +};
> 
> -static DEVICE_ATTR_RO(temp1_input);
> -static SENSOR_DEVICE_ATTR_RO(temp1_crit, thresh, 0xE2);
> -static SENSOR_DEVICE_ATTR_RO(temp1_max_hyst, thresh, 0xEC);
> -static SENSOR_DEVICE_ATTR_RO(temp1_max, thresh, 0xEE);
> -static SENSOR_DEVICE_ATTR_RO(temp1_crit_alarm, alarm, 0);
> -static SENSOR_DEVICE_ATTR_RO(temp1_max_alarm, alarm, 1);
> -
> -static struct attribute *i5500_temp_attrs[] = {
> -	&dev_attr_temp1_input.attr,
> -	&sensor_dev_attr_temp1_crit.dev_attr.attr,
> -	&sensor_dev_attr_temp1_max_hyst.dev_attr.attr,
> -	&sensor_dev_attr_temp1_max.dev_attr.attr,
> -	&sensor_dev_attr_temp1_crit_alarm.dev_attr.attr,
> -	&sensor_dev_attr_temp1_max_alarm.dev_attr.attr,
> +static const struct hwmon_channel_info *i5500_info[] = {
> +	HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
> +	HWMON_CHANNEL_INFO(temp,
> +			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST | HWMON_T_CRIT |
> +			   HWMON_T_MAX_ALARM | HWMON_T_CRIT_ALARM
> +			   ),
>  	NULL
>  };
> 
> -ATTRIBUTE_GROUPS(i5500_temp);
> +static const struct hwmon_chip_info i5500_chip_info = {
> +	.ops = &i5500_ops,
> +	.info = i5500_info,
> +};
> 
>  static const struct pci_device_id i5500_temp_ids[] = {
>  	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, 0x3438) },
> @@ -121,9 +130,8 @@ static int i5500_temp_probe(struct pci_dev *pdev,
>  		return -ENODEV;
>  	}
> 
> -	hwmon_dev = devm_hwmon_device_register_with_groups(&pdev->dev,
> -							   "intel5500", NULL,
> -							   i5500_temp_groups);
> +	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev, "intel5500", NULL,
> +							 &i5500_chip_info, NULL);
>  	return PTR_ERR_OR_ZERO(hwmon_dev);
>  }
