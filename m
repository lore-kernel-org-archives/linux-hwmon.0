Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4943264DE
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Mar 2026 17:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772557262; cv=none; b=QC3mCpYLuQQ4HYybBeaJhz1g6F3FokAU002bk+KEXsjnxQ2Et8/W7HEaDZYtsjXK8/F9PU1KkvKNXNi0+Y2+7uVySt9ZU/JPvAEHjUUfDUEtr5AQSyILYObQwV2Afrp0Pz/E6fd3ClVFg+0RENQLxtq9zxZpmlCL1UlAH6buJjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772557262; c=relaxed/simple;
	bh=SHczlQwvd7NbmZSKCgXO4swnTD02FjgsoHeLFkn+T7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLJHIQvbWJYfO0jnvbix6wf3BWllhxgQZ8gfk/IQXocUL0BL0fleUV6xlAxsCiNGSY1ufNboweNRYjwhY9GdEdi043/hTj+ehTrFE7YOjmTL2oTmCjbXsJAWBDtd3AlucAmMS/CKFpYb5a4gXJo8eqot5Nc1Vh5YKmKD5z+xd8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VraKuHOh; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VraKuHOh"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ad21f437eeso43204935ad.0
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Mar 2026 09:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772557261; x=1773162061; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FbBWAf9/WIE8nrawBQ89GCjVt6XOGMgNOGsA0rMVAf4=;
        b=VraKuHOh7wfN3uVrYlPPihDzKLjZ/kRsm/Gxgn2s8bEbOqKQB5tLRYP63wXbes/3Do
         d7mwH94rqSEacWAmHu72Zc8x/R9AHpSVm07UPQTYXdUd0MjeDJDrhg1Wusa7Zw2wRVk2
         QgF0Ww+olW/Jlmyy1rXz6lD3yh4oivRbwMCaS4W2p+LF4X7mLUVG/DJzmioY8AirpXhA
         cuOeMtAW1TXAzL8D8WNhR6I035WLdZBLxcVbrH4PIoRuamHlMngNeo72iaMNKC0llh2F
         gK8HiSbMTjbtm3NeYbpbzzVwIIdBdRkqgUubGaI8agdnj1SSmqMM+DPXdkq9cbiTkbXR
         XGtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772557261; x=1773162061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FbBWAf9/WIE8nrawBQ89GCjVt6XOGMgNOGsA0rMVAf4=;
        b=M9D1VkLws33HvJ2g7W+1be1eec7RySSmP+koyW+xSfHa5/grUOv3ZrfdMAbfN6yCM9
         zSyLhBJY3cKJUWr+GTuUwM52jWmPMo6Wn1vVV9ZKsm2I7bpRQ+ihX82c0iHSdrt5tCtb
         YGDeEkiBZ3JW+I5Ku+RjMQV4iCHCt+2mPQyIdeZuQbsLow7XWefz3mAmLmF6lw+aN2c9
         uZyCltKh/z8Q5Me65HnrbjT29Pg7+psjUYm5ak8tLCi6dIqoWPH43jZMaKE41lzLnu1b
         lYMBxxRGO7PAJN495bG2hFaJvoW5KNb62JZWKgl9VLpg3okSuET6d2Oq1WuEqQgatWpv
         NN2A==
X-Gm-Message-State: AOJu0Yx6LMXszt9lKWwgI1j4QGWUJSfOG2bB85WCbC20XIMjVsKJ87u0
	nswZ2TVAdE/cDQPLMeJ+hqRNCtz5QJ/n7rBBMltYCeofncwmkNnPei0e
X-Gm-Gg: ATEYQzy+Q5EIrHPEcD1/uECpmnchB2TvndjxLZGzPrBH4zKjmESN1/vVHFMhojmZAix
	/31gPCQlE88rxeg35iFT/TTmvDSoyk6oh75u1rD1FbmtDk3qnADqjR7uCk5fFOlauBkUOHdzVn+
	+zD0GfQgqA3/Sa2LJr1+8rkAfMXS/cRoKE6NpG43f99Bw0bDbyoXWbYSpQPXaeYABNr4kt3nwqm
	zGcssnTR8KXjHH3ZckYrHUTA/udfkdl78GOL4xp2wRtIoGL1AVU0arnH8YGmUSi10swO8skLrhL
	6Z8aMmu9/4IE1KK3OH3ypmkmYqbqYi/Zu++JnNYc3s/9k6NSmylrF8XYwuQrnlg48zMsR6bDMAX
	uMHFQLWW1uez1lgQ9GtRClQXvl5Grmusnv60Ux9zcfGwXIM4meoRCPx+AYRXcEoljzjoAc7bf7W
	KCEfMDQ2dgXueY/4LR1JsGn4zIdAv4m9d49vgy
X-Received: by 2002:a17:902:dac2:b0:2ae:54e3:9299 with SMTP id d9443c01a7336-2ae60d98a75mr25174085ad.21.1772557260722;
        Tue, 03 Mar 2026 09:01:00 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6e190fsm180942895ad.82.2026.03.03.09.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 09:00:59 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 3 Mar 2026 09:00:59 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jonas Rebmann <jre@pengutronix.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (ina2xx) clean up unused macro and outdated
 comment
Message-ID: <66dad3fe-fdb0-4310-9922-c6731575c08b@roeck-us.net>
References: <20260303-ina234-shift-v1-0-318c33ac4480@pengutronix.de>
 <20260303-ina234-shift-v1-1-318c33ac4480@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303-ina234-shift-v1-1-318c33ac4480@pengutronix.de>

On Tue, Mar 03, 2026 at 12:07:01PM +0100, Jonas Rebmann wrote:
> The list of supported chips in the header is incomplete and contains no
> other information not readily available. Remove the list and instead
> hint that the chips supported by this driver have 219/226 compatible
> register layout [unlike the ones supported by e.g. ina238].
> 
> Remove the unused INA226_DIE_ID macro.

It is a define, not a macro. I'll change that in the commit message.

> 
> Signed-off-by: Jonas Rebmann <jre@pengutronix.de>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/ina2xx.c | 20 ++------------------
>  1 file changed, 2 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/hwmon/ina2xx.c b/drivers/hwmon/ina2xx.c
> index 836e15a5a780..6a2cebbb9f15 100644
> --- a/drivers/hwmon/ina2xx.c
> +++ b/drivers/hwmon/ina2xx.c
> @@ -1,22 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
> - * Driver for Texas Instruments INA219, INA226 power monitor chips
> - *
> - * INA219:
> - * Zero Drift Bi-Directional Current/Power Monitor with I2C Interface
> - * Datasheet: https://www.ti.com/product/ina219
> - *
> - * INA220:
> - * Bi-Directional Current/Power Monitor with I2C Interface
> - * Datasheet: https://www.ti.com/product/ina220
> - *
> - * INA226:
> - * Bi-Directional Current/Power Monitor with I2C Interface
> - * Datasheet: https://www.ti.com/product/ina226
> - *
> - * INA230:
> - * Bi-directional Current/Power Monitor with I2C Interface
> - * Datasheet: https://www.ti.com/product/ina230
> + * Driver for Texas Instruments INA219, INA226 and register-layout compatible
> + * current/power monitor chips with I2C Interface
>   *
>   * Copyright (C) 2012 Lothar Felten <lothar.felten@gmail.com>
>   * Thanks to Jan Volkering
> @@ -49,7 +34,6 @@
>  /* INA226 register definitions */
>  #define INA226_MASK_ENABLE		0x06
>  #define INA226_ALERT_LIMIT		0x07
> -#define INA226_DIE_ID			0xFF
>  
>  /* SY24655 register definitions */
>  #define SY24655_EIN				0x0A
