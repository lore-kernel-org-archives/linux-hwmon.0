Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E483101DC
	for <linux-hwmon@vger.kernel.org>; Wed, 28 Jan 2026 18:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769624539; cv=none; b=chXjb0jdgjs6uDJ5p8yxOwQEv7Xzy8ZSEY+xMjoTlbYGwsJObgy7FPCmEarhpuTX1zlEZ34y99QAVUdZZctEhBaNUILE+c3CQfxfAE7aD2b64pi+38YugLPeVO7in/pb1BfN5lx7gJWD6JBXDrVj2flBu29xvTnDLVbVlawYRBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769624539; c=relaxed/simple;
	bh=RJR1H+iu/kZxlNPuw++tzsBqS5Zwmg3D1lpiK9TTT90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XC8hkpXivkVz9LxMObL6mKaoMzacaj1JveT5bhpDhB83NGKW5SYCiz+7DXz8s1hKov8jOFMEnhtbi6XISkD/lDMOLcNpC1m3xHeWWamBLdWmLiG+SGKOLGe8TYRw8HK2r4CnO1cdGlnt8nWyi5k+hpQ2on7MCx4xpfOkJIAuxqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V+YfU063; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V+YfU063"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b714f30461so181576eec.0
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Jan 2026 10:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769624537; x=1770229337; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mcVqp2rUpPp/VVSCM0w6MWN1dKIoJLmI0hVnpk6TA9U=;
        b=V+YfU0638w7bUQ6iueg7defpOlgyBmFFgB8fjzOl7BYashOZ92kuqWX+GinYtb0Ggw
         +/nVqDKPSPSiLP+DAdbm4fHBPSmFI9duQJAIk3K0EMibkUukFpqIPXuPn7832rxlN/9L
         U8hX4miVIAwUbwXmiQGwryjWdX5fMgGPKsT1uJ3VJ4lMKt8gwyEzqP7x2u6eITX5dEQo
         ZDjz0WmeO5Ajk//zlgz0kIn5Z1r+eHLMdZ6nLxIOIKZdIMu06WpsnxP37EkeJx/bT0Pc
         hPGo3FfDRz1RiFWXwLu1Q/oU+jE3j11xu0OEx7fuqWX7g8GrLap7OoQdYIAVN6wlkeFt
         9K9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769624537; x=1770229337;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mcVqp2rUpPp/VVSCM0w6MWN1dKIoJLmI0hVnpk6TA9U=;
        b=nID/5DEK5FqgWUoh6pMdMF8yneggGPznjz0cWDKSGMG82n5SfCLsNsvukYtUf7W0LG
         /KKtXc3TTq/98gGA08TRjzlAaCY945W/0Tqgw9TsqTLygCxjLxUN8ZV/Y+p4MCXVhkb3
         wB+pnoR//QBZLMS33EGI1u2TwDf9PeW5I+R7725DfTikIEwJrCl8DRkfSKwAu6MJ7qr+
         HU0bCfHEs1uWB4mAwwY1Eg0N3SisivPRln3zXNyq6QjQbfQeMzrfs6yMSNY3xB5SWPTi
         dyaJKvxWU4fw2CW3o88g2AY9XMPHHkO9dGosyPwCx3PS3v7F46aU+GoIjwSMuYsjGB38
         gh2Q==
X-Forwarded-Encrypted: i=1; AJvYcCV8ydAfTn+RjghyIJiu9iZcvybaT2b7E37kPoQpqrNUDldChfcCWDg30Vs9AE+63InBSNiGEk/NrhZweg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9GrR24OuZS51AFWJYNn9fO55BX7fsZ5ZL/UQ0779v2/6KycoS
	Lrx4960I4IhZxDIyvYGgNL/F1fG5iKIdHBATdPfFb4AEJ4/FpXgVaTnC
X-Gm-Gg: AZuq6aJ5v1E6iXxkFLXx1rK626s/QMWv7BH0LRdHmAU5nVDtXuAyWznnNnICeuco8Ze
	pnXocpotE3oNYuruxiZkviqwv9JGCf5RmIs8KarW1xkVjp70+y6YmbAZW+fj6pdBbHk/EsFp4x9
	AW9+WHXudqKkzw1r1Kksz1XGu0fwxlalTIIBq/3QWbBc6SKbgxcYh55Lek/F2PohvyXpe5wPsR8
	9v88FOvLafRluROpejE4O/VW8tYtklTpvyd3owq7y2ZdGT/fdDxM3aBoLN1URVzZSZ9wyMEkjHl
	Irw+4b+1hBkfDNwd93pF5BFp+eXnoGrA812nbgsWBy2mkGpPXUbqBeYoauYnrZL2S055l/H8zgA
	lVKvgmbi4t2oZXzFYOlqIqikZ9qL9l/wRJcU138htpklSXa3QwPlJxI2mOuOJisbgBaleiTk09T
	h7krtAAwyRDapXBuhtGdZaRUTE
X-Received: by 2002:a05:7300:2314:b0:2ae:59d3:46d3 with SMTP id 5a478bee46e88-2b78d9d54ccmr4405093eec.25.1769624536911;
        Wed, 28 Jan 2026 10:22:16 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cfaa8sm3543912eec.4.2026.01.28.10.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 10:22:16 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 28 Jan 2026 10:22:15 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v5 0/3] hwmon: Add support for the LTC4283 Hot Swap
 Controller
Message-ID: <e2208717-0f47-48d6-9cf2-20196e13a3d0@roeck-us.net>
References: <20251223-ltc4283-support-v5-0-1152bff59a61@analog.com>
 <eed64bf1-93af-4b36-adf5-1476cb40edbb@roeck-us.net>
 <382e259ea3835ffbd2be9c36b529875f5a43f38b.camel@gmail.com>
 <8efa188b-8b91-479c-ac10-3fba5b0cbb5f@roeck-us.net>
 <02b7cf63-4f87-4cdd-8d9e-53a7d0e808a6@roeck-us.net>
 <e5b775065b92cada730f42a3d60546700ec46db9.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e5b775065b92cada730f42a3d60546700ec46db9.camel@gmail.com>

On Wed, Jan 28, 2026 at 06:07:24PM +0000, Nuno Sá wrote:
> > [ ... ]
> > 
> > > +static int ltc4283_read_power_word(const struct ltc4283_hwmon *st,
> > > +				   u32 reg, long *val)
> > > +{
> > > +	u64 temp = (u64)LTC4283_ADC1_FS_uV * LTC4283_ADC2_FS_mV * DECA * MILLI;
> > > +	unsigned int __raw;
> > > +	int ret;
> > > +
> > > +	ret = regmap_read(st->map_word, reg, &__raw);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	/*
> > > +	 * Power is given by:
> > > +	 *     P = CODE(16b) * 32.768mV * 2.048V / (2^16 * Rsense)
> > > +	 */
> > > +	*val = DIV64_U64_ROUND_CLOSEST(temp * __raw, BIT_ULL(16) * st->rsense);
> > 
> > Does this overflow *val on 32-bit systems if the calculated power exceeds
> > 2000 Watts (approx 2^31 microWatts)?  The intermediate calculation is
> > u64, but the result is assigned to a signed long.
> > 
> 
> I'll have to double check this one but IIRC 2000W is not a realistic value for
> these applications. One thing that could overflow is power_max given that the default
> register value is 0xff but we do write the proper max value depending on
> rsense (I actually need to check how will this behave in case we use a default
> rsense value - ie with no DT property).
> 

I have been wondering if I should introduce a hwmon_power64 sensor type, similar to
hwmon_energy64. WDYT ?

Thanks,
Guenter
