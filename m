Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816935;
	b=gEx1UlviHkDIu4kUtoBBuYu704c3z0lx24il/2NFHMM67AfZECrEM5QVGB7OotnpSTXi
	 LPRihhEJXET4mZYiV/JsY1611Hin8EoRbN2mmoid4rfCKve93tSHb6seOPcOmhpfoqEsY
	 XzC91sBbmW2dBiGOYuv0z+lJsiAtvTZe7M/qTbzegdLM5GIh4dQJl8XCz8vBIMx5L+9IB
	 oZkyXbJKkEVBE7UwNj4hP0j711xFvs8xKtf7GwPWybIRfr8INlPw0JaO9kLg4IPxDYK3X
	 PlOOB5YvdRSCKChj4xDIquogQ+mCIb+0otS3C/qzvnHsJOspstSYLdXwwcsuTtChVyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816935;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=SFJwlUyqlnW4DRbVzxxL9VU7f1wu/pDUPInWa0d30zE=;
	b=RikTpX0Fh4R2skiFwYnRoX9E4yuWOYeVyr6gjDNQVwwxPYdnx3oq+3mljkJmQ8WNRPDU
	 kdtDxlUdkClVccSEcSD51IflBW/AcoDTNBoOzHkAfOqrl8kgNY989H02zUVZfXTXAMr85
	 qnGrEGkB7ixgu6ZUJlAWHWafLh4RFol5giQt0nFsBCrAdsiA9SYG6meLM0p+CR5HUXMGy
	 +yljMIzFEFKdbsKY8JOJoAYDFgGtV7avsVXxMbQqkj43qaMYd+NKXjA9RIzfnlicggYDY
	 GaSwBIkgHfWNOHygYRxSntLSYzqvbHvFBhd3tlhSAiGtrdFDGa/utZMkzMD0i70I+nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=Bx5Evt26;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99AA606A8D2;
	Wed,  4 Nov 2026 18:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B99AA606A8D2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=Bx5Evt26
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=SFJwlUyqlnW4DRbVzxxL9VU7f1wu/pDUPInWa0d30zE=; t=1793816934; x=1795026534; 
	b=Bx5Evt2673gLHXkznLdvK/EwyQuTOwZBLfFEdprbFA8GOp5kLG6t0WyxPqUEkkudBHBCsL82XE4
	kciDa1IepEChy04JdrdWXSsp/SJXZScFO7dwWjK+2Fh4usPLmkQo1O9BzXFZAHR0jljybCoUZ9NXL
	VwSRefwnUa1NP9jm7y3LwRWpzYG9uPP/P413FBB51xPGrGDiswX90TwrkCJ4561iJbYdUgLLoh7Cu
	CDkTjhzfmPc3+Pz52RD3eOrd85gjlxNC6oRUYfzbWnjUytKx/NcVgS7DZCfNZcqQIGH9oBvYMnUPS
	NcBF9WyoVAnzr9cDOIrRHmLbdLjvZ1ZoV9vw==;
Date: Wed, 4 Nov 2026 19:28:45 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>, Alistair
 Francis <alistair@alistair23.me>, linux-hwmon@vger.kernel.org,
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] regulator: sy7636a: bind to the I2C device
 directly
Message-ID: <20261104192845.41b086ea@kemnade.info>
In-Reply-To: <20261101223125.302001-7-pmazzini@gmail.com>
References: <20261101223125.302001-1-pmazzini@gmail.com>
	<20261101223125.302001-7-pmazzini@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  1 Nov 2026 22:31:24 +0000
Pablo Mazzini <pmazzini@gmail.com> wrote:

[...]
> -	ret = devm_regulator_get_enable_optional(&pdev->dev, "vin");
> +	ret = devm_regulator_get_enable_optional(dev, "vin");
>  	if (ret)
> -		return dev_err_probe(&pdev->dev, ret,
> +		return dev_err_probe(dev, ret,
>  				     "failed to get vin regulator\n");
>  
we need that regulator enabled for i2c access, if Patch 5 is merged before
this it will happily try to access the device without it being accessible.

But it then is just another error code than ENODATA.

So if that is considered harmful,  probably this patch needs to be reordered.

[...]
> --- a/include/linux/mfd/sy7636a.h
> +++ /dev/null

but if it goes in first, this part will make trouble.

Regards,
Andreas

> @@ -1,34 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Functions to access SY3686A power management chip.
> - *
> - * Copyright (C) 2021 reMarkable AS - http://www.remarkable.com/
> - */
> -
> -#ifndef __MFD_SY7636A_H
> -#define __MFD_SY7636A_H
> -
> -#define SY7636A_REG_OPERATION_MODE_CRL		0x00
> -/* It is set if a gpio is used to control the regulator */
> -#define SY7636A_OPERATION_MODE_CRL_VCOMCTL	BIT(6)
> -#define SY7636A_OPERATION_MODE_CRL_ONOFF	BIT(7)
> -#define SY7636A_REG_VCOM_ADJUST_CTRL_L		0x01
> -#define SY7636A_REG_VCOM_ADJUST_CTRL_H		0x02
> -#define SY7636A_REG_VCOM_ADJUST_CTRL_MASK	0x01ff
> -#define SY7636A_REG_VLDO_VOLTAGE_ADJULST_CTRL	0x03
> -#define SY7636A_REG_POWER_ON_DELAY_TIME		0x06
> -#define SY7636A_REG_FAULT_FLAG			0x07
> -#define SY7636A_FAULT_FLAG_PG			BIT(0)
> -#define SY7636A_REG_TERMISTOR_READOUT		0x08
> -
> -#define SY7636A_REG_MAX				0x08
> -
> -#define VCOM_ADJUST_CTRL_MASK	0x1ff
> -// Used to shift the high byte
> -#define VCOM_ADJUST_CTRL_SHIFT	8
> -// Used to scale from VCOM_ADJUST_CTRL to mv
> -#define VCOM_ADJUST_CTRL_SCAL	10000
> -
> -#define FAULT_FLAG_SHIFT	1
> -
> -#endif /* __LINUX_MFD_SY7636A_H */

