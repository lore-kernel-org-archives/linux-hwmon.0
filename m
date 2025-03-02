Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B726DCE1
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Mar 2025 18:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740940122; cv=none; b=jaVZ9SKpxS+HejZHAjptMloYIZTlHbqN46o4l1P8tp1w4NeoadKPEwhcs4maEgGeuO3b9v2oXFdgHnp7bcOTrKyD3X+NmNms77ZpcFfogXgbnKI9G1HBhGe2mVtalD2E7PhruPVZs+ajrgkRVP8Bx/JPi4DrnAwQjx+YB4Jjd98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740940122; c=relaxed/simple;
	bh=1Ge8jFGfCm1sOthhOtWN5r7nDd92OBKurxDwQ/RkmA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NLk+gIotj6VKIpfhCUAei6Fh/epbmLimWNfYr1oax1rVvfWBF5XkhWe/RGy1ujdC/205R2wVWjTXHxY3kgoq8A6GsGW+JdUi5zaqWVNAp8Fw/+1bS204WMeKFLtAsLzlbKY0n2lGaRShzNEayFFzVF2F96itG2QikESE9g4bGsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e48bES5L; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e48bES5L"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2fee4d9c2efso1223550a91.3
        for <linux-hwmon@vger.kernel.org>; Sun, 02 Mar 2025 10:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740940120; x=1741544920; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SE+IwOSqHRnLQhV4MfwjkBjJDpkglF8UVW1vEPKvrrM=;
        b=e48bES5LYU/itDPKjBIypjRmeOSbhhLgPMScNaXrB+v1bRv2Mdi/S1cwjbC9+klu3X
         S7E0V9lDkqss7MRA2jDu2ozG6q4hfBu6kX9lfB/eFBHPDUuhxWIYaVehq5LvFpeJCTC6
         dGvqACv3dVq9D9I8SVlOxNKGcJsoBX3nr3wtYK0oALR5TAc/2eKEHlaTf9C+YozrW65h
         j8gn/Ao1+DAxI/KFL88M8MAfQqqiyBC9lsSsVRwrAuMVBtfP1C0mKr8A/yELESVRFCsC
         TBWBMaxbeRC/rZETXW9s2s2A+FVB/er5aBxvHHS1kwAIimis4+FecZ6TUysy5JShwFDg
         /j2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740940120; x=1741544920;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SE+IwOSqHRnLQhV4MfwjkBjJDpkglF8UVW1vEPKvrrM=;
        b=Zd6L4NthrvLWKub9Ysvig6PUeNAxLku+Z/kEBFwBX3Vff/iHkFL2Me8edMnBmtn4l7
         l3ozGla5mUhpDB50EYyy0PVuD3QkftSWfGpoBteXmucV1T4aY8paNFHtj9sePACWmBP9
         zND8GfP/lF9Wq25p+YGjlTN9zLmmYo32E2Bp4rHcsoiFTeBRPZqr18Fv6+lfDlcPVWWN
         WlylsjQ2ymDFqc5FfvcJYCQkZYTLFDr674ZxhCCfGh7By9KRQOpwFIzeer3+UuJdTKVx
         VUvHU+I7Ttu9xgJP/C6GJXX/Dnnh3n2pYlhpWun8p1xFzRyAzu42R7Xc4U1vCYeOSjC/
         YGbA==
X-Gm-Message-State: AOJu0YzSwDNu1XsnzFu37OWETg2HLGekfYFZah0SHbV3aXU/9Yz28VOe
	LZivpYA90pLGKb2MKaTnp0dv3O9j+7P4SlU9xE/7iZRzBb4O2APyPZiREA==
X-Gm-Gg: ASbGncsjyDFDEesH5DrF9qg2Ln/21SD4FQ4iACqIn3HT5X5MlWvws9FE7NncWfREX8y
	A0tyYEbNUZHa1f7uJLimSR1hUv9p/PIlB1HELXPPWeCYwlEnKcXWpFkhRnNXeB42eC7kkHYWZ85
	DToZjUiNgIL6CAWSRVQOcUDW8Vg9fxtgOqU2DBMGxr5A2VW0A/rHf8rAy0/RQ8OniVKS4kQhquC
	MfhK/f72Anu4H2gboEkW0PDX0vupHsGXzKTJCn3gaLEkdUmLPFo6fAKAswsi8bHH3R8Bl0Qu5sc
	/r/SuEhPUr+TGNhdcvyz9OtCbTORqwjyUjXraIIIk3E2VpvyW9IjX+SLIw==
X-Google-Smtp-Source: AGHT+IFOrk6MKc+YAWQJpQImfkeQJicYwthDKbuxIAdsrzBCdNehNs1PTx8rMHPz9y8q4Xyx+pAKng==
X-Received: by 2002:a17:90b:3a89:b0:2f8:4a3f:dd2d with SMTP id 98e67ed59e1d1-2febab7875fmr17770617a91.15.1740940120472;
        Sun, 02 Mar 2025 10:28:40 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe6cf95a04sm6532831a91.0.2025.03.02.10.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 10:28:40 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 2 Mar 2025 10:28:39 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: ChiangBrian =?utf-8?B?5rGf5rOz57e7?= TAO <chiang.brian@inventec.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v4] hwmon: (pmbus/tps53679) Add support for TPS53685
Message-ID: <5ed6079b-784e-4d0f-9f86-9bf8f6d02f7e@roeck-us.net>
References: <CAJCfHmW61d2jd_tYpNEqBG_Z58bEnVKAmsvhrEP1zXQoXqrUVw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJCfHmW61d2jd_tYpNEqBG_Z58bEnVKAmsvhrEP1zXQoXqrUVw@mail.gmail.com>

On Tue, Feb 11, 2025 at 02:22:31PM +0800, ChiangBrian 江泳緻 TAO wrote:
> From: Brian Chiang<chiang.brian@inventec.com>
> 
> The TPS53685 is a fully AMD SVI3 compliant step down
> controller with trans-inductor voltage regulator
> (TLVR) topology support, dual channels, built-in
> non-volatile memory (NVM), PMBus™ interface, and
> full compatible with TI NexFET™ smart power
> stages.
> Add support for it to the tps53679 driver.
> 
> Signed-off-by: Chiang Brian <chiang.brian@inventec.com>

The persisient lack of change logs does not help moving this patch forward.

Worse, it is corrupted and does not apply.

> diff --git a/drivers/hwmon/pmbus/tps53679.c b/drivers/hwmon/pmbus/tps53679.c
> index 63524dff5e75..7b412f3fe86a 100644
> --- a/drivers/hwmon/pmbus/tps53679.c
> +++ b/drivers/hwmon/pmbus/tps53679.c
...
> -   if (ret != 1 || buf[0] != id) {
> -       dev_err(&client->dev, "Unexpected device ID 0x%x\n", buf[0]);
> +   if (ret != strlen(id) || strncmp(id, buf, ret)) {
> +       dev_err(&client->dev, "Unexpected device ID: %*ph\n", buf);

%*ph requires the buffer length as argument. Testing this out by applying
just this line, the code does not even compile. That strongly suggests
that the change was not compile tested, much less tested on real
hardware. To move this forward, I'll want t see a boot log.

Guenter
