Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0803E833E
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 17:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778953435; cv=none; b=XgJiwRHxQ2o/iaqBbnTRx95YPAqio23v16EZYzxnPbjbb+QMbd5UD5baTDhS2zhQT87h+29n76tiM6fi8GNn0nXY7pm8huFal4/STlX+n1FxD6aCJhBrfru498L7eSuviLqasIaSvj9mKsuQosWbF8yKEg/a57B2sEojGXUJtgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778953435; c=relaxed/simple;
	bh=csTK/HbKKC6v2Ikk6PQp3X4XP1MiazJHTn4tijrsTPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YLMYcn3hvEFFX1dZ0hTJYAzL5awZi3o6RnJXWEPTpRsZn900y7GEsz1j2IrP6YmoeKE3TGV2DnMAn7gbtjCEvweGNEAIMirKyKdNnv8D4OpQvIHDqI9QktXqsSnOuOGjmHSnV0b4MS8EVTXXP7A5NH97hium5r8kipeSodFDZfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNmU0SOd; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNmU0SOd"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1334825de43so752349c88.0
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 10:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778953433; x=1779558233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bT/ht7TDh8ru/ZEga5H1yY/vbnW0GAOum+ohG5JvRE=;
        b=RNmU0SOdWPxyof+7z+kaI70mFusT5cVhRHh3tQlcZiySf7HjdkVeF0wyRiTWkpsihE
         BLfC6l8hpgvetgSQaWN3b/yL0YqTSz1JKGcWOqL79cuvEkNGk6Hj68aD66BxAG43qhJF
         9Cu+tw1F4bqKA5s+SgWE3lTnTXp+s1Crv+ncUUxhCXx7BdkLTSfatS/WpzeK0e5WVYzG
         k+WSIG518cojlBTDEYWQDwqrIFGRAQENB9grQ02E3CzmiR4bFGBgRQ+ZQFcyptM/Ra4U
         N1GI0dIVlO3WFE8fba4Tu7zZzrM5bicp9lCdqfuD/mxAGHkT8d50Ki9dsXDLqIdZgqbC
         KPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778953433; x=1779558233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2bT/ht7TDh8ru/ZEga5H1yY/vbnW0GAOum+ohG5JvRE=;
        b=FX44yYYJpcbdoLyQvEIbuWYEt3LxM5tQY1oiLru2KRgXC9zvu/bYQmmUPZFHtf4E8B
         eQ2bAYasPcElsceHhykv3o8WsSkBqoHH8JkuFLBhJFKvsMfjlSxhxfUThBjScAMlVJKP
         rweyVCEDGDhKHawLs5Zm1umgwddi/GG/LpRNGLHmtFIw3FafPaiJaRRr5jMWdIOfy98Q
         GenmegvvCofzCGxd86hhzwcSB+p6EA/G6TrDM9vLJ5OHd0ckZzF6hxrJl75LH6skc2rp
         0c031C4sxHtOfpeFnJqJi+PAhQI1YttFuFOxHD3M/Xt7YtrkDhB4/I1W7wGBMTs+3W89
         4GWQ==
X-Forwarded-Encrypted: i=1; AFNElJ94ftoN9Kr+bIM20Qfc4qaE1eWVqKofENSN4O6bXXHEo/ta3/piPCPh1AP5aFFKEw4xJ9V6ziAgZ69u1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3ufU7g04n92AL73YSryBgGIBQCqOD6H//pDo4EX0Uc8oYvsp0
	7Z+wF8/22xcR3+KwMN/LvVIzm6TFEaYs1owT/wxS7bx4bUV/X2J6x832
X-Gm-Gg: Acq92OHzEuNcVpHe6jglGRR/Kae3g+T75gSECPLythKDg/5e2YTHN6QkupL6LL453RG
	8qcHgWXKj0SHFQd2Cjr6N3qHWyIOIrt71KQ4HM7sFYGu4y7boReZZ/NGBnZt/6wYhDjeet1azF3
	9BpsEbhlUEYBBPjkPpcejkOzJdCc6kh59umEDp3SeEG1B6XcK5EvbF/fgzHPN9RI8fkp6l+B2yE
	ETHXQ+c9at2dJ6nV2Y8u4bhXLGPoKOOuWyCpeLY4LgTEdf55L9bjC1Hg2GzhskTZ5glTvkGd1WQ
	zb7/icPrIjlk5vmbnan3xjQUEr6PNyLPma5QEHK//QXEsW90+6paZpmlZtECuFaW3uEv5EXvJgl
	65r54a4nkBzX98qnCzj6Ct28Y/eW5eOn7z1BBoZP8jZr/eOppCO8NDb5yD+sWP4KcEK57NOmJIc
	kx1BeEg7VzUtAI2GpgMmGPHcxWpUXPMLBO/zORGe8hE/cgJGk=
X-Received: by 2002:a05:7300:b209:b0:2d0:239a:23cb with SMTP id 5a478bee46e88-30398655ecemr3889054eec.16.1778953432798;
        Sat, 16 May 2026 10:43:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302973bcd0csm10467417eec.24.2026.05.16.10.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 10:43:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 16 May 2026 10:43:51 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chen-Shi-Hong <eric039eric@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] Documentation: hwmon: lm75: document sysfs interface
Message-ID: <9882b9cf-7b10-411d-be41-2da298500db2@roeck-us.net>
References: <20260516160823.1461-1-eric039eric@gmail.com>
 <20260516170728.2066-1-eric039eric@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516170728.2066-1-eric039eric@gmail.com>

On Sun, May 17, 2026 at 01:07:27AM +0800, Chen-Shi-Hong wrote:
> Document the sysfs attributes supported by the lm75 driver.
> 
> The driver exposes temp1_input, temp1_max, temp1_max_hyst, and the
> standard update_interval attribute. Some chips also expose temp1_alarm,
> and temp1_label is available if a label is provided for the device.
> 
> Add a sysfs-Interface section to Documentation/hwmon/lm75.rst to
> describe the supported attributes and clarify that temp1_alarm,
> temp1_label, and the write permissions of update_interval depend on the
> chip.
> 
> Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>

When I tried to apply this patch, I noticed that a similar patch is
already queued in hwmon-next. Sorry that I didn't realize this earlier.

Guenter

> ---
> Changes in v2:
> - Document temp1_label as conditionally available when a device label is
>   provided.
> 
> Changes in v3:
> - Add changelog requested during review.
> 
>  Documentation/hwmon/lm75.rst | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rst
> index 4269da04508e..fa8ddcaa0c2b 100644
> --- a/Documentation/hwmon/lm75.rst
> +++ b/Documentation/hwmon/lm75.rst
> @@ -181,3 +181,28 @@ is supported by this driver, other specific enhancements are not.
>  
>  The LM77 is not supported, contrary to what we pretended for a long time.
>  Both chips are simply not compatible, value encoding differs.
> +
> +sysfs-Interface
> +---------------
> +
> +================ ============================================
> +temp1_input      temperature input
> +temp1_max        maximum temperature
> +temp1_max_hyst   maximum temperature hysteresis
> +================ ============================================
> +
> +If a label is provided for the device, the following attribute is also
> +available:
> +
> +================ ============================================
> +temp1_label      temperature channel label
> +================ ============================================
> +
> +If supported by the chip, the following attribute is also available:
> +
> +================ ============================================
> +temp1_alarm      temperature alarm
> +================ ============================================
> +
> +The standard update_interval attribute is also supported. Its write
> +permissions depend on the chip.
