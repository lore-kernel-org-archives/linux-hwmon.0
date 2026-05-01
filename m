Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D842D7812
	for <linux-hwmon@vger.kernel.org>; Fri,  1 May 2026 08:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777625347; cv=none; b=eGygRYZX6VdMGEPwRCd4oeTkGxKrCKOzz5ZZKBIXENkTtDsfEXi7mESaGLM0fC7Xn8iTZVIKK4q4TvGqTWKjR9vRqW+eMPmkkzU4JlbAXLnGoGpJfCcV4Gt197nQZTwZd3h9P9/nDke7g+s0PyO7Ywqc0lSdObvBMQWctaOqLEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777625347; c=relaxed/simple;
	bh=74LOHSjwHfw5YaRr1ruWi55VPi5NHbqsE/UqD3GzfFM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BBxz76NlN/ES/52dZBWYkvXMaAz1V6oB/Ybo7UJ6pb1tYvQ40s3D16TZsqfn8G+U4QYBuo6xnag1kJrVVPgN6nn4mAtB6T86riIf3G2W+BZWQCyy6H7FhABJyNCt5+5jnD6rzUPeoUP8ioap5g+jXECkaLQAcEqF6T354/thbUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GU/xMXo3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GU/xMXo3"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-48896199cbaso15353415e9.1
        for <linux-hwmon@vger.kernel.org>; Fri, 01 May 2026 01:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777625344; x=1778230144; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGavx6I1kgrdHm6LlhP7mvKPN+wzHCkGOpmot/VRJ7k=;
        b=GU/xMXo38SV1qyNqgeHd/AOl8Gucs9Gvo33uwQI++jL8ateQOImdfZAMadK8C9CTX7
         JrtD5n4Yr7FeMFDA2dxdYNML/u732dq9O7xyzpla/MeqF9t/gkEKQa0Gh182DalMrren
         2CO7sonmBjswQcY7kZug3Z5A6v2EyIpTW7WVtFFmitJFMOrGMIWfw0f7ZLfy63OiDPjz
         LGtO9DtttSDP7bctPrSNP56HqaoV26moBoPF+SQ9m6La60DB/ZkyScPcubWzj9i90A6V
         PL7FlxZNhSNH4Wze3d+OSh64NbHNIK1T9Ny/Dv/OEvNq2NZu5wL9wmM4L2DS0Jv2vg7C
         b2Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777625344; x=1778230144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fGavx6I1kgrdHm6LlhP7mvKPN+wzHCkGOpmot/VRJ7k=;
        b=RptemWb2Lg5EQcxXxD75tQjXhlD3yQ7j0K+7G4fyUwYCMEcRNb8fVaIxebT0vCmkNc
         A4v0dsGJ/DjVD1H7LwIRlAG70+sHqNqpDqrTEojv7JtALXqau4joCheB/fdEKfcnL074
         Yy0JGQhY+dKdyY9ZBl+qFjcHk8Gs+wYAQNx6KBQ4BfyCF0p6qxECHtrVRg9yoHzGAD8j
         uNCD8XfKV2Caf/Xcb1HPxeDWoYRy4/LErmOJex0HkV059YaQ2vEFJEiTHybAeIdib7/a
         StEfz2k+0oWuAOq9muqGF0wcsFD+7lnkaXVm+NaiZg7WxaItVYRGh+CigtxOHMm5Hppa
         0yig==
X-Forwarded-Encrypted: i=1; AFNElJ/z86juGiPO9ZbVkOP2My18jNgnlXG0/Nd4+PfqmCOK5jumoA2Au9O/hEAh420Xa/+T/+2I+6wl83Kkeg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/HkAm7CJrNHFab4ZCzkzV3RDU8ifkXOWwsFpeSput+42VxOjx
	sY7jHwLIJb/dww0HR25SvDsXOErYi9T7ueQrQZWy7tULSu0j4luooEEMZbF2rJqA
X-Gm-Gg: AeBDiev3DmMMqKukVpXNImhUwzHnOec9bq5owXSC+ztZ90RIdERgqfCOlXLb/sPr5NP
	gEPKvEU8IKWpBig1Ax8+Cb2sXXQxs17+X8d3C4Bmn1N50hGk+nFgFiHgoTEK22n3C+QsjYTDDci
	4K6NyZ5cqqnmayocag8wp/R8AmkF4tW00YYfncCeBc6PBJTDswkj3a9nmmVT4KLHDsXXL0GjiGM
	0og9tKuPc92j1uNIW9Tf3ulaYUoQxEvVImQrt9rUx9OU1EOPrPu7nkxgBfW3ownK645NusKzlP+
	aMIkL53WlIPTrHjG6AL7qQ00eBxPh/WNCITUX2s9zGPEpIIIpDE6+JGjD0klytLvMUrvmCR2avu
	ftaFusIfYUzH9JRytL1Q0osH4OmhcFjZjbB1/TS3I5Yvzjd9zjqAzq4UGW4buCTDSFs6JgPnGOk
	8Xj2B3AWv/4heiZpo5kDDTffvztvDXRjbV1UJ/ZmPtYVbiEDrBtWJFZH0LwVCbO4SBHPu7ppB7+
	4g=
X-Received: by 2002:a05:600c:4e88:b0:485:7f02:afd5 with SMTP id 5b1f17b1804b1-48a84444083mr98838155e9.13.1777625344047;
        Fri, 01 May 2026 01:49:04 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82301adesm114565645e9.10.2026.05.01.01.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 01:49:03 -0700 (PDT)
Date: Fri, 1 May 2026 09:49:02 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Tabrez Ahmed <tabreztalks@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, shuah@kernel.org, me@brighamcampbell.com,
 Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v5 1/3] hwmon: (ads7871) Fix endianness bug in 16-bit
 register reads
Message-ID: <20260501094902.05ce6d37@pumpkin>
In-Reply-To: <20260501023530.31160-2-tabreztalks@gmail.com>
References: <20260501023530.31160-1-tabreztalks@gmail.com>
	<20260501023530.31160-2-tabreztalks@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  1 May 2026 08:05:28 +0530
Tabrez Ahmed <tabreztalks@gmail.com> wrote:

> The ads7871_read_reg16() function relies on spi_w8r16() to read the
> 16-bit sensor output. The ADS7871 device transmits the Least Significant
> Byte (LSB) first.
> 
> On Little-Endian architectures, spi_w8r16() correctly reconstructs the
> 16-bit value. However, on Big-Endian architectures, the byte swapping
> causes the first received byte (LSB) to be placed in the most significant
> byte of the u16, resulting in corrupted voltage readings.
> 
> Replace spi_w8r16() with a manual spi_write_then_read() into a byte array,
> and safely reconstruct the integer using get_unaligned_le16() to ensure
> correct behavior across all architectures. Additionally, use a u8
> variable for the command byte to ensure the correct instruction is
> transmitted on Big-Endian systems.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260418034601.90226-1-tabreztalks@gmail.com
> Signed-off-by: Tabrez Ahmed <tabreztalks@gmail.com>
> ---
>  drivers/hwmon/ads7871.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
> index 9bfdf9e6bcd77..d77eff430935b 100644
> --- a/drivers/hwmon/ads7871.c
> +++ b/drivers/hwmon/ads7871.c
> @@ -59,9 +59,9 @@
>  #include <linux/hwmon-sysfs.h>
>  #include <linux/err.h>
>  #include <linux/delay.h>
> +#include <linux/unaligned.h>
>  
>  #define DEVICE_NAME	"ads7871"
> -
>  struct ads7871_data {
>  	struct spi_device *spi;
>  };
> @@ -77,9 +77,17 @@ static int ads7871_read_reg8(struct spi_device *spi, int reg)
>  static int ads7871_read_reg16(struct spi_device *spi, int reg)
>  {
>  	int ret;
> +	u8 tx_cmd;
> +	u8 rx_buf[2];
> +
>  	reg = reg | INST_READ_BM | INST_16BIT_BM;
> -	ret = spi_w8r16(spi, reg);
> -	return ret;

Isn't it enough to just byteswap the result? so:
	return le16toh(ret);
The whole thing can be:
	return le16toh(spi_w8r16(spi, reg | INST_READ_BM | INST_16BIT_BM));
(although I suspect sparse bleats and needs an annoying (__force __le16) cast)

-- David



> +	tx_cmd = reg;
> +
> +	ret = spi_write_then_read(spi, &tx_cmd, 1, rx_buf, 2);
> +	if (ret < 0)
> +		return ret;
> +
> +	return get_unaligned_le16(rx_buf);
>  }
>  
>  static int ads7871_write_reg8(struct spi_device *spi, int reg, u8 val)

