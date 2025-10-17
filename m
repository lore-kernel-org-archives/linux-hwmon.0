Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C33A6330319
	for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 12:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760705334; cv=none; b=HPk39T0bVIHW0rLnulLNef+WONF43rjxEBFBTj2L1D8fEaydFINuvIqFteJV7+LAC2dei//yAEzyS8h/Sx+r9CL5qRBbOqoYVOjmSGO2UZXI/ug3TDdJCkdofZonBfhJcbsQj5gCtRVzbUqToN5TwBsgWFvFuAgFJOFu+QjjEbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760705334; c=relaxed/simple;
	bh=lw5cb12WTQW5V8LKlGN3d+ABzL6hKt0x7IsEIl0HPdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JG6FJPYwQ1g3wSjyLOQyVcDFqqnAvm6wW7+bfPVE68E56lrZGWVm5jGxBTI5XKK1Vzh8eyXr5N1qmtEyRyXqHbId4dLeO3ng9+cJYtin+MwwBqD6WMTzZAMek/6/rxGegROZ8A6v41k4geM8zhGUhY7hsVaaFVndz9jTjeYhm0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=das2UgJ/; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="das2UgJ/"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-77f67ba775aso2645383b3a.3
        for <linux-hwmon@vger.kernel.org>; Fri, 17 Oct 2025 05:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760705332; x=1761310132; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vm1q1yJNMMPqej5XCUEQWCVG1hgmSTxZ5v4pBOj1eAo=;
        b=das2UgJ/OdqBeODEJnZopFMVZMcNTNIGK5EzrEA0l0rCSYDsvAiPr+V5pTm12X4GzU
         Kk3cXA2toWNcsOxJvdEVZ1UslLRMSTe4yOdSlqq0KTsOQL+G+43zSNz6qqQXeX6hB9Ow
         NO+atH17rp0lZbnJzZiWpkRi0CKNRa2XCUmarZ/TIfayUzS9VQ340mrdpNYmm17RX6g5
         cPIDbR3gLcv1XprIsxlsDM/wlIUZ9/sYX5UG/xzuhZS9hm3ygjRo5Bvwc+qwGbHAlnv0
         HP3h9SKz4l0fQGovkJk06dvt7rjyDB1U76wCNBTP6LB09ve++fvJyvj42A8XsPSTb5dZ
         oieg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760705332; x=1761310132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vm1q1yJNMMPqej5XCUEQWCVG1hgmSTxZ5v4pBOj1eAo=;
        b=b1cZHb8ZNrYpdcMj6n53x2u5Tk1++eRgd2ziql9gHgi+9O52DKjvxipGuLcnqKg934
         AAsZZ4r4z1KipQsd6O/lKd1Rup0/ad9sMcb90r9kurUYCUUyj70AyFqgyAGsOD7a7Axa
         6gT+1QwaD7EnWE9JG4ODDippER9E1otwlonXM5udjYF+yw5FMLS/W240aYsbkiaAVfbK
         PwDpCqVsaXIXkxt8rVq4W62nokPvUseoVBgLCvcIOvwEKKi6ap/MKGmBBvcSXACYg+TX
         DD+H8Dqie7snIMolasKz853xfh3JEPkUeG3807dPQbiXJNxEEt4pVCRJR9tpWpU7nDNc
         7Scw==
X-Forwarded-Encrypted: i=1; AJvYcCWsiTCAwfbzAQcD2x226k+87ODXBu3CMGT1EaZKUeBGZHEL9FD6tQ/W+n+gbKPU9UIScqzNoL6Y7Gb/Dg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCUKGf1NhntPaVszHHkDyd9BM2kxiS18npQEIM0u8rcKyQ5Oe9
	dDRHyqbGMALEY/G3kARgUlUllNL4WdcFaz4YPLLAAVEbnw8ZhvPH3sIqD954RA==
X-Gm-Gg: ASbGncu8kOaeSmykX2vgmXCJQ6Vco4sUZoCRO+jyJ/HVqvRNn4+cAs4sz7JZPuPBxbH
	tNp9qRCCjO+J8MpfBXVYOrjF1W/7pXNsQbUAg1wT/wm5Yd7QXctva8ZhqWggYFtyqvx+rNsO/e/
	kJvqB9oJOSU1ZtLlB3wW4pCXHLT2paOeQXo8m3qg3CvOoFFIDn0fRrTBXqT+acMa/Tu/RCC04BX
	JSeDwizSgatqEe87Qnpo8apWnmLcIb3MzhiS/JQzfCIkvsYHK/JDENzAvdR39sCXIZ6eQmO4Zm2
	PVXC9nsZjXylFrf1/Mw24tPwusbz7X3xvo7ovBiaja8T7IDxnMiKzGxxT83WgQhJv8p+T9cS8xB
	f/CyP2qSsQm7qoLKQZbrOUH0HGKH5+EFALtLxbfZLmmBSicRGhkk7wG/LVg6nFWBGQG3F6Utq7t
	H0kOX4GKMeFo375SZEfe7EQQs=
X-Google-Smtp-Source: AGHT+IFwTxIM7KbRMRI4pagPw+NiPSPIsNhdBx3JaSyasAkdLl7zRtFXNHdz/QIh6BaZIRnxB4f6nQ==
X-Received: by 2002:a05:6a21:4d17:b0:334:a9f2:558c with SMTP id adf61e73a8af0-334a9f255cemr3877419637.5.1760705332044;
        Fri, 17 Oct 2025 05:48:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b06076bsm6390184b3a.4.2025.10.17.05.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 05:48:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 17 Oct 2025 05:48:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ankan Biswas <spyjetfayed@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, khalid@kernel.org,
	david.hunter.linux@gmail.com, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 1/3] docs/hwmon: Fix broken maxim-ic.com links to
 analog.com
Message-ID: <826742f1-d1b3-49cf-a1d2-5a64d1e58d16@roeck-us.net>
References: <20251017105740.17646-1-spyjetfayed@gmail.com>
 <20251017105740.17646-2-spyjetfayed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017105740.17646-2-spyjetfayed@gmail.com>

On Fri, Oct 17, 2025 at 04:27:16PM +0530, Ankan Biswas wrote:
> In 2021, Maxim Integrated was acquired by Analog Devices.
> maxim-ic.com & maximintegrated.com links redirect to analog.com.
> 
> Broken redirects fixed to their proper analog.com links.
> Fixes warnings in 'make linkcheckdocs'.
> 
> Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>
> ---
>  Documentation/hwmon/jc42.rst     |  6 +++---
>  Documentation/hwmon/max16064.rst |  2 +-
>  Documentation/hwmon/max16065.rst | 16 ++++++++--------
>  Documentation/hwmon/max1619.rst  |  4 ++--
>  Documentation/hwmon/max31790.rst |  4 +++-
>  Documentation/hwmon/max6650.rst  |  8 ++++++--
>  Documentation/hwmon/max8688.rst  |  4 +++-
>  7 files changed, 26 insertions(+), 18 deletions(-)
> 
> diff --git a/Documentation/hwmon/jc42.rst b/Documentation/hwmon/jc42.rst
> index 19d10512f6c0..df47a5d265cc 100644
> --- a/Documentation/hwmon/jc42.rst
> +++ b/Documentation/hwmon/jc42.rst
> @@ -5,7 +5,7 @@ Supported chips:
>  
>    * Analog Devices ADT7408
>  
> -    Datasheets:
> +    Datasheet: Publicly available at the Analog Devices website

Please refrain from making such unnecessary changes.

Guenter
