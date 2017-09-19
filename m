Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:38301 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750872AbdISSDw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 19 Sep 2017 14:03:52 -0400
Received: by mail-pf0-f195.google.com with SMTP id a7so146619pfj.5
        for <linux-hwmon@vger.kernel.org>; Tue, 19 Sep 2017 11:03:52 -0700 (PDT)
Date: Tue, 19 Sep 2017 11:03:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-hwmon@vger.kernel.org,
        Andrea Merello <andrea.merello@gmail.com>
Subject: Re: [PATCH] hwmon: (stts751) Fix buffer size passed to snprintf
Message-ID: <20170919180351.GA7145@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Sep 19, 2017 at 02:59:34PM +0200, Jean Delvare wrote:
> Function snprintf already cares for the terminating NUL at the end of
> the string, the caller doesn't need to do it.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Andrea Merello <andrea.merello@gmail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/stts751.c |   18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> --- linux-4.14-rc1.orig/drivers/hwmon/stts751.c	2017-09-17 00:47:51.000000000 +0200
> +++ linux-4.14-rc1/drivers/hwmon/stts751.c	2017-09-19 14:51:39.773843565 +0200
> @@ -396,7 +396,7 @@ static ssize_t show_max_alarm(struct dev
>  	if (ret < 0)
>  		return ret;
>  
> -	return snprintf(buf, PAGE_SIZE - 1, "%d\n", priv->max_alert);
> +	return snprintf(buf, PAGE_SIZE, "%d\n", priv->max_alert);
>  }
>  
>  static ssize_t show_min_alarm(struct device *dev, struct device_attribute *attr,
> @@ -413,7 +413,7 @@ static ssize_t show_min_alarm(struct dev
>  	if (ret < 0)
>  		return ret;
>  
> -	return snprintf(buf, PAGE_SIZE - 1, "%d\n", priv->min_alert);
> +	return snprintf(buf, PAGE_SIZE, "%d\n", priv->min_alert);
>  }
>  
>  static ssize_t show_input(struct device *dev, struct device_attribute *attr,
> @@ -428,7 +428,7 @@ static ssize_t show_input(struct device
>  	if (ret < 0)
>  		return ret;
>  
> -	return snprintf(buf, PAGE_SIZE - 1, "%d\n", priv->temp);
> +	return snprintf(buf, PAGE_SIZE, "%d\n", priv->temp);
>  }
>  
>  static ssize_t show_therm(struct device *dev, struct device_attribute *attr,
> @@ -436,7 +436,7 @@ static ssize_t show_therm(struct device
>  {
>  	struct stts751_priv *priv = dev_get_drvdata(dev);
>  
> -	return snprintf(buf, PAGE_SIZE - 1, "%d\n", priv->therm);
> +	return snprintf(buf, PAGE_SIZE, "%d\n", priv->therm);
>  }
>  
>  static ssize_t set_therm(struct device *dev, struct device_attribute *attr,
> @@ -478,7 +478,7 @@ static ssize_t show_hyst(struct device *
>  {
>  	struct stts751_priv *priv = dev_get_drvdata(dev);
>  
> -	return snprintf(buf, PAGE_SIZE - 1, "%d\n", priv->hyst);
> +	return snprintf(buf, PAGE_SIZE, "%d\n", priv->hyst);
>  }
>  
>  static ssize_t set_hyst(struct device *dev, struct device_attribute *attr,
> @@ -518,7 +518,7 @@ static ssize_t show_therm_trip(struct de
>  	if (ret < 0)
>  		return ret;
>  
> -	return snprintf(buf, PAGE_SIZE - 1, "%d\n", priv->therm_trip);
> +	return snprintf(buf, PAGE_SIZE, "%d\n", priv->therm_trip);
>  }
>  
>  static ssize_t show_max(struct device *dev, struct device_attribute *attr,
> @@ -526,7 +526,7 @@ static ssize_t show_max(struct device *d
>  {
>  	struct stts751_priv *priv = dev_get_drvdata(dev);
>  
> -	return snprintf(buf, PAGE_SIZE - 1, "%d\n", priv->event_max);
> +	return snprintf(buf, PAGE_SIZE, "%d\n", priv->event_max);
>  }
>  
>  static ssize_t set_max(struct device *dev, struct device_attribute *attr,
> @@ -560,7 +560,7 @@ static ssize_t show_min(struct device *d
>  {
>  	struct stts751_priv *priv = dev_get_drvdata(dev);
>  
> -	return snprintf(buf, PAGE_SIZE - 1, "%d\n", priv->event_min);
> +	return snprintf(buf, PAGE_SIZE, "%d\n", priv->event_min);
>  }
>  
>  static ssize_t set_min(struct device *dev, struct device_attribute *attr,
> @@ -594,7 +594,7 @@ static ssize_t show_interval(struct devi
>  {
>  	struct stts751_priv *priv = dev_get_drvdata(dev);
>  
> -	return snprintf(buf, PAGE_SIZE - 1, "%d\n",
> +	return snprintf(buf, PAGE_SIZE, "%d\n",
>  			stts751_intervals[priv->interval]);
>  }
>  
> 
> 
> -- 
> Jean Delvare
> SUSE L3 Support
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
