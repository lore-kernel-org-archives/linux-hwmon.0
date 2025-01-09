Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C91619D072
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Jan 2025 18:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736445624; cv=none; b=hueNM/lAa40eaEl94a748mhVh6HwN/zL4t6OrJwG4TBtQq5MBkmlhhNRoVMApH0DOD/PvV0vgn3oq3Iy6PUk8mnSJGHa97c8cpXNOP/EDqYmztRGIz/WTCfajloRWf/pSk2dsUAc/HlTnCsm7vqQDWN2DAZPochC1gGk9wZnflk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736445624; c=relaxed/simple;
	bh=N5uM1zrDOuXJmDuhW7iq55HhMUx3ojHwb1js9x0VTc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CqDhUD5D63dPeTZs62ZVJZgaQJu5l4Q6oskW6Ik8Ws6tv1tdX7cCKdiBC70ocgO9e8yR/wkIVMdjpkQHZXuFk56pnZ536wqh8icmGttsP6ZUVhr84SAS6pSxQ+0SB9dyEiUlUSO96sR9Ku+5MvOasZTM5y/dplwwt4E4vNeAsHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fKcKrLeZ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fKcKrLeZ"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2efb17478adso1974461a91.1
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Jan 2025 10:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736445622; x=1737050422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sefHBZez1R1hV/D2LSwrM6QuVBV0jG0gTOZZG1rxa3k=;
        b=fKcKrLeZcQxXGN9iN78EsCuEQiuI0700BjEilHwKSZAB1mHANpz98J3hthpmy+Fi8B
         0F9kggMag2Ca7iyQH5u6wkMkiR1YqD+nHYLQJKimvXJCxowR+ukWEfjnHytcekf2d/ed
         gmRJ+ili4GmyyaoAG/Xqj14Ypi70mdXFZFpbCRgrgiEd/MmZbcVF2gs3+LdA0ITNArkn
         kA6/g+KRjbtTy0uY6teUh66GBE16ibRQPSs7MUcLzTAGIF5QrQJsEX5W5X1ain3Wg7TL
         jBBA9JqSqk6mVINPH6N59ASnagJ2yOmBNGaRe2V1XEpyh32H3I444WG/Uq1oaVJeyMgR
         0Ekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736445622; x=1737050422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sefHBZez1R1hV/D2LSwrM6QuVBV0jG0gTOZZG1rxa3k=;
        b=JwlC6cYwQWspEqbZ6kOz2YUMMqyLa4skFG98AzkoMho7GBZDPZhxl1x8IBjpZSfcLS
         xh6XtuAXf5w1xQDT6loYA13Aw+lESALng+yM1Y9o9KrQN4afCJSgV+hilXnCavKQDRcP
         qEMRZbIfZ+RXW3MKE74OAQME/6u+a/uFhLmW8oR1qeCPGoKabPeAbWfHx3panrzMIrtU
         u+HZouD0ujsNM0vpk5Bw6AoatT7lArZ45Ql7uuRs+ONa7h9fiQ6tx/P9N+pG8+X3EXpv
         7zxxkYfSPc/fO8VwTtRPzF6myl6wMkO0KPFMii/N+tXPpO9ufSDtpARv45HN1vLbV4t1
         I3Dw==
X-Forwarded-Encrypted: i=1; AJvYcCURk7Gge+UYzlsMO61sg3OgDA85n2qeH6eEiW7iQ4EXPyf4A6bflTCXKT1drOlcRGDMTcNeGrqeYgTjfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YybBd3G8XMahcETlrkH2x9nZ3dpTaXiwA2A6oQNLNyT4MJ0uBZ8
	jDWY6TMplrCpccSuH+fmC594dULsnvOYgxT4XYV4+VO5S0fA6cX3vwrKbw==
X-Gm-Gg: ASbGnctgHbZGKGP+uLn8H8YZtYYXFTaa3lhcXTM/vIEO3mNjXhyKbI4BdxYerT+Y9Q/
	iASQ5inmwc6KszPvR8fLtR9NftW9dIc43bysRV6JleRc56DrjWllC58nsBGKlUqTET8fdAF95dP
	M5tcaoMOsDxxY0tTY8QvPAEG48tA29CPejiXRy1JRGYMVKYZcRJ/9TfCK8jR9eGFHGfy3eg10gI
	MzkJ/O+S1bbfiCioVZ3b4X6F6GzGlzzMQDRSjrss1+pPl4ir++EO/hlw7CTgszYqf4sSQ==
X-Google-Smtp-Source: AGHT+IFbgYJ/b3SFnCMBaiWrAnjTqEIqLQ7FKWV0h0eldrC/w3pHYuxTuid1/26waPOvRp882IhQyw==
X-Received: by 2002:a17:90b:2c8d:b0:2ee:ab29:1482 with SMTP id 98e67ed59e1d1-2f548f2a9admr12518269a91.16.1736445622258;
        Thu, 09 Jan 2025 10:00:22 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f559439ae4sm1877810a91.30.2025.01.09.10.00.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 10:00:21 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 9 Jan 2025 10:00:19 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (core) Use device name as a fallback in
 devm_hwmon_device_register_with_info
Message-ID: <51d9548f-3182-40b2-a832-b1c4afd117ad@roeck-us.net>
References: <1cb1c77b-177f-4b03-9fcc-9c892391e654@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1cb1c77b-177f-4b03-9fcc-9c892391e654@gmail.com>

On Thu, Jan 09, 2025 at 06:03:17PM +0100, Heiner Kallweit wrote:
> A number of network PHY drivers use the following code:
> 
> name = devm_hwmon_sanitize_name(dev, dev_name(dev));
> if (IS_ERR(name))
> 	return PTR_ERR(name);
> devm_hwmon_device_register_with_info(dev, name, ..);
> 
> Make this a generic fallback option and use the device name if no name
> is provided to devm_hwmon_device_register_with_info(). This would allow
> to simplify the affected drivers.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/hwmon/hwmon.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index 685d4ce8d..1fd3d94e1 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -1170,6 +1170,11 @@ devm_hwmon_device_register_with_info(struct device *dev, const char *name,
>  	if (!dev)
>  		return ERR_PTR(-EINVAL);
>  
> +	if (!name)
> +		name = devm_hwmon_sanitize_name(dev, dev_name(dev));
> +	if (IS_ERR(name))
> +		return ERR_CAST(name);
> +

That introduces an undiscussed change: It handles an ERR_PTR()
passed as name parameter, not just NULL. Why would that be warranted ?
It may not look like much, but it introduces an inconsistency: Other
pointers (dev, chip) are not checked against ERR_PTR(). It is also not
immediately obvious to me why the driver would want to check if the
passed name is an ER_PTR().

Guenter

>  	ptr = devres_alloc(devm_hwmon_release, sizeof(*ptr), GFP_KERNEL);
>  	if (!ptr)
>  		return ERR_PTR(-ENOMEM);
> -- 
> 2.47.1
> 
