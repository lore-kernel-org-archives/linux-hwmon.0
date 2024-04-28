Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E99771B24
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Apr 2024 18:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714327249; cv=none; b=CTQzAe3fZF6++7TLst7+NZNnmdR8nO0LeFFu1OVxzWVYlksXOQfAr/Ui8/jvXGKvNDYNuTHMICnlDACnt6F7+GPxN3/wI3WdNpFdg+0LwqQxtXsoNXfsxJcyfGyS02uNym/tqZSSqgZmnpIPAVZtzB0hK65XJmy9ZT6EbbYOyBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714327249; c=relaxed/simple;
	bh=ewTbeOqINPwqWb07BtjnMbGckQnCYtpxl/Dq6j3tNT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A2Bl/kXI79372WSwBmn3d+9jgNqcDkXV9oXeRbzhiNJHAaKWecp8GpYTXWMtODXceePau0HQynC5zsIJ4qrSvXy4XCmUWfKfkrZHB3ijeFCGM2D8yO6mmVoOrKGiWYWYng8LdgkW1p/XFNb+ZssNlr4+NqOieRS0KFA12qPXlns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SxJxq8bS; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SxJxq8bS"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6f07de6ab93so3438765b3a.2
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Apr 2024 11:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714327247; x=1714932047; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lJLGlZY2L98q0amH9/OZOKq6aDPhJNtYmJQYGUK94Aw=;
        b=SxJxq8bSFurmGOAn/rscuNx2EXmYG5pun+MLnG/nsLINe0K2xfr8B+ex3K60oOHD61
         xPs0FsTRQDsPEj4lb8kouw+BZ8rFK5Q4+w8Kk9OUBfw+XvN8ERY7DGJxhWWENSIXpWAL
         ygmU2TzO92r69W5fsnO67iYJQdqIBmzOMOIi4Rj7Culp08YdxdpYXpZMesfND2VgGrMK
         XYbp1TY2KYEWD9nifuDePY58Gv3vfYN7M5zmgO+7h6mPuExpIBWORL3HRuxRTfGPWFf7
         EbnCnFG+G7bgIA2aWtD04tUymSoVWlXCsriIhGv4Su/nBEvcltcKnbDcy4m7q5wiVz1H
         wH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714327247; x=1714932047;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJLGlZY2L98q0amH9/OZOKq6aDPhJNtYmJQYGUK94Aw=;
        b=KaDz6zLwVsntpJAMjJY01vJ+g/mOH+3dAduFN/VhOkaBVAuNALnZfM1nN8Hz78FCGl
         DN7ygNr0fINSyGGGSzI5dTyxCuJRfVdd4ce7jvtVkE0CBYubIaqMVCOENeDg8OVCNx6+
         2s8z1vlGdqTDB2yXQroBlIHmAs4wC6K0YI/cc/bg6gkeuXtil3SDu4SqomJMIvwAPPR+
         +wd4nO54nORJbelnpdI5QPZDOwsEB8XeEX2aQBsbaF+W2iC+w8/H6wB2800iYhO7LPKd
         OlOppbRjSdC5jJ+wywaG5UCf73wDuGIsF7uAwZowt2X57xMulxnCoDWgHhjpvpZ3j9hf
         2ZQA==
X-Forwarded-Encrypted: i=1; AJvYcCVs4Uigt0FXji498n6qcNT+g3LkcM03NDv1cMZBNgpRcTp/nUGp4HssnoK9HJgXGTGESmxxKrcRosmlJzVVoYmEGZlfLlcpTs8VwYQ=
X-Gm-Message-State: AOJu0YwoW3NFn8vH31y7E8f+IKc1dhF8bqKH3QGl8EbR1RKBWt+jFTO2
	TgMzemeSHCGHmEhuFoa/nj3X8u3thYlVIwNJaiAMrbnlZCeH4Z/35R7ilw==
X-Google-Smtp-Source: AGHT+IHWr8VuYOZQ1LyDmGXWNK5mHLkpkWq/bOggeEbK65HEN+edRunDeUZU5k/kqDL65PcNfFImHA==
X-Received: by 2002:a05:6a00:21cc:b0:6ed:1012:9565 with SMTP id t12-20020a056a0021cc00b006ed10129565mr9980773pfj.15.1714327247175;
        Sun, 28 Apr 2024 11:00:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g14-20020a62f94e000000b006f2d97c3e87sm11811920pfm.125.2024.04.28.11.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 11:00:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 28 Apr 2024 11:00:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Lars Petter Mostad <larspm@gmail.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	Lars Petter Mostad <lars.petter.mostad@appear.net>
Subject: Re: [PATCH] hwmon: (emc1403) Decode fractional temperatures.
Message-ID: <56b04367-8b5a-4c73-a741-729c55daf83e@roeck-us.net>
References: <20240426141322.609642-1-lars.petter.mostad@appear.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240426141322.609642-1-lars.petter.mostad@appear.net>

On Fri, Apr 26, 2024 at 04:13:22PM +0200, Lars Petter Mostad wrote:
> Decode all diode data low byte registers.
> 
All ?

> Signed-off-by: Lars Petter Mostad <lars.petter.mostad@appear.net>
> ---
>  drivers/hwmon/emc1403.c | 34 ++++++++++++++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
> 
> 
> base-commit: e723f6ca39fb54ae31f79b5af74fe8496308d4de
> 
> diff --git a/drivers/hwmon/emc1403.c b/drivers/hwmon/emc1403.c
> index d370efd6f986..2b14db802f96 100644
> --- a/drivers/hwmon/emc1403.c
> +++ b/drivers/hwmon/emc1403.c
> @@ -37,13 +37,43 @@ static ssize_t temp_show(struct device *dev, struct device_attribute *attr,
>  {
>  	struct sensor_device_attribute *sda = to_sensor_dev_attr(attr);
>  	struct thermal_data *data = dev_get_drvdata(dev);
> -	unsigned int val;
> +	unsigned int val, val_lowbyte;

FWIW, this is wrong. The upper bit of the high byte is a sign bit
on emc1438.

>  	int retval;
> +	int idx_lowbyte;
> +
> +	switch (sda->index) {
> +	case 0x00:
> +		idx_lowbyte = 0x29;
> +		break;
> +	case 0x01:
> +		idx_lowbyte = 0x10;
> +		break;
> +	case 0x23:
> +	case 0x2a:
> +	case 0x41:
> +	case 0x43:
> +	case 0x45:
> +	case 0x47:
> +		idx_lowbyte = sda->index + 1;
> +		break;

What about the following ?

2c -> 2e
2d -> 2f

> +	default:
> +		idx_lowbyte = 0;
> +	}
>  
>  	retval = regmap_read(data->regmap, sda->index, &val);
>  	if (retval < 0)
>  		return retval;
> -	return sprintf(buf, "%d000\n", val);
> +
> +	if (idx_lowbyte) {
> +		retval = regmap_read(data->regmap, idx_lowbyte, &val_lowbyte);
> +		if (retval < 0)
> +			val_lowbyte = 0;

This is an error and should be handled, not ignored.

> +	} else {
> +		val_lowbyte = 0;
> +	}
> +
> +	return sprintf(buf, "%d\n",
> +		       (((val << 8) | val_lowbyte) * (u32)1000) >> 8);

The u32 typecast is unnecessary and would interfer with negative temperatures.

Guenter
