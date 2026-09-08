Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108D538B7D2
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Sep 2026 16:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788883991; cv=none; b=YBOELbFTdwRC3thHDFEh8WoPq7Km9IwpSXlOBHbwXvuLi3597F1kTHIhEWpdCyvh3z9j+qSKnSge/ytej/myu/BUJOPs7pgt59RmaAovA2lcmArIiSpV+K8SRSWxGMhMLWIs/m3wm8794meuS8Q8YizPb8iXNPTYQpIgM9NB6XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788883991; c=relaxed/simple;
	bh=uH6of9n2rBHWfIQOS9mKxTMhHVx2BH+BmV3w17ToNbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BbUl8XVLZOU4NdWh7co0VlXt+Kx6o3pDhEsQHCS2GLDJPlN0axW+OjeljWFOpaIFEgGtvDIHqBKJ1Qt6vdX3ikPeAS5x92wl5fRoC1KvNSNIfQkTGiCzmPwqNCQI4eZ+pe8PAwoXHKpNMPWI8dYePWrHUQAsxBIHqegI6o6IZaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxqzrxwi; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxqzrxwi"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-398d2b28acfso3571226a91.1
        for <linux-hwmon@vger.kernel.org>; Tue, 08 Sep 2026 09:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883972; x=1789488772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=G0ot632abDXUhRdAYyei8Pmi85X+F5W6JzkBTKWHobg=;
        b=fxqzrxwi2bzga5/vC5mqkMfyxdXc9OjpkhgB2nu/QvIEaAWPMVL6MciTrSgFUNYWu3
         RjM8v+ptYG/PzK+3bmx4rc4wbwG08FUHhcsRSOvroG8RrCcjSY06fAtta8wLB+2MFF/Q
         +jAYXoAIsXdEYUODcdnyEriJYSuu1/RDtQzW8/r097SLQ0cfRfqs80xoLPI8PAo8VzR8
         Dfzo1ZN6m1MxnFG5gQq/BwbQkMTJRCkPxwL7HGGkD5gs+GnPhbgm9cahAlp16dcAOpwN
         xlWrLBeYo+iH5AyMZ4PDqiU6zDp2vS07v3FvuL8SWi6a3mAEQX2DswpV3PZFmk9bVoPP
         cn7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883972; x=1789488772;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G0ot632abDXUhRdAYyei8Pmi85X+F5W6JzkBTKWHobg=;
        b=LuulhVMOTMqkhXPOOQd12O57sY0cSBqfJiwNt51EJwf9nHzW4ZrGr/zHNQEqVzEDZb
         HOuOg9LmtJ7txxOhyOqdfaidC1ZWQ1DlyEnqhmhbLn5hjNnzcTTJxByaukE/LEzn4lWP
         4YlEZIZnb6+34h3b1xXhGZy6YsSKiKcJfOI1XT3tGKBiY65Yf1t6mh3E5pivGMYuz1cy
         TLbQoSRNf3wTAmVW49fBVXyRCRGV+IMU5VRNKuZNj+AlR88ZkYol4QCVk/Br/JC0AkSO
         WRkHs9a/Ccp4WA3pe6ugx7InIV2xpV2qdpQCw5SWB5dDpg9K+QFOh8/aqyL5XEOqXgLt
         YBUw==
X-Forwarded-Encrypted: i=1; AKwUvBzYjwOUf4lAjEEluTZYSneBRi7UcOsAdkMuaOQF2h0MPpGJWN6Pct1gipQvIDt5RXe28L7/g8uV0YRE5A==@vger.kernel.org
X-Gm-Message-State: AFuF++lKvGOy1tSJ3pNrATGl6QaQhqHXRZJAvTIbXnaQ7kDc82k6vfD/
	uzsoQbOUDFldNTKAPc99wGBlLQ1XHaYOhh6BGyOG6kGMneEmGWQi+GIj
X-Gm-Gg: AYBFou3uHjb83ZLM9TzT3P3QE0pFBFIPJ2To560GjyV33i6MYTnCn3NVgkUkKYCTHub
	4NsbQ10N/LOZqLfo+nVyx5VYXm2izw5IZ8mHUyTWiepLWN6/6Ui+0L/GTT36bMmLXATzemeVTIT
	INtBF0XXvmdjcPpHleRQUQObKtWwPMwshFIBMQtUan04gb7elP4U2KJC5kL36MuL5o7zFJz6lGP
	M7o6LQuTj0X4CJHdKnWTjCIDjtEbMysvz5aCC2FEwM85IP36wVeReASn9EiGVWdYD+Ta7VWNRWF
	yAr6SCqRcUabdsCFVKymhPVU8ApDGtEz3NrDqH5O4xRLTh3SXtBIjgEcjVYDDJYi3f1VhGRy1NU
	VVmhxIoLoPzIrsHWPyB7fP6fI1Xs5cPkkD4orXFV0qRDeVUcih55Pn05yalNfxdi0fKqslW1cxH
	qraGCiAxcFkNClAlcrdrsQtmTwRYHcrlrtpLUI2gFK5WEVul6kMf52yrkVbIhfEWIRjAj8eqQiD
	w==
X-Received: by 2002:a17:90b:4b0c:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-39b26121f6cmr45189132a91.2.1788883972013;
        Tue, 08 Sep 2026 09:12:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fe843sm26901209a91.10.2026.09.08.09.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:12:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 8 Sep 2026 09:12:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH 2/2] hwmon: axiado-tsadc: Add AX3000/AX3005 TSADC support
Message-ID: <5f01098a-9d83-4f4a-957f-835d63196a98@roeck-us.net>
References: <20260903-axiado-ax3000-tsadc-v1-0-a8a0f3b251f5@axiado.com>
 <20260903-axiado-ax3000-tsadc-v1-2-a8a0f3b251f5@axiado.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-axiado-ax3000-tsadc-v1-2-a8a0f3b251f5@axiado.com>

On Thu, Sep 03, 2026 at 12:09:48AM -0700, Petar Stepanovic wrote:
> Add a hwmon driver for the temperature sensor ADC (TSADC) controller
> found on Axiado AX3000 and AX3005 SoCs. The controller measures
> temperature at locations within the SoC silicon die.
> 
> Each TSADC controller is registered as a separate hwmon device and
> exposes one read-only temperature channel. The sensor is configured for
> continuous conversion during probe.
> 
> The current TSADC hardware does not support threshold or alarm reporting.
> All TSADC interrupt sources are masked during initialization, and only
> the current temperature is exposed through temp1_input.
> 
> The averaged 12-bit ADC code is converted to millidegrees Celsius using
> a lookup table with linear interpolation between adjacent entries. Raw
> values outside the characterized lookup-table range are clamped to the
> nearest supported temperature.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>

Applied.

Thanks,
Guenter
