Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17103BB4A
	for <linux-hwmon@vger.kernel.org>; Sun, 14 Dec 2025 17:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765734571; cv=none; b=Cmk/hDb0RInkYJkcg4qsRzUSGNyYorwPBTn6Qx94tEqnznrqoQSW4zYrqpXKQBbzY74kB+U5mlYcceU0kJzr2fwwfyhN+8b+oaQL8LkXI9gd6KjJvUx7dw1KIvMgTWBWAuIhEdo8G0W25w4wyU824GXwR1fSZOTaf3+aP42p7Zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765734571; c=relaxed/simple;
	bh=WPW0/zrI/DcaK+PfAinuxCPGuIbKFrN3J/CerGBUd7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t8BfFp0nHJptq3qhBLzqDoHVT6Z5WA6jEKO0LZGOKqz5oiDdqRbbQWhE3iSbyqZtENhHyvWBEyiaCMjz5dIZFN3fwRcTQqtVtsxM0qtsB0p1aHyhkauuG1oISvElPsVgivUW+PcwRCUA/u+OGYZmBYIFIWel4n+DG1Nr748ZLvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EeSpMl7y; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EeSpMl7y"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7e1651ae0d5so2208304b3a.1
        for <linux-hwmon@vger.kernel.org>; Sun, 14 Dec 2025 09:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765734569; x=1766339369; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3jDnFxX73ETZW+ely6TzM0O0KMjmwUAr204vySPq9HY=;
        b=EeSpMl7y+aiI1mcb3Jlshn/kty33+dXKYOkC3xiuFrmp9U67l+fHU7YNUF6z8iX1kY
         pCFFOZNr0iFLUY67JfNM/S2GdVHjXVI2qFVnO2HgeGcyWPM/ui7PzBZ+fFUk0V2j/fr1
         j8zT/V9luX0NLrjpyK9Wbv6mHAxhQvNbRWKMtoiGdAqiwgdQVjhDQoWm/gM8pZm4IZ/P
         JhvPpgOxLRg4hnEwqeG8NRzkoml59eUa8dsbIXMqv5S9klyzxOIqIoVj7dpE12LnKmku
         OZR+1ddGvRcRXLndFKvoKUsUnTe8i/nnbAt3KnvZnCvMRiKnUnY4ttJzIdjbUcooqyqF
         uxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765734569; x=1766339369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3jDnFxX73ETZW+ely6TzM0O0KMjmwUAr204vySPq9HY=;
        b=gvjZ9YbIXzPxKBE1AlstEReG1OiQdhhlkBSafkf7Dy9ZqlkBJT5eSfebROvUVNpGBm
         y2yEua9G74ostnBbfTdZ3rqvpJBQO+L02LKBDi1KktkzhNS0dYjOyVigR9NhBHTakkH3
         XjjKJRb76brCJAklU40h19sHz3jIBSEv2GYATHTI2ZaUyreUeAX4bUwsRK4KXbZdxl++
         Ifeh8s8jsUthFDPVliT3JuJI1qlndg0P+V5e9LAYZxjOcoSWZd4hhcQIpFZqZrCcUTjy
         dpfVEywryglasbxPn56L7z3WQr5gybZ1nswzrUYTwOjz2wTaz5EvEzdeYoOC8QmfQ8Nx
         CV2Q==
X-Gm-Message-State: AOJu0Yx1SguZvhUQPvTCyjX+pRRgw6JfRJNUYrIrnbLVShMM7EgPHi6R
	lKgu+KzBWksxOGX9JMuvthlndKlYwhWcusYSSs40W+DWxbKaQ8FWraHoFPMVWA==
X-Gm-Gg: AY/fxX44z9dbz8qYnEFs3qK2nVVdqzqA6467kHEOd6hYBx8dgGs8s2pxJeMAP/KViNr
	qpDXR3D8Q7S4XDAV0w/8ztgTBMuzLHNmg0p+RDkHgksR4mltgjfKYzR9PkG03UCw8k4jaTYBK2v
	hwUxEa40Bo/OaZC8hOfB+p+03//7NuESmd+nPZ2EYPxXNmiOvjPWaUFoc/YdBiVSl/GDiiL1pI4
	IowXAeZ2KR0uY0rutTnZM1SEhHXhebq3obaFlE9iqlzwZDaFMTXchbp27yqpOKYtNoC+9BlNwOG
	edYTbA4i/vbF9fKG4R53nuYZElFFtYra/WL+eLPdHjh00iAEY+PCqtTmvzf0CTq9yScwjLURwoJ
	s51HKyz/u3NJJeEN8kxolWAqtQ3mQT1fWwcs1SCBKS1JY5Dt2c5ykFYAb8E6uMy4iN3nXdA5yry
	Yl4c+chNeFLIT1fFPmC0ek7lXGTBmaVwjbHg==
X-Google-Smtp-Source: AGHT+IGk7cuLTGPRO8Np6fz8ERIOePfwN+yoIRPfG6TFGuQl9Kb2YBgcbkmR3pQa9PQkT0UXFPCtew==
X-Received: by 2002:a05:701b:2218:b0:11a:72c6:22d6 with SMTP id a92af1059eb24-11f34c02a6fmr6457756c88.25.1765734569057;
        Sun, 14 Dec 2025 09:49:29 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11f2e304766sm38384382c88.13.2025.12.14.09.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 09:49:28 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 14 Dec 2025 09:49:27 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Alexey Simakov <bigalex934@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: Re: [PATCH] hwmon (tmp401): fix overflow caused by default
 conversion rate value
Message-ID: <3d7ad463-a9e7-46c7-9823-1c76fd792099@roeck-us.net>
References: <20251211164342.6291-1-bigalex934@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211164342.6291-1-bigalex934@gmail.com>

On Thu, Dec 11, 2025 at 07:43:43PM +0300, Alexey Simakov wrote:
> The driver computes conversion intervals using the formula:
> 
>     interval = (1 << (7 - rate)) * 125ms
> 
> where 'rate' is the sensor's conversion rate register value. According to
> the datasheet, the power-on reset value of this register is 0x8, which
> could be assigned to the register, after handling i2c general call.
> Using this default value causes a result greater than the bit width of
> left operand and an undefined behaviour in the calculation above, since
> shifting by values larger than the bit width is undefined behaviour as
> per C language standard.
> 
> Limit the maximum usable 'rate' value to 7 to prevent undefined
> behaviour in calculations.
> 
> Found by Linux Verification Center (linuxtesting.org) with Svace.
> 
> Fixes: ca53e7640de7 ("hwmon: (tmp401) Convert to _info API")
> Signed-off-by: Alexey Simakov <bigalex934@gmail.com>

Applied.

It does not matter in practice, though, unless someone overwrites the chip
configuration from outside the driver. The register is initialized with a
value of 5 (500ms) when the driver is loaded, and the driver never writes
a bad value. I added that note to the commit message.

Thanks,
Guenter
