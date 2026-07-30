Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21513B0598
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 15:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424695; cv=none; b=la7MZc5f5MqGpvZf5zQHZCUxUYyJ7nobDtF+nBgxHws3oG04dckrU9EcazM4QT4l0m4FWZP1BWn87/lkeZauq1+hhJF4BxuD/jZ+wcmPZKBZcWi4QVTZpy+Rmn8Mu9Rux3WgkXj7xcPPkbdOulnCUUfnUrq2OKOCdxiJlO9TR18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424695; c=relaxed/simple;
	bh=72hnN/0rE7uzUdVvzXQ6rS4xBcofWgn8Ndd9UkHCOGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L+J4y9gpzmtepKjFoY4mMh3K/xPrEKifUF7IaH4ik+WepENmBwRvoezi2mfeB5nJ7O3iNsfmuPgzXdpocc2hJPU//iPqU/TQgY7uubl4EHvyaOSKDGtb0VXo+SVhjYGCcW5yKZ05MNTpY0u2WjzPSGc7rLKJISAX03lFMlNnC94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bdd5qv1G; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bdd5qv1G"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso15934895e9.1
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 08:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785424692; x=1786029492; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Edhb2n6rlJZQPuQdw5wF8BrPLoATNFthrzHW9vrli1A=;
        b=Bdd5qv1GJ9myn0Cs+T/Z+RBsxyRlTIuCltXZRxKsA4cbF4iTVxYCyqCD+cModZ+sxe
         8M1rvthmX+U8oUGBbMq/P8ver+v7JUYpp3Px9IVf7++EGVUPPZPaKtyBSwTNNAwxl6Zp
         InuKgmbu3aL8qwMyuYkJhn1sX70wfCaL2O6v/q6vuqU73vsRxQe+2mvxzNpOZAeLIxBY
         +WFuYwIG4KmRJlnxHqSXduisRYH9Q4iNbm71TBbqIOxOL1IfMhXsOCSKyFP2Yg9/zc3o
         AzWodz44TctvVFsSMgK1ZEJNBLng4ZM5IeuFi5Sn06ApZVZflIpZmrwa6oQUF33rWlY5
         e7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424692; x=1786029492;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Edhb2n6rlJZQPuQdw5wF8BrPLoATNFthrzHW9vrli1A=;
        b=sGBjU6n3nvYPm8sRwV53r0A6krD5nHz+DJFBIv5hhOx1thjiiD6Qk1YMMGYbWLB2jH
         4hLg8IgRAID5HyG+MFZHTuSx4tl6z2EqzMTNX4edKefx1lik6LEW17OEx95/EBdnkEcz
         +HcEuvc3AkzMryQX9rYCg4ylCnCQc9zgEeNQidPxim+HB8FVG3sNfil4QX/JQ8lArDVd
         NwEVVvAvBosthrjeCX6DvIrm2k71AXUzC6OepXZURmM+DpADCRaJKvx/W32Yq7rG398W
         dAS8UzYt1AlbpVWWJ9R6xJ/b4hCeG0WzIPq5XGHXBMgkus9GufCPNN694Y7CfoOt0X8n
         fpQg==
X-Forwarded-Encrypted: i=1; AHgh+RqB1Pn9NXm2FZJQKz0S6IgD5MOsKfRKMqvls16TwxFym/8ZYUqVOqfdHAi0O6OwBKf0GMkr86oXZrrERw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOoxwjELcPWYeVhA0fIIigrAIALHvHRffmKH6od2rv6LmHEfax
	wZggN6aEQsM2GOequbTyflRx67rDJZ3xygmHOqFTCD2P9aa9yYabaKgQTcWc4Q==
X-Gm-Gg: AR+sD10xdbM9qsEzzJY0IaUfI3k5dgQksRSJkwJC1uqdP7xxYH+nv+qdB26sFEXhQO6
	U5GoLOKh849Xza/sM4vfG2BhgZMLcM20A6LzJ+sIHJ20M+Bfv6LnoEOKsBuMFoeVssbS6aEuuSh
	jAPzkV1oUi0mQVeWLcoLDXxi6y4/syVDqyj2mH3akGcQJu3zoss7ODUhd8dNVbPL6OihTSV0P7O
	B/QCnY72OQPTs97leusVDXQJJxiMbjN+e/6YahE4eOirBmQTAW1p6fsyd40Agnqm/Qp84dxPzt3
	mWuIHu/i1rWr58sQpqmmPJ6GNAyEg7u69Wskn3th2SfhIr1va1E4NehcYRxMsLfxPI8PiUIGCwb
	7+bGaNhJVwyO53AHSqxHxqhmwq9BIa1sNIZviH+QtfIERCCSrjPIwaxAGq3Da5VlLjYAyM+bvDP
	j37C7+WDDiNF8igZnZqV1Di52Sw/ngXUwggdfaIMhLRWSzhfannM2+0fRzwwkVIKU=
X-Received: by 2002:a05:600c:4e46:b0:493:e451:a9e1 with SMTP id 5b1f17b1804b1-49800e6d495mr45990775e9.2.1785424691553;
        Thu, 30 Jul 2026 08:18:11 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49800e1f084sm7641595e9.0.2026.07.30.08.18.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:18:11 -0700 (PDT)
Date: Thu, 30 Jul 2026 16:19:20 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Alan Tull <atull@opensource.altera.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 3/5] hwmon: (pmbus/core) Add mapping function to
 pmbus_read_block_data()
Message-ID: <amtqPQSM6zsiCh4B@nsa>
References: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
 <20260728-hwmon-max20826-support-v1-3-224766e0acd1@analog.com>
 <c3e143ed-af08-4a0f-a630-96a255df838d@roeck-us.net>
 <amtewh9lOgWz0-Nh@nsa>
 <e37df572-1ca9-4c56-a16e-faa44f1ff1cd@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e37df572-1ca9-4c56-a16e-faa44f1ff1cd@roeck-us.net>

On Thu, Jul 30, 2026 at 07:47:37AM -0700, Guenter Roeck wrote:
> On 7/30/26 07:27, Nuno Sá wrote:
> > On Tue, Jul 28, 2026 at 02:05:53PM -0700, Guenter Roeck wrote:
> > > On 7/28/26 09:03, Nuno Sá via B4 Relay wrote:
> > > > From: Nuno Sá <nuno.sa@analog.com>
> > > > 
> > > > This is in preparation for adding support to a device which needs to
> > > > use it's own read_block implementation.
> > > > 
> > > 
> > > The chip-specific implementation calls i2c_smbus_read_i2c_block_data().
> > > I'll need to know if this is a chip limit or a controller limit.
> > > If it is a controller limit, a chip specific override would be
> > > inappropriate.
> > 
> > I'll reply from top of my head (did not looked at the driver again).
> > IIRC, the biggest reason we need the chip-specific implementation is because of
> > the RAIL selection logic (mainly when not in page mode).
> > 
> 
> Yes, I have seen that. Question is why you use i2c_smbus_read_i2c_block_data()
> instead of i2c_smbus_read_block_data(). The rail selection logic would not
> require that.

IIRC the reason was because the i2c controller on the raspberry pie does not
support i2c_smbus_read_block_data(). So I guess this:

https://elixir.bootlin.com/linux/v7.1.4/source/drivers/i2c/i2c-core-smbus.c#L220

- Nuno Sá

> 
> Thanks,
> Guenter
> 
