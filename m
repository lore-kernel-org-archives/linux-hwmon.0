Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888C23D3CE6
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Jul 2026 12:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784031770; cv=none; b=KLQv9Z5oJH5nal7c/nbnkSHSdmq/3Ns+/vPBiz8Po1lyjf1R5ZSvrlffSb01dm41Jam966egra34O+PsUvZ1im44fbb+SUc97ITfjXvSA6X0NtzBFDV6o5rgM/5dPO7/F+iv/woomMiE6Jm/lq0ISTeWGLIX9jRxhU7ini9goIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784031770; c=relaxed/simple;
	bh=v4bcVpyXOMVPtjXuO4lTsNsPU4GJwkI53YwReUC+wcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eDMqKehSO4gXrKij7CTIx+r+mg77h8gK1SQigkThyJpKPW8J3OOD2W1yo2rVLuwbQj/A35ILhCoxrAy1hMYa74E6hDVswAbs2pH0m4MPTtUV9vtA+B1qNWiHTj/zv7XJeygVBqJcmLMl9wp8zsLt3m9O4PbMD1phabLbju5w1Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LDEcqJ4O; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LDEcqJ4O"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493ce08a75bso16644925e9.1
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Jul 2026 05:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784031756; x=1784636556; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YZfBbjDAxNyT2g2YvKnyBU4PDyus98gbsXDj+ex0/0Y=;
        b=LDEcqJ4Oq7jE/AwbCHKVCiTYT2P6phZRsz4pj4VfnxFIGy37zm75jIORtRmA6Mt3li
         L15KHHMD5zl9Y9uHJq6z8mJ7XmxBEYMm3ie9KxtvQg3hiM/wt22R+fW+ThlGKU/fuGOn
         7/Rtwi5RJJoL8O03Co7zdW5OSidLU7yGTn2uJAgdghTlvhV+rvmaZ12+BNhVY7ugACxz
         1ftwwu144XUzmMdkAkiMIgmqdfFgfD7i1pQzc5K4F1STS/M1qjvCbYIfqBOLaYhlE3Aq
         QFRYwvJml2NjXXIoY6qwvcurKquzBfgBx4NnFSV9IckRS+mbNOJDLsztj6MwSJA3ArCh
         kRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784031756; x=1784636556;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YZfBbjDAxNyT2g2YvKnyBU4PDyus98gbsXDj+ex0/0Y=;
        b=QeY9400gnWEyDnKJMRPyPZCM9Sm7ymqsOX9idtJf7yh7E6tOkQcAvv7uie5Y+kYORq
         rAxCVKAyESiIUcBemdnN6uJDCy2Gr8P+oiSKZCrW56+CXhIO/Fx9Poj7ZEXSjqTq1LDA
         x51bXmFfG/B+MRMjZsO+LWPCswYxi+2JM68f+Mmp4eabGDSzgsOSftyezCuY4NR3Ugu7
         6WuKFHVzM/jzHLerCEmCeelQhN1H7AgWOIzarf0Ca2GD9F1ISwTP63RuUP0HrVqBAsqE
         V26ay24AcWsDOfP3S5Z6xQrOwGKbWBr7KnURCkokqx71aU36OJC74O1MHE8EMfh5z7Ni
         2qDA==
X-Forwarded-Encrypted: i=1; AHgh+RpdBbiM51XISNVhc7Rk23aZT162fDUJXkfc6rNYgiZnkzWGY/QzXjGKAamk1TDRyP8K66vbUHBwkzj8eA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9v71YOjgDg0PONcRv/IYzDKeoh2wpYzNcKLDgqSCsr6W7NplD
	tlONRVt7SH6HvQyE6v2cOiLGQDg9ipizY4pRXhqro5ZOLirq/3K2uLVysnwu1ht19j8=
X-Gm-Gg: AfdE7ckMytPP3PS9y4z8L01gmTYdMJmY2cfH/cXsrYFIB0N6vDaBwcO348XOAMtopsE
	vOx5TVLZG4+TUKeWcSYyOBm58sVZFH6EqfRZziDvl0+RHa++71KpGg0gKy+a77hH2cWmNKBhHrV
	ALAm/csVAx2o33NVGWKMCttEd0oCSRvg4+GAYvMoJvCzE7Nz9Yga/ipb/C+nLauWFXDxWbJvhLa
	u6/4LbJmTwxECCpomPtgP5XKHvCmkWIOIglYiinwQzswvmMfioaKTiJy++arcs9V2MSa4uWLOXa
	zJzAnrs0w+goEeitV+IXnf9E9kqAnkrsbOPvukZqY67pl3NlJguhVlKZ9RWZFXk2OC3gafO22+X
	8gBoSjtDQF9XbQSGt+/xEUDjVMphUViIvHEiIq9aMrrvuBZhyvURwSbQf17Mcabw1/WgdiQLp5G
	TPdqcaMQM+rIH3Y/Q6pfm+ZOod5WTMGhjEqQvRxX6HxZixP9F8FfZRM5gZvxknSU/4E6VW4Niet
	GL7
X-Received: by 2002:a05:600c:c0d1:20b0:493:e983:806e with SMTP id 5b1f17b1804b1-4953815a61dmr23231085e9.3.1784031755778;
        Tue, 14 Jul 2026 05:22:35 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4950872424asm76061295e9.1.2026.07.14.05.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 05:22:35 -0700 (PDT)
Date: Tue, 14 Jul 2026 14:22:33 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (lm90) Switch channel parsing to fwnode APIs
Message-ID: <alYpqifR8RHXZWZ5@monoceros>
References: <20260713190659.4511-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="67hkz2jnla32hvol"
Content-Disposition: inline
In-Reply-To: <20260713190659.4511-1-flaviu.nistor@gmail.com>


--67hkz2jnla32hvol
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] hwmon: (lm90) Switch channel parsing to fwnode APIs
MIME-Version: 1.0

Hello,

On Mon, Jul 13, 2026 at 10:06:59PM +0300, Flaviu Nistor wrote:
> Replace OF property handling with fwnode API in the probe function to read
> the channels properties, improving the driver compatibility since this
> method is not limited to Device Tree only.
> Add also the needed headers for explicit include and clean up related
> function naming.
>=20
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> ---
>  drivers/hwmon/lm90.c | 48 +++++++++++++++++++++-----------------------
>  1 file changed, 23 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index 4b9c0ccdf260..045977e30cf4 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -101,14 +101,16 @@
>  #include <linux/bits.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
> +#include <linux/fwnode.h>
>  #include <linux/i2c.h>
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
>  #include <linux/jiffies.h>
>  #include <linux/hwmon.h>
>  #include <linux/kstrtox.h>
> +#include <linux/mod_devicetable.h>

<linux/mod_devicetable.h> is going away soon. Please rely on
<linux/i2c.h> to provide of_device_id.

>  #include <linux/module.h>
> -#include <linux/of.h>
> +#include <linux/property.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/slab.h>
>  #include <linux/workqueue.h>

Best regards
Uwe

--67hkz2jnla32hvol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpWKgYACgkQj4D7WH0S
/k5b4Af8CQ2RCKjW7Ww400XNM7QcZ/5+xHgQg8NxYmulcdMBOCiYsdcxo3L1NMAC
ZSPhfyW3wEnP6ZGojp9Wi9t+oE+shu89NstUwRGy+PdeJEtWxmRDVEPiSph3QE9u
AGv4qP5uLzBwcrcw5gMnkGpJNZSp7n0UgJaYTBGL2EUcKmm+qDXHRPM8Q2DoNo+V
0duxqMu92p2NK8uXilwQzXj5cHImbZ/iyJjiVM0wrdkaQ0llIpQHxdUHuk0FHcY+
4pxlNy1L34WTqWvn+7LtvsXDfCCbnF65LsLHWOUHMneF2gH0tOPp7AiyjsSy3W+/
CcTolEFGkA/DN+xpgzz6SdnkW5NVOQ==
=jXzz
-----END PGP SIGNATURE-----

--67hkz2jnla32hvol--
