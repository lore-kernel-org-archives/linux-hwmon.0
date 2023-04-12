Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F95EC7619A
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 Apr 2023 18:47:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229864AbjDLSrH (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 Apr 2023 14:47:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbjDLSrG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Apr 2023 14:47:06 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C61A40F9
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Apr 2023 11:46:35 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id b2-20020a17090a6e0200b002470b249e59so1474890pjk.4
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Apr 2023 11:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681325195; x=1683917195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8ZYobfC1lPpWSfLL2/Fri+vMGlmIMNIO2VCzXLbxGk=;
        b=oP+ySll3Yz1VsnTEaalCKmt2uGLwJz5Ez5/wkV/XiKweU0PYVKEw9xb58/dvgAtewo
         7cB1JTsleWYdk6PrztRZmPFN2kEmOsvj1zmGxq7I5aU48tmSkJ2YBiHc17D3PWWyw88S
         qk/kxn6G1Pj/r+sUOxnAVP9vJ7+vsexEAeLKUmEEPELoeYjiPUHTzJWCR3MLEwhspDO5
         QsLMQ+FhuzS12LNrUsLA85p4e9ZyEVhNnhp58WCfiAwD8I8gPotdFrIQD4yuAtzU7KEq
         xLrL5QFtPN3CuXr2DqHr6brwWpccNU72TpDP/9j8IqefEzRkDnXuolLhSp/WjTYAzYsF
         8sIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681325195; x=1683917195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J8ZYobfC1lPpWSfLL2/Fri+vMGlmIMNIO2VCzXLbxGk=;
        b=DyKXH+rlfp7bK0CqflHKZLwstapSZpus7pPP4bmdbiixLhgaosThM8cQU/7f/VOdwa
         8FCJ8S2vUuHT8MG/k6KRrvdf2Qt+4Up+kAS33e6C6VcYC35JMGgT/4COHWDMSDTH84rp
         CzN8ynymVx0bDLMU0aCDle06G8is62prwmQd4eLpQ1IV1GLg119MR4raUTrkHMRYJiyw
         RDz3EUHcdGlRGt0x3U0R8CkNPxfHINEb8jurFMnaBa8argLGbaM0dciLwq0Vm4AyTb6g
         quLA2Nayh+HRbG5wyYJOVhpZX8uAx0CtAMHrVLGaFdsnnhTPtiWwRmfdv59881onL8Pv
         8LAg==
X-Gm-Message-State: AAQBX9c2p6YtCINbHjBIv11/Yt2UG4m1AapduSexqgRSf5gBum+f3R1Q
        mWnBXtzQw5xqdWvdTTUVd/k=
X-Google-Smtp-Source: AKy350bTdOJmJRYn32TSNM4lL5IRAPi6+ic1RPw2SyL9529RyrRAUAoxtg7njjpxIptnKATQOiGwDw==
X-Received: by 2002:a17:902:bd87:b0:1a0:4ebd:15d5 with SMTP id q7-20020a170902bd8700b001a04ebd15d5mr2755066pls.67.1681325194917;
        Wed, 12 Apr 2023 11:46:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bd8-20020a170902830800b001a1ddd224desm11922633plb.89.2023.04.12.11.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 11:46:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 12 Apr 2023 11:46:33 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v1 3/4] hwmon: (it87) Test for error in it87_update_device
Message-ID: <67b7127e-6ddc-4ac4-b487-301bfb6d244f@roeck-us.net>
References: <20230409034718.1938695-1-frank@crawford.emu.id.au>
 <20230409034718.1938695-4-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230409034718.1938695-4-frank@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Apr 09, 2023 at 01:47:17PM +1000, Frank Crawford wrote:
> Handle errors from it87_update_device(), which currently only occurs if
> SMBus access locking fails.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>

This patch needs to come first, before it87_update_device() can return
an error.

Guenter

> ---
>  drivers/hwmon/it87.c | 48 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 1ca3247efb9e..a3d26ef2cd31 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -968,6 +968,9 @@ static ssize_t show_in(struct device *dev, struct device_attribute *attr,
>  	int index = sattr->index;
>  	int nr = sattr->nr;
>  
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
>  	return sprintf(buf, "%d\n", in_from_reg(data, nr, data->in[nr][index]));
>  }
>  
> @@ -1060,6 +1063,9 @@ static ssize_t show_temp(struct device *dev, struct device_attribute *attr,
>  	int index = sattr->index;
>  	struct it87_data *data = it87_update_device(dev);
>  
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
>  	return sprintf(buf, "%d\n", TEMP_FROM_REG(data->temp[nr][index]));
>  }
>  
> @@ -1140,6 +1146,9 @@ static ssize_t show_temp_type(struct device *dev, struct device_attribute *attr,
>  	u8 reg = data->sensor;	    /* In case value is updated while used */
>  	u8 extra = data->extra;
>  
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
>  	if ((has_temp_peci(data, nr) && (reg >> 6 == nr + 1)) ||
>  	    (has_temp_old_peci(data, nr) && (extra & 0x80)))
>  		return sprintf(buf, "6\n");  /* Intel PECI */
> @@ -1237,6 +1246,9 @@ static ssize_t show_fan(struct device *dev, struct device_attribute *attr,
>  	int speed;
>  	struct it87_data *data = it87_update_device(dev);
>  
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
>  	speed = has_16bit_fans(data) ?
>  		FAN16_FROM_REG(data->fan[nr][index]) :
>  		FAN_FROM_REG(data->fan[nr][index],
> @@ -1251,6 +1263,9 @@ static ssize_t show_fan_div(struct device *dev, struct device_attribute *attr,
>  	struct it87_data *data = it87_update_device(dev);
>  	int nr = sensor_attr->index;
>  
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
>  	return sprintf(buf, "%lu\n", DIV_FROM_REG(data->fan_div[nr]));
>  }
>  
> @@ -1261,6 +1276,9 @@ static ssize_t show_pwm_enable(struct device *dev,
>  	struct it87_data *data = it87_update_device(dev);
>  	int nr = sensor_attr->index;
>  
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
>  	return sprintf(buf, "%d\n", pwm_mode(data, nr));
>  }
>  
> @@ -1271,6 +1289,9 @@ static ssize_t show_pwm(struct device *dev, struct device_attribute *attr,
>  	struct it87_data *data = it87_update_device(dev);
>  	int nr = sensor_attr->index;
>  
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
>  	return sprintf(buf, "%d\n",
>  		       pwm_from_reg(data, data->pwm_duty[nr]));
>  }
> @@ -1284,6 +1305,9 @@ static ssize_t show_pwm_freq(struct device *dev, struct device_attribute *attr,
>  	unsigned int freq;
>  	int index;
>  
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
>  	if (has_pwm_freq2(data) && nr == 1)
>  		index = (data->extra >> 4) & 0x07;
>  	else
> @@ -1589,6 +1613,9 @@ static ssize_t show_pwm_temp_map(struct device *dev,
>  	int nr = sensor_attr->index;
>  	int map;
>  
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
>  	map = data->pwm_temp_map[nr];
>  	if (map >= 3)
>  		map = 0;	/* Should never happen */
> @@ -1657,6 +1684,9 @@ static ssize_t show_auto_pwm(struct device *dev, struct device_attribute *attr,
>  	int nr = sensor_attr->nr;
>  	int point = sensor_attr->index;
>  
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
>  	return sprintf(buf, "%d\n",
>  		       pwm_from_reg(data, data->auto_pwm[nr][point]));
>  }
> @@ -1697,6 +1727,9 @@ static ssize_t show_auto_pwm_slope(struct device *dev,
>  	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
>  	int nr = sensor_attr->index;
>  
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
>  	return sprintf(buf, "%d\n", data->auto_pwm[nr][1] & 0x7f);
>  }
>  
> @@ -1734,6 +1767,9 @@ static ssize_t show_auto_temp(struct device *dev, struct device_attribute *attr,
>  	int point = sensor_attr->index;
>  	int reg;
>  
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
>  	if (has_old_autopwm(data) || point)
>  		reg = data->auto_temp[nr][point];
>  	else
> @@ -1958,6 +1994,9 @@ static ssize_t alarms_show(struct device *dev, struct device_attribute *attr,
>  {
>  	struct it87_data *data = it87_update_device(dev);
>  
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
>  	return sprintf(buf, "%u\n", data->alarms);
>  }
>  static DEVICE_ATTR_RO(alarms);
> @@ -1968,6 +2007,9 @@ static ssize_t show_alarm(struct device *dev, struct device_attribute *attr,
>  	struct it87_data *data = it87_update_device(dev);
>  	int bitnr = to_sensor_dev_attr(attr)->index;
>  
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
>  	return sprintf(buf, "%u\n", (data->alarms >> bitnr) & 1);
>  }
>  
> @@ -2025,6 +2067,9 @@ static ssize_t show_beep(struct device *dev, struct device_attribute *attr,
>  	struct it87_data *data = it87_update_device(dev);
>  	int bitnr = to_sensor_dev_attr(attr)->index;
>  
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
>  	return sprintf(buf, "%u\n", (data->beeps >> bitnr) & 1);
>  }
>  
> @@ -2102,6 +2147,9 @@ static ssize_t cpu0_vid_show(struct device *dev,
>  {
>  	struct it87_data *data = it87_update_device(dev);
>  
> +	if (IS_ERR(data))
> +		return PTR_ERR(data);
> +
>  	return sprintf(buf, "%ld\n", (long)vid_from_reg(data->vid, data->vrm));
>  }
>  static DEVICE_ATTR_RO(cpu0_vid);
