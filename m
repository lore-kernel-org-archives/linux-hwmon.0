Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6D421019B
	for <linux-hwmon@vger.kernel.org>; Thu, 30 May 2024 06:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717051065; cv=none; b=mnM6eOOEiKpuGEWuHJMlpz0R6AEZckcR9utXmYl2opwiZH5oNgXlf1qH7NySMo2nnky6RyRPdZZgOc7Okkyx0O32QZ7ogQcg7JJQBlbmEXGGyBbvwZnGKUQcp5REEKd3rmUcB7Eb05ZhmglAgHfcu3qMTwGgiRae0C2sAird4BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717051065; c=relaxed/simple;
	bh=fy08POZqkqE0i38gAuRJ/onImk+pMipAaqWGq/Sy2aU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WL5XPa+TJzolOhGMluICdqgGzM1p02Gb96GbhnrkZfq2Ay4tRcMB89wuoreXQK3juAAIHTN30xuc2NEOQhjUtUMVqV8upN2yOjRddzi2AIWRaQAwKk53YIVlodjc0haU6oB3Einmk6iz6FMhKLNlh9SsBX98f+KYxxLIInfUWok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EllejzQ2; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EllejzQ2"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-35dc04717a1so349643f8f.2
        for <linux-hwmon@vger.kernel.org>; Wed, 29 May 2024 23:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717051062; x=1717655862; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=weov7S2If7LLVyjvZCE9ldsOJ6qnENnWeSaQWWSUXx0=;
        b=EllejzQ29Ns2GGr9iDFz+PpD4id8lWa6Fs8fT3uF4Me0ed8VHOyDjGlH/UAmbwvanC
         9LIg9RURRwSTWnYYeYGgELIYXNyzXpItyM5spcFq8STuJw2f42ePg7X2M6nfeD4rlTqj
         Jl8zmJ12LuVxtKFoyiohvZuVqK3AQGTFyKyETihZMy0Q5XSbCtQZygZZCRj2hr5dPCsH
         aBHAdWdp++dINCch3zZwGdMTri9LCkyQ6UGdJUwj8Aew8Z334hHDjNPSgjgDOL/u0j3N
         zJoyeGM/KKXHMwYplMy9wz+Z0hNopRDcG6LXlEd/gy6Vf8NLsqtSI9nGDWphocVKygfM
         R2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717051062; x=1717655862;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=weov7S2If7LLVyjvZCE9ldsOJ6qnENnWeSaQWWSUXx0=;
        b=MKy+ybz79dSzsfyamqZAcPXy5XF648JwRFugKxKduNlhRg49ACVCksBErBT4DRUlVK
         YcCp2Rvqe0/51qRKkDJMv17esAnL39mHiy/DbrHq9y3IvZAPOBfjPo+BEnqmPGvlx+3/
         lvjhQwWpyzYjpShPtP636WTF2yWKbjLF9ZX+oDfoKhjMkzAjNwvzahGBEvWwAvzOHQld
         0nseaL9zVOKap8HvD+4U3+1IYWoQx687cBLBNxSHmNNwi3CbX0RllB7++PIrdGO30xYQ
         TWoqu9AWxfIUNXMSb/gOzErshgcjZG+iGcWhzGGf7CPp/AGT+U4eeUBV1Iy+R9cXvaz+
         jqyA==
X-Forwarded-Encrypted: i=1; AJvYcCVRjnL74E8RHvtH3TAEhjhAVwYTOlZFZXsnoiswtodgWw2yayd5f+VLEjCchpn8SNHofY5d5I9k5a4ybxR5hg3PceToksp3kcb+Ny4=
X-Gm-Message-State: AOJu0YyXoYMnP7hGU/NN41vBoli863qcezD/K2R2TbC9Fg9cEpm/tf+z
	1AHxVIQ2ImaSDS5C5eqiqU8S/t5XogRO/x7BVyu1hCeSzoj7acWY
X-Google-Smtp-Source: AGHT+IEAKqlfcnCOKLP1DKybFSyzZruBrItehxQqK8FImaCKZLNe9Vvc5lAhvHwShqdx7rRNud0DDw==
X-Received: by 2002:a5d:50c3:0:b0:355:12c:2733 with SMTP id ffacd0b85a97d-35dc009ac60mr1791861f8f.31.1717051061931;
        Wed, 29 May 2024 23:37:41 -0700 (PDT)
Received: from ?IPv6:2001:a61:35f9:9001:40df:88bb:5090:7ab6? ([2001:a61:35f9:9001:40df:88bb:5090:7ab6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557dcf03f0sm16613798f8f.98.2024.05.29.23.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 23:37:41 -0700 (PDT)
Message-ID: <2b2ccdd71d8005ccbddd1d0c566c3a6444645978.camel@gmail.com>
Subject: Re: [PATCH 1/2] hwmon: Add PEC attribute support to hardware
 monitoring core
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: Radu Sabau <radu.sabau@analog.com>
Date: Thu, 30 May 2024 08:37:41 +0200
In-Reply-To: <20240529180132.72350-2-linux@roeck-us.net>
References: <20240529180132.72350-1-linux@roeck-us.net>
	 <20240529180132.72350-2-linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-05-29 at 11:01 -0700, Guenter Roeck wrote:
> Several hardware monitoring chips optionally support Packet Error Checkin=
g
> (PEC). For some chips, PEC support can be enabled simply by setting
> I2C_CLIENT_PEC in the i2c client data structure. Others require chip
> specific code to enable or disable PEC support.
>=20
> Introduce hwmon_chip_pec and HWMON_C_PEC to simplify adding configurable
> PEC support for hardware monitoring drivers. A driver can set HWMON_C_PEC
> in its chip information data to indicate PEC support. If a chip requires
> chip specific code to enable or disable PEC support, the driver only need=
s
> to implement support for the hwmon_chip_pec attribute to its write
> function.
>=20
> The hardware monitoring core does not depend on the I2C subsystem after
> this change. However, the I2C subsystem needs to be reachable. This
> requires a new HWMON dependency to ensure that HWMON can only be built
> as module if I2C is built as module. This should not make a practical
> difference.
>=20
> Cc: Radu Sabau <radu.sabau@analog.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> =C2=A0drivers/hwmon/Kconfig |=C2=A0=C2=A0 1 +
> =C2=A0drivers/hwmon/hwmon.c | 136 +++++++++++++++++++++++++++++++++++++--=
---
> =C2=A0include/linux/hwmon.h |=C2=A0=C2=A0 2 +
> =C2=A03 files changed, 123 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index e14ae18a973b..7f384a2494c9 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -6,6 +6,7 @@
> =C2=A0menuconfig HWMON
> =C2=A0	tristate "Hardware Monitoring support"
> =C2=A0	depends on HAS_IOMEM
> +	depends on I2C || I2C=3Dn
> =C2=A0	default y
> =C2=A0	help
> =C2=A0	=C2=A0 Hardware monitoring devices let you monitor the hardware he=
alth
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index 3b259c425ab7..1fdea8b1ec91 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -14,6 +14,7 @@
> =C2=A0#include <linux/err.h>
> =C2=A0#include <linux/gfp.h>
> =C2=A0#include <linux/hwmon.h>
> +#include <linux/i2c.h>
> =C2=A0#include <linux/idr.h>
> =C2=A0#include <linux/kstrtox.h>
> =C2=A0#include <linux/list.h>
> @@ -309,6 +310,103 @@ static int hwmon_attr_base(enum hwmon_sensor_types =
type)
> =C2=A0	return 1;
> =C2=A0}
> =C2=A0
> +/*
> + * PEC support
> + *
> + * The 'pec' attribute is attached to I2C client devices. It is only pro=
vided
> + * if the i2c controller supports PEC.
> + *
> + * The mutex ensures that PEC configuration between i2c device and the h=
ardware
> + * is consistent. Use a single mutex because attribute writes are suppos=
ed to be
> + * rare, and maintaining a separate mutex for each hardware monitoring d=
evice
> + * would add substantial complexity to the driver for little if any gain=
.
> + *
> + * The hardware monitoring device is identified as child of the i2c clie=
nt
> + * device. This assumes that only a single hardware monitoring device is
> + * attached to an i2c client device.
> + */
> +
> +static DEFINE_MUTEX(hwmon_pec_mutex);
> +
> +static int hwmon_match_device(struct device *dev, void *data)
> +{
> +	return dev->class =3D=3D &hwmon_class;
> +}
> +
> +static ssize_t pec_show(struct device *dev, struct device_attribute *dum=
my,
> +			char *buf)
> +{
> +	struct i2c_client *client =3D to_i2c_client(dev);
> +
> +	return sprintf(buf, "%d\n", !!(client->flags & I2C_CLIENT_PEC));

sysfs_emit()?


with the above,

Acked-by: Nuno Sa <nuno.sa@analog.com>

