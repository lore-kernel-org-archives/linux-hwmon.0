Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B53EE18FC80
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 01:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768267994; cv=none; b=rjcNx0hGp2H87oLBeXzv8M2xgDB6ANamT5bavN55W2hDqIaEwjy4v66e8pHC5UyqUCHo7HNUC3CltmafZymQYrOwmrX35HKdSAm4LoFXXPXR9cms5a//i0xo1I0u33kfRNI2GmVxVccL9YT9/zm+ePzIEdl3phqb0fHhXoS5uEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768267994; c=relaxed/simple;
	bh=ad32iXyTi4EbZ1XO99xfmDWdXhUVYTE5uI1F/YJLopw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PUFg+dDHgTglHd5u7fHNS44CE+0GPtvCdJ/WeQ0QjwVOoXDp7ZC8CFmUHW5hi62a21azhfjMwOlPZHAqmfgXsjG4nf2qBZYwWbrg2oYAa4iYrOMOBqYrKGgnGPHuX+ebYNbE1f6gAGMX3Le0+ZriKvJO3+8LEoghn+2QSlRfugE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAlkfDCt; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAlkfDCt"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5ef3482907aso2799540137.3
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 17:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768267991; x=1768872791; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/HecYQMpzSx+pKogOGD9AgS/QaSSY95HkqZjIA46rM=;
        b=nAlkfDCtBx+9uVBGlKeMzFxphOObB7fSVsixw8KPYdHiFbFwn55WSBCJ6DllTK96KZ
         /UdUHGvZmSh7yglW2hwJ7fNd0bDEA6owaYY7WH6SBnM7T23Zh/JcIGsSgQf/a33ZhuLB
         shw6ae7WIywkNE+eJ28yPOrsZ1PGvWELry8N92gSkkIZ5NJ3DgFN6zsfd/5/ALtq3Utn
         JCWvOIHqB+pv9qhkFhAGzNHXyiLhU3ymvIRr5OY7Qw1mpyAUo2JqACOQEFcvMF8s7ond
         LY7gzNTjn6jyr4MBH/kTJwtPjJ13sEMNMrY0xg29fpzILDy++CvZuPKQoPDmcMhI/o0b
         4d3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768267991; x=1768872791;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M/HecYQMpzSx+pKogOGD9AgS/QaSSY95HkqZjIA46rM=;
        b=b64ZGf+5vbJkVFRnfqhN+pvxaIMG33yPi/XjiecayBNDIj6jJI97bjEGYJCr7iuzu5
         l4XPKblU781qN0lRa/xBUbGNBLB6lz4UjWopVlYT0imu8lyH5/1WkAnVxgm8Yb4U+V36
         hBLgEFtUQX4vuSOj0eUS6PFg/mOGBBX+VRfBHcmEklhkJDqUrjyrUYmJFxsuhkANGw0S
         8bzkQ6SGZWFNMLzIjtJkAvlA6OSs8dHHI8UHz99y7Dq6vmqFxHkdc1UJK8aRytrwmHNA
         QQ7p2/9gRGYgAeLrIaQArLxc7HudjpHFNq9dRRvdP6s+lOHfqcAPr12PnuUQnl1nip7T
         b0aA==
X-Forwarded-Encrypted: i=1; AJvYcCV+YwJUx6m1p6vDRODn9sGzytN0JrFNXcPGCU6lHqEDtlq6gfIWi4yEioUaALRCdOU/PlQc4vxjvXl6eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbJZSKYeZsXbLULUsip2bAJ1Wzw6M/O+kM9uDfxgwfNZGFDb/+
	uO37azWhZbHA5NDSvm+ArO2FPc3jGpyybMue9e1a+v/wO+vcmkmjeAHAFeyW7g==
X-Gm-Gg: AY/fxX6oYz+fGfbztMhyXJ6jT9ePqec/GpuGpWQpkjMEV3hXCREb/3ZoIei+wpz7WKO
	/vKzKkiRPpLFrTIyARdhVCsHIUFeqkSDUy4iBiau7RFdPv6uwJYn2oy4s3UKwF2q0xWTCuSw/GC
	xYwcncc0ys1Al0BxqBnAmzhurQSB10W9G3bOX1mySMseXNn5EMtfoc/ccRf4uH+FQpyE2eISU98
	L+lF/NOyApK8paWUzj4QUFAponD7mvd9JZy9ojR7BUAXSBVxtC5iNdYOoH7eBqHTg95Bsd0Ga2M
	sqJ1tSmUFiYBvXZx8/FLeWByfCeVDbaefNeAgF1ppeHDxZfc8gxfZbO+JvQxvXKZcZqlOYZ5Bfr
	iaz2mV2omc0AcfuvHmYDUsqA67uphL+xeZmsiMLwfdzAdtsVL8fxV9vciFBMwab8k3iZUV2U3Ni
	vlehf4uS+3ffwLmWLOk/PxYt/Q
X-Google-Smtp-Source: AGHT+IGq7SH/P29EOxwJv+i4U56r7yzSOhU39ES1wZYIBI+ODZJsWgoNszRhwOG326pCJxzPcgjgSw==
X-Received: by 2002:a05:693c:4151:10b0:2a4:8576:abf5 with SMTP id 5a478bee46e88-2b17d2b0af0mr12747919eec.23.1768262565381;
        Mon, 12 Jan 2026 16:02:45 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1707b0b2bsm16475727eec.23.2026.01.12.16.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 16:02:44 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 Jan 2026 16:02:44 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Cryolitia PukNgae <cryolitia@uniontech.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	zhanjun@uniontech.com, niecheng1@uniontech.com,
	kylon <3252255+kylon@users.noreply.github.com>
Subject: Re: [PATCH] hwmon: (gpd-fan) add support for Micro PC 2
Message-ID: <2892cfa4-f033-41b3-bc8d-b849dcbd1a07@roeck-us.net>
References: <20251222-mpc2-v1-1-695d8d351cc1@uniontech.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-mpc2-v1-1-695d8d351cc1@uniontech.com>

On Mon, Dec 22, 2025 at 06:51:39PM +0800, Cryolitia PukNgae wrote:
> From: Cryolitia PukNgae <cryolitia@uniontech.com>
> 
> GPD Micro PC 2 is a mobile productivity device with 7-inch screen and
> abundant ports.[1]
> 
> Link: https://www.gpd.hk/gpdmicropc2345345345 #1
> Co-developed-by: kylon <3252255+kylon@users.noreply.github.com>
> Signed-off-by: kylon <3252255+kylon@users.noreply.github.com>
> Tested-by: kylon <3252255+kylon@users.noreply.github.com>
> Link: https://github.com/Cryolitia/gpd-fan-driver/pull/23
> Signed-off-by: Cryolitia PukNgae <cryolitia@uniontech.com>
> ---

Applied.

Thanks,
Guenter
