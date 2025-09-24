Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C13CF30F543
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 16:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758729979; cv=none; b=lbFuPsvwUJvWOM99SoBu5gocKyk5gu0XKVzBpphCC3+NxheZW6PvlQNuQWH2jnMv1+jPX6woKY0YmJvS5RUC+h5MpJFKW/UZzGNgbdD9mIAj44ozzWIYADNubIIuH7tqiYOtXIG6Lh00zz3kDRb/gzcUVMzCpcLAJYwrVMqVtsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758729979; c=relaxed/simple;
	bh=RlgzAqEmJctrExkohclF3JO07Tmu3wf5hlNJ/lE7s9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZiICZL0cJ2rprB03Ni25SKrLldsIBgJGvSJx3UtN4sW8wHSiiC9d+EcEkxqABRsTfJ2qj2t2Ihdx0wKMSLS1mKUOUf+sixvGOSla0Iw/MafmnqyPVczjxkyv/URpdDU6lQKfjxVdtKYZA1QCX8NbQQVzwqIguEnaTgUOPLxC7Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fmAW9wrD; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmAW9wrD"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-77f22902b46so24784b3a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 09:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758729977; x=1759334777; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nSQu/2RCtWocxRG8xJXQfc/9cGGCdtiO/pXeSzUp62k=;
        b=fmAW9wrDc/mmS0qsAWyQ98Y7msPqpFWHKPh3TUuYnDpEiF1id91lY3V+AbMRameE5i
         qkOEpKysQS2uS70R1uOzvJIwRGiknySKfEwsRSzpRf1VSIsMCmcVaNDJozRfer1XLN4G
         4bt8RR1EnsBMKN6H55ZTbHMOlMDNGnKkzToNlxeZhU6Ixrhe96g2DhIgW2krJTLFlu8n
         Y4wdO3wXkrO2Ym6woZ8mPcz6GINDGz0NqD3krJ3gmfotX15rnVzUP8oBTC0Um/KZ364V
         idNeDRrrlXvNy2gmOVvZq7pngu9RVKpeHXCwP4GyZVyXPBC2tpwC8xnA/KEmKlGT9QpA
         N7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758729977; x=1759334777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nSQu/2RCtWocxRG8xJXQfc/9cGGCdtiO/pXeSzUp62k=;
        b=SIFtny61gAjQcSHfm/Ex/sFW+NP2VBFb/Rb+U9CX5T6vdDeC1LD2e0ELnJb/QC/+1b
         gRL3BZpOMGuLHS5lrxdgaj5+D0fLCl8yz77UXdc8VnWzkgFUK3GiT7ND8fF1+edTeQBr
         HmGRREe4b5xHQcRMK1KBGJwwKi2cFoA009iR+Bgvk34d8GgN3IR9g8GbcpfN8gayVzb1
         2YgXPxMI8cBCAP4kwfAOh77tR7N1m6ACG2btARIeCJCkuz6v7twcwTJD0kWSAZytki6g
         1buWs/wfVNdK9hLOpXzIWo7QSCGCtxLS3loPiubgr2v93UaVkCE08gXHB3DEF+KhXQ0v
         Zd+w==
X-Forwarded-Encrypted: i=1; AJvYcCVoN5guj3CyB1RMNb6Zx1Ghasbn7fCw5GTV3P7CimifyZFfTfqW5dEWYEGTKYiyeUIqbL2F15hNO/mSVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YynrKQyze6yQTreqaduZB0/WLPmHttLf+XlBx8Jlh5n8MqvA7F2
	9WKpIT2zj2G+xZEVjSTjQKfT6uidQWuqAa7DtnXawhEp0/Q+gVf1XBFq
X-Gm-Gg: ASbGncvIXsV6Y1lSL5kqh+zbo9pXGOWCH70Xw9APFjBbBpNbJ+IVlm39kvx/G63IrSS
	tfj3t3ytFi2d7Urr2UQ6wVVeK6XbB0b5UoTtZhzW3/2qn1r0AKk9ccG8zKHMf4Cs1lsIoRXUCU+
	Bwg3jzbbEXHQKP4lDPAX5PNa31ij35OxkMPslegED2HnH4MN6LphGllPhA3XSSWeGxMRCI15QgY
	HQBRO+wR6J16tAFFHjdTUx7Wo/TCi3LpBJ+tbJl2eCcscDuoPaNBZe/n7s2zQisuPoMowXJsv48
	20QVjBrvrln1Tl5BlWDyz7y8bOkcuoQfw04Z3X+xma24rlQoUGUaw7H44Q6STX0L0Rald2UqCTl
	ZG2tdhLk/dpbtIKtCkB4gy6ODqBjMX5zIPVQ=
X-Google-Smtp-Source: AGHT+IGNtKUIe+fhs7JwdpbdHjDoCm1EBcvJPx7BHY+BU8eg+XY3rYFS80UFfMM6cMn1jgotagqw2A==
X-Received: by 2002:a05:6a00:139a:b0:77f:47e3:310b with SMTP id d2e1a72fcca58-780fcdfe486mr542247b3a.1.1758729976940;
        Wed, 24 Sep 2025 09:06:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f60b0d7e1sm3649468b3a.24.2025.09.24.09.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 09:06:16 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 09:06:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: jdelvare@suse.com, lgirdwood@gmail.com, broonie@kernel.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alistair Francis <alistair@alistair23.me>
Subject: Re: [PATCH 2/2] hwmon: (sy7636a) enable regulator only if needed
Message-ID: <25ef8eef-a4e6-436b-87cd-c77506b4b215@roeck-us.net>
References: <20250920114311.291450-1-andreas@kemnade.info>
 <20250920114311.291450-3-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250920114311.291450-3-andreas@kemnade.info>

On Sat, Sep 20, 2025 at 01:43:11PM +0200, Andreas Kemnade wrote:
> Avoid having all the regulators in the SY7636A enabled all the time
> to significantly reduce current consumption. In pratical scenarios,
> the regulators are only needed when a refresh is done on the epaper
> display powered by the SY7636A. This is can save around 10mA which
> is much for this kind of devices.
> Also fixes the asymmetrical single enable call.
> 
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> ---
>  drivers/hwmon/sy7636a-hwmon.c | 34 ++++++++++++++++++++++++----------
>  1 file changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hwmon.c
> index e83d0e50c735..0fda69bea3b4 100644
> --- a/drivers/hwmon/sy7636a-hwmon.c
> +++ b/drivers/hwmon/sy7636a-hwmon.c
> @@ -18,14 +18,26 @@
>  
>  #include <linux/mfd/sy7636a.h>
>  
> +struct sy7636a_hwmon_data {
> +	struct regmap *regmap;
> +	struct regulator *regulator;
> +};
> +
> +
>  static int sy7636a_read(struct device *dev, enum hwmon_sensor_types type,
>  			u32 attr, int channel, long *temp)
>  {
> -	struct regmap *regmap = dev_get_drvdata(dev);
> +	struct sy7636a_hwmon_data *drvdata = dev_get_drvdata(dev);
>  	int ret, reg_val;
>  
> -	ret = regmap_read(regmap,
> +	ret = regulator_enable(drvdata->regulator);
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_read(drvdata->regmap,
>  			  SY7636A_REG_TERMISTOR_READOUT, &reg_val);

Does that really work without delay ? Usually it takes some time for a chip
to return useful data after its power supply has been enabled.

Guenter

> +	regulator_disable(drvdata->regulator);
> +
>  	if (ret)
>  		return ret;
>  
> @@ -66,23 +78,24 @@ static const struct hwmon_chip_info sy7636a_chip_info = {
>  static int sy7636a_sensor_probe(struct platform_device *pdev)
>  {
>  	struct regmap *regmap = dev_get_regmap(pdev->dev.parent, NULL);
> -	struct regulator *regulator;
> +	struct sy7636a_hwmon_data *drvdata;
>  	struct device *hwmon_dev;
>  	int err;
>  
>  	if (!regmap)
>  		return -EPROBE_DEFER;
>  
> -	regulator = devm_regulator_get_optional(&pdev->dev, "vcom");
> -	if (IS_ERR_OR_NULL(regulator))
> -		return -EPROBE_DEFER;
> +	drvdata = devm_kzalloc(&pdev->dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
>  
> -	err = regulator_enable(regulator);
> -	if (err)
> -		return err;
> +	drvdata->regmap = regmap;
> +	drvdata->regulator = devm_regulator_get_optional(&pdev->dev, "vcom");
> +	if (IS_ERR_OR_NULL(drvdata->regulator))
> +		return -EPROBE_DEFER;
>  
>  	hwmon_dev = devm_hwmon_device_register_with_info(&pdev->dev,
> -							 "sy7636a_temperature", regmap,
> +							 "sy7636a_temperature", drvdata,
>  							 &sy7636a_chip_info, NULL);
>  
>  	if (IS_ERR(hwmon_dev)) {
> @@ -102,5 +115,6 @@ static struct platform_driver sy7636a_sensor_driver = {
>  };
>  module_platform_driver(sy7636a_sensor_driver);
>  
> +MODULE_ALIAS("platform:sy7636a-temperature");
>  MODULE_DESCRIPTION("SY7636A sensor driver");
>  MODULE_LICENSE("GPL");
