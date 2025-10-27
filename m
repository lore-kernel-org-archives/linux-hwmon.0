Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D83220694
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Oct 2025 06:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761547293; cv=none; b=PGCuQ6SC9IBRjiANMAYROvtHyS12yn6zL7c/AisOtZ2POfUVF1SAaIaT6oy0r/WRgipOHfv7YgpaCgdDpRlH7WzYsWesBMrzG7Ki2ue3Hbqd+pquPZ4ZZjCP6GAUkkgpJ+EL9i8fuG/coqxZfPbMFcA5URAa4uwG1M38DgRwTvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761547293; c=relaxed/simple;
	bh=NPMQeSnux1WgQoNx4rxVtVlmNiImFDKpyKy8ElUhOgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G7D8agkVjYbO6RrudLfd16clhzxwssY81RhQaMMLk6HWkPh+Jv7U4wt/mWjzDJN0Nrj/Zdaf5gE9lxMkvJlRQC8ixLLqPA9IQCPWTWgN2pHsJBWQA9odB4xqw9iNKB0Sk3YjwG+UnMllGZibLuLen3+ciN0ceDQVqnxQ0JQMD68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=ad57ETgB; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="ad57ETgB"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3401314d845so715608a91.1
        for <linux-hwmon@vger.kernel.org>; Sun, 26 Oct 2025 23:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1761547291; x=1762152091; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BNYKZ3q1Auj7hMkOKDK6a1DLo0lCG1SQUrXtOHXGU90=;
        b=ad57ETgBYBam3lMPV2kfwPCdckEBTejF9rB1d800BMCNlzO6inDfKMLuLA+eze7v5Q
         NJko8MP6zTZ865XM4J7h5F5bg3JLln8mx2/Sduau2Fqcv5aiG4bAXfYrTpca3+p3u0CO
         HjdCoYohJykQsJ2LVrT6spYk39HApfj4+CWn/O0uOeL+FRl2FJ8jWBI8i5CZ/cdgd+uS
         MTF38HsZFslgBfMDEeHP4ThrPqL0zgZC1z3WBwOsuM97VzuJPGmQ0bTT+OJRHZ1XGPo8
         l7yeVBgQTUV72V71MeKesPnB9EItaxHEdmsKnL4AyQo9JADbLQrealTy/Abln87M6SJg
         MNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761547291; x=1762152091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNYKZ3q1Auj7hMkOKDK6a1DLo0lCG1SQUrXtOHXGU90=;
        b=wDNbxJyOpwaZpd89j+czgcqfXkhmlCdEAIHtdSMhow1KLd7nSiHILx/A7eIPTnE008
         Uc45lILs2B7Ma09DbEnFSY3r1kz8+K1Ltnziuu6t12N+Nelba7fxBLaRPs/MiJNyWDiQ
         F8tibJ6eXWlQvzcEwtve1OS/XsJc/ufh8kCVFWpU0P5oy8nz8MXU7T42XHvSGybakNSB
         EjMMVOVAKoiQRFnChVG0mF8GNOFm6SIEdHYCpZ4U0ocB4AFoPU9ReE0WaFjE2vY0fLy7
         vXr3A5RCnLqEtg8UPctFiLxAWf9nEL5ralhHgGr1Xeq9+ohZCti1iek0AQqGUvtFwjaO
         bU9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWmD9YgsAxqKMDv6w7IefaAG/sA0Jz4qPW7lOR7l5ChLxURm3tASUe0jpa30x7iWoXW0NyECwdF8UMxGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaWySamjfeQhc/GAVSUdEXrAc/EZLpbyZpX+NvucWq4QmdQW9l
	UQHahdHHFyqbZcT8bu9tHoq54n1YU/WNf12RIdTfukOaV0W0PCG7VtLx3NNsF9k6rqo=
X-Gm-Gg: ASbGncuZT2bHbIyN3hxBZqon3Zz6ohis4a8URwX8VrvSd6SBEqF0NmoOnV12DiAyc2X
	EYpZOKU2RXNBCbK0wa4//N5+OH6CGvk5QjntilTBAci89co9sfuKQ0aG/PlBh6W6ScUTJMsrj2h
	nSOYcpKg6trPUUZkehq8qGn1NGV15spsitVjKQaOllMGIkFN/b5EPlEnDRRcky/iz+7scEUHuxW
	5LkXqnSARJ2bm/H7z2WN2SypbNh3AS3hdIFWRaOnqSgfl8GdJ1cWeu//k4A/w0N10Rtv+xhQvJH
	fJE5YdIdD/28lqAHCbcuI93AlJu89fhyNq36V4hR71O5J3yZrwU5r+9iUWsMRzR2knJLpPB85H/
	39/xql6QcRqKJFva2KKT1Foqh5qvVbHkiOF1McaK9W9NCO1gJaUxSzWGpd0h5TjFX5a2IJSF0JX
	LwG98iHH/uZo1fC9D3oLz6+4H+vXg=
X-Google-Smtp-Source: AGHT+IE8qvj8HBsTwz5HGw5OIU28tMFtEpb+ccgQfqfh/iRW6PjNGYH658OE70RjYaYmTrjBpzvyzA==
X-Received: by 2002:a17:90b:2690:b0:33b:b453:c900 with SMTP id 98e67ed59e1d1-33bcf8e3d67mr49587249a91.19.1761547290681;
        Sun, 26 Oct 2025 23:41:30 -0700 (PDT)
Received: from z440.. ([2601:1c0:4502:2d00:599c:824:af74:2513])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed81c9e5sm7276917a91.17.2025.10.26.23.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 23:41:30 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: linux@roeck-us.net
Cc: conor+dt@kernel.org,
	corbet@lwn.net,
	david.hunter.linux@gmail.com,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v2 2/2] hwmon: Add TSC1641 I2C power monitor driver
Date: Sun, 26 Oct 2025 23:41:27 -0700
Message-ID: <20251027064127.648712-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d3365f32-dc92-4a55-91a1-c4a446558c5a@roeck-us.net>
References: <d3365f32-dc92-4a55-91a1-c4a446558c5a@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>In some way this is inconsistent: It accepts a shunt resistor value of, say, 105
>even though the chip can only accept multiples of 10 uOhm. In situations like this
>I suggest to expect devicetree values to be accurate and to clamp values entered
>through sysfs. More on that below.
>
>> +	return 0;
>> +}
>> +
>> +static int tsc1641_set_shunt(struct tsc1641_data *data, u32 val)
>> +{
>> +	struct regmap *regmap = data->regmap;
>> +	long rshunt_reg;
>> +
>> +	if (tsc1641_validate_shunt(val) < 0)
>> +		return -EINVAL;
>> +
>> +	data->rshunt_uohm = val;
>> +	data->current_lsb_ua = DIV_ROUND_CLOSEST(TSC1641_VSHUNT_LSB_NVOLT * 1000,
>> +						 data->rshunt_uohm);
>> +	/* RSHUNT register LSB is 10uOhm so need to divide further*/
>> +	rshunt_reg = DIV_ROUND_CLOSEST(data->rshunt_uohm, TSC1641_RSHUNT_LSB_UOHM);
>
>This means that all calculations do not use the actual shunt resistor values used
>by the chip, but an approximation. I would suggest to store and use the actual shunt
>resistor value instead, not the one entered by the user.

By "actual shunt" you mean defined in devicetree? Then does it mean disabling 
writing value by user via sysfs and making "shunt_resistor" read-only or leaving it
writable and clamping to devicetree value, thus discarding the user provided value?

>See below - clamping is insufficient for negative values, and it is not clear to me if
>the limit register is signed or unsigned.

>Also, the datasheet doesn't say that the limit value would be signed. Did you verify
>that negative temperature limit values are actually treated as negative values ?

SUL, SOL, TOL are signed, I verified. The negative limits for current and temperature
work well based on my testing.

>This doesn't work as intended for negative values. regmap doesn't expect to see
>negative register values and returns an error if trying to write one, so clamping
>against SHRT_MIN and SHRT_MAX is insufficient. You also need to mask the result
>against 0xffff.

I was under impression regmap would handle this masking correctly when defining
.val_bits = 16. E.g. in regmap.c:973 it selects formatting function for 16bit values.
I can mask explicitly if it's required.
It certainly doesn't throw error since negative alerts work as mentioned.

>Why did you choose lcrit/crit attributes instead of min/max ? If there is only
>one alert limit, that usually means the first level of alert, not a critical level.
>Raising an alert does not mean it is a critical alert. Please reconsider.

I used hwmon/ina2xx.c as a reference. It covers many similar power monitors which
have single threshold alerts and defines only lcrit/crit. If this is a wrong approach
I'll change to min/max.

The rest of the things are clear, I'll fix those.

Thanks, Igor
