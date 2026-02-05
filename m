Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A67B27B352
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Feb 2026 19:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770319908; cv=none; b=NptCnseIr9XdQH0qW7eLmaWTgLadk+1iFjsN4ScJRxLyY9dWIqVZQTzyDuYVP/5enA63MkwwAi1yZhQIgRn1jqDom4kqDp6F4emuaUOV98wOKcDs0g10fq5yjftmuklYtLELS3cgQUUVNsMbDOHIknEzwCYS9WcvoHzmcj0AXDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770319908; c=relaxed/simple;
	bh=SNSK7Cot9ZIbbKE74SRCFLW/frVlnHaL3hZaVj368qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ig1pwU5nmYI+Ij/GM2CLl5/TXDWMaZSzrFikP6c1hG1viQU3UiOsFnIhbp4RLYZaR5x33Wx0SiNX509zYQ/+TJkCRwS4GavbxXfTthtNpUcedrIdMdh2T2mDBB1FQsRcgQmH13aspbm9dVHhQiwvYFALY9tcdl3SQ8GOqvfD8K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mbKV4Z6W; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mbKV4Z6W"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-124b117776fso867950c88.0
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Feb 2026 11:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770319907; x=1770924707; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ArrtrCatvVEunchquCbZFqkaHBYMn7L4hO5jWdJUlIM=;
        b=mbKV4Z6W3nrgpmNEBq9EGyzlDCzzSf48nFduAryajbPUi6Di5wV4hRoK3X9r0/bKp6
         gFDkm8VdjboicmaeyicQY42D5TMMZxlI5JVAb6SDScuoRAFdFugHn58Y7J/r/weztBb6
         66iFHRGNTkW1BB9tJsGqGQSWUiAhNa+PCroWIpas5O/KMcDO//vDnvJZ1fneqrH3fqNA
         +S8a6FnexvgKyxcO+1mWSaeV+PlfHCtFFJ5+snMkSjjMvg32XRSr51RM5Iqzg7JyBjCA
         t2k+mbii6UbOyGNMjFulPI7rvfvlxUgD1eVECQHedAXhxku84bwQl2o4WzbnOtx6Edb0
         Mx5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770319907; x=1770924707;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ArrtrCatvVEunchquCbZFqkaHBYMn7L4hO5jWdJUlIM=;
        b=AE4DKoeC2elR25NwEETq+WcVpsQ3zBf3FQf9YlpjR9H2nTZ6ZPLCtLC77WQt8OXQcs
         XNAcM+kbpdwJ7xMdOyia0AOh+0L2x2WDjJBxoHfReXCcNTtWY+wm75iBNCe4G7tM5rOF
         OQ9ak/JiP9HvY5bR+W5p0dI/pTXDEeZqDl1Nm+NIIx0gy8JTsyuQ8HwVm6LuClSV/baH
         JPd/7GKeV4qCTPqrDqV1IXXD+MtSKG6ihmKjrw2rUwwFYFPFQ5gMlpVt6EQb8oO2T9aA
         kBOc2I2FdM6tCX0xUbPUiyNsNTJusjFB0bBy2JzAzyoAMdB9O4QJ3v1NSHL0xp/5Ok1H
         aLWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnSd/sbqnNPd3VXxydeUlUdU0ovFBqZFnQzlmFbcaHNM8Blo9CypIjJiukMixzB9BBuo1mJED4lseyUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyqRPLkHOxze6Jmlpcr8GvTs3vg2StXwr8yYE1SRpfRRxZ8OCqn
	xZGNeqChi84mWZBCRHxal4xCPckLGvV0yamLN98tAlLkor72FkhmEYCh
X-Gm-Gg: AZuq6aJlXW6Yz7Qy3zWYSxqRaDCaio++fT6RQKIifECewISbRsRyfdIchv2nYHVX9Rg
	mwOsrxKjWDMW0MCgCMsQ253pszt4P2h3hoJLhuLBYa5gWGQXjLihn2v/XxbnaZ3C/obKbmR/T/0
	xZs0ujwKOxCszjB+9MlMen6+2rcNHmjeTTT8Ry9l1sgTYLMgx3Z98iOZuUCLrgSGpXsPQF46PVj
	/cC799RDJkdK5j7LfC5XxGAeIh7CyjEk//zzJoCQIqpQDAlETcxAZLwLffIwGen22tvD70HdpjH
	TEkwoaY5aD9eijVihCXDkg6NyLNkWgwKhtm3DmqdTadONFJd/igtjBLLv/kcKYF+ymbth1Iqmyz
	QV68xVFFI8lsilh9IEKdjY5LrXg7iepSpDbwdi/CSzMvc5EuaQUJmBTpzSOtHKPqOokhXUoceE1
	t3fkxhBfRxPWavifHcRM2fHne0
X-Received: by 2002:a05:7022:6611:b0:119:fb9c:4ebb with SMTP id a92af1059eb24-12704049ad1mr125795c88.30.1770319906948;
        Thu, 05 Feb 2026 11:31:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm175140c88.8.2026.02.05.11.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 11:31:46 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 5 Feb 2026 11:31:45 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Marius Cristea <marius.cristea@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 2/2] hwmon: temperature: add support for EMC1812
Message-ID: <22549d9e-62fb-4ffb-aa18-50b65fa2591e@roeck-us.net>
References: <20260205-hw_mon-emc1812-v5-0-232835aefe8f@microchip.com>
 <20260205-hw_mon-emc1812-v5-2-232835aefe8f@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260205-hw_mon-emc1812-v5-2-232835aefe8f@microchip.com>

On Thu, Feb 05, 2026 at 09:09:04AM +0200, Marius Cristea wrote:
> This is the hwmon driver for Microchip EMC1812/13/14/15/33
> Multichannel Low-Voltage Remote Diode Sensor Family.
> 
> EMC1812 has one external remote temperature monitoring channel.
> EMC1813 has two external remote temperature monitoring channels.
> EMC1814 has three external remote temperature monitoring channels and
> channels 2 and 3 supports anti parallel diode.
> EMC1815 has four external remote temperature monitoring channels and
> channels 1/2  and 3/4 supports anti parallel diode.
> EMC1833 has two external remote temperature monitoring channels and
> channels 1 and 2 supports anti parallel diode.
> 
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>
> ---
...
> diff --git a/drivers/hwmon/emc1812.c b/drivers/hwmon/emc1812.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..30bbc377d592622b07a156732b71cad555987934
...
> +static int emc1812_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +			 int channel, long val)
> +{
> +	struct emc1812_data *data = dev_get_drvdata(dev);
> +	unsigned int interval, regval;
> +	int convrate;
> +
> +	switch (type) {
> +	case hwmon_temp:
> +		/* Range is always -64 to 191.875°C */
> +		val = clamp_val(val, -64000, 191875);
> +		val = val + (EMC1812_TEMP_OFFSET * 1000);
> +
> +		switch (attr) {
> +		case hwmon_temp_min:
> +		case hwmon_temp_max:
> +			return emc1812_set_temp(dev, data, channel, emc1812_temp_map[attr], val);
> +		case hwmon_temp_crit:
> +			/* critical temperature limit is stored on 8bits */
> +			val = DIV_ROUND_CLOSEST(val, 1000);
> +			return regmap_write(data->regmap, emc1812_temp_crit_regs[channel], val);

AI feedback:

If the input value is 191875 (the maximum allowed by the clamp above), adding the offset gives 255875.
DIV_ROUND_CLOSEST(255875, 1000) results in 256. Since the registers are 8-bit, this will be truncated
to 0 (-64 degrees C), potentially causing an immediate critical alarm. The value should be clamped
to 255 for 8-bit registers. This also applies to emc1812_set_temp() for the internal channel (channel 0).

> +		case hwmon_temp_crit_hyst:
> +			/* critical temperature hysteresis is stored on 8bits */
> +			regval = DIV_ROUND_CLOSEST(val, 1000);
> +			return emc1812_set_hyst(data, channel, regval);

The same problem really applies to emc1812_set_hyst() as well. It clamps
the register value to (0, 256). 256 is truncated to 0. So either the clamp
in emc1812_set_hyst() is not needed (I didn't check possible value ranges)
or it is wrong.

...

> +	i2c_set_clientdata(client, data);

I don't immediately see why this would be needed.

Thanks,
Guenter
