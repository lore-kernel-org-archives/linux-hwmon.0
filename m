Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF3049B21C
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 18:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788287173; cv=none; b=Dj2Bzx47891xUc2zPTrUHErpX+4/3/e39pT3JrT/YcD5iBgYkqc+gFPfchqVIeA+h4Y1duNRUXPXCRoF5bANW8qaFUlcdAwLnMZ1IhhMqDqUfHZdoq+fpa14fUjXyEqfOhmgem2a1CIUcRO3vClHbfXduKrcD2HzZa5UQITM5ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788287173; c=relaxed/simple;
	bh=GjkMd31B8IO1q1TEc4FJ3f8muCf/z4sVEW3dE7UbiYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F64vMlKN8i5k4/59FJfu9LsnlDbNTPg5Lk6neNV+ocdCFodKv445sLJWE+CFApTWisD+4nfCaRIHxPgDZsI5p1Is6bkmIAcWQWZkawElleHxXeajy3sL2GHT2efyXT3Q231Q6fGoVoMbbPaNjhWNGUpxigTX3+v13FPL4acq+Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G9y4WJ4B; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G9y4WJ4B"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc1cb472b76so206258a12.0
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Sep 2026 11:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788287170; x=1788891970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EvjgfuOaClxNvg/6NVjMxebmfyVFXPFQ4W0zSbFbVnU=;
        b=G9y4WJ4B3O0Ut74TN3zDN8cZDVg85q6Nf5hStZQPG9jQ3u55yD0o9I96OB231eRqxQ
         ncbOIITIILSWhIoxQEDTCs+8C4Xo7aiJGxVbgzUqFy7ELDIETFO39xrApf4leqHwduw8
         xA8XecdME/XUFFiM6GYgoYDjAYp4HDHFNLlrpcuI0cjKpZM71mh2OjGUpsZZEIhsmu5a
         vCFZXkV3mp5T0khlmPX2qloWlDMnZ1oHnZRToBrFGs7ijCB0QNKJS1XvIjRdxw5d7LxP
         cGJM91juh9EeSfkAI2gP1khjRiZMo/qU49Sew8ObuEzkB2Uut/5+KHIVTvwQH1IE6NkY
         FzKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788287170; x=1788891970;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EvjgfuOaClxNvg/6NVjMxebmfyVFXPFQ4W0zSbFbVnU=;
        b=lKs79Ag1G6nYhA29z6bgRmIukg2+D8EOSUoadQdZ79wHXDUux6Y9Av208tzPrsscAt
         XIh+cRY83mebFfvbr2zDOp8zsiaSbbI8g9O/i4WHHZpoRS+jjgXhk6ni03gp07xojJkJ
         jsKtxrv2PpWCTUyeTEOsnO3P9uPQ0CTUIVOaQ3Gc8UrBbHojdfLYox2nQ1liqd+ooTiO
         Vf0B7Hr6wQR0y7zxuG6+NRGrjO2hivp2DnpF68Vt0hB05EsZ3XPHuEaBT4/JWJbxXYXL
         rvFgLVmKOTpszOr3wxxxnnDj3IzpFlkgvOzM+mHBCpJkjczuLETINJc4A2m0k7dUvkLg
         RJ2A==
X-Forwarded-Encrypted: i=1; AHgh+Rq+xpMIk4o3AYQk699FxIIuIykQrDSdCpRZQT0R4fJgS+J8iB5m8uCpglTpvSwzcceiOYXvl9r8bOTWVw==@vger.kernel.org
X-Gm-Message-State: AFuF++kdTk6AlT/uSmFJoOxCXH1ZfY2aTZqcGeYYjWhoe9p8NVW/9gKx
	+tapyrCCsqjaEZDfFs3p/BmGysFjja3ehwneHcccDACGbAc8seWWuTSO
X-Gm-Gg: AR+sD11XBd7GhlB3VzQ8HYhg4HaPnsKwLd6s6U/k0Y8sKIfxIByAJHB8xAPTfP1sEMW
	pSLb6ewbY9Qs0wGo8Dqn/gT9cUT2MlFrionm46u4d9ZLkQgvf5bJpuQaTm4ybZB8pNDxFg6SrVR
	pbchvJrsp+eHBnkwujQD3EeIQexnsjmPOVXgg8NDXXeVE+MrqNgpiyMW1aFGwZ+A88BDR6B6Cb9
	GHvJYrfkT9uWSE+MII25y8rIhTX5CDlOTWLHc9v0QChcSZLm1IIQqWhbXEpQJLUcAFJjzQ+mheD
	FeJW5m14qGKcT0JNwqTG5+muNPV49J6K3jxZ0+ggYAOL4fsCUOu688Tw4tcVbIKOrMqGMqeaBDK
	FeLLm4+PHJm3rYfTTQU799Z582C80k6p5mSv9E0D3iVgX8ZGOLxEbPkcuckz63ZQInKyL1nMy3y
	t1wQGKV9SDGG/2KPD9MDm3uT6GV364CgHqo07oBZwcLYcjPxklp/dUgZIRNmlgchrHWSOc8o4p9
	w==
X-Received: by 2002:a05:6a21:594:b0:3bf:49c8:f7b with SMTP id adf61e73a8af0-3d2681a3f3cmr60887371637.13.1788287170209;
        Tue, 01 Sep 2026 11:26:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc3473ff3e5sm575a12.4.2026.09.01.11.26.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 11:26:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 1 Sep 2026 11:26:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Cong Nguyen <congnt264@gmail.com>
Cc: Nishanth Menon <nm@ti.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko AI review <sashiko-bot@kernel.org>
Subject: Re: [PATCH] hwmon: (gpio-fan) take fan_data->lock in
 gpio_fan_shutdown()
Message-ID: <69118d15-39a2-4506-a5cf-e610957a0b4c@roeck-us.net>
References: <20260901155404.1532092-1-congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901155404.1532092-1-congnt264@gmail.com>

On Tue, Sep 01, 2026 at 10:54:04PM +0700, Cong Nguyen wrote:
> set_fan_speed() writes the control GPIOs one bit at a time. Every
> other caller locks around it; gpio_fan_shutdown() doesn't. If it races
> a locked caller, the GPIO writes can interleave and leave the fan at a
> speed neither caller asked for.
> 
> Fixes: b95579cd8795 ("hwmon: (gpio-fan) Add a shutdown handler to poweroff the fans")
> Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/r/20260830152150.27F5F1F000E9@smtp.kernel.org
> Assisted-by: Claude:claude-opus-4
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>

Applied.

Thanks,
Guenter
