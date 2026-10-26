Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974288;
	b=oO1wr7T1K1GfKPLJ/4tp0x9jceMckheWz7mT+++9evDjYvYItgH1/dhsl+Qka1wInxP2
	 28Uqft6Jtx5AX5AZvqjCWJiF95Uf/F7IkZe2gjmcJaCIRROiCruu3igUHvBQi7enLhEJ6
	 aVCkr+gek32nnrXioA4q6fBUQd9vYkeJ9UmdOt0BobUP9d/HdoKthKmMfZzIzlcejILjA
	 zxNIRbTEFV4oqZKWlLCtXHEu8Y8P79yMdEyztQMgaDByrhlsJalWkgzvb+kOOz2Zgc8wS
	 3ioskXjwRmXcRR4CvX752vq+6IvY0aqGUaH2KJ1LItuX+xdVuyteeV0rDf6G4AzJTUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974288;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HV83c2/+fbkcmd4e8V3tUmbhGiJJW07WJQ5LFrvg8bc=;
	b=oKm+fPqPgOWNurDzim+moUhvpybWsRxmZROu91aMZYh0+AyGOdruzh7B7mK3Nvb+PGXk
	 1UemyBFNkE81kRHsxF85mew4ZzBUBgpmGKtCGJduarPQwVlnqUsvN5IaMFieBhNnjT6PY
	 mmXZ9yfShfLd8GwSSFA/WdI0lHtQq03YemTP9OCAjlaDV/hZJXfRVb+tmvKMugXBFBGbd
	 ZPAQO4nyWnouOeyFiCrAM98d4mt6BjPNuA+NtDosg+81mlyI9nNC0UvPeqJn5tMRaR21r
	 8EaevzEY/P88LGLifEOFt5UyNJdQoKfrtLGRquqIHNR+gH58IWIHl1WVdXpS+yC9m7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QMARMDKn;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C296606A31E
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 00:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C296606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QMARMDKn
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e9e53d011eso17459715ad.1
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 17:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974288; x=1793579088; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HV83c2/+fbkcmd4e8V3tUmbhGiJJW07WJQ5LFrvg8bc=;
        b=QMARMDKnwV949KW4/7O7LSMd6V/YMqHz9ZlzpWPQ+s6TZykn3tcjCrDcHALhy1p1D9
         zqqj/8P2iA+mT9qEVy+OTO4BJMmNn57xNgP9cUxA94uldrS4V3XktyXb2Npr40PtGPuy
         km/P3oDXSbst12pKwgiayxeyY4umhESjvW8vcI/lsH8231KYo2AEuYpPYCEs9G9OqRi5
         ILdIktl2YHjxn/ILB2eQPo/HJLGk1XEysxZ7njT+GgD1zhFE4eCvQVj3jq9AYneT4VqA
         n4shNZ80DPL984vmHjsFDb6Jg3k0aVHR1+XFwi0SpyargLeisyh4sSxPIXy16x4yeHfU
         TTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974288; x=1793579088;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HV83c2/+fbkcmd4e8V3tUmbhGiJJW07WJQ5LFrvg8bc=;
        b=kvcMXzV2UjWjYlfUTKWkuXjiYMoDMhCVP2+KGqEeuOTiTXrMPqdLLb+DJcaQ88BNFX
         p5qoOrjY+s3D4EDLsoFbyUZK2kYKl20RVyQW1+7CdtD0pnVVPiLGYsEJxQ9ZUpoc9la1
         gQj0soJ7IEskm2/o92qwYpDBXMgVuWXyKsFxmaxuh058dn65NR4Sf6O+K3ouK5eJjeCw
         T3/LBkvp1T7/+PsuDFf8CRJavuL5rtdFn8iN6EcGM4yp5qouKBgj7N1af58cYNX4RM1L
         416hdYdclockiecjRkyn1/SM6e8DLBP/3D4Y0jTcdXu5pkpIJX8Wr7w6SnJmi784DqXI
         Wsgw==
X-Forwarded-Encrypted: i=1; AKwUvBxEi9PtryRBsiNuU9f9urJeSSJdAcCKSBGSVZzzFfZMch7uwgPvGELE5LtkCDUuJYkZB/aZ+QY57Mj2mw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIwTD7M8xenAyygyoIhWhfSQWfTEyYIjUpJyeH3NxzqT6/nysh+
	2RY1FHrQLCu3zQRtWTbXukkF+JpZfLio/z4oWjardpRqm34oKr3droEv
X-Gm-Gg: AYBFou2Eu2wcUdsf5eVpj9GbtxV5YlsJXwa4Ju66Y2w1ZG0tqRutvjY2EJdtUlBvnPf
	y5NNS5gWSP9o5ehQzHicYfQVsb/YMm7f1kV2JgwwD6WzKAkm2RP5Y+ysLS5aV7BCEkoFseIopVV
	YMGS3HM9kzDDnVfDrjv+fvo7eFWK0cALfoL5pEL+A7ggJ8hsHZRpFTSEr6IwBa8+9OSRUNfg+L9
	zrt4mCCkHiqSFYkccujGGAWz52xpZCNz6Vpxk2fBusBpYWpHjw46R6Ar828dIoavuVPWsf8VFw+
	gfIuH6RCp9xCxsd22M22pK52rTNYsB8+PglCmRHWVsP1GZIEtnZqHVGTA6aNMzgze9PcNKhcVs7
	dLM9kB5WNggr+31L2wqJkVyG8B8sWrLdxqGquv/dLt0Gf/aTrKeV+hnTGqMyojU6l/5+WOyOBUc
	m0PWoMYUkffrmhWypDrMI2LQ68Akw6gzuCHeazwz28u0YdwyE7fmNPuR5gpnTupTI0sRZmNN/VA
	Ihkq9Eq66a/6ZHWDFpqkVPvy59UUf7d2beTgTKR4/i7JpxbuAbYIQOAmhjk6k0BH6ixew==
X-Received: by 2002:a17:902:f705:b0:2e2:c602:2072 with SMTP id d9443c01a7336-2ea9c6c3363mr43122285ad.36.1792974287852;
        Sun, 25 Oct 2026 17:24:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b12104csm10407525ad.19.2026.10.25.17.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:24:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:24:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, jdelvare@suse.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 3/3] hwmon: (lm75) add MAX31875 support
Message-ID: <9977952d-339c-4ca0-b11c-9df45b6c7b65@roeck-us.net>
References: <20261023091550.1494-1-johnerasmusmari.geronimo@analog.com>
 <20261023091550.1494-4-johnerasmusmari.geronimo@analog.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023091550.1494-4-johnerasmusmari.geronimo@analog.com>

On Fri, Oct 23, 2026 at 05:15:50PM +0800, John Erasmus Mari Geronimo wrote:
> Add support for the Maxim MAX31875 I2C temperature sensor by
> extending the lm75 driver. The MAX31875 features a 16-bit
> configuration register, configurable resolution (8, 9, 10, or
> 12 bits), and selectable conversion rates (125ms, 250ms, 1s, 4s).
> 
> The MAX31875 has no alert polarity bit, and the bit the driver would
> use for 16-bit chips is part of its conversion rate field, so skip
> the polarity configuration for it. Also set the default resolution
> and conversion rate at probe so the driver state matches the chip.
> 
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>

Applied.

Thanks,
Guenter
