Return-Path: <SRS0=z86d=QT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28E01C282C4
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Feb 2019 21:49:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E7F92222C0
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Feb 2019 21:49:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="beKPVIef"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731252AbfBLVtN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Feb 2019 16:49:13 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43492 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727816AbfBLVtN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Feb 2019 16:49:13 -0500
Received: by mail-pf1-f195.google.com with SMTP id q17so86227pfh.10
        for <linux-hwmon@vger.kernel.org>; Tue, 12 Feb 2019 13:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=xm4eoP65RFrYlDQJYEBkhBqxXUmSxBYRGaIrZfk/2oU=;
        b=beKPVIefnN1h++CNWMeLBqkcWl40XAE1ImYOmoX7gqgvJNcEZX30x8GQA0lt9CA4nK
         oaaKXJ2riUxIy/2s57EWc655+bSISmRchptYs7Z6ib0GWorQTitnBsnutgkSVIKGCJ2r
         DHxfAk7HJ2b0UTqamW7URiUUh8kCgni4L+zp7z7+n4OJJoXi/1bSPCS3nBA94hrz/FaS
         I5cnzYweHTzeQFE3x2/aiiK63AAYRu1hq0TrmEZXw3vUWX/DHGPKpUwp7C0vmeqvFbGo
         4RwYv+blDpWv8swW62RXxwduf97BUs/xyVJHpdsZS/b66i/5MGf7MvVfJACuydxhe7iS
         DSIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=xm4eoP65RFrYlDQJYEBkhBqxXUmSxBYRGaIrZfk/2oU=;
        b=pkNU2Z92a0u4iixw/99mV64AckV0IEq9OFzUYVZQ+Vkmd96TJSY1CRGEZ8zenu+Ecg
         hy/7c6W3VaWH3CX/0o1WbKP8rLYWLzC2MOUi1I53wsEvXQWtSV28OwUoDsTQgSgki6TB
         g0wsV6lDt5HMqdvFLB9mi2nkFetMpmqPPABRSUa9oV0WthTNUIuR5dYCAPYUNAQ6z9zX
         RXbhXld7/JBALSgoouoDNTTLnk+vFXsusdSpC6GgH7wcsE6jP/UwC3jOttqG72/6Ozu2
         y8tHA4LvYNIZHV2j5pCKH9HQPhc+8jPH/UWlFnQqZknDxoJhxmhxvoGgsGAlhPuwjncl
         cF6g==
X-Gm-Message-State: AHQUAuZAzR6nn5S3SqpjuzbYxDHsuwZdm+UkAlUjM9Dm5mESXaVrtCPm
        XG+IWrYU/5+U21oqiIcZKfI=
X-Google-Smtp-Source: AHgI3Ib66qq5g34AK/XKSBnepDxJFjHE2WpRfBYaazo5O3p9pjZOknxnoTRUouk0ptoeQRZxPpQMDg==
X-Received: by 2002:a63:5109:: with SMTP id f9mr5564262pgb.450.1550008152427;
        Tue, 12 Feb 2019 13:49:12 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g185sm19490355pfc.174.2019.02.12.13.49.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Feb 2019 13:49:11 -0800 (PST)
Date:   Tue, 12 Feb 2019 13:49:09 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Brandon Maier <brandon.maier@rockwellcollins.com>
Cc:     jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (ad7418) Catch I2C errors
Message-ID: <20190212214909.GA17486@roeck-us.net>
References: <20190207215036.185561-1-brandon.maier@rockwellcollins.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190207215036.185561-1-brandon.maier@rockwellcollins.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Feb 07, 2019 at 03:50:36PM -0600, Brandon Maier wrote:
> If there is an i2c failure, the ad7416 reports its temperature as 0C.
> Return an error code so users can properly detect errors.
> 
> Signed-off-by: Brandon Maier <brandon.maier@rockwellcollins.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
> Tested on an ad7416, attempting to `cat` the temp1_input while the
> sensor is physically disconnected returns this:
> 
> > cat: read error: Remote I/O error
> ---
>  drivers/hwmon/ad7418.c | 65 +++++++++++++++++++++++++++++++-----------
>  1 file changed, 49 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/hwmon/ad7418.c b/drivers/hwmon/ad7418.c
> index 76f0a5c01e8a..28a91d14d7af 100644
> --- a/drivers/hwmon/ad7418.c
> +++ b/drivers/hwmon/ad7418.c
> @@ -54,10 +54,11 @@ struct ad7418_data {
>  	u16			in[4];
>  };
>  
> -static struct ad7418_data *ad7418_update_device(struct device *dev)
> +static int ad7418_update_device(struct device *dev)
>  {
>  	struct ad7418_data *data = dev_get_drvdata(dev);
>  	struct i2c_client *client = data->client;
> +	s32 val;
>  
>  	mutex_lock(&data->lock);
>  
> @@ -67,47 +68,74 @@ static struct ad7418_data *ad7418_update_device(struct device *dev)
>  		int i, ch;
>  
>  		/* read config register and clear channel bits */
> -		cfg = i2c_smbus_read_byte_data(client, AD7418_REG_CONF);
> +		val = i2c_smbus_read_byte_data(client, AD7418_REG_CONF);
> +		if (val < 0)
> +			goto abort;
> +
> +		cfg = val;
>  		cfg &= 0x1F;
>  
> -		i2c_smbus_write_byte_data(client, AD7418_REG_CONF,
> +		val = i2c_smbus_write_byte_data(client, AD7418_REG_CONF,
>  						cfg | AD7418_CH_TEMP);
> +		if (val < 0)
> +			goto abort;
> +
>  		udelay(30);
>  
>  		for (i = 0; i < 3; i++) {
> -			data->temp[i] =
> -				i2c_smbus_read_word_swapped(client,
> -						AD7418_REG_TEMP[i]);
> +			val = i2c_smbus_read_word_swapped(client,
> +							  AD7418_REG_TEMP[i]);
> +			if (val < 0)
> +				goto abort;
> +
> +			data->temp[i] = val;
>  		}
>  
>  		for (i = 0, ch = 4; i < data->adc_max; i++, ch--) {
> -			i2c_smbus_write_byte_data(client,
> -					AD7418_REG_CONF,
> -					cfg | AD7418_REG_ADC_CH(ch));
> +			val = i2c_smbus_write_byte_data(client, AD7418_REG_CONF,
> +					cfg | AD7418_REG_ADC_CH(ch));
> +			if (val < 0)
> +				goto abort;
>  
>  			udelay(15);
> -			data->in[data->adc_max - 1 - i] =
> -				i2c_smbus_read_word_swapped(client,
> -						AD7418_REG_ADC);
> +			val = i2c_smbus_read_word_swapped(client,
> +							  AD7418_REG_ADC);
> +			if (val < 0)
> +				goto abort;
> +
> +			data->in[data->adc_max - 1 - i] = val;
>  		}
>  
>  		/* restore old configuration value */
> -		i2c_smbus_write_word_swapped(client, AD7418_REG_CONF, cfg);
> +		val = i2c_smbus_write_word_swapped(client, AD7418_REG_CONF,
> +						   cfg);
> +		if (val < 0)
> +			goto abort;
>  
>  		data->last_updated = jiffies;
>  		data->valid = 1;
>  	}
>  
>  	mutex_unlock(&data->lock);
> +	return 0;
>  
> -	return data;
> +abort:
> +	data->valid = 0;
> +	mutex_unlock(&data->lock);
> +	return val;
>  }
>  
>  static ssize_t temp_show(struct device *dev, struct device_attribute *devattr,
>  			 char *buf)
>  {
>  	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> -	struct ad7418_data *data = ad7418_update_device(dev);
> +	struct ad7418_data *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = ad7418_update_device(dev);
> +	if (ret < 0)
> +		return ret;
> +
>  	return sprintf(buf, "%d\n",
>  		LM75_TEMP_FROM_REG(data->temp[attr->index]));
>  }
> @@ -116,7 +144,12 @@ static ssize_t adc_show(struct device *dev, struct device_attribute *devattr,
>  			char *buf)
>  {
>  	struct sensor_device_attribute *attr = to_sensor_dev_attr(devattr);
> -	struct ad7418_data *data = ad7418_update_device(dev);
> +	struct ad7418_data *data = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = ad7418_update_device(dev);
> +	if (ret < 0)
> +		return ret;
>  
>  	return sprintf(buf, "%d\n",
>  		((data->in[attr->index] >> 6) * 2500 + 512) / 1024);
