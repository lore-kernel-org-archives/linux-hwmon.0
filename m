Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A98C332610
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 23:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782860859; cv=none; b=suA3W0q0XYuT34C/ZJMb6JMgFxk4WsIEbR+T0dpMzGjyeuYoYHNDJY2L6jooWUd3yLmLSWqyuO3oLytDNMdmadADNIKCEvarqrwCnDu4cm8TWMC1Gf70SkPnFhqDN4CodyiayTJOc0uINH5jXwpc9M7y2mq+oKNLEqwqE+HRczk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782860859; c=relaxed/simple;
	bh=3OA8qHvCQBNwM6PHuoZPIH4mDqqaedVoVXMNlo97b40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qjx8yHONR7wdM/gAJEEC6Nlyc+0rlx9WrCq4J6u4tPIvlX2QCq+O0z88yRBwZPW4fKJkyb09E1BEWBCcyrqtVNi6QJqJPAGIWFPbVarrKLmwJOJAisX409x5wW+YKBbZOL8dtcwXV2xv91oQvE+uENaHMlHXs+i6k0YHWpmGt4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YUlvmTU+; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YUlvmTU+"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ca1479dfe0so330565ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 16:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782860856; x=1783465656; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gSHQq9lz2uT/CCkNnFTD2/+zrLE3tP+kqFCFI7YQj6o=;
        b=YUlvmTU+TrfIITX4pnTaB9LUWmAA0/86IB2EN/i4o/N4tCGdEzbCAOjKiziIw3z4RG
         lXSCBHukVFmSagZXSymFS6JEkKRbZ1AQba0q+ZcjB3MVWogU3o6BZkidf1YeUFfkjH5x
         Hjcfv0qG1rSckCh4wyiUSGsYNKGR/JWrxzv/4BssxXUjpHvOpGIGsH7Sq50dBTPqGBSx
         XgStqYMVqWmOl7se8Z3Qo5LyWwjpoSzFq+SPO/oZps6WD5CSku59/mlid2+hvNg4LsGd
         dI8PCa5K/3r+Z89rTPolq6s5ImbAtmSwL66NI+FVm2cV6PXA4zbjeTfTzy7iCFl3IVOY
         oepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782860856; x=1783465656;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gSHQq9lz2uT/CCkNnFTD2/+zrLE3tP+kqFCFI7YQj6o=;
        b=aq5PQT3Xk1sx7Id13MGiAUF6W2NBL0F9cpLBUc8Yz3y+j+YCXoD24znMMee/O61xJ8
         no6WAlTOU4DFmJm3/cqeV/cnXSELT//A1pHyPpYvh0erPk1ug+vR11aR13x5shAeWJQK
         G+ffMOHq5nGb2RFv/IAeYiNDP3UYr/wZmowoQQHUdJj97iWasSojesNfD4Ook1xPfpbn
         HaVK1taac2lmlCdDU5mfyrzttKvoWg5OyR/daEI7wRZ1yjdWnI7tlVHns2ygDWjSwgdt
         hVz5x2oj64VijAzdll6zQ07jjHZxgyt4LuSnJSrtMAlZ0Cp94Nw75V13y302GAxU04HL
         M8ng==
X-Forwarded-Encrypted: i=1; AHgh+RpMmJyTytxX7OGrAvx54U3R5qXWqrZCl+w3Q1VUwB+RIHFPi0wYZ8gDB4zEoRDAQcLpfrncWMk7n+rmKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxmfNvdZhTVA2/9ZQEDsXQUW2AtkuqNURc8JT1Y56b67icoUIfO
	MSZHP9YxtupbNdvfwrFjhtmV0etDnkuUz5xLD91IYenOkC0//Y1Ee0WK
X-Gm-Gg: AfdE7clBqrRfVZ61S0gtFMtD41Y5x+Tq9nBPmemFFxjdueBq+57oxFBG0/Duj2MZ0NJ
	bC2gXNZKyNYNdswoeRCl9DvMNmtu1/FeijBre3HFVRB9WqwB3PICbXhJ0IcG9z+Z1fBpTpsJyl4
	Eu9KFih0sO8SPZI+TBdq6goOfFCNWwGTQUBeQZZ+uLEhAT1pX7+sthcs5Ni1m4mUZ+6MYWoRSqa
	gZwzAwOfxL2X8Rd9XrHJRT7LU05fmsUGqzsfV7WyJODzvwlE04uUrLtFhR1q+oett+xJYGYuKpO
	+vxpkEV5KJLXq9lj7zIHjaH42044r53+f8Zx3q7wKUzB7O8UIeAd5xcsuszz8z4eon32sfx23uj
	ja9NqBep02SYvct5jqgoJN7i1nfGSO7nLUy/aFTqZ2+TXOM7IQOZktEVLUs8HAPZk58vUaqxMqI
	BOsfVi4FmzACjEMnMjAX9MapD7mQ==
X-Received: by 2002:a17:902:f788:b0:2c8:1c2d:b9c6 with SMTP id d9443c01a7336-2ca2e715005mr45995405ad.22.1782860856349;
        Tue, 30 Jun 2026 16:07:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca37a71053sm22270565ad.8.2026.06.30.16.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 16:07:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 30 Jun 2026 16:07:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (cros_ec) Implement custom kelvin to celsius
 conversions
Message-ID: <638242a7-0be7-4596-870b-026f44e409c8@roeck-us.net>
References: <20260630-cros_ec-hwmon-overflow-v1-0-3d2ecd3eb0f2@weissschuh.net>
 <20260630-cros_ec-hwmon-overflow-v1-1-3d2ecd3eb0f2@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630-cros_ec-hwmon-overflow-v1-1-3d2ecd3eb0f2@weissschuh.net>

On Tue, Jun 30, 2026 at 10:57:51PM +0200, Thomas Weiﬂschuh wrote:
> The ChromeOS EC APIs use integers representing degrees kelvin for
> temperatures. The default conversions from linux/units.h will then
> always convert these integer degrees celsius with a 150 millidegree
> offset. This is a bit confusing, as it also differs from other CrOS EC
> tooling. Internally the EC uses a kelvin to celsius offset of a round
> 273, so the current conversion is also not entirely accurate.
> 
> Implement a custom conversion which preserves round values.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/cros_ec_hwmon.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/cros_ec_hwmon.c b/drivers/hwmon/cros_ec_hwmon.c
> index ea24056ae646..44291799dd8e 100644
> --- a/drivers/hwmon/cros_ec_hwmon.c
> +++ b/drivers/hwmon/cros_ec_hwmon.c
> @@ -147,9 +147,17 @@ static bool cros_ec_hwmon_is_error_temp(u8 temp)
>  	       temp == EC_TEMP_SENSOR_NOT_CALIBRATED;
>  }
>  
> +/* This differs slightly from the variant in units.h to avoid rounding inconsistencies. */
> +#define CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS (-273000)
> +
> +static long cros_ec_hwmon_kelvin_to_millicelsius(long t)
> +{
> +	return t * MILLIDEGREE_PER_DEGREE + CROS_EC_HWMON_ABSOLUTE_ZERO_MILLICELSIUS;
> +}
> +
>  static long cros_ec_hwmon_temp_to_millicelsius(u8 temp)
>  {
> -	return kelvin_to_millicelsius((((long)temp) + EC_TEMP_SENSOR_OFFSET));
> +	return cros_ec_hwmon_kelvin_to_millicelsius((((long)temp) + EC_TEMP_SENSOR_OFFSET));
>  }
>  
>  static bool cros_ec_hwmon_attr_is_temp_threshold(u32 attr)
> @@ -228,7 +236,7 @@ static int cros_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>  								cros_ec_hwmon_attr_to_thres(attr),
>  								&threshold);
>  			if (ret == 0)
> -				*val = kelvin_to_millicelsius(threshold);
> +				*val = cros_ec_hwmon_kelvin_to_millicelsius(threshold);
>  		}
>  	}
>  
