Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5793054F9
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Feb 2026 03:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772161417; cv=pass; b=ZkqjbVcgDDvqcMWsVxqK4MOusFvl5jehuQSws+NHScIUS2t9WCfwEy5IRVivJhJ3oCzC6ndG29GItvfkVHGnm8XD2gCvTZ4LzToXnEsHXKZMjUi1tJNuqaib8R4OU/9vFYh++KbKcyD4NbOqZQ9xngG5Yl9/XWx14KOLNdLpTaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772161417; c=relaxed/simple;
	bh=rAeXGz9RgUBQrbD5iu/kr7xRar9M1wNTZIyHsZI+SD0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HppOV6ZSTeQ8NIR3w8gQIAaf02Eg/S7FBwQAWeLeY9SEbQ6AI4xYFU5Q3QFzo6APUNY8ReElHlTTexZxPlR8vhOyDFgGgmqj3jVOfQ41xMa/423lwa2KOSA11JdMxFaaQi7US+vmrXHST6dWZTYCNA2l4fSm6OSukHNLOERnUqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IskQ4GnC; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IskQ4GnC"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-89549b2f538so26400946d6.2
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Feb 2026 19:03:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772161415; cv=none;
        d=google.com; s=arc-20240605;
        b=idhqdFUypPG2EM0hLaipV+vSPPDqiuuKtoIJeK8nu49KnYxEPm75iOaTIsakqk0UAF
         cdNOHgNjyLy/3psad95rCwVf43cBamAYhVJ6djYDgtBD+uG+XezRrDhgGmGzws/2xsFj
         u8+TCwbf/f3cDhnpq90aO9XMpxMNJp8fIQDxFZmWKcYXpP82976kwuyfHJZEDc90XlU0
         69PiEhD9QhQSHKe4zBryXtwmnoNEttb43Xb3PCZ5vfXGFJtibc23FtaE/ocRHv+Dmqnm
         aDMFHNtqnO9Oiw9kUV5z/qqXlnQi7XMYG9h2Fi+dYcq9iwgydAluzMsfgLQ1LP4Y3S2Z
         rUrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v3X6uNvjRgnyqwPAC6LYHkM/Dk2cAc5WKIw3orsrsKs=;
        fh=KCzdT7U4vQAPd7lYdnF4g2vjnVsnd+LxLBacZRcaFQE=;
        b=TeIb6IgaBBVDqWL1OyfGuPAsodOuWas2K1vaPGXRCqx5CAUv3hOK9PprovUDbtx+7k
         3SgQ4wy+tFHDPOOuhrdjmfjL+m14WoFnOogO96ne/9pluWhf4Z/hCGTkfiOY+UYUQ4NZ
         h5S/tUVsHhxbEYlLZKqAYMb5mbsK2piefuCUocYY3Xr1i61+tEwykkR+0qL6L0e6dO6X
         hIyD6wOf1n3r4ZqgpQS+iuU9gXNcJ5bSpMRy7sH3iCj+PahUyXxjaYffNsm4wgIUJZ67
         QYTGfnDlMFbA+p6xM2nrdPbEOdoOR7wzBt4QFuCXmMye1kXddR8iSMCI4XTIy8S6xR+U
         16aA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772161415; x=1772766215; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v3X6uNvjRgnyqwPAC6LYHkM/Dk2cAc5WKIw3orsrsKs=;
        b=IskQ4GnCXHidoiMfLG801vPgULQJyI3i6yr8xBWHODKKkVnSQT3hktY2pmBsXdTodl
         wU6d+JNuywryIbOegZ3GPcyDUgeFj1kp9oad6PhAUVvsAu/VwDoP2r2ADh1okSkYwWjt
         eqSyf4+uSopiXnZv/ZOFqcUC3ihC/OvLwELOZTKyoCtcJ3cR5duVgUL72EpB2i8IS7sm
         xTeeNBSXAB+ImDEiu8dvGr+SaTLDqYvmmtgdpOWStvHdTilpmHs10fW5o+BvzOkF6E0I
         KTtY7FQ2m8h6uv1DR6kiHHzB/AsxStrx+qdHLXZMK6TC/akt2V8j+6tO8eLqrd4tD4yW
         yxaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772161415; x=1772766215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=v3X6uNvjRgnyqwPAC6LYHkM/Dk2cAc5WKIw3orsrsKs=;
        b=dbM7xJeUEdsL2r64mUivD6QIG7HJDqesfJojdQESbv43Yabe9RP1MKYhMbYO2/Fok8
         NAtKyMk4wgLwk258LjhOYp7fuGiO6cZhuvEsCcVUPrm6Vg1Lzo2tKENHo3VwEjvZJ99x
         06sguUzRg7Pm3NuCKDyvDlW699O26RHWE8Sj2Qs4jLue4mV6eJOxT5ZS5R3LznEJ+Jgp
         GgNtQepOo7Uq8YVJVw6ax3ns35I76LmBHQYkAcZlWFtQFvQ1eW3pwdmOd3Oq0STmx1/G
         YRCOSF/wltUXQHoFkEjnTbYJ5wdUrrKDICIDNlxx8YIOpkOrehrlpz1RhwCFAm6wjH/b
         YSYw==
X-Forwarded-Encrypted: i=1; AJvYcCXIIE+WvvyYLZz1bO3Vq8VDSfCN0i+w58EZ8QOvxMl7V939pve1l2o1IaQNiZ7B3A7qfrb6LlztThLgSQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKp4h1xNooUuVFrY31KNj83h4RhguAnishKrIEBmcR8oFtXazU
	xoWfkZ3dbWtQoy7QVCE3QNEKLG6OLmd3tH3hq7Ze1FfaLV4jka+cqZgb1qN6UJvS7YDAs+gmeGr
	jFptg16AbAHQzGKxn9TlowGh2YlcL1GE=
X-Gm-Gg: ATEYQzwm1BgoQi2lIwCDfcY/CmczJ7seuXhxll902N0oBi8mR0DtjWc4T9pTBuQ6BrC
	DLNCTCcWJo7TrKGCJTWt0nDEQuft+P/GYzKd/XNvA9nBkOE4XK7jvsExbxt8GupjTAc4wDInlnS
	lyKtNKHF+dOKmXI1fRzia5yuL832vrfUCLwW3VzjgqRBR0ri8kmKijORXM0oLif47MGKSjVjPxo
	5Uf/18sdJnITXSYvV1Jje6OuduM87dP5Qwhgm+niYQKDgWXWEoTVakxlpu75/tSAN04fWp7G2Sl
	4D49LtLUDqzPdnWnX4/+dYK0ozUqo7khexW3/eMmODhOtfilY4pfjhqFQOlRLB4WKQ==
X-Received: by 2002:a05:6214:c63:b0:890:2480:f02e with SMTP id
 6a1803df08f44-899d1dbcd78mr21240946d6.28.1772161414781; Thu, 26 Feb 2026
 19:03:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <53C09CAECC90EB98+20260227024945.151198-1-zhangdandan@uniontech.com>
In-Reply-To: <53C09CAECC90EB98+20260227024945.151198-1-zhangdandan@uniontech.com>
From: Cryolitia PukNgae <Cryolitia@gmail.com>
Date: Fri, 27 Feb 2026 11:03:20 +0800
X-Gm-Features: AaiRm51jiSEOtXqiq0eTnRlTH5UjdvlVETUOt09cjpD0MjJTxVl3jMu9YL60NhU
Message-ID: <CAANcMPkoWsXmEqD4U6THzi1Euk_MZYO5TAcDgHZOcYAEs6P-oA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: gpd-fan: replace custom EC I/O with kernel ec_read/ec_write
To: Morduan Zang <zhangdandan@uniontech.com>
Cc: devnull+cryolitia.gmail.com@kernel.org, CoelacanthusHex@gmail.com, 
	corbet@lwn.net, jdelvare@suse.com, linux-doc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, linux@roeck-us.net, 
	marcin@stragowski.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Morduan Zang <zhangdandan@uniontech.com> =E4=BA=8E2026=E5=B9=B42=E6=9C=8827=
=E6=97=A5=E5=91=A8=E4=BA=94 10:50=E5=86=99=E9=81=93=EF=BC=9A
>
> Replace the custom gpd_ecram_read() and gpd_ecram_write() functions that
> use direct I/O port access (inb/outb) with the kernel's standard ec_read(=
)
> and ec_write() functions. This provides better abstraction, improves code
> maintainability, and ensures compatibility across different kernel
> versions.
>
> Signed-off-by: Morduan Zang <zhangdandan@uniontech.com>
> ---
>  drivers/hwmon/gpd-fan.c | 37 +++----------------------------------
>  1 file changed, 3 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/hwmon/gpd-fan.c b/drivers/hwmon/gpd-fan.c
> index 1729729b135f..c44957b7fd91 100644
> --- a/drivers/hwmon/gpd-fan.c
> +++ b/drivers/hwmon/gpd-fan.c
> @@ -19,6 +19,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/acpi.h>
>
>  #define DRIVER_NAME "gpdfan"
>  #define GPD_PWM_CTR_OFFSET 0x1841
> @@ -243,44 +244,12 @@ static const struct gpd_fan_drvdata *gpd_module_drv=
data[] =3D {
>  // Helper functions to handle EC read/write
>  static void gpd_ecram_read(u16 offset, u8 *val)
>  {
> -       u16 addr_port =3D gpd_driver_priv.drvdata->addr_port;
> -       u16 data_port =3D gpd_driver_priv.drvdata->data_port;
> -
> -       outb(0x2E, addr_port);
> -       outb(0x11, data_port);
> -       outb(0x2F, addr_port);
> -       outb((u8)((offset >> 8) & 0xFF), data_port);
> -
> -       outb(0x2E, addr_port);
> -       outb(0x10, data_port);
> -       outb(0x2F, addr_port);
> -       outb((u8)(offset & 0xFF), data_port);
> -
> -       outb(0x2E, addr_port);
> -       outb(0x12, data_port);
> -       outb(0x2F, addr_port);
> -       *val =3D inb(data_port);
> +       *val =3D ec_read(offset, val);
>  }
>
>  static void gpd_ecram_write(u16 offset, u8 value)
>  {
> -       u16 addr_port =3D gpd_driver_priv.drvdata->addr_port;
> -       u16 data_port =3D gpd_driver_priv.drvdata->data_port;
> -
> -       outb(0x2E, addr_port);
> -       outb(0x11, data_port);
> -       outb(0x2F, addr_port);
> -       outb((u8)((offset >> 8) & 0xFF), data_port);
> -
> -       outb(0x2E, addr_port);
> -       outb(0x10, data_port);
> -       outb(0x2F, addr_port);
> -       outb((u8)(offset & 0xFF), data_port);
> -
> -       outb(0x2E, addr_port);
> -       outb(0x12, data_port);
> -       outb(0x2F, addr_port);
> -       outb(value, data_port);
> +       ec_write(offset, value);
>  }
>
>  static int gpd_generic_read_rpm(void)
> --
> 2.50.1
>

Why do you send it to my gmail, using uniontech.com which is in the
MAINTAINERS file please.
Have you tested it on a GPD device?

thanks,
Cryolitia PukNgae
