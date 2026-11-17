Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794913907;
	b=DIlxcg2XblWkvph1VzwwwfQHwqHkPL3jK/hYd1Qagz5MMzthhOPKpK+Q5x5iUJrd1goC
	 44IHqgLWz3i6wlgabSLQWBK8OOjiUJm6yo7l3Rv1a2z1xgQj1i0V1LfQAmsR1YNkwsJP9
	 dPQf//byVL9UaSs9UatmrFt9u2F5x7DRMt5M9EOdIYIL5kO3mtd1xvqu9Y/D1NrcUslxO
	 ic4qo3bK+ozOr1wskeIDM1r/Nd9yt7aeNXPSfMjLedLfJ0R9DuqPanXNqLy6SSX7IYMbi
	 rDGPjOimQuZRiPbUocwZveRPuZnNRjJjIQZdxsQLTZuY4H3YG+S5m3Nvf2owbxk0ioQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+10pY0INY9MpKdeaN2+bTZktiWeoGPp9KNRq4cSBn94=;
	b=efIS50WntRSt+7/PoEvcElsdO+2kmapDeMMpKmPak7OZlUpd7xXKqYXshEkKCextC1Sx
	 dpTXLt0t+7nmzqIL6tQ6y0/PHI/NtW/2ue5D5IHRofCzfZKXjqhqFx7lxh49J/1uFj/Md
	 9O5dOJcWxp5y7FvuyFi+ulTPS2PccivPWQ/rAbp2MZWnTeC9zE5CXMCA6NnO6xaNO1+LP
	 jkp5GsYHVRKi65UjlmvZJ5irV8PYNGAc+prK169UN5z3InNYb7penJwF/JNAxAdN+uWdw
	 U31dbzPvI5y4ST27OOFL1s+MFrL3513t4JID0d+RijBeI9suEJDu1vPpqbw8Ya1pW5g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yyzwQXWU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16FE2606A31C
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 11:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16FE2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yyzwQXWU
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4395d31228so719570066b.1
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 03:11:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794913904; cv=none;
        d=google.com; s=arc-20260327;
        b=aUuXwmjh+0E578Yo9MU9IO24+coOFcCBdc5AZlhjri+yDmBSgS037E6TviBKTqXSCJ
         rHE02zxrHJ4yrfbu+Zmke46CSHfgdOvzbrDrW7KVFyYl9fYty66D0gRt1+nUdt+6OWaf
         qHzJTovznGpIhDuWiKvJRDPoTiFA/pbWvUS2ydinMWVPZGqgyMxMZqsgg4azfHYT4iR/
         8WMShsFE5VFAz7Oc9+M9XXLbuOWhhGXytoMJKwexGcMsCTFwLLTkN69jtY6h9VI41abb
         TChbvfniw4U3G79D1rLLmFBIwocj2NmmtoDgs6AVZF2Qt8xBx4YhaxnAq4+cXaSstwxe
         gcKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+10pY0INY9MpKdeaN2+bTZktiWeoGPp9KNRq4cSBn94=;
        fh=WBtLqtlsxCBfznNXwp+0BfC0k6dAxo48dbiNV+oM0dQ=;
        b=T1ihW1dMXasE+V/xJX4gWU4gRdbN4EuotL2FnrHoqAyHHYQKZLzdZiKaX6/zJMjbJq
         jDnbO/qx/PTpk5cq6Pwy+atPLmhBeAx+BvQx+GiNjDNc12eIvrp+4gjDeGXWRwk6aNWQ
         xwUlQTxcU8t5zQZEUkieOzslvR4kk6uzCwyxxJjCJhf/mQQOwAGfByiYdJ5SQWAGb0Qa
         q5nYVYz4/iddgWik32rlVjHuWtTxHEkE1ufi8Nh6CltLEveRDBuYCZ56Kg+yk6f0E+/+
         79qEAEUS/Jvcu+XZ4Sle2MHIiuYKpwF8X1GbloL3WmXM7ZmE15XwaX58PfgtwTyet/nB
         FJ9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913904; x=1795518704; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+10pY0INY9MpKdeaN2+bTZktiWeoGPp9KNRq4cSBn94=;
        b=yyzwQXWUh3hlTm75j49756a3u40dxwVtzSwHSTRdU1++KQVLHeGLEY5oKwXhbCuaYH
         6nWczAtsAkgzqx7tarkVTwqE/NcVSVZoNK6OuqrefHsu23luGO9vLTl0ReCdUF488lYn
         Xctf0sJGtjqLQoPJcntw5NhbgQ1nt+25ZO5G9d6SB0G6QMIK+9CNoivLQNtlpfq8YlX2
         bvCKhmaKDMno2IJ2CF+XBc6YetjTb5aYwyiC80kbZ0zb4Mtd9yiOq9GZfVJP1lOB2jXz
         W2YR+wlO7NuhGWOJ237/w17lVlBl32uKbC1Xb7lNg+J4sMz5FU92rzdEDYH6v/ndnBFN
         3FOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913904; x=1795518704;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+10pY0INY9MpKdeaN2+bTZktiWeoGPp9KNRq4cSBn94=;
        b=BEVB42EdxibsdINMJjjXaFYHClCxSLQ/F+SYRvJkS87w1chB7HvCY8e0NwZiXCZPzv
         i3decsm3UEW0eM+8czqNx2D0et8kmE/UP8penEAM9plK3VPmzeNNmdR09qN2lZ94NAuB
         y9y6ySMn0Llgi36ODGjrWy7LXUtpTsL/jFFIASxJbq+fjppo+1VRgiBfy+37a/nhp3jI
         8S2xN/kVG5zxr+JXtZ1IsZbeZh8q+vwCXlV7WQDBTwvGoFzlH6oED2+zAFFPIOpYLq5V
         whQFl5lqpVQnSQsTu0dT5jNcP79enLqN2lX0/X2n8a8zbFr4pBN97S/xB+9BgMzabPoR
         tm5g==
X-Forwarded-Encrypted: i=1; AL+hErHCD+gdOwkfZ/cJeDmvwOJB722L7Mr2xuz8N1XV82QVQkzACNzjN7359e50v8qFCGIpJ1yYj1GYurpNlg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8d93CAqJxflIqtSZr6MoBLYezPbGe6vKPjHB98bxnohnX0KdaP
	fY81TW82iCMo1CB75z+fAq1dFNJGUYwNsMfs4hkLBuavqFt/uqAneOtqVcQkblSv89Tjpj+Tbfe
	M1XBQtasaBeE+OxNZOwHFLZvpy737rWM=
X-Gm-Gg: AYBFou085lds4pz6WMwmwTK/GwB01Fforub8wWNP8haGk6SIB2ehWImnS//N9FVTWpT
	P+296rf4xevZD3UOSJAng0pUGupTRMDLtFGITw8tzr46SsD6VGcnqNe3osB1FbaDuF16Wsk0+WQ
	/ZF3To2sNzdhYmgjOaKnIIwifacvTLmRF14Lr1IHVKLQtX5qgFry+t+OA9Uxcybhfr6HCcI0zdl
	WYhrPCBvpl8CE/jTqUm0ZplW4mPUeoJNY1VnYZcmorNT6IZBr9Z1Za9QxGrS8H0UQkDROf++zQL
	5bYKyt6CgzCW2b8uHL9KeCPiua5w5njJfQ866oJ5jkYDpNknAEetaIAsjRM5RI0+aL/HxR1GWV2
	uCcYvSdVn3MKPr0UzRjwc3v43k4arMYZ1dkY691W4w3/2bXBnS+X8G0o/dyF7ywd1vlz59CLqby
	gJLRAac8kr/Q7Zi8N/jCkgkN4=
X-Received: by 2002:a17:907:94c5:b0:c50:576f:b3a8 with SMTP id
 a640c23a62f3a-c50963d9089mr1499165666b.48.1794913904361; Tue, 17 Nov 2026
 03:11:44 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com> <20261116-marvel-env-v2-5-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-5-ef614eb2e7f1@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 12:11:32 +0100
X-Gm-Features: AclHuK_ySbd-btf70cw_u0VyMg7YEG-_OS2SndJeElSe33r8vAUxyZLJAiFwxJQ
Message-ID: <CA+=Fv5R9GknyU62ZwcGPvH9u_ucK=qP3j0mE5s-YMJgVbkGs7A@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] alpha: marvel: register a platform device for the
 environmental sensors
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Nov 17, 2026 at 3:59=E2=80=AFAM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> Register a "marvel_env" platform device on Marvel systems booted from
> SRM, for the hwmon driver to bind to.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/core_marvel.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_mar=
vel.c
> index 7525f3ed6b62..169a1df6adb2 100644
> --- a/arch/alpha/kernel/core_marvel.c
> +++ b/arch/alpha/kernel/core_marvel.c
> @@ -21,6 +21,7 @@
>  #include <linux/module.h>
>  #include <linux/memblock.h>
>  #include <linux/workqueue.h>
> +#include <linux/platform_device.h>
>
>  #include <asm/ptrace.h>
>  #include <asm/smp.h>
> @@ -1139,3 +1140,13 @@ long marvel_cfgtree_partial_update(unsigned long o=
ffset)
>         return status;
>  }
>  EXPORT_SYMBOL_GPL(marvel_cfgtree_partial_update);
> +
> +static int __init marvel_env_init(void)
> +{
> +       if (alpha_mv.init_arch !=3D marvel_init_arch || !alpha_using_srm)
> +               return 0;
> +
> +       return PTR_ERR_OR_ZERO(platform_device_register_simple("marvel_en=
v",
> +                                                              -1, NULL, =
0));
> +}
> +device_initcall(marvel_env_init);
>
> --
> 2.56.1
>

Looks good!

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
