Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45946C7619A
	for <linux-hwmon@archiver.kernel.org>; Wed, 12 Apr 2023 18:45:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjDLSpD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 12 Apr 2023 14:45:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229598AbjDLSpC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Apr 2023 14:45:02 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE66C3AAB
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Apr 2023 11:45:00 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id jx2-20020a17090b46c200b002469a9ff94aso10724778pjb.3
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Apr 2023 11:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681325100; x=1683917100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O/CTzg+r0KhkiePzJ+1CcIHPkvCwXyT/6q/xCwAV19M=;
        b=bAkWdnff7b14BGV5lMBfleRNhIsnSu5ZKc8atvnvcf2uQqV20zew5FGtG34yxg4wK+
         DQMXLbKp0cfTbkyUS5j06R7EjXvZJUXWraWifKPDBjRmV1PrdQokUEo7jYClsEdh+29M
         1SJdeYN7zviYunZv5OaxgI0bbohNXi3/FQRa6oI6kewF41U/R9AziiYOjOWRsa+E3CD7
         n01j/pAzO9ySrFtvvzR4npE8vLb36uEGQAhzEvW0aOum2a26lyK3WHq8IkY3wZtBTbwr
         jC13xOVTA6lkWtFogSye/4ql+4vHPchdo38UN7NqlEGXZ1Q8o9f9EybMja1yypTwqTak
         3mJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681325100; x=1683917100;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O/CTzg+r0KhkiePzJ+1CcIHPkvCwXyT/6q/xCwAV19M=;
        b=RZK7amiLQmP0oowUePdE52w6lJYoGmXsxR9ouurLbgVmRNOtLIQYgyt+f+yMSfrl1s
         iMyvJ0Rtc6UUxtIIjgf3RAZ1I6MkGbpW0HEkmxDzqjef0huJVKQmscyr4j0Ds1LFBNK/
         GUUU1ld4zXYWvD6nyJbs6CvDlCmlHZ9PYEAjFdAipAjYg9hUU3jLnCh/t1PuRnEe+BsP
         bvYz8pfoGQsmkS3TBrCc8PnMPVExt3HtLeR6DYH9blyn5bar/VDncSBMpLTokfyDJgwK
         d68wii6XypLsPSX625h0M6GXbjU+NoB7FXku4EntX2jl58mQOuYU8DPQEDGQtQZpnvc4
         cY5A==
X-Gm-Message-State: AAQBX9dVeNUckQr1TT4mecbo9izWt627Y6ZuftcUyInsZROIpDvt3JjP
        Mvz5pSsuDCQ4Rm20bIJF+EI=
X-Google-Smtp-Source: AKy350a8IDlotK1TRmsz4TiX4TZK6N2KfE+SrOLcT/er1Mo3G4SEh6N9oERewHRbBjJgDKNO0p72Zg==
X-Received: by 2002:a05:6a20:2986:b0:ec:22ab:a009 with SMTP id f6-20020a056a20298600b000ec22aba009mr231126pzh.62.1681325100061;
        Wed, 12 Apr 2023 11:45:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e34-20020a630f22000000b00507249cde91sm10336645pgl.91.2023.04.12.11.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Apr 2023 11:44:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Wed, 12 Apr 2023 11:44:58 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Frank Crawford <frank@crawford.emu.id.au>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v1 2/4] hwmon: (it87) Add calls to
 smbus_enable/smbus_disable as required.
Message-ID: <8c8408ff-ab22-4a6a-b9d1-64bab64d6f05@roeck-us.net>
References: <20230409034718.1938695-1-frank@crawford.emu.id.au>
 <20230409034718.1938695-3-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230409034718.1938695-3-frank@crawford.emu.id.au>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sun, Apr 09, 2023 at 01:47:16PM +1000, Frank Crawford wrote:
> Disable/re-enable access through SMBus for chip registers when they are
> are being read or written.
> 
> For simple cases this is done at the same time as when a mutex is set,
> however, within loops or during initialisation it is done separately.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>

This gives me:

ERROR: code indent should use tabs where possible
#629: FILE: drivers/hwmon/it87.c:3268:
+^I    ^I^I     it87_read_value(data, IT87_REG_CHIPID) != 0x90) {$

WARNING: please, no space before tabs
#629: FILE: drivers/hwmon/it87.c:3268:
+^I    ^I^I     it87_read_value(data, IT87_REG_CHIPID) != 0x90) {$

> ---
>  drivers/hwmon/it87.c | 181 ++++++++++++++++++++++++++++++++-----------
>  1 file changed, 135 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index b74dd861f0fe..1ca3247efb9e 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -746,6 +746,7 @@ static int smbus_enable(struct it87_data *data)
>  
>  /*
>   * Must be called with data->update_lock held, except during initialization.
> + * Must be called with SMBus accesses disabled.
>   * We ignore the IT87 BUSY flag at this moment - it could lead to deadlocks,
>   * would slow down the IT87 access and should not be necessary.
>   */
> @@ -757,6 +758,7 @@ static int it87_read_value(struct it87_data *data, u8 reg)
>  
>  /*
>   * Must be called with data->update_lock held, except during initialization.
> + * Must be called with SMBus accesses disabled.
>   * We ignore the IT87 BUSY flag at this moment - it could lead to deadlocks,
>   * would slow down the IT87 access and should not be necessary.
>   */
> @@ -816,15 +818,39 @@ static void it87_update_pwm_ctrl(struct it87_data *data, int nr)
>  	}
>  }
>  
> +static int it87_lock(struct it87_data *data)
> +{
> +	int err;
> +
> +	mutex_lock(&data->update_lock);
> +	err = smbus_disable(data);
> +	if (err)
> +		mutex_unlock(&data->update_lock);
> +	return err;
> +}
> +
> +static void it87_unlock(struct it87_data *data)
> +{
> +	smbus_enable(data);
> +	mutex_unlock(&data->update_lock);
> +}
> +
>  static struct it87_data *it87_update_device(struct device *dev)
>  {
>  	struct it87_data *data = dev_get_drvdata(dev);
> +	struct it87_data *ret = data;
> +	int err;
>  	int i;
>  
>  	mutex_lock(&data->update_lock);
>  
>  	if (time_after(jiffies, data->last_updated + HZ + HZ / 2) ||
> -	    !data->valid) {
> +		       !data->valid) {
> +		err = smbus_disable(data);
> +		if (err) {
> +			ret = ERR_PTR(err);
> +			goto unlock;
> +		}
>  		if (update_vbat) {
>  			/*
>  			 * Cleared after each update, so reenable.  Value
> @@ -927,11 +953,11 @@ static struct it87_data *it87_update_device(struct device *dev)
>  		}
>  		data->last_updated = jiffies;
>  		data->valid = true;
> +		smbus_enable(data);
>  	}
> -
> +unlock:
>  	mutex_unlock(&data->update_lock);
> -
> -	return data;
> +	return ret;
>  }
>  
>  static ssize_t show_in(struct device *dev, struct device_attribute *attr,
> @@ -953,17 +979,21 @@ static ssize_t set_in(struct device *dev, struct device_attribute *attr,
>  	int index = sattr->index;
>  	int nr = sattr->nr;
>  	unsigned long val;
> +	int err;
>  
>  	if (kstrtoul(buf, 10, &val) < 0)
>  		return -EINVAL;
>  
> -	mutex_lock(&data->update_lock);
> +	err = it87_lock(data);
> +	if (err)
> +		return err;
> +
>  	data->in[nr][index] = in_to_reg(data, nr, val);
>  	it87_write_value(data,
>  			 index == 1 ? IT87_REG_VIN_MIN(nr)
>  				    : IT87_REG_VIN_MAX(nr),
>  			 data->in[nr][index]);
> -	mutex_unlock(&data->update_lock);
> +	it87_unlock(data);
>  	return count;
>  }
>  
> @@ -1042,11 +1072,14 @@ static ssize_t set_temp(struct device *dev, struct device_attribute *attr,
>  	struct it87_data *data = dev_get_drvdata(dev);
>  	long val;
>  	u8 reg, regval;
> +	int err;
>  
>  	if (kstrtol(buf, 10, &val) < 0)
>  		return -EINVAL;
>  
> -	mutex_lock(&data->update_lock);
> +	err = it87_lock(data);
> +	if (err)
> +		return err;
>  
>  	switch (index) {
>  	default:
> @@ -1069,7 +1102,7 @@ static ssize_t set_temp(struct device *dev, struct device_attribute *attr,
>  
>  	data->temp[nr][index] = TEMP_TO_REG(val);
>  	it87_write_value(data, reg, data->temp[nr][index]);
> -	mutex_unlock(&data->update_lock);
> +	it87_unlock(data);
>  	return count;
>  }
>  
> @@ -1126,10 +1159,15 @@ static ssize_t set_temp_type(struct device *dev, struct device_attribute *attr,
>  	struct it87_data *data = dev_get_drvdata(dev);
>  	long val;
>  	u8 reg, extra;
> +	int err;
>  
>  	if (kstrtol(buf, 10, &val) < 0)
>  		return -EINVAL;
>  
> +	err = it87_lock(data);
> +	if (err)
> +		return err;
> +
>  	reg = it87_read_value(data, IT87_REG_TEMP_ENABLE);
>  	reg &= ~(1 << nr);
>  	reg &= ~(8 << nr);
> @@ -1152,17 +1190,19 @@ static ssize_t set_temp_type(struct device *dev, struct device_attribute *attr,
>  		reg |= (nr + 1) << 6;
>  	else if (has_temp_old_peci(data, nr) && val == 6)
>  		extra |= 0x80;
> -	else if (val != 0)
> -		return -EINVAL;
> +	else if (val != 0) {
> +		count = -EINVAL;
> +		goto unlock;
> +	}
>  
> -	mutex_lock(&data->update_lock);
>  	data->sensor = reg;
>  	data->extra = extra;
>  	it87_write_value(data, IT87_REG_TEMP_ENABLE, data->sensor);
>  	if (has_temp_old_peci(data, nr))
>  		it87_write_value(data, IT87_REG_TEMP_EXTRA, data->extra);
>  	data->valid = false;	/* Force cache refresh */
> -	mutex_unlock(&data->update_lock);
> +unlock:
> +	it87_unlock(data);
>  	return count;
>  }
>  
> @@ -1263,12 +1303,15 @@ static ssize_t set_fan(struct device *dev, struct device_attribute *attr,
>  
>  	struct it87_data *data = dev_get_drvdata(dev);
>  	long val;
> +	int err;
>  	u8 reg;
>  
>  	if (kstrtol(buf, 10, &val) < 0)
>  		return -EINVAL;
>  
> -	mutex_lock(&data->update_lock);
> +	err = it87_lock(data);
> +	if (err)
> +		return err;
>  
>  	if (has_16bit_fans(data)) {
>  		data->fan[nr][index] = FAN16_TO_REG(val);
> @@ -1295,7 +1338,7 @@ static ssize_t set_fan(struct device *dev, struct device_attribute *attr,
>  				 data->fan[nr][index]);
>  	}
>  
> -	mutex_unlock(&data->update_lock);
> +	it87_unlock(data);
>  	return count;
>  }
>  
> @@ -1306,13 +1349,16 @@ static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
>  	struct it87_data *data = dev_get_drvdata(dev);
>  	int nr = sensor_attr->index;
>  	unsigned long val;
> -	int min;
> +	int min, err;
>  	u8 old;
>  
>  	if (kstrtoul(buf, 10, &val) < 0)
>  		return -EINVAL;
>  
> -	mutex_lock(&data->update_lock);
> +	err = it87_lock(data);
> +	if (err)
> +		return err;
> +
>  	old = it87_read_value(data, IT87_REG_FAN_DIV);
>  
>  	/* Save fan min limit */
> @@ -1340,7 +1386,7 @@ static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
>  	data->fan[nr][1] = FAN_TO_REG(min, DIV_FROM_REG(data->fan_div[nr]));
>  	it87_write_value(data, IT87_REG_FAN_MIN[nr], data->fan[nr][1]);
>  
> -	mutex_unlock(&data->update_lock);
> +	it87_unlock(data);
>  	return count;
>  }
>  
> @@ -1381,6 +1427,7 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
>  	struct it87_data *data = dev_get_drvdata(dev);
>  	int nr = sensor_attr->index;
>  	long val;
> +	int err;
>  
>  	if (kstrtol(buf, 10, &val) < 0 || val < 0 || val > 2)
>  		return -EINVAL;
> @@ -1391,7 +1438,9 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
>  			return -EINVAL;
>  	}
>  
> -	mutex_lock(&data->update_lock);
> +	err = it87_lock(data);
> +	if (err)
> +		return err;
>  
>  	if (val == 0) {
>  		if (nr < 3 && data->type != it8603) {
> @@ -1442,7 +1491,7 @@ static ssize_t set_pwm_enable(struct device *dev, struct device_attribute *attr,
>  		}
>  	}
>  
> -	mutex_unlock(&data->update_lock);
> +	it87_unlock(data);
>  	return count;
>  }
>  
> @@ -1453,11 +1502,15 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
>  	struct it87_data *data = dev_get_drvdata(dev);
>  	int nr = sensor_attr->index;
>  	long val;
> +	int err;
>  
>  	if (kstrtol(buf, 10, &val) < 0 || val < 0 || val > 255)
>  		return -EINVAL;
>  
> -	mutex_lock(&data->update_lock);
> +	err = it87_lock(data);
> +	if (err)
> +		return err;
> +
>  	it87_update_pwm_ctrl(data, nr);
>  	if (has_newer_autopwm(data)) {
>  		/*
> @@ -1465,8 +1518,8 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
>  		 * is read-only so we can't write the value.
>  		 */
>  		if (data->pwm_ctrl[nr] & 0x80) {
> -			mutex_unlock(&data->update_lock);
> -			return -EBUSY;
> +			count = -EBUSY;
> +			goto unlock;
>  		}
>  		data->pwm_duty[nr] = pwm_to_reg(data, val);
>  		it87_write_value(data, IT87_REG_PWM_DUTY[nr],
> @@ -1483,7 +1536,8 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
>  					 data->pwm_ctrl[nr]);
>  		}
>  	}
> -	mutex_unlock(&data->update_lock);
> +unlock:
> +	it87_unlock(data);
>  	return count;
>  }
>  
> @@ -1494,6 +1548,7 @@ static ssize_t set_pwm_freq(struct device *dev, struct device_attribute *attr,
>  	struct it87_data *data = dev_get_drvdata(dev);
>  	int nr = sensor_attr->index;
>  	unsigned long val;
> +	int err;
>  	int i;
>  
>  	if (kstrtoul(buf, 10, &val) < 0)
> @@ -1508,7 +1563,10 @@ static ssize_t set_pwm_freq(struct device *dev, struct device_attribute *attr,
>  			break;
>  	}
>  
> -	mutex_lock(&data->update_lock);
> +	err = it87_lock(data);
> +	if (err)
> +		return err;
> +
>  	if (nr == 0) {
>  		data->fan_ctl = it87_read_value(data, IT87_REG_FAN_CTL) & 0x8f;
>  		data->fan_ctl |= i << 4;
> @@ -1518,7 +1576,7 @@ static ssize_t set_pwm_freq(struct device *dev, struct device_attribute *attr,
>  		data->extra |= i << 4;
>  		it87_write_value(data, IT87_REG_TEMP_EXTRA, data->extra);
>  	}
> -	mutex_unlock(&data->update_lock);
> +	it87_unlock(data);
>  
>  	return count;
>  }
> @@ -1548,6 +1606,7 @@ static ssize_t set_pwm_temp_map(struct device *dev,
>  	struct it87_data *data = dev_get_drvdata(dev);
>  	int nr = sensor_attr->index;
>  	long val;
> +	int err;
>  	u8 reg;
>  
>  	if (kstrtol(buf, 10, &val) < 0)
> @@ -1570,7 +1629,10 @@ static ssize_t set_pwm_temp_map(struct device *dev,
>  		return -EINVAL;
>  	}
>  
> -	mutex_lock(&data->update_lock);
> +	err = it87_lock(data);
> +	if (err)
> +		return err;
> +
>  	it87_update_pwm_ctrl(data, nr);
>  	data->pwm_temp_map[nr] = reg;
>  	/*
> @@ -1582,7 +1644,7 @@ static ssize_t set_pwm_temp_map(struct device *dev,
>  						data->pwm_temp_map[nr];
>  		it87_write_value(data, IT87_REG_PWM[nr], data->pwm_ctrl[nr]);
>  	}
> -	mutex_unlock(&data->update_lock);
> +	it87_unlock(data);
>  	return count;
>  }
>  
> @@ -1609,18 +1671,22 @@ static ssize_t set_auto_pwm(struct device *dev, struct device_attribute *attr,
>  	int point = sensor_attr->index;
>  	int regaddr;
>  	long val;
> +	int err;
>  
>  	if (kstrtol(buf, 10, &val) < 0 || val < 0 || val > 255)
>  		return -EINVAL;
>  
> -	mutex_lock(&data->update_lock);
> +	err = it87_lock(data);
> +	if (err)
> +		return err;
> +
>  	data->auto_pwm[nr][point] = pwm_to_reg(data, val);
>  	if (has_newer_autopwm(data))
>  		regaddr = IT87_REG_AUTO_TEMP(nr, 3);
>  	else
>  		regaddr = IT87_REG_AUTO_PWM(nr, point);
>  	it87_write_value(data, regaddr, data->auto_pwm[nr][point]);
> -	mutex_unlock(&data->update_lock);
> +	it87_unlock(data);
>  	return count;
>  }
>  
> @@ -1642,15 +1708,19 @@ static ssize_t set_auto_pwm_slope(struct device *dev,
>  	struct sensor_device_attribute *sensor_attr = to_sensor_dev_attr(attr);
>  	int nr = sensor_attr->index;
>  	unsigned long val;
> +	int err;
>  
>  	if (kstrtoul(buf, 10, &val) < 0 || val > 127)
>  		return -EINVAL;
>  
> -	mutex_lock(&data->update_lock);
> +	err = it87_lock(data);
> +	if (err)
> +		return err;
> +
>  	data->auto_pwm[nr][1] = (data->auto_pwm[nr][1] & 0x80) | val;
>  	it87_write_value(data, IT87_REG_AUTO_TEMP(nr, 4),
>  			 data->auto_pwm[nr][1]);
> -	mutex_unlock(&data->update_lock);
> +	it87_unlock(data);
>  	return count;
>  }
>  
> @@ -1682,11 +1752,15 @@ static ssize_t set_auto_temp(struct device *dev, struct device_attribute *attr,
>  	int point = sensor_attr->index;
>  	long val;
>  	int reg;
> +	int err;
>  
>  	if (kstrtol(buf, 10, &val) < 0 || val < -128000 || val > 127000)
>  		return -EINVAL;
>  
> -	mutex_lock(&data->update_lock);
> +	err = it87_lock(data);
> +	if (err)
> +		return err;
> +
>  	if (has_newer_autopwm(data) && !point) {
>  		reg = data->auto_temp[nr][1] - TEMP_TO_REG(val);
>  		reg = clamp_val(reg, 0, 0x1f) | (data->auto_temp[nr][0] & 0xe0);
> @@ -1699,7 +1773,7 @@ static ssize_t set_auto_temp(struct device *dev, struct device_attribute *attr,
>  			point--;
>  		it87_write_value(data, IT87_REG_AUTO_TEMP(nr, point), reg);
>  	}
> -	mutex_unlock(&data->update_lock);
> +	it87_unlock(data);
>  	return count;
>  }
>  
> @@ -1902,13 +1976,16 @@ static ssize_t clear_intrusion(struct device *dev,
>  			       size_t count)
>  {
>  	struct it87_data *data = dev_get_drvdata(dev);
> -	int config;
> +	int err, config;
>  	long val;
>  
>  	if (kstrtol(buf, 10, &val) < 0 || val != 0)
>  		return -EINVAL;
>  
> -	mutex_lock(&data->update_lock);
> +	err = it87_lock(data);
> +	if (err)
> +		return err;
> +
>  	config = it87_read_value(data, IT87_REG_CONFIG);
>  	if (config < 0) {
>  		count = config;
> @@ -1918,8 +1995,7 @@ static ssize_t clear_intrusion(struct device *dev,
>  		/* Invalidate cache to force re-read */
>  		data->valid = false;
>  	}
> -	mutex_unlock(&data->update_lock);
> -
> +	it87_unlock(data);
>  	return count;
>  }
>  
> @@ -1958,18 +2034,22 @@ static ssize_t set_beep(struct device *dev, struct device_attribute *attr,
>  	int bitnr = to_sensor_dev_attr(attr)->index;
>  	struct it87_data *data = dev_get_drvdata(dev);
>  	long val;
> +	int err;
>  
>  	if (kstrtol(buf, 10, &val) < 0 || (val != 0 && val != 1))
>  		return -EINVAL;
>  
> -	mutex_lock(&data->update_lock);
> +	err = it87_lock(data);
> +	if (err)
> +		return err;
> +
>  	data->beeps = it87_read_value(data, IT87_REG_BEEP_ENABLE);
>  	if (val)
>  		data->beeps |= BIT(bitnr);
>  	else
>  		data->beeps &= ~BIT(bitnr);
>  	it87_write_value(data, IT87_REG_BEEP_ENABLE, data->beeps);
> -	mutex_unlock(&data->update_lock);
> +	it87_unlock(data);
>  	return count;
>  }
>  
> @@ -3129,6 +3209,7 @@ static int it87_probe(struct platform_device *pdev)
>  	struct it87_sio_data *sio_data = dev_get_platdata(dev);
>  	int enable_pwm_interface;
>  	struct device *hwmon_dev;
> +	int err;
>  
>  	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
>  	if (!devm_request_region(&pdev->dev, res->start, IT87_EC_EXTENT,
> @@ -3174,15 +3255,21 @@ static int it87_probe(struct platform_device *pdev)
>  		break;
>  	}
>  
> -	/* Now, we do the remaining detection. */
> -	if ((it87_read_value(data, IT87_REG_CONFIG) & 0x80) ||
> -	    it87_read_value(data, IT87_REG_CHIPID) != 0x90)
> -		return -ENODEV;
> -
>  	platform_set_drvdata(pdev, data);
>  
>  	mutex_init(&data->update_lock);
>  
> +	err = smbus_disable(data);
> +	if (err)
> +		return err;
> +
> +	/* Now, we do the remaining detection. */
> +	if ((it87_read_value(data, IT87_REG_CONFIG) & 0x80) ||
> +	    		     it87_read_value(data, IT87_REG_CHIPID) != 0x90) {
> +		smbus_enable(data);
> +		return -ENODEV;
> +	}
> +
>  	/* Check PWM configuration */
>  	enable_pwm_interface = it87_check_pwm(dev);
>  	if (!enable_pwm_interface)
> @@ -3243,6 +3330,8 @@ static int it87_probe(struct platform_device *pdev)
>  	/* Initialize the IT87 chip */
>  	it87_init_device(pdev);
>  
> +	smbus_enable(data);
> +
>  	if (!sio_data->skip_vid) {
>  		data->has_vid = true;
>  		data->vrm = vid_which_vrm();
> @@ -3310,7 +3399,7 @@ static int it87_resume(struct device *dev)
>  
>  	it87_resume_sio(pdev);
>  
> -	mutex_lock(&data->update_lock);
> +	it87_lock(data);

Not checking for error here means that the lock was not acquired if
it87_lock() failed, yet it87_unlock() is called below. I don't really
know how to best handle this situation, but calling unlock if the lock
was not acquired is definitely wrong.

Guenter

>  
>  	it87_check_pwm(dev);
>  	it87_check_limit_regs(data);
> @@ -3323,7 +3412,7 @@ static int it87_resume(struct device *dev)
>  	/* force update */
>  	data->valid = false;
>  
> -	mutex_unlock(&data->update_lock);
> +	it87_unlock(data);
>  
>  	it87_update_device(dev);
>  
