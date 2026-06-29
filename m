Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C87B3793CA
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 20:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782765543; cv=none; b=q4dzMRVj88vjClWY8PDSNfmYC9o5bWCr9t4Mbw3/1q4zgNuZX437RGjKqhASYbkVp/uRMAh0S/QL/83hr5+XpIi1TqjTbyHtAVTiK91wXqv8f+wZsANsXna2VfxNgJ3fm2onijMEHYgURz61AOI2h69z80wdxvq7w5KzYsZB2+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782765543; c=relaxed/simple;
	bh=EwFDPkXT5wkRWplhD6XwRPUDKn9mnoFOIBaT+hv7ofM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQcKfVk3z4Wer7IjY8/zuA23GCgTcfmBwf33UPy5lyxZahkeIu4xBhkaggtz9n7ZI5kDr8A60OTmmw14h87XMLVMO9fLLm4H/1PwZ0qpAmX5zfX1K7fxn7jF6YTnjVwzoiWuyuSq4I8wszN/dx3MghSNKUcbiZtnkGqaZOzteXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B7oZBJKo; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B7oZBJKo"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-13981833e13so4617154c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 13:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782765541; x=1783370341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QxGd9JAkUGNcCflM4SNBM1B387rgbM795qSJ3dVw6Do=;
        b=B7oZBJKoHylJ6UKoUMu4C3eKdFcgWsn/MViB2YeqIhsmm6Hk2QNhV2PilkCibEU9NB
         swJoU2iEYJMbjfHMLqjCd2O51jZTGlWHmYFOi1Cn112HBpm6nICfHNPYaIGNuS82FNO3
         fLnvJxMOqy9aVDm2TT6iSQf+C6nHIEKOFLjcUw+JqUVmSmbQRZa9gTCHdvOtLgMgJKpn
         ftW/WcPBB/+2NO5lFcGOqemod5ZTRtPVnngFO94H44zcSRBjbU2+Fnql0XtXmW6oLjLp
         94zMk5FlmHG1Wj+Qmk0wGyG01ChAnd5FA346SqptOuVeZKDktj0coKtuEISdspJWI0ts
         UBJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782765541; x=1783370341;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QxGd9JAkUGNcCflM4SNBM1B387rgbM795qSJ3dVw6Do=;
        b=XalhnptLhwluwlYlJsNlZdqMPE9lu/sm2NPMjIg5G2GlGdhqt2eVMjFLQU3t/MiAJL
         WOnp8AKLd4jcvyVnWz941VkfWEZdwKJK2D3XZh+5hXVuBMfasPCh4Einqd9d3NInmFfP
         2GD/acwsYzg0jwW5sVutt0H0MndQKk14QiKK5Nsmg6kDk6Oe/xuUuOGW1QkIE6h3VN96
         RSC/uxX2R+d4yhyqZgZETtoRFwvDhHRaP8lJoq1TFwkplRcyzJWtPmJFk506iswixbLB
         +If09VhHVgkmsQWO8XVVYxRo49LAGpqsIoRG0gtpNHUlmqO94eW/5P+DhzfOzd1R6Yop
         1OwQ==
X-Forwarded-Encrypted: i=1; AHgh+RrbMKAPzMIm71iSsNududBFJmsWUUTa2mnQd+Of+PbPePTVgdjdKKj4iZ9JI0KBrZan7bvkWVG+CZUMBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxT1Af+4G9vhVolJ0PIe3GM0SaGRXOcZe0+koI5wxqDeWMBpG+g
	c2/ETFaZwJjXoUM8Jw3bQ/NLv0G4E2a5RLj/itL16uoshB6J0HYhVoI5
X-Gm-Gg: AfdE7ckBWemkoEmqMNpEXx2TIx4LG8PnOzAcjlrrxgNdzYzYkVtOd9nvRGxUFGHfLVV
	Gd9SH+sF2SZvGRa9CnnYYMom2u8WtaSsvOzfiSUJaNanp58TxFsuDHn1oKiwmkEk2ao8RwiSynu
	DIZyTqr5J46yDeksXBjIqwyJO3iniEufS+aQxRVAFo1d5BAJtyGyxVlFL6NRz8uH0juk9uawDZh
	Ro6YYb42UA8AqBsn1LfVmwh2ipEobySq7Svf/GXJC7UjYQvZp3bk6FGcYlgkZmTvo5tpXywiqSw
	8usYwMwv/1CP55a3qN+gywepVfRIM89l9kVBe3YKLFzfcGgIEmIdNa6PYRN+0Z/nk04l/8y2H1k
	0NilZg0gAK3ss6lM/tBUJyLDuMiS5B3bcyJymHQqZMIJDcwEbRvxF9eTnqqGvhKvWQEs9Zjwppf
	jIA64j1cydTOzPUv9iNqDgI3Cgnw==
X-Received: by 2002:a05:693c:65ce:b0:30c:9051:e4be with SMTP id 5a478bee46e88-30ee13a1114mr480608eec.35.1782765541259;
        Mon, 29 Jun 2026 13:39:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee3170ee7sm642589eec.14.2026.06.29.13.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 13:39:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 29 Jun 2026 13:39:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>,
	Alexandru Tachici <alexandru.tachici@analog.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 3/3] hwmon: (max6679) add missing 'select REGMAP_I2C' to
 Kconfig
Message-ID: <22b58be1-ba09-46fb-93a9-30b342713bcc@roeck-us.net>
References: <20260629-add-kconfig-deps-v1-0-8104df929b1a@gmail.com>
 <20260629-add-kconfig-deps-v1-3-8104df929b1a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-add-kconfig-deps-v1-3-8104df929b1a@gmail.com>

On Mon, Jun 29, 2026 at 09:17:41PM +0200, Joshua Crofts wrote:
> The Kconfig entry for the MAX6679 sensor doesn't contain a
> `select REGMAP_I2C` parameter, causing build failures if regmap
> isn't selected previously during the build process.
> 
> Fixes: 3a2a8cc3fe24 ("hwmon: (max6697) Convert to use regmap")
> Cc: stable@vger.kernel.org
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>

Applied, after fixing 6679 --> 6697.

Thanks,
Guenter

> ---
>  drivers/hwmon/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index cc593fbfa4cc..2bfbcc033d59 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1368,6 +1368,7 @@ config SENSORS_MAX6650
>  config SENSORS_MAX6697
>  	tristate "Maxim MAX6697 and compatibles"
>  	depends on I2C
> +	select REGMAP_I2C
>  	help
>  	  If you say yes here you get support for MAX6581, MAX6602, MAX6622,
>  	  MAX6636, MAX6689, MAX6693, MAX6694, MAX6697, MAX6698, and MAX6699
