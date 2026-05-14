Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4047436164A
	for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 03:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778729157; cv=none; b=DAoc6XfwwG3F8wUBrHM44ZxXKcDjjIhiAZeNG1MflHCLNCDhaJqG9ayvID01LANqSn451r2UrmQTS6YVxOLcbkEW0O6RamAbW44cAhWgW0nVM50PSDVnSdX8wd9phb46XnVQWpSqtQRLl5HJ86r3W/FYc6iGA37kXfucjJbIRUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778729157; c=relaxed/simple;
	bh=YuFK9wdcDVTR1B5I2wiGUi3OJLXgcQkJRqiuy2EM/oU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HxQPVKPo2mwBi+s7EyiXDqaaFDXB9OmmxkMYJECWgCJ7wfHpkr5sZsbPGh5Fkycf/IfNY0FZzi1V8a5LvGpJmMg9B/s0sHolANN93e91pI6lznbNeljkhZZ0dEYJG3XMVPo1iUTZAsX3C0k79fr1a7AjtSaqR50YwFoxbG6BRfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JG2JNIKo; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JG2JNIKo"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2baef9f5ecdso47368345ad.1
        for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 20:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778729155; x=1779333955; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nf839P5Nup0rXclHDaobJzL5BL+On47x7FRSebFUKm0=;
        b=JG2JNIKofqa9wiJkDi90z2ek8oH/uGeDtoan8CUScmNvvLmP/TvQH+LXf76YUxjm23
         BX68+aQpezEhEnfnsAI2sd/aMh0jXsuUJY9goMfmB6NU83RmAjoHQub2khu//MoaaVbz
         BVHWvTCSXCxn5xxng9mKFZ1CYPs8N2CM2nc7Zg1pQqtBFW1kM1pfouQI6aDrtgejt6ae
         zRC6RJ4rBGRfCtuOr3Xr/nxter7ESRRvRsZ6O6uwMy9wiNJxZr+kGrEs5eo+E76Qo8HJ
         n2BS1mFMxkDWPluhlEkYxl/jMa6VIKKmQisPa/N/UJ+HIW/y0oPdB0AgZz258V3RDWdd
         1xsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778729155; x=1779333955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nf839P5Nup0rXclHDaobJzL5BL+On47x7FRSebFUKm0=;
        b=WN4SYq6QE9UEUEt++HHQMZSQ7zNWmNiBFp9U4hKJw5HCK9/M15LhQzHqiei35o0Heg
         5rE3CqgsxJu01SlG//U9fj7r62/kzJDp4dJamC9DD2J3DjoV067mctmnxkMCFJICKfF+
         d1TVnduA/Y1YT0hl2oGC2EozZiJOr37BF5j2HWsoNVsPS5Wau6RnV8Qn+CVssFaNBfg+
         MyfL5G/EHsqzU3gxd1cS6UdhVA9VJKN4XHkwzZ0VbIYQPOBxyNJQ3RSyDJIlQauSvQ67
         vkpDrdQTKrTqUNN/PbIUQvccKsL1yFQm2ucAsACZjSTEKq/moNdmjf9zi82JqdsQo+5v
         8E/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/T511JvmlAPt+4gXSOji9eZHllyj2GOwBNW6UH3dkprEoN3KEDCtlNQLUS5BS6M+KgYhq5IL5q5qr7uA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJEa79YmdoxWfP+mWNQA/GLV4/Ct8cUxREc0+L2yAd8epsRtiW
	zonJmrNYUlYDuIjmvIwMZzXxrKYz8JWLsytq0ltj0ykSLe1BcipDEbtYnduTSQ==
X-Gm-Gg: Acq92OEsz/zkcMlU1FM7WebwXhX947I/WlLLCyrhviDC4XErZMexgARSlVZ4MKClNqs
	XfYHhv8DXGBNrgedrh4j1xQCQi9rgqaGVNtGYC+QfoVAI07hzSY/PNAtZj6opG8UgThjsElzJA6
	UArZRD4/3VGXqrH8Zzha/58uepq9nKrsclAQ/r5+6LenfTh1OkHs/1wFtbaW5Xp+Q4pvzuaXciU
	Gn3hFcCnayYN79GutZUC/5JwPM9euBmv2zrbIS093/T7cnLHxOIrMzoEbciswcNESFg8d3fBu5k
	DTGg7Z9N8Ctkzh22iRcU1slreGipo+fvX60eJVxxWPWOLgx03N724yc+F/lJZzWQwAjamGQZ488
	EYmPT5yQgZRr+3BOjhFBGuIoZYilpGM6Xx9NfB4rs26f3RnnL4fxllSBLW4Peac1j1d33N4ps8M
	rCfV+tf6Af7w0KqoqHp2uNbrVQg2GVyR4eFgQFpj7XWU+wkLKYBKwVnpZ+cw==
X-Received: by 2002:a17:903:2654:b0:2bc:f1ef:2e65 with SMTP id d9443c01a7336-2bd275b6074mr46602185ad.17.1778729155326;
        Wed, 13 May 2026 20:25:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd60275sm7102835ad.7.2026.05.13.20.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 20:25:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 13 May 2026 20:25:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kean <rh_king@163.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] hwmon: lenovo-ec-sensors: Fix NULL pointer
 dereference when DMI match fails
Message-ID: <c808d5bf-b166-432d-864e-db0536a3f4e3@roeck-us.net>
References: <20260514011411.4167069-1-rh_king@163.com>
 <20260514011411.4167069-3-rh_king@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514011411.4167069-3-rh_king@163.com>

On Thu, May 14, 2026 at 09:14:10AM +0800, Kean wrote:
> dmi_first_match() returns NULL if the running system does not match any
> entry in thinkstation_dmi_table. Without a NULL check, the subsequent
> dmi_id->driver_data access dereferences a NULL pointer, causing a kernel
> oops or panic.
> 
> Add a NULL check and return -ENODEV to gracefully fail the probe when
> the driver is loaded on an unsupported platform.
> 
> Signed-off-by: Kean <rh_king@163.com>
> 
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>

ERROR: trailing whitespace
#104: FILE: drivers/hwmon/lenovo-ec-sensors.c:540:
+^Iif ((inb_p(MCHP_EMI0_EC_DATA_BYTE0) != 'M') || $

ERROR: trailing whitespace
#105: FILE: drivers/hwmon/lenovo-ec-sensors.c:541:
+^I    (inb_p(MCHP_EMI0_EC_DATA_BYTE1) != 'C') || $

total: 2 errors, 0 warnings, 0 checks, 12 lines checked

> ---
>  drivers/hwmon/lenovo-ec-sensors.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/hwmon/lenovo-ec-sensors.c b/drivers/hwmon/lenovo-ec-sensors.c
> index a32b1f2c6a3a..b0f2a04ce679 100644
> --- a/drivers/hwmon/lenovo-ec-sensors.c
> +++ b/drivers/hwmon/lenovo-ec-sensors.c
> @@ -546,6 +546,8 @@ static int lenovo_ec_probe(struct platform_device *pdev)
>  	}
>  
>  	dmi_id = dmi_first_match(thinkstation_dmi_table);
> +	if (!dmi_id)
> +		return -ENODEV;
>  
>  	switch ((long)dmi_id->driver_data) {
>  	case 0:
