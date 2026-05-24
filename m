Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973F017736
	for <linux-hwmon@vger.kernel.org>; Sun, 24 May 2026 15:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779636570; cv=none; b=gZD/DkfdOowveZfW3uRaVbgBLTEGuRNc0a25BH2j9aM/7MauMiloejSDAioX7Ell8z3z5DAOA9GGX2dxXm1J0IWL2Zxw7e81jV017oy2gqfsXoNERrXAV49aOF3qox0Dj1UHpWfOwwTuXrNVZwwXNvHIowt72pfpVB4Y8NogeCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779636570; c=relaxed/simple;
	bh=HEiFoWOHBK92VHTeE8cLFQSMC0YNV0sFTAtxxwVjbiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZNuTrsDhwQrer9U1OfAe2vVwhLDpC8e/TVjQyv0WgruJ5QfoTonDWSrwmFwdeRaFmem3/IaZUxmhDixmUsuzJpuS1moeomeaM3ca3CPwnzHV1wr0j395OYf87jZRsoWfCJST8Q/au6o1vjFww5urTL+6pe7LCZYo9s5nZrbCJVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MMMIIAaL; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MMMIIAaL"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-134fe980658so10453689c88.1
        for <linux-hwmon@vger.kernel.org>; Sun, 24 May 2026 08:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779636569; x=1780241369; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xxqZnu7ehyuX2Ml7ZVJKPD+ooD4o9U9OD6sysLTUE8s=;
        b=MMMIIAaLcEoAQtfobXx8/2EE+w70p1G5yHVNmWGrJiCAeGjtywkvyl5vkvMExbNT70
         S4oTUciRstLLCeZ+GA+Ajl8YllergLBeXXUnmqsQ04MfcQTSu8LnyoqGvTl1ACW2y7YJ
         d1opx2/JWx4Cu89cF1AhM1qeLBhJnfWmfdjYwef2HJq7ImeBIMIk3vGKqclaMEyX0fym
         OkDt6YUE83brvgJnrs5eRqX3asjx3AoIyN/rCZuvwUwH+ozpOe4Cepjes2ll4XioaLv8
         kmHz/HvTQbaIrxSdFe6REFvGyA68bJzsdW2HuBDWeylEgEbdgvsYcWTbJ3DW+1CSYzhk
         G1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779636569; x=1780241369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xxqZnu7ehyuX2Ml7ZVJKPD+ooD4o9U9OD6sysLTUE8s=;
        b=hEeHMBEnWjvashBxzYeTntokxtmKI9zSza8udcQcYWb5/Ags0k3yylY0ZW0+dFuIYz
         dNew6FLVQYaeHMQZOsWby38NtBt7H6yiGS0mDmo5FEXMqCWgTdv2hbalNgwULe32fa4W
         wwv8ZKw95B1+4Flr8IA25Ylgg5+mRACA/CKO/sJk4Nj/Kfb72HsG3N7V8xoKz6NRTeaJ
         TOVly28nCZvRXpqLEsuCvxXafF9BPRtr5EjcPCn9//7Biw+PA1dqrciiv7SHYNJzLZrY
         MMTEJc96dy6lxTcKtXGkcOnm9Uw1QchL0NQNhEEITPj4+YjezOmuVfxAtlcMtqb/nnbd
         yUbw==
X-Forwarded-Encrypted: i=1; AFNElJ+j+NFzeDOe66mn+CAlNH9EJyj+qPMLkIPisx1SB6JXzUSy3zRtPw/bpW9SESjAuiVJZyR1+1yUrAqTPA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyM43/dnbtcm82od5zE9FD42SWE/xu7XP+w98mhrAWxJFwil1vo
	j7yA1/NeE1i9S+PMEgNvjGH1iIZrjiZVoYzKBlyZWMfDrDqhmm+4JgzHoblDTWUm
X-Gm-Gg: Acq92OECrIhaxyLSO9XG9iYBt95/5DrDACyh6sxRWe+OOh0F8I6xeddKH4wDZaEE8JF
	xlBXhJmh0ernl/zo6XyIP3eaYBamxzx/CwKxazsuBzRMCUobWHTWnlUn0C1Zkh3Ec2y5Esd8WX7
	C+xo1suya54J3KjZiVvpSdRWfTJmvl70M5G8mI/r05r+tRzgDyf5Gl43WHvSgNW3z5AH/4PPw/r
	KKI/miL82GkbqNKllKN3jPa8rGSlvkkxw3Ewjnjbw/0V46o8+8kg0Ha8FzEMtEIqT/aKeBYxsa8
	lmWFnU7r4Fv0C90S0x4wAJcm6hY6UXsUhiRwzD9qTp1qXog3+vIDv1lN8w4tkg5wsJML2Uga5MV
	K15pBUR7y9L2CkeBnaWrjYFCwllEuDeCG++/k8V4rET57p5loM7ia1BkY+YLkgB7wYdEYWpdg7J
	b+z2aHMBq6pTCtJaTxrVEeEFXWGEp2QgCCIXJYVvigbyP88bs=
X-Received: by 2002:a05:7022:60c:b0:12d:b8e5:5d6 with SMTP id a92af1059eb24-1365fa38dfemr4108657c88.24.1779636568616;
        Sun, 24 May 2026 08:29:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-136b3706ad6sm1974281c88.13.2026.05.24.08.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 08:29:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 24 May 2026 08:29:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (adt7475) Add explicit header include
Message-ID: <81ed9280-50d4-44d5-9f68-0fd9b151414f@roeck-us.net>
References: <20260522052352.12139-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522052352.12139-1-flaviu.nistor@gmail.com>

On Fri, May 22, 2026 at 08:23:52AM +0300, Flaviu Nistor wrote:
> Since device_property_read_string() and similar functions defined in
> linux/property.h are used in the driver add explicit include for
> linux/mod_devicetable.h and linux/property.h rather than having
> implicit inclusions.
> Removed of_match_ptr() improving non-Device Tree compatibility of the
> driver and drop unnecessary __maybe_unused.
> Header linux/of.h can't be removed yet since macro is_of_node() is used.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>

Applied.

For the future, please don't split lines that much in patch descriptions.
The column length limit in patch descriptions is 75.

Thanks,
Guenter

> ---
>  drivers/hwmon/adt7475.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
> index 7fb96f5395fa..7241fc73d21a 100644
> --- a/drivers/hwmon/adt7475.c
> +++ b/drivers/hwmon/adt7475.c
> @@ -19,6 +19,8 @@
>  #include <linux/err.h>
>  #include <linux/jiffies.h>
>  #include <linux/of.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/property.h>
>  #include <linux/util_macros.h>
>  
>  #include <dt-bindings/pwm/pwm.h>
> @@ -173,7 +175,7 @@ static const struct i2c_device_id adt7475_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, adt7475_id);
>  
> -static const struct of_device_id __maybe_unused adt7475_of_match[] = {
> +static const struct of_device_id adt7475_of_match[] = {
>  	{
>  		.compatible = "adi,adt7473",
>  		.data = (void *)adt7473
> @@ -1995,7 +1997,7 @@ static struct i2c_driver adt7475_driver = {
>  	.class		= I2C_CLASS_HWMON,
>  	.driver = {
>  		.name	= "adt7475",
> -		.of_match_table = of_match_ptr(adt7475_of_match),
> +		.of_match_table = adt7475_of_match,
>  	},
>  	.probe		= adt7475_probe,
>  	.id_table	= adt7475_id,
