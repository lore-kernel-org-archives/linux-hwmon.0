Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B733B6BEB
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 22:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778798191; cv=none; b=VbLxUHjqjmMMhDmMH+dN4T5bxHEBEf7o6FoiFT74CHgXvbj8boEP8ZTb/RzbBXcEg0NJF3sDytYfPKO1ztEGiw6VJCwxBwuuuNNZSJMxdFGR3jabTxskIycgaCGZquVv5h5Eaf+hVjJ/EQcjQf8iegOPykLLqE1H2C6/BBLPQKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778798191; c=relaxed/simple;
	bh=lsNGluqTx7YGA3Y2CmfX/wCwf0cINNrUdJZdujktRSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sC7L8ym8oDHiRm6gFzf934/tHKFIp8u5cYuJnKPaAjnIl0uw880l05Y7bszSl2h5CCkD+GrY3ctPj0cuqbCfIEBMaCHFGeX/mi+Ge80QXgtW2jKHTyBUOvwJP/8HLTADFBpWJ/NLCboULd1hd5K4IT65gT31Y8kWP9sFw03jYEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dKWRvTW8; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dKWRvTW8"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-134ac81c445so4525566c88.1
        for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 15:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778798189; x=1779402989; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z3lEAt6dTncV+ioqy1lW1e6spsJQTbpRWpTPgK9KgmI=;
        b=dKWRvTW82q563uMdrH1xDEftkiXf5WerSrZTbslz6LqTYWmHOAyttf9Bwh+FYmp/Lk
         EofSBS/ZYuDTkizReJdWzO00ZwH7Yv6CNil5KZWhMjvkntpy/OfpKA1VFdaBWhF1NOTr
         r7VduOVCO8V43Who+PGewo4HU2f3OPV4+kwk8vKaTZHop5TJpQFRaQrIs7xQnhaFM+wb
         v+8n5PitC0R4ofsh6nNvKwprv/uAub6RYXVKuWXJgBQoxwZG08+QS3Gr1WEWQWcuv9aq
         CCKeqmiY5vroZ7B2F0E1V3w7PxHSyvaJG6tfm2Hi5xzkYFqLMo+Qzrqzeu3PMqZ/XSjp
         3tXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778798189; x=1779402989;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z3lEAt6dTncV+ioqy1lW1e6spsJQTbpRWpTPgK9KgmI=;
        b=ABmWyDr7azLYw4lvaEJiKO7zhjzIGc7T0cIgzdIOJlQXwivGQ9tdU8/IKwMxoYqIaC
         DRv0xKx0oTy0Fscih003R1y1MnSZGbrsQU/cwh5kUm9JapygpekPZTokW/nao4/sgut7
         UcF4PzDYHTWbSJzTX3wQwsBGdup6QtXsK+8ayWI8QXisMgfnSEM/efQ4a4b/HN5AZfYv
         np3U4ctcxG6YIKXmJkhfajjJLfMfHVWDt02DKvBua/LJw49rEcZX44NT5hlsxZJJ5s3Q
         ibYcdIymUkUBnBARlDvfxU3G6nSkP5GkNgfLQ1p8+qh+752Xw2zbu7hDWHbTef3v/535
         bD5Q==
X-Gm-Message-State: AOJu0YywRtQ/x1gLMXm9NeHPJLyVkjGyupOITiK/cAP4kFIiwJp05JWh
	/sQgwePpvledg1gSjSaSuvCkYWkhDTOcuLD/0K3B/e6lxP3rCiCuvVd6of8DtA==
X-Gm-Gg: Acq92OGRt8PAGcs8QSLgwyq/t1v4hTo67lxSWviryuOrowwnntwnLvGqQHP3PEVvIY7
	HWve+wnJ5g3zat80O7AJRCwL6t+9sB5Lfop9T1tPgF6n2+3ecU7aNpTCZ1hIEZc9Ps4Yie8Rgez
	9PeddgSA2VKYH70RVHBlVxspmwxXDCtPh57cmO52mJx5zBciSlAHuVuUxczH/8tT/ClEyef490i
	W58JX20TYhOJ1bIXMfyfcW2Anj6SR1bbML0cCjo7TIs3RqzZEZnr7oF/JPosd/s6tshI1SJWZVa
	SJbgcA9tP0miqP24SsWOIVHC+QT4BDjSH0Js3tidQ/QFBhaahMUp2WmJ7m2dU4yQNKCu1sE84A9
	wNvvCpd1Ykig7cOzO9rcuyCcYnmLyO1fz9gXgJupPIdiZnsAI9WPnQKK52jhvn55Zw0vzAyo+he
	qaRIK3ZiH2PhXHBV+SYkKueqhALjaRtNeyO1HF
X-Received: by 2002:a05:7022:6b9b:b0:130:9b78:b17b with SMTP id a92af1059eb24-13504a4fd4amr520257c88.38.1778798188725;
        Thu, 14 May 2026 15:36:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cf44668asm5399780c88.6.2026.05.14.15.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 15:36:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 14 May 2026 15:36:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] hwmon: Use named initializers for arrays of
 i2c_device_data
Message-ID: <78511406-8da8-4184-9704-f9777427e8da@roeck-us.net>
References: <cover.1778688802.git.u.kleine-koenig@baylibre.com>
 <65b77bcd452752c36d866069cc5790b26d2bf8dc.1778688803.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65b77bcd452752c36d866069cc5790b26d2bf8dc.1778688803.git.u.kleine-koenig@baylibre.com>

On Wed, May 13, 2026 at 06:44:58PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> While being less compact, using named initializers allows to more easily
> see which members of the structs are assigned which value without having
> to lookup the declaration of the struct. And it's also more robust
> against changes to the struct definition.
> 
> The mentioned robustness is relevant for a planned change to struct
> i2c_device_id that replaces .driver_data by an anonymous union.
> 
> While touching all these arrays, unify indention and usage of commas.
> 
> This patch doesn't modify the compiled arrays, only their representation
> in source form benefits. The former was confirmed with x86 and arm64
> builds.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Applied.

Thanks,
Guenter
