Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1C39346770
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 23:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777590031; cv=none; b=am7FineINk8q+1foqR1jBE7fDmUbY6KDm6y8i3dpwZ4OHDYG80cvyj8bKVJA7Dzc7arcNkMK2rRg9MaCo1r+VKzzA0dnCoOesQeC/F+yL1PlVRai+xhlay2xWEHc+mvAbGnhQ+6GpPJbFkRnDu0j5wqiCGLzCPUDj0muHUpO4cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777590031; c=relaxed/simple;
	bh=ItXw1X4UVqDE0APuaEw/HlVoV6vthPIaAOO5Vqp9NXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=inJ52NnymO1DfcpJfyiMiedyk30iLZZa8wpRhQ+yAU65h72oxodGopj/5dc7gUSxKTNB7ah9qMCVtepRB+yssV3vbr7j/dmMf9fdJvmaBII/EDQjadLF7Ltn7/uwqCNnq1cmi/zyu+9R6IEvJhRaCn5KfBPWJ6qpJNKRrR4d9hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q2HHQr+Y; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q2HHQr+Y"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82f8b60e485so681569b3a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 16:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777590029; x=1778194829; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e21aQeKoqL29PG87k6OugvmzaO38ohD/iR9PEx/x6lc=;
        b=q2HHQr+YnuuA8kEDH2FhEHQw2425JseSi1e9Xzz1/YWVlHLOv4WDZBnx+syCtuLwk6
         ViQ+eGe8bKJLLseD6yh9mAtWa3PKie1dFZkEcUn/BWEzj31We85hQUzMk1Nqe3IfG8Jl
         6ykT6XqCz85OPJGEBu632FaUAzXSBpjzy+84SA86GHaRXbwRjafO4gpjZ2gg101VpO3+
         mpcX3ZUErsXBLgDG821QzydltdD8ePhFGRNvdUsYGPqhqlnRXcWRlftrI6HWT98woePI
         XX4ORzSW17wrWKH94nOJej5p5VnEgCAUv2f6r+rOaR4a3NqUTpwTGJQEjS8aOKMUwt38
         RmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777590029; x=1778194829;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e21aQeKoqL29PG87k6OugvmzaO38ohD/iR9PEx/x6lc=;
        b=Usfp12vEPicz29U1G2LL7wRM/62sA5TT0I1DUAq2SKhXrvC3W8b21ltTW3XwOnc+n8
         Pli0asW3vINtDmucTJ3+vxYEgzkAGswIdcvmUIk1qUONCkQLXTWHQLkpsnCYxRwf23kC
         1C2qOwAqiDrK/XQ091PAV75M03RNSz+ui5e3WOa+TCyF4i3fwYSPQMzrdBwhAXVprXnI
         HZOODyh2RSjNIp6IAF4rXykT3+p81PBS9Rqvbj7jNRFT5XwG5uS5zHvM3sJAoSGW1J2g
         hv1kPuFxDRZmcFbfzZ2DDtniBgeKGyS+8ylOWhPeBPoafZFv1zOJahlpRLT+WT4Hfiql
         EHEw==
X-Gm-Message-State: AOJu0YygJT0YsxMqF9bkJPI9R1fWAmuzugOURoOZhGncqHQE8eXR0K4H
	jKpsLTcTzscBrVhvyu/3gwDRDSs8a826TcC4av/K3o81BIp3HZfXMqrJ
X-Gm-Gg: AeBDies5P8iAcWBTxUuzBY1BbdI4rZm4KoyHzRzSvPBNzuHokbesk2LOpEPzwE4m6Fo
	O5R0QJ0qzbI7zucvNXpBCjo3T1VTt7GI+vcMf0pz6LtNG56R2thARseUbUwIJhEUlE2lsQOIngf
	u0ds4sfvP0RTaWyZoLnoIYtmDqlNrdlvm33WsWLiHJ98cVwcn09Q0lySPZU7drFV/R7qBSpNeJB
	wWgdg3JHNwX260jyvqUrHEYuKx9fR/i0Vj5AQncyBE9VGFXQ1O8XNGCGOInS8vQIS2ILNuZ4HgA
	QvNy6iLq0cNM+H2fu30W43XotwbVctaO3LyTN5a3RaSDcHZUVJrio8SePt0BWt9cLUFvxS4niFf
	nedizDp+wPtkMWhCPVcdl5hC9Ndd4Zg936Hx8Oc6/E1mfhvfTxyuf5AUIFJas+425zErZ/lVPyY
	2U+lAiItOt1id8Nwg6vvU489v/JhhzPV5RxdY9K0yQu1VuloY=
X-Received: by 2002:a05:6a00:3691:b0:81f:3afe:281e with SMTP id d2e1a72fcca58-834fe05fbb9mr5547003b3a.3.1777590024291;
        Thu, 30 Apr 2026 16:00:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b485eesm683535b3a.48.2026.04.30.16.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 16:00:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 30 Apr 2026 16:00:22 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com
Subject: Re: [PATCH v2] hwmon: (lm63) Add locking to avoid TOCTOU
Message-ID: <a8cfcc8f-1213-4424-bc91-267f6500a368@roeck-us.net>
References: <20260416135703.53262-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260416135703.53262-1-hanguidong02@gmail.com>

On Thu, Apr 16, 2026 at 09:57:03PM +0800, Gui-Dong Han wrote:
> The functions show_fan(), show_pwm1(), show_temp11(),
> temp2_crit_hyst_show(), and show_lut_temp_hyst() access shared cached
> data without holding the update lock. This can cause TOCTOU races if
> the cached values change between the checks and the later calculations.
> 
> Those cached values are updated in lm63_update_device(). In the general
> case, the affected functions combine multiple cached values without
> locking and can therefore observe a mixed old/new snapshot. In
> addition, show_fan() reads data->fan[nr] locklessly while
> lm63_update_device() updates data->fan[0] in two steps, which can
> expose an intermediate torn value and potentially trigger a
> divide-by-zero error. This means that converting the macro to a
> function is not sufficient to fix show_fan().
> 
> Hold the update lock across the whole read and calculation sequence so
> that the values remain stable.
> 
> Check the other functions in the driver as well. Keep them unchanged
> because they either do not access shared cached values multiple times
> or already do so under lock.
> 
> Link: https://lore.kernel.org/linux-hwmon/CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com/
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Fixes: e872c91e726e ("hwmon: (lm63) Add support for unsigned upper temperature limits")
> Fixes: d216f6809eb6 ("hwmon: (lm63) Expose automatic fan speed control lookup table")
> Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>

Applied.

Thanks,
Guenter

> ---
> v2:
> - Sashiko-bot pointed out that show_fan(), temp2_crit_hyst_show(), and
>   show_lut_temp_hyst() also need locking.
> 
> While learning the hwmon driver code, I found a few more potential
> TOCTOU problems in drivers still using the older non-_with_info() APIs.
> Fix them.
> ---
>  drivers/hwmon/lm63.c | 37 +++++++++++++++++++++++++++++--------
>  1 file changed, 29 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
> index 035176a98ce9..b8b1de5fa90f 100644
> --- a/drivers/hwmon/lm63.c
> +++ b/drivers/hwmon/lm63.c
> @@ -333,7 +333,13 @@ static ssize_t show_fan(struct device *dev, struct device_attribute *devattr,
>  {
>  	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>  	struct lm63_data *data = lm63_update_device(dev);
> -	return sprintf(buf, "%d\n", FAN_FROM_REG(data->fan[attr->index]));
> +	int fan;
> +
> +	mutex_lock(&data->update_lock);
> +	fan = FAN_FROM_REG(data->fan[attr->index]);
> +	mutex_unlock(&data->update_lock);
> +
> +	return sprintf(buf, "%d\n", fan);
>  }
>  
>  static ssize_t set_fan(struct device *dev, struct device_attribute *dummy,
> @@ -366,12 +372,14 @@ static ssize_t show_pwm1(struct device *dev, struct device_attribute *devattr,
>  	int nr = attr->index;
>  	int pwm;
>  
> +	mutex_lock(&data->update_lock);
>  	if (data->pwm_highres)
>  		pwm = data->pwm1[nr];
>  	else
>  		pwm = data->pwm1[nr] >= 2 * data->pwm1_freq ?
>  		       255 : (data->pwm1[nr] * 255 + data->pwm1_freq) /
>  		       (2 * data->pwm1_freq);
> +	mutex_unlock(&data->update_lock);
>  
>  	return sprintf(buf, "%d\n", pwm);
>  }
> @@ -529,6 +537,7 @@ static ssize_t show_temp11(struct device *dev, struct device_attribute *devattr,
>  	int nr = attr->index;
>  	int temp;
>  
> +	mutex_lock(&data->update_lock);
>  	if (!nr) {
>  		/*
>  		 * Use unsigned temperature unless its value is zero.
> @@ -544,7 +553,10 @@ static ssize_t show_temp11(struct device *dev, struct device_attribute *devattr,
>  		else
>  			temp = TEMP11_FROM_REG(data->temp11[nr]);
>  	}
> -	return sprintf(buf, "%d\n", temp + data->temp2_offset);
> +	temp += data->temp2_offset;
> +	mutex_unlock(&data->update_lock);
> +
> +	return sprintf(buf, "%d\n", temp);
>  }
>  
>  static ssize_t set_temp11(struct device *dev, struct device_attribute *devattr,
> @@ -592,9 +604,14 @@ static ssize_t temp2_crit_hyst_show(struct device *dev,
>  				    struct device_attribute *dummy, char *buf)
>  {
>  	struct lm63_data *data = lm63_update_device(dev);
> -	return sprintf(buf, "%d\n", temp8_from_reg(data, 2)
> -		       + data->temp2_offset
> -		       - TEMP8_FROM_REG(data->temp2_crit_hyst));
> +	int temp;
> +
> +	mutex_lock(&data->update_lock);
> +	temp = temp8_from_reg(data, 2) + data->temp2_offset
> +	     - TEMP8_FROM_REG(data->temp2_crit_hyst);
> +	mutex_unlock(&data->update_lock);
> +
> +	return sprintf(buf, "%d\n", temp);
>  }
>  
>  static ssize_t show_lut_temp_hyst(struct device *dev,
> @@ -602,10 +619,14 @@ static ssize_t show_lut_temp_hyst(struct device *dev,
>  {
>  	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
>  	struct lm63_data *data = lm63_update_device(dev);
> +	int temp;
>  
> -	return sprintf(buf, "%d\n", lut_temp_from_reg(data, attr->index)
> -		       + data->temp2_offset
> -		       - TEMP8_FROM_REG(data->lut_temp_hyst));
> +	mutex_lock(&data->update_lock);
> +	temp = lut_temp_from_reg(data, attr->index) + data->temp2_offset
> +	     - TEMP8_FROM_REG(data->lut_temp_hyst);
> +	mutex_unlock(&data->update_lock);
> +
> +	return sprintf(buf, "%d\n", temp);
>  }
>  
>  /*
