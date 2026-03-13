Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904113DEADB
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Mar 2026 18:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773427088; cv=none; b=mcjAY8B0ZxUqoS2tN29ZxwCsyr1WGYsoUXTza6aQoLXyP59HsaOwNskAZB2qTzmXKzO/R+2WCQONFv6XhQbkW8vkcZ/lVQXsUcf2GFN4r/JRqFB0vtM5h/4DUrCsQiopDpQWjXaO7033iQ9WVOCbDv4f0Fou6IuNywZc+t7abm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773427088; c=relaxed/simple;
	bh=IC3W1fF8lre9ZUCS8NDhRva8zIinkQfLZ7J80XkE+wM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQ96JH9jJ/+p2iT64eQT6ehAyCcU+KEFFbd/0Ho/LihbODF+wAh9ccbKf+1NZBRgOpJvxjcNj5x9v+QUSU7u25U8Lz4Ix+NNCVx7pIbK2QKs5W+gxk4EIAauE6JNpNZ8nUKXqM7CaGo73nJE2GGPioHHKDvhDdjxDp6sXBUboj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ob1WRnqN; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ob1WRnqN"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2beab594d8eso1259676eec.0
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Mar 2026 11:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773427079; x=1774031879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eg7eI9ivG3+/ZJvb3PtZ/9IeNP82PhJuviBrZwDJey8=;
        b=Ob1WRnqNqPegpR4NDAuVyQnNY6+cfYo3ijqj7LCAeNq75zkvCjVQTgKF3XtUdpwPkV
         xQH7MzcoD/lZx11euSaUjUKG7UM2N/CUzYXjIi+n8XYXjYzgEpSdaYzBJXiagrj3Sdsu
         Bn0zVRDpMUQPC/qK0VMLnUtPzc8UYQUm2rfET8aKy3534Y4ZN0gpicURdeD+ZPW/uPcK
         6Qy9o8GHDtkxtXnhnHPg7UdOJUiuJ3/3IlQr//G/gbyYYZh1VJmz5U9c6waAFOtL5gpB
         rQnLbMzGDM1SfOkJyCUBtpS2Cg53QY0lDWcis30axunlZxLiyRfBuixTHgWEESS2ittl
         L+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773427079; x=1774031879;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eg7eI9ivG3+/ZJvb3PtZ/9IeNP82PhJuviBrZwDJey8=;
        b=qbe3c+7T20YScIxQcnP7LxzruyqDVII8gQhGI7q32XpfbUTmTC9HbjjIg0leAFc7PF
         cnXejOVxwqxVjcE7sjzANSWFbNdki7A54Xm+NoUhN/fAxTIxagHpWETo38cNwGASWZCY
         fjKWkOYRmhetrg+W0KgJGsI52HFCf8j0cU5hI5JGsGEdbAkTMSlYiC71Xeb7NUQJGlAl
         UXU40F6BBaU7JxCsyMHT+jXRx6vNul7oSnxtRQVO/Tw6zl1ws9dmnKwMuopZY6z3fjJk
         o9iBxqwFClfyqc6IBd+P2s7WXwdKYESaV/wNGcNWsCzj8fjNn6YSEKO5nd9P+Xf5yAxZ
         a2Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVN+FPzafU3Dak6Enbs8hyIm1mZtY1HRTTTheiD0M2RFITVQON6kmH8fBJiQUsBEWFCimoKYErdgJXYEQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaR4B3xoQBbvX6PsSyNJJZ0h9dcrVR+8RQr04sEiq7eJbGwYjq
	MyGNQX6cdwbMvwAbHGtPrym3cK0AeItNeLvbq8f6a2KULB/FtD9kq9Z+
X-Gm-Gg: ATEYQzwEDeuAZAoSgP4eHdsRA5B7C76VhNvdaYulRirlt+/xeGbpadXlKa3y8Kjg/Gh
	RLIoWGBjHhfs9UlgJ9taQ+w4UWnABe/BE5lnl6aBaIiLpa+/ogvPlwIsNYmiG7KLdTR7YW/bFQs
	T+D+fI5ECFGZLQ+XuY3d9f8w2guEc7TBma67Ix0NnncUzcBsv3V4rr29hsYDNV0qVcCmOREax6Q
	vj7rPHOpUB+4KkXr6rIsR68OX/zTZGq2xK2Nhv2AwM7w2G7sr7RJAUHPF66u3Idy4aqD74OYqv5
	5R7AjGQtcOqKNqtJLeDtK/oBLJKSFbuvL7vBeGhbZjYfb8JZfDPpKE1/57KRmVjQujzAJu575OV
	iRmmbSj3CM2JN7oC4FfhkDc12+PvICYqH5cO8Xa3uLJ4a6FQYpY5XwmKmlYKFzS3AFtyoLNbJ5R
	tTWWgirvKdYfchQ69ioibo37kcJ9TO87/q1Nmw
X-Received: by 2002:a05:693c:408b:b0:2be:ad5b:d5a7 with SMTP id 5a478bee46e88-2bead5bd7cbmr1024934eec.4.1773427079093;
        Fri, 13 Mar 2026 11:37:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab555c44sm4279781eec.25.2026.03.13.11.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 11:37:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 13 Mar 2026 11:37:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: lm75: Add support for label
Message-ID: <b1118a3d-85bb-4214-84f0-bf12e0cd4ade@roeck-us.net>
References: <20260311105809.107357-1-flaviu.nistor@gmail.com>
 <20260311105809.107357-2-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311105809.107357-2-flaviu.nistor@gmail.com>

On Wed, Mar 11, 2026 at 12:58:08PM +0200, Flaviu Nistor wrote:
> Add support for label sysfs attribute similar to other hwmon devices.
> This is particularly useful for systems with multiple sensors on the
> same board, where identifying individual sensors is much easier since
> labels can be defined via device tree.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> ---
>  drivers/hwmon/lm75.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
> index eda93a8c23c9..66178ac63e4f 100644
> --- a/drivers/hwmon/lm75.c
> +++ b/drivers/hwmon/lm75.c
> @@ -108,6 +108,7 @@ static const unsigned short normal_i2c[] = { 0x48, 0x49, 0x4a, 0x4b, 0x4c,
>  #define PCT2075_REG_IDLE	0x04
>  
>  struct lm75_data {
> +	const char *label;
>  	struct regmap			*regmap;
>  	u16				orig_conf;
>  	u8				resolution;	/* In bits, 9 to 16 */
> @@ -363,6 +364,16 @@ static irqreturn_t lm75_alarm_handler(int irq, void *private)
>  	return IRQ_HANDLED;
>  }
>  
> +static int lm75_read_string(struct device *dev, enum hwmon_sensor_types type,
> +			    u32 attr, int channel, const char **str)
> +{
> +	struct lm75_data *data = dev_get_drvdata(dev);
> +
> +	*str = data->label;
> +
> +	return 0;
> +}
> +
>  static int lm75_read(struct device *dev, enum hwmon_sensor_types type,
>  		     u32 attr, int channel, long *val)
>  {
> @@ -534,6 +545,9 @@ static umode_t lm75_is_visible(const void *data, enum hwmon_sensor_types type,
>  		switch (attr) {
>  		case hwmon_temp_input:
>  			return 0444;
> +		case hwmon_temp_label:
> +		/* Hide label node if label is not provided */
> +			return (config_data->label) ? 0444 : 0;

Unnecessary ()

>  		case hwmon_temp_max:
>  		case hwmon_temp_max_hyst:
>  			return 0644;
> @@ -553,13 +567,14 @@ static const struct hwmon_channel_info * const lm75_info[] = {
>  	HWMON_CHANNEL_INFO(chip,
>  			   HWMON_C_REGISTER_TZ | HWMON_C_UPDATE_INTERVAL),
>  	HWMON_CHANNEL_INFO(temp,
> -			   HWMON_T_INPUT | HWMON_T_MAX | HWMON_T_MAX_HYST |
> +			   HWMON_T_INPUT | HWMON_T_LABEL | HWMON_T_MAX | HWMON_T_MAX_HYST |
>  			   HWMON_T_ALARM),
>  	NULL
>  };
>  
>  static const struct hwmon_ops lm75_hwmon_ops = {
>  	.is_visible = lm75_is_visible,
> +	.read_string = lm75_read_string,
>  	.read = lm75_read,
>  	.write = lm75_write,
>  };
> @@ -721,6 +736,9 @@ static int lm75_generic_probe(struct device *dev, const char *name,
>  	/* needed by custom regmap callbacks */
>  	dev_set_drvdata(dev, data);
>  
> +	/* Save the connected input label if available */
> +	of_property_read_string(dev->of_node, "label", &data->label);

Please use device_property_read_string().

Thanks,
Guenter

> +
>  	data->kind = kind;
>  	data->regmap = regmap;
>  
