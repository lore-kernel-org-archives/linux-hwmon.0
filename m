Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0DD3ACA57
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Mar 2026 05:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774504380; cv=none; b=V0+Gt/maVc3BbaJEEHB7AfwSv6VStYuNCo1SMIn4ccEagWcL0ybXnOLnwZDzAK5ifTQUaQZ4amOTEyM58KUDI6WnVKNgScaslPOh5cGsOeUJKUdaV7FuqJuV4muxd9IwSYM9FNqGcJ8yqXdSepjlR9WsxGLKbjTTDb4eesYU0W0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774504380; c=relaxed/simple;
	bh=0yhZX0DH8A5C35IHXsYkFJYJVmgHMHBij5UNfrFZogE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VozISFjdcqXo+GfUuHDPCL3UvDIm/P2F6wETwMMPsvzFH5u6zXjmyJLrKqMhiZdPys7qzw2t3/UmS0obj7l2meoiqX0fJj9Tk19S3jCyJheqG+cd8R0XmFezEDCTVvvh1l4SxHv6kI/BqPiYK8jDSmYvWoj4Q6X7VTg1xTtAVhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GYdazrn4; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GYdazrn4"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2b042533de1so3122705ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 22:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774504377; x=1775109177; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VWC6Bj+K9uxHnGnEONT80OvFfh7DvFkOXxkVna9Jzek=;
        b=GYdazrn4ygt2QoOPdIY/rjWWDy2+xU8cMhE8YuOuBbJKwPoOx18T/RHtYX/Xs8FaNN
         cfIWs7QsRkPRD9l9u4OlpNwCy5gCayFhKBOCSEi9qpqxourwVlLQhFDqld93Jz0BjQMf
         WAH+Czvc57mFcUIh3QxUXNuqWOub5YnN4Cohy7blBGuCpw4Q749AUHq5SJ/NxE7EW3hk
         3Gncw44QhKqRKxooZ6g8khKiRPoighrTwHmL2jM3fcFSUeJk6eznXhilKljZprVmHKim
         udvoD8mNH7B9jAjkRaLtCbaiimMHRq1jZHYt6vj6Dm6cjUFhPP+xfm0uIWlegAci/IIj
         Gjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774504377; x=1775109177;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VWC6Bj+K9uxHnGnEONT80OvFfh7DvFkOXxkVna9Jzek=;
        b=ezw+3Lz3y0M/AawA4lnPSdD3MkBQGg++tnr+kp05qZGaM9TutfFAGfIbViAq2c13NX
         WprvHly/TypGEAe33UCch6E1jTr85eQRvPcW8GWhNIybqGSvd9yI8lH8Cp50qb8u7xEm
         5z7zqYF82ayVfV5MVOcRSsOBm2H0rv8ipHTcutrp66Qi69r1afuGe60fPRKjLGw0Sjl+
         OxzpNoqG/Mh8/uhAVm+XbdURSD56hU3j1FAO6YzPNT69LrY96+rSiIEpkoQaVYE06YVb
         oH7eA+UQDGWn4QxnbnAH0w+HN7//Way+6QC0meO+H8AYuPxUvY4bcj4oz8Mht4U3HQDt
         iAYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbaBOsYphBtzkuYHiWe7EOPzxr2jxg0CmY5pl3crA9CDRu0EXCTc9/Gw22MV/HeUoBBEKBwd6U50rEUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxjrTy82IJwx28QuRuyIqJ4DsatEsc0qvYq1KkXnbZsT1fdIPAA
	MOINMz+k+xSuQuN5CAfIxv9p78efy0xMtXnrjyds0CRNvKvnyxBRh79tueXGbw==
X-Gm-Gg: ATEYQzyctt/utKKXwPVCFzXvbgojEUEMoRnDqvUw/9/WTXokXD8z7Hm/fIwN7I3XrEN
	1Z8Oo2nosIlK+36JZ0cQu2jt6+emmvj7kB9nKEslnYLn9/OGTKh762QLCVmVuPVK4XeYnaJwPJp
	7wOOBj1nG5k8yd15BcwwLpEgPGlTr7n6XFo+/qNB6vPrJlsrUDdrWBnbDkBL+VQKR5zoFNgTsGW
	TN1b43s4HUN2Yyhw94U5tsMoMFz30+b1gxhyFcPbxBFGhw3S9ZVqESnzmCrdeOLHYRgDeAz7Bx5
	p9evbPmAlLwguxCorXjogENxWqPngu+vWjcXWxew/eyTw21t3HW20wNJ67XFH6XpJmaawmdy09H
	pNsRgS6mEaWT6daqhclV1PhggI7837a/bV6poalgZ3VYL/2i46QkdGWYgU9AQBxJJgPcjph3bYi
	HbhZoZny97gOP6h/kD3k4hHDPW+JDSUALmRo6TQqkIMDK4PiOvB45aKDw4z91CzYUBsHZD8Skto
	0QXb0BocAc=
X-Received: by 2002:a17:90b:3f46:b0:35b:e844:3bd with SMTP id 98e67ed59e1d1-35c0ddf6eabmr5677531a91.31.1774504377493;
        Wed, 25 Mar 2026 22:52:57 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c22ce693csm329442a91.14.2026.03.25.22.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 22:52:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9648e0ae-8102-4f70-866b-163fbd5050eb@roeck-us.net>
Date: Wed, 25 Mar 2026 22:52:55 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] hwmon: emc2305: Support configurable fan PWM at
 shutdown
To: florin.leotescu@oss.nxp.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Shych <michaelsh@nvidia.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: daniel.baluta@nxp.com, viorel.suman@nxp.com,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
References: <20260325160444.1736866-1-florin.leotescu@oss.nxp.com>
 <20260325160444.1736866-3-florin.leotescu@oss.nxp.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260325160444.1736866-3-florin.leotescu@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/25/26 09:04, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Some systems require fans to enter in a defined safe state during system
> shutdown or reboot handoff.
> 
> Add support for the optional Device Tree property "fan-shutdown-percent"
> to configure the shutdown PWM duty cycle per fan output.
> 
> If the property is present for a fan channel, the driver converts the
> configured percentage value to the corresponding PWM duty cycle and
> applies it during driver shutdown.
> 
> If the property is not present, the fan state remains unchanged.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>

Sashiko has a couple of concerns.

https://sashiko.dev/#/patchset/20260325160444.1736866-1-florin.leotescu%40oss.nxp.com

I don't know about the shutdown problem. If that is real, a lot of drivers
have the same problem. Don't bother about it right now.

However, the range check should indeed be a separate patch.

Thanks,
Guenter

> ---
>   drivers/hwmon/emc2305.c | 41 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
> index 64b213e1451e..722ec1d054f8 100644
> --- a/drivers/hwmon/emc2305.c
> +++ b/drivers/hwmon/emc2305.c
> @@ -32,6 +32,7 @@
>   #define EMC2305_REG_DRIVE_PWM_OUT	0x2b
>   #define EMC2305_OPEN_DRAIN		0x0
>   #define EMC2305_PUSH_PULL		0x1
> +#define EMC2305_PWM_SHUTDOWN_UNSET      -1
>   
>   #define EMC2305_PWM_DUTY2STATE(duty, max_state, pwm_max) \
>   	DIV_ROUND_CLOSEST((duty) * (max_state), (pwm_max))
> @@ -104,6 +105,7 @@ struct emc2305_cdev_data {
>    * @pwm_output_mask: PWM output mask
>    * @pwm_polarity_mask: PWM polarity mask
>    * @pwm_separate: separate PWM settings for every channel
> + * @pwm_shutdown: Set shutdown PWM.
>    * @pwm_min: array of minimum PWM per channel
>    * @pwm_freq: array of PWM frequency per channel
>    * @cdev_data: array of cooling devices data
> @@ -116,6 +118,7 @@ struct emc2305_data {
>   	u8 pwm_output_mask;
>   	u8 pwm_polarity_mask;
>   	bool pwm_separate;
> +	s16 pwm_shutdown[EMC2305_PWM_MAX];
>   	u8 pwm_min[EMC2305_PWM_MAX];
>   	u16 pwm_freq[EMC2305_PWM_MAX];
>   	struct emc2305_cdev_data cdev_data[EMC2305_PWM_MAX];
> @@ -539,6 +542,7 @@ static int emc2305_of_parse_pwm_child(struct device *dev,
>   				      struct device_node *child,
>   				      struct emc2305_data *data)
>   {	u32 ch;
> +	u32 pwm_shutdown_percent;
>   	int ret;
>   	struct of_phandle_args args;
>   
> @@ -548,6 +552,12 @@ static int emc2305_of_parse_pwm_child(struct device *dev,
>   		return ret;
>   	}
>   
> +	if (ch >= EMC2305_PWM_MAX) {
> +		dev_err(dev, "invalid reg %u of node %pOF (valid range 0-%u)\n", ch, child,
> +			EMC2305_PWM_MAX - 1);
> +		return -EINVAL;
> +	}
> +
>   	ret = of_parse_phandle_with_args(child, "pwms", "#pwm-cells", 0, &args);
>   
>   	if (ret)
> @@ -579,6 +589,16 @@ static int emc2305_of_parse_pwm_child(struct device *dev,
>   	}
>   
>   	of_node_put(args.np);
> +
> +	ret = of_property_read_u32(child, "fan-shutdown-percent",
> +				   &pwm_shutdown_percent);
> +
  > +	if (!ret) {
> +		pwm_shutdown_percent = clamp(pwm_shutdown_percent, 0, 100);
> +		data->pwm_shutdown[ch] =
> +			DIV_ROUND_CLOSEST(pwm_shutdown_percent * EMC2305_FAN_MAX, 100);
> +	}
> +
>   	return 0;
>   }
>   
> @@ -631,6 +651,9 @@ static int emc2305_probe(struct i2c_client *client)
>   	if (ret)
>   		return ret;
>   
> +	for (i = 0; i < EMC2305_PWM_MAX; i++)
> +		data->pwm_shutdown[i] = EMC2305_PWM_SHUTDOWN_UNSET;
> +
>   	pwm_childs = emc2305_probe_childs_from_dt(dev);
>   
>   	pdata = dev_get_platdata(&client->dev);
> @@ -714,6 +737,23 @@ static int emc2305_probe(struct i2c_client *client)
>   	return 0;
>   }
>   
> +static void emc2305_shutdown(struct i2c_client *client)
> +{
> +	int i;
> +	int ret;
> +	struct emc2305_data *data = i2c_get_clientdata(client);
> +
> +	for (i = 0; i < data->pwm_num; i++) {
> +		if (data->pwm_shutdown[i] != EMC2305_PWM_SHUTDOWN_UNSET) {
> +			ret = i2c_smbus_write_byte_data(client, EMC2305_REG_FAN_DRIVE(i),
> +							data->pwm_shutdown[i]);
> +			if (ret < 0)
> +				dev_warn(&client->dev,
> +					 "Failed to set shutdown PWM for ch %d\n", i);
> +		}
> +	}
> +}
> +
>   static const struct of_device_id of_emc2305_match_table[] = {
>   	{ .compatible = "microchip,emc2305", },
>   	{},
> @@ -726,6 +766,7 @@ static struct i2c_driver emc2305_driver = {
>   		.of_match_table = of_emc2305_match_table,
>   	},
>   	.probe = emc2305_probe,
> +	.shutdown = emc2305_shutdown,
>   	.id_table = emc2305_ids,
>   };
>   

