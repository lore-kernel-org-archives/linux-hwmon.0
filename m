Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B286217F53
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Dec 2025 21:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765403072; cv=none; b=AuXo7wp5i3E8roAs0oi5NIYx3oRp6RrhPZBFcr62g4WFnqJTEzjgxLVLcXjgUNL5nXBKxlGGc4t/u7K0HF/Zsa/3duoeveZRTCEAB6jtXwnBH1xjkn19BpfQDSZlHoBzQ7gscRb73tz7sAUjVfiak1etkDnRki8CSIN3ZXX/4a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765403072; c=relaxed/simple;
	bh=d/HC52CeU5NBJ76yAQ2cLC78OiXrMD3IoC7o+lo4+Ek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tys3oPm1ZZZuHHiCuCUUfwrDm2xDZYALKXMjOze7S3XWewYMDGviFIQPLnxOj55U61zfPC1TQeyouO8zkhucUZhHdD3TE9MhPMtsVcl3XpThkdQiBjc5CZP3FezWmsUbrfx+1IHes6jjOZ9A+Ht6OVvLtWDfvDeYduUOC2b2BO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E+OWNnW9; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E+OWNnW9"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4779a637712so1794275e9.1
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Dec 2025 13:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765403069; x=1766007869; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wal2enxY4moWZCAf4g26lvQIKnCzny5AtoBmuUAlL6E=;
        b=E+OWNnW9E+Me9H+MkPgMwZaZyEJHWzxjGDNsXwyBp6/w5w40ncu08qqlSDZHZSpsWs
         PMVk3sCaLwH7o3kgfUAJ5clSHKkjC4hZg1OL5ejVU3u8GRKng7l/8W0Dbdc2aHjXPxa2
         oijug8WrHMhnuRXR9sUgW7CQC+Tx+qpZlM0ABUaz5XPnK0FJ/Ch06oq9LCLLuD7KUo0Z
         nd5EB8FLoaZ4ljElsfT29GQF6G35ITW0bzZI0sdArq5ur5VHZTzYRaOp5+nt+qhCJrL5
         CdRcEOWQLhG01IEev9XKvNppN7ntwwpyZCGqSar5OE0xu9v8EtFcyMu2magGCBKjGFa3
         epDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765403069; x=1766007869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wal2enxY4moWZCAf4g26lvQIKnCzny5AtoBmuUAlL6E=;
        b=nSkXnl1SSL8258k1ukwljmjf1FKoHa3/BEkISgDcG0s9z3vihkXzVXDbH+sZcOAMKf
         qxKZ2mA7pqczmwLep8wBPjDYFvcOD1dlDVymatar38r/COB5wNafsmgPgxn3IbtqJ2Rt
         5VGACs88ALdOqoBGL+iYIHrKGNxS9/eij5eUXx+OAtwk8P0XmVwxSDXTG8HHedVrkwIw
         Ae6cyqjAnF37aqH7NiCC4p8/mEKeJyguZYtaXvJ+65rWlAUeGLBFnC8DxvPVE7Q2+lDo
         1bFKI6dBxCxwL38wnuqyFDZG1o1G3Acar77/XsQ3tigSQ1Z37GJ7eyyafQW70A8B2JeO
         OhNg==
X-Gm-Message-State: AOJu0Yzn1Fz3Q4AyPYVyE//4BS5mjs+rocSexkHTKeInnUrNTFyRXUY1
	Va/hud4gr3YIR0Yna8EzxRpZ3fj06Twc8CHTcjUG4Yuig6YOabVemnUS
X-Gm-Gg: AY/fxX60FgFXuXKoCROfi9RlUcIIFRZMKcwPnBQ9RiLYAOzD7JF+STuRdnbCX9s3vP5
	n1OplXtklvTG9smdvkJfa6J2RjG4s/wqtGnJfjcO7qgtHwTCgussPalf92osuqgi5RTLn/myr5x
	wifIHqCw2cBOch1n7Rhk5xvDql5u7x2MFqEyVWmiUw6qL20KHl5bsY8pHzQp6G9WRrO8sPhdoEm
	DW7cRu46aRxVmCPlFJaHxsBGRBVweRdrFn0vzQoLvEdK8Tntyhjv5AWacrJ0v6anAkHYzzaF862
	N7xrtEKWE2vIAwiE495bL2xEZ/Fc0cWrXv0j/ZZnEJyFxjhzq4WVMFfhGZ8hGaLvJY6kqOKVVd0
	Ytoy2IFv+qiRBmOZTplctnMIfUeARsNrlutSkuD36o91ZU/3p1nDOorDexvodGLoRSfnCGgoFhR
	9ja3xi7pI3BONwCsTqVPXIrZYvN4WePGRcxPxzrl9vf6AVzYd4di7/kw==
X-Google-Smtp-Source: AGHT+IGKOyUSuHZubxgOrr5LFCQa+eHSu9NDBphfSYSTLin7Raqk84h/gD6t9Iw24mD+KXt1In9blg==
X-Received: by 2002:a05:6000:400d:b0:42f:9f18:8f40 with SMTP id ffacd0b85a97d-42fa3b17789mr4674090f8f.42.1765403069044;
        Wed, 10 Dec 2025 13:44:29 -0800 (PST)
Received: from antoni-VivoBook-ASUSLaptop-X512FAY-K512FA ([37.163.92.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fa8a70973sm1338592f8f.18.2025.12.10.13.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 13:44:28 -0800 (PST)
Date: Wed, 10 Dec 2025 22:44:13 +0100
From: Antoni Pokusinski <apokusinski01@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (sht3x) add support for SHT85
Message-ID: <20251210214413.pyzke7etf7xfjf5t@antoni-VivoBook-ASUSLaptop-X512FAY-K512FA>
References: <20251209175848.5739-1-apokusinski01@gmail.com>
 <2683b84f-d7d1-4445-b5d3-bed393de34a0@roeck-us.net>
 <d11e3cf6-3095-46df-a4f2-442d209675b1@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d11e3cf6-3095-46df-a4f2-442d209675b1@roeck-us.net>


Hello Guenter,
Thanks for the quick review

On Tue, Dec 09, 2025 at 07:09:55PM -0800, Guenter Roeck wrote:
> On 12/9/25 13:19, Guenter Roeck wrote:
> > On 12/9/25 09:58, Antoni Pokusinski wrote:
> > > SHT85 is a temperature and humidity sensor with an interface very
> > > similar to SHT3x. However, it does not feature alerts (and therefore
> > > limits).
> > > 
> > 
> > The datasheet does suggest that the chip supports both temperature and
> > humidity tracking alert status, which only makes sense if the chip
> > supports alert limits. It does not support an alert _pin_, but that
> > doesn't mean that it does not support limits. I'll want to see definite
> > confirmation that the chip does not support the limit commands.
> > 
> 
> Looking closer into the SHT85 datasheet, the sensor chip is actually a SHT35.
> Given that, disabling limit attributes and alarms is neither necessary
> nor acceptable. It isn't even necessary to add "sht85" to the device ID
> table; sht3x works just fine. I don't mind if it is added, but it does
> not need a new chip ID (at least until/unless interrupt support is added
> to the driver).
> 
> Thanks,
> Guenter
> 
I've just tested the SHT85 sensor with the non-modified sht3x driver and
the limits and alerts work fine indeed. I was a bit confused by the SHT85
datasheet which does not explicitly mention the limit commands, that's
why I excluded them in the patch, sorry for the confusion.

I guess I could simply add {"sht85", sht3x} entry to the i2c_device_id[],
this would also indicate clearly that sht85 is supported by this driver.

Kind regards,
Antoni

