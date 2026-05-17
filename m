Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494AA3B960B
	for <linux-hwmon@vger.kernel.org>; Sun, 17 May 2026 16:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779035713; cv=none; b=h5ax14iOhtYiJjLyBBSL5Jqu+HFzPXiY4F/Y5YDbN5NlYOKXh7iqGeg+mK+uu5pMcJQfR4qO7Z/byFGmXpPPLMugQDBhemAcC7vcWmCAVrNSACCDTqcwGr+98RovvYLBAp636wQET07kmTi8hZPNTryC7GgTM7WygFubjqtQOHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779035713; c=relaxed/simple;
	bh=8Q8zRJsr3+iz+++U2Aj5mXnSDaVqsx2OYsA5zkLvM2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DK6WWDerKBy752nPee4mKxGvmkUez0jsykBXWX6QmFs6/COs/mIX8DiD5SBOlSqxe/NN6lZx/kAi3P3Yn2BUmVkXjvNIXZwVlvnyFl1tmNDXutcpsjQKDmcHhRHav5xYlTLcYXP3KTYq5uoaf9I654WlrYVl+f1XKX/w70uMv+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fbvjsM33; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fbvjsM33"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1332772f6b3so1449845c88.1
        for <linux-hwmon@vger.kernel.org>; Sun, 17 May 2026 09:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779035711; x=1779640511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CFwrZB0BzatPRzM1lAAxsiBWokBxwZaQG7cDqa9uKvQ=;
        b=fbvjsM33NiM5TEfhunXI+ge+CueIKtR4xJSksvoDnaRnHTkbMc+4GcDorIMo61E1Pl
         2vH6kaM7roQCJoFU7ext/WBV1+qJSXkh+H8jFiCX0ChdtuPEan3Kp97KI1P4MpWkgBSN
         QUL/+3pxHyM64BOALA9wc9EFt5DtXnNxPIhBMA8pBWFcdlAk2AhLAdlXStk5YdqYf2SO
         +ZPfDc7B5XwK3OmX3gd5bOYu+ePSpXOHXbL07QsGbIm7ZrOAAUS2yyp/yd/nMqcN3PcT
         5pU4MD3Z0yvl53BFwOrM845hskwI2DbTtEZggybfEDzWdGJN+lBpYHOhBBsK5EFX1+nV
         k1mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779035711; x=1779640511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CFwrZB0BzatPRzM1lAAxsiBWokBxwZaQG7cDqa9uKvQ=;
        b=IGz0ZDhuTcH0ycQ86SioFN5c8AkcsGFIkVFp+dGznTy77lAXaUBeSJLL70TkgX+EUR
         ESZy/RC4PU56pvuhji4kzT7Axsm3rnaZCq8XOemeCMO9eFP+LsDbqQphfiKDLuXGfvSs
         N8avC90p2NdHyiLCR6V9NTdAYkA7xIGLPL444sMeFJSpeZ7iRTFyeSnpBVYaCW+xflCh
         PWpATMCGBssSg+VR0uLnNdT2wpfFWfwm8vMTUaGi2C3UXwFLi7RPxPjr0ejsUL1773kc
         g4HsKIpX/s22tcb4sdgEhgak7wmhkLDCBbanB951Hr+8EzvVBO8p8AjM5ptSBx43L8S6
         lHTw==
X-Forwarded-Encrypted: i=1; AFNElJ8NzXNIBO29I/KGo0W64bzP+igL080TtBmNVX5zI6OOUF6207k/P/DnGTw+jl5aNyVlwi1aU4b0CCwcUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKf4HDIA4G3RPfaAmcxZutyKmrJ2pjKJSJLcA9kEcT3o3Opimz
	LSTqFURQP6syoRODNvYXrDDV/M9eC3TDXCq3sGW0hqYepjJC0PxR+kzZ
X-Gm-Gg: Acq92OHr29k5CedNr+BcYspxcBOOolehxbjeIqDxYFQbTA4hvYqPPdwoDjcjVq/QrQo
	VFvQBw8FC/LPxXbRAq25ZnNYsfainKa2cVZibvFcKZWGyS8YBQd1Is59hAfYa/b2P+b6KE8YkzU
	vX74DXZ7IhqU5DiokpkegdDIll5I4lXfV7TnWjgGUsADBO4o1h6VicHPh8KazzVFIUZkeV79236
	WQnGXVP9nOX3Mk1RtsTrYsIiOO5CN2vd/tVzmZlOc9/mu2BmA0qiaH7xTOksGgITKAvs2j4x0Bx
	89HUhJIH6HM9SsZtoxqTFi8hC6umbYAG0YphnNmtAbaLlPF4GtLmWs2++1faMXQgO1gylNB60Os
	oya6Pf9hG4wqV8l1SEQwlHPx9/EYb9y8x4gJpDVdfuDy40XgvRBvAFtcU/F5SchevWBJwAGE5EY
	lwrGpY9BoC5PKmcjbAzBBm6y03djbjObyWfF/JNahEJ7iYFxg=
X-Received: by 2002:a05:701b:2410:b0:135:1a72:571b with SMTP id a92af1059eb24-1351a7258afmr1939567c88.26.1779035710747;
        Sun, 17 May 2026 09:35:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc2351c3sm18862718c88.11.2026.05.17.09.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 09:35:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 17 May 2026 09:35:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chen-Shi-Hong <eric039eric@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: hwmon: htu31: document debugfs serial_number
Message-ID: <8f436695-28b9-442a-a3bb-da023eeae270@roeck-us.net>
References: <20260517125320.2196-1-eric039eric@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517125320.2196-1-eric039eric@gmail.com>

On Sun, May 17, 2026 at 08:52:21PM +0800, Chen-Shi-Hong wrote:
> Document the debugfs serial_number file exposed by the htu31 driver.
> 
> The driver creates a debugfs entry for the sensor serial number, but
> the documentation currently only describes the sysfs interface.
> 
> Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>

Applied.

Thanks,
Guenter

> ---
>  Documentation/hwmon/htu31.rst | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/hwmon/htu31.rst b/Documentation/hwmon/htu31.rst
> index ccde84264643..9ab774dcf65d 100644
> --- a/Documentation/hwmon/htu31.rst
> +++ b/Documentation/hwmon/htu31.rst
> @@ -35,3 +35,10 @@ temp1_input:        temperature input
>  humidity1_input:    humidity input
>  heater_enable:      heater control
>  =================== =================
> +
> +debugfs-Interface
> +-----------------
> +
> +=================== =========================================
> +serial_number:      unique serial number of the sensor
> +=================== =========================================
