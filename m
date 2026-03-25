Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D60F1218E91
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 20:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774468925; cv=none; b=AX1OtRYxaf630XEX9jC19ChK6QFhEszcSih0VUJwGP4t7+WF8yfG4uXpytAmrxxCRfp4waGpVqoTBVaqvxXKQdTiVkAESlt+bHwhpkAqPMAEivGV9ICb6uaXJeTZoH6qfMKKRdRyi4C8fP+uhX3rN2jjyn0bShN9srLGtXHrcFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774468925; c=relaxed/simple;
	bh=+OqoUI19RCnwsXWZDsm2j1Cqhad6FqDcZ1vJXoAX90E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jZBzDNt88E2qMT34SXmU5rv4KbMSYk3a4tvlSAaRnQLupPGP+iL35HOzTZimyDmoHyaVdBCpw3tXpoYsChhAejHjpNyIcMv3SNtRvqmBz+Btx5nGeqGEoLm/awZuZECLCJN1z9JYADd8FeFGBSqp3lvlURaBGICpNsNIOamtUO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KNzJpixB; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KNzJpixB"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1273349c56bso345222c88.0
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Mar 2026 13:02:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774468923; x=1775073723; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=e3CZCnTqRxUjMNPGN8nVHqOW8jYHy07xQcrdoN086uw=;
        b=KNzJpixBRB7CM4y1g0h2C4JkhEyOb0jH0MWX2ssdwKGoT6P3g9sX0KNkhkUUtN6F3y
         4gQB8rysXbKwlPhC/zmJLOf2239BpPIlY942e8zBTETLyPv7cq2WAYCQXxoMYOwLF8zR
         OCBj5c2Cr3GpfY9Z+ecFCq16esI5RpakqD/Tcyh7lYvsVPsEiCBCb6H9x462S5QYG9nD
         QeZWRuv04bMqyojZ3YtdVH1e3Qp5ld3mWBP96SsW62Uob7NXuAVHUAO0GcMQKKzYXs1W
         g2dadA7k6BEHZ1g/bG5MsqD4cYzxOznBfM5ijTHy0M6f4B6PJwOyNQNucFVqKeWm6zhg
         EOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774468923; x=1775073723;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e3CZCnTqRxUjMNPGN8nVHqOW8jYHy07xQcrdoN086uw=;
        b=jKoxZI9pMQ88GiFa9uO6XXPJEdgj3iVenOLto96kHYVWHOyl3Wqz9VXzpyDl9LWYr/
         BcenjQT2BuHdNSArSzVN6wxsDDXJMXaDWczYG8xzxytT5dfR3GJ3eu2lOBug2rqPLXa5
         NCx2oCrIRPH3/2vEgepytEFeO4wBRZ0+y+RQRxTMi8vxbpI0emnIc5fuv2T7ivnznW+L
         5NnFFIQ/vFh4gI2T8PhEooK1DrCJZELy3Jzhq6VSYbrVqPwtXa+XsQNdQkGQq0+OnvAg
         zv7ts0Kc5izJ78zitloTg0BhKFykFRNFP63Pvlyhcn3UodIf3FmzvM5iS0MlHZx/zXmX
         Rthw==
X-Gm-Message-State: AOJu0Yx0W5s+PjUPDZm9MYVpv8X70ujOO6wZWE5O67RmvU7bz05gAAYf
	xHvldXv3fj+u8RKYySUYMFumjgKKeLeGhAvpxwhlIg923nLAPPw3VtCcaoiLNA==
X-Gm-Gg: ATEYQzzRc0fGBqztb8V/CQxwiQUICIEwQPS0jxImwJIc8lt/oT7gDTi3mdLcvzw0L37
	5MtJf7SMP15wfu8cBRDtB3as3gTE8o9NcDJaN2C3gpw+YRo2MMB1Jj8Na97tiVZiwQhKhaqNGGV
	wRHro1puM/O71X6PDgbI9ssl5Kky5aQIRAesceQgh/Dc+FwJLJFF2hQxVTKcqyH8JulLyguwz5V
	Lm+qM7ayI4zTlduixWFSqEvsYWJ99ntDTbPOEfx1K6iUP9J+o8rnGmajPLN6EJTR+LgOlrEO0pz
	ZAVGe5lS/8Pm3E0oDbATQuMT0bb9ce9G1vsJeH1j2Zs5gdhgWywtlZuuBFQ/IfuhBDSfR2cal4y
	UfllIqi0kZ7P5QbdEZQbddXCEe2ZtdxcbzRebbDyPYo2O9EYyZQLmm0I6OmAj/TPnRKUvoW67UH
	Tov5hOHk3wCdxZX2ieU/D2TQy1R+od/xcEU8aa23KlRRK090xbcu9r3wfSNWCmo5r3drt7EhBB
X-Received: by 2002:a05:7022:50e:b0:11b:9386:8265 with SMTP id a92af1059eb24-12a96f2a003mr2352775c88.42.1774468922845;
        Wed, 25 Mar 2026 13:02:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12aa782ca4fsm895971c88.14.2026.03.25.13.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 13:02:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <92ccdb7a-e182-4fab-8141-14fb34386bc1@roeck-us.net>
Date: Wed, 25 Mar 2026 13:02:01 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] hwmon: (pmbus/core) Protect regulator operations with
 mutex
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sanman Pradhan <psanman@juniper.net>
References: <20260325181631.17259-4-linux@roeck-us.net>
 <20260325190502.109001-1-sanman.pradhan@hpe.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260325190502.109001-1-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 3/25/26 12:05, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> Reviewed the series.
> 
> Very minor hardening thought: the notifier worker is
> initialized after the devm_regulator_register() loop.
> 
> The current probe ordering makes that fine, so I don't
> think this is a bug, but would it be cleaner to initialize
> the notifier state a bit earlier just to keep that
> setup self-contained?
> 

The interrupt handler is installed after registering the regulator,
so I don't think that is a problem since the regulator notifier
is called from the interrupt handler.

> Don't see any blocking issues in the rest of the series.
> 

Thanks a lot for the review and feedback. Surprisingly, Sashiko did not
find anything either:

https://sashiko.dev/#/patchset/20260325181631.17259-1-linux%40roeck-us.net

If you don't mind, please send me a formal Reviewed-by: tag for the series
or for individual patches.

Thanks,
Guenter

