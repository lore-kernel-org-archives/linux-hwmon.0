Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF3C25B086
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 14:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784471710; cv=none; b=jXC+y0h6kJc0iYfFla08git9MoP10IHtTaA/Wh+mGba7HuICiHjBBnAGammf4pQ5q0Yg47FyiVh6knqBAcGyJskCecp880ZSEBl7l1+BpH5b1Gurijb8q1lXzh/eEn0PljxU5n01fmh0H0Ua8/otkrz6jXdPmIJyaN5UWWfh2ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784471710; c=relaxed/simple;
	bh=IW2jPExxKBT6wO7bPnFE0Pkub0+nMkBiLUk57Iy55tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hz1M14f2PGxVf0SrwvouxWdwU73MImp8csm4txLa/AMfx50XhPqdV19Is24G5lrtEu+2XzFEWIwcDRYzDDhvridiQzk8ayOoOTX4aZSULgjgoYi1oPwc3AFwOvfGNweFZ0PaPDLDQCm6CbWe4L/wsZc923CvelR/EV/Gy97MILM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CqhKC0nU; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CqhKC0nU"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cee9b74ee1so55907725ad.3
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 07:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784471708; x=1785076508; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3mMOZLOn+ug3WCgazWkuZpH7WbHIxWMuuhqF8JhrA40=;
        b=CqhKC0nU4Lz8Ub/OvRZHfur1gAkZdBkjd0aakzhMxriTJgf/VOHG/UwLIN6oirChCa
         6awARuMyq9TTOezdBGGvbhqDfGqbUUp7HcyRTnNA8ev/a8K6++6izBH+3IABIUrpnw9p
         H+1e8SLXnYQw5jizvWb8F/w8xYYlCcI1+bKty9p3EmMA/IQGXgVVWi/zW5BLRLgfNGYo
         mwPUK9LDB7qLlzvuvGHm1HZ0lv48+TSKg4wNfgvgzszlmtRO7qPdtt8Xd71cIHDHW/lC
         VsSdPSvU2kPHTkBE4DGLIr83g0IwKYVyWDmzDxrlC79mPYqSQFZ5EUsOwzuDhkYY94V4
         eAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784471708; x=1785076508;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3mMOZLOn+ug3WCgazWkuZpH7WbHIxWMuuhqF8JhrA40=;
        b=Zs7HbqptyGfRnrlwBUepy8krqF6YMqa4X7x2cjvHdwZ9WU3HPQEhTg2S2jfDUX9ax7
         fGKH4AVEYnrh9bL2bfBm7jS5p1Z5lGTB0s/b0RAUsD8RbNQ8ahurPdH8P4ZU7ODNaEB/
         K/hAAv0jRVE/dDMZ27JkcpXg8v/U1mqbBPOENnhkGa7liYvrZV2upY9VJWOHzLi7g9b6
         sCvFQ69hMGrAvDXKPTXoAuB0jxtNqxxQsCjLiBehgLDlYyG3OjK5Z4CEJTnySx/Y+tT6
         dHU3hV8TuQoCnssLsv4vhu/XMLxw4uS8hFUqHeNbpa7jO3XDbenIUnpZkqZCjJRrh8I5
         UEPw==
X-Forwarded-Encrypted: i=1; AHgh+RqXNfffo02UiCjXEng54A0JW/g2b+1RJ8/vEPXSbZXFp5S9+G+3cVQ/0Dp4YTvfL7O7Znj9QBUfHMVs2Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YybxzK9v9LSL321GWhK0ddoj2xGCi7OM3fi1zfAEIyswl+k25nm
	fxqrJ/aWUBrmyeoxIhWNLiypd/tH11RoRqwlBkq2Wo114h2+Zjk0RZxx
X-Gm-Gg: AfdE7cn0Q97IYtBdIHUJ0f3GJZV7Tp2CUy5c2H2Hxh/bOBGWu5s50bqPhmEBDpCGABm
	EkzowFPrMX/7fsPwajTwl0HcfPNHiI3MERRDlfCX4QUIlqtt8XYbMXOs8xlwDKCxybHDkHFnNko
	534Cdv0aYt9DfooVx6WhDrUVtCP9brt0LLEl0oHGwACNdYI1JI0vbEU14btW8VE9p6Y3guSeAOi
	g3AmoxDGPR88gmqLBFNx99o+Eh4mQQR4sYGpocgAAkp9avAyVHf+0hM6x7x0mlpDGb/l0ly69vM
	ggrtkzUlVoOXkKlq89eKLfjD6unQ2YqAmRZl8t0xNMzkhgXhCCODMT1++8lX2ScYmC077DPD6S8
	mY6vKjQQzIeYGD7bygtOLHYn00SlVrqL8+1ZEGmfN00WiIzN0OfYe6F3fOKyIbVd+hix7Glr/WJ
	MryKOqOXgxrWr5E/U=
X-Received: by 2002:a17:902:d2cb:b0:2c9:feea:4e4c with SMTP id d9443c01a7336-2cf34887d67mr106322705ad.15.1784471707707;
        Sun, 19 Jul 2026 07:35:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b1f04sm41777995ad.22.2026.07.19.07.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:35:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:35:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Sung-Chi Li <lschyi@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] hwmon: (cros_ec) Store the hwmon device in
 cros_ec_hwmon_priv
Message-ID: <d02a06cb-403b-43c1-bfcd-da5d2ac87bce@roeck-us.net>
References: <20260711-cros_ec-hwmon-locking-v1-0-cb6d0fdbb2d3@weissschuh.net>
 <20260711-cros_ec-hwmon-locking-v1-2-cb6d0fdbb2d3@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260711-cros_ec-hwmon-locking-v1-2-cb6d0fdbb2d3@weissschuh.net>

On Sat, Jul 11, 2026 at 11:59:06AM +0200, Thomas Weiﬂschuh wrote:
> The upcoming locking scheme for thermal devices will require access
> to the hwmon device.
> 
> Add it do the priv struct.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/cros_ec_hwmon.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> index f9b19da50472..fb5daa9f80d1 100644
> --- a/drivers/hwmon/cros_ec_hwmon.c
> +++ b/drivers/hwmon/cros_ec_hwmon.c
> @@ -25,6 +25,7 @@
>  
>  struct cros_ec_hwmon_priv {
>  	struct cros_ec_device *cros_ec;
> +	struct device *hwmon_dev;
>  	const char *temp_sensor_names[EC_TEMP_SENSOR_ENTRIES + EC_TEMP_SENSOR_B_ENTRIES];
>  	u8 usable_fans;
>  	bool fan_control_supported;
> @@ -556,7 +557,6 @@ static int cros_ec_hwmon_probe(struct platform_device *pdev)
>  	struct cros_ec_dev *ec_dev = dev_get_drvdata(dev->parent);
>  	struct cros_ec_device *cros_ec = ec_dev->ec_dev;
>  	struct cros_ec_hwmon_priv *priv;
> -	struct device *hwmon_dev;
>  	u8 thermal_version;
>  	int ret;
>  
> @@ -580,10 +580,10 @@ static int cros_ec_hwmon_probe(struct platform_device *pdev)
>  	priv->temp_threshold_supported = is_cros_ec_cmd_available(priv->cros_ec,
>  								  EC_CMD_THERMAL_GET_THRESHOLD, 1);
>  
> -	hwmon_dev = devm_hwmon_device_register_with_info(dev, "cros_ec", priv,
> -							 &cros_ec_hwmon_chip_info, NULL);
> -	if (IS_ERR(hwmon_dev))
> -		return PTR_ERR(hwmon_dev);
> +	priv->hwmon_dev = devm_hwmon_device_register_with_info(dev, "cros_ec", priv,
> +							       &cros_ec_hwmon_chip_info, NULL);
> +	if (IS_ERR(priv->hwmon_dev))
> +		return PTR_ERR(priv->hwmon_dev);
>  
>  	cros_ec_hwmon_register_fan_cooling_devices(dev, priv);
>  
