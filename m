Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794913815;
	b=hTCbZrvUEXQ32aD+ZDozZWfUi4J660Fn6QgAg1BJA20m02U7l1tCyq9L4WdqkhcZnWcZ
	 0A2fZPbtgRMeUbS2wUczlhR/MANLTEp/PtTLYAZmxoM8syGq/+xEJ8DTAsIbzworq3mWJ
	 sPXz8xkBbdI73J5dfFencTDtfDbRb9TKys0zNpPHhWfl0ugHQ3x8T50MgdDcIQuzAzN11
	 pbOpuIYVjJzDhDAv+Mq+XFaqOEQOJ93YNpK+Byu38ECb88rXdrYC7ssungsfxOvjuVq/B
	 kbsrdmaNvPBVTrXIl+bBZ7QhK0ubN0JsljClGUf6zLxR+6kprlDU/9ETK9uTEB3XAtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8HNt04LbL3op65Jtm2Xw8wh/ofgld4Wuc5d7vXjDfv0=;
	b=DIIDb5yFAXw6HCQIdHGuJLl75tpl3JqfYjCWHYKweTLi8FeEFT2npSDEluWnpxCYrAlY
	 B/S7DTSAskQk7q5gvW0oEnrMSi946b79JK2VsNCtk43tm4iWGdyQQ3IIh/GAkWgSj7q0Z
	 +v9fywwCYH8cBxP4aYm4G1VXbzOPh7EXgAK/fbW1DBCLdRcU6weqve0kbKkEhjTnxCD4g
	 CiIF1HK2zdrnu1MhS7yPUdoNPvVnsD+T78QYHwlfG0u6cZfospqDRs9X2hpRbxJpYhBxg
	 lW3eRqmxozMqaBFuiZtF2TrM3lCmXKeNMSrp48xxvr1RNOyiZhP670cHe9/H171szgw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2Hk1hKb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862AA606A331
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 11:10:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 862AA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x2Hk1hKb
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4d28f75d62so873540366b.0
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 03:10:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794913814; cv=none;
        d=google.com; s=arc-20260327;
        b=pzcJ2dvH/KKa+uHUD4qtWm2ZkEQgkNadDfirvKRTZ+1+CrXp5SRcHDjKlvQWpJyiDf
         l/MOHNMlW9hRor2ZerCAxBL1wg/2C9H78mQh7KjFRJLTGAbguMuq/MVhGMSYCVE8sUlo
         +074LzcW7HMj0826WbLFO6V/TdErjoYawuGXzRUAmCrlHVx2nBw4q4NuCk5G+19/fh5m
         E5SgQUKK7zAFAdD6Iv8i18/limRmSRkEP2+N4rM5rb2m3tT9VSLagHU5mrLZGR6YihzY
         aqLNL8yNPWUWYIA/wi5BcqmivBXn1cRMgz6s1hAfaODBcO17waBPlXsPzzFHFL+rsUTR
         vYOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8HNt04LbL3op65Jtm2Xw8wh/ofgld4Wuc5d7vXjDfv0=;
        fh=c3ovs+NzD8shHxyyjm1ytFTcEsBmZkIpLkAMODG6L6g=;
        b=U4U/+MDNX1O12h/XZYZq+3Gha97V4qqebEFifrzw3JJa5aElNH+r95yNb2lwymyPbp
         VcUowbfjJ7N1q3i+YUF/mlps9rlJSDsiOzMyFKqloBRux6ZVTi+8r2016OC1NX9Gxo3Y
         2iaOdArF8h2XQr617bRfXNX4lT9dcVW1WmKyJkRgoJ1DVcKxEA//vBjfbqgvjy+6W3D4
         RCt0MW1K/J33kOOvzA/CFST8U9lG+OCTIXlSeGpOEq5lHdtLB31+JdKCRlV02vuECZoS
         GMw8mAQL5lQrRFKkSPKm8CzIqqSvyCOKuKhiTN5z3fbYrqXkrK4+89N7l5PVl84J4VVt
         fLsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913814; x=1795518614; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8HNt04LbL3op65Jtm2Xw8wh/ofgld4Wuc5d7vXjDfv0=;
        b=x2Hk1hKblfNfbBuIqPiQYQh2uP0SnQ8rF7azyRg4NYKTU3Fu7PbhEJPFEoY3qlSRFz
         T4COaEzFG92WXLtKX6fk63E1vsACOSPW5/ek9/aUiaptwVWyj+sJ2Q5rkTNyTSVXvxvx
         /5A9XHhMAAhtfAmWhFuuektMe6yqNzmace6YCtiehHL0xRx+KtowsiimYXlOejq/riSs
         S3s/uOKUsSWxJ3NHmOH3DkVJqg05gQzE8l7IhIRUxwEIe41jJmJInn8KzA4qLOVcGYze
         umI/PvB/VnSZkn4nBMxrMKsahoMhc9+btYRJpOYNhS2bITRufspALvbSPqUfA+f99JaT
         9A1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913814; x=1795518614;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8HNt04LbL3op65Jtm2Xw8wh/ofgld4Wuc5d7vXjDfv0=;
        b=dt8m2Lxwmfomlbazy08IVFeDsaqofeEgEVuttw4x2MIV3N9eY/hhrpWBur4KdXxZCL
         jFMMLCdE/5x9esQg6MabbfUWQkNkRoXRGznsuoNcpH0UQoPRslLxStAZWY/YgFeCBd+U
         NydcakvatkwenQsX3R0b87zIU3MYWTqkG12VYYY0NiSDp6cC49x+8pk8M1AFi1huA4IL
         +Mi9muGAVKSU0hOeqjuYNt2xDLB9YCyjOUvlfWhfJ4/gLZ7xxB8g1+j9NEcEJ/HiL/Fq
         Vopx8UWg3j5RNMqikm/GxNtqAf470lZT1V7RFpQ3DV9LikKAfHMr+QqtVY6e/17JXr6M
         jPvw==
X-Forwarded-Encrypted: i=1; AL+hErFQSUzIuNbUYPr/9H7hkUFvMQ31C2e/KeKeUquDgz5IEXtaBwfHdtne29J3gBiZKrzRKHV82rvUm56HgA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9JhxvmcaVVEAM8+YIsYoAgt7FjSnJg4zSU5RdbHYmIV+6srkih
	a+Hkor34QrysF+nsm8Vacxpm/jkEZLO+gHVPf4uz2aYwO2G9WZ8FrPJ4x6yyrOfQeJ+UFgNp+Mq
	G7NQdZ/g4os121/04oA/uIp0XqtxzyaA=
X-Gm-Gg: AYBFou1RXMnxuR9iCx1T8GcVd6MNUu9un9MHDaAcw/SGZZeXVphMNnWYorGmIhTn+Mo
	o8p91NPwQ2E4tS5wsDQvCgGhwkpYNiBhEwgoomKuC6wjdVc6A0c5WsS8D7JA/ESfTImwxiyMtga
	3iUiw1nClZOU0Z6l2AaqPZ8EMYo2Ku8MWnJC1HFdehUW25z4LV/fWwOnYAZZmj7bR2Zh6OLWn9c
	pit7KjiZAe2NAizYKJ1KlUntGMHKtsDegeI4oY6289K8ofN8nTmHLMTe2l7qPq0LvJKHReMzWG4
	FKYr3c7EPbsdznOBYozhKtTtEYZc94z5xRSicnmP6c4XKg5rKf3HMJvY2+PFz8Qa9+MJCatzO35
	GsWf/D+uv+MLIhJtyquZPyHG3c0ioAC7E29yKbigZg2tDi6mTYX7RdC9tJes9DHFNblXba2C4C1
	QWJuG2FnrXkYl72kSjYPpyDND+oGVaZC1nhS7R6Y2f2m2F
X-Received: by 2002:a17:907:6d06:b0:c2e:2944:d6cb with SMTP id
 a640c23a62f3a-c5096328166mr1059994766b.13.1794913813640; Tue, 17 Nov 2026
 03:10:13 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com> <20261116-marvel-env-v2-2-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-2-ef614eb2e7f1@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 12:10:02 +0100
X-Gm-Features: AclHuK-Br5Vbz1VzqXOUMBwObsh3mCpAfEThlMEgldrsDt8fW8D9WyXgT-y8mRs
Message-ID: <CA+=Fv5SCPN9wTpZ-FMToWtNerfPswbExZxEHtt=gwrXf+S994A@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] alpha: marvel: report environmental events without VERBOSE_MCHECK
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
> The service processors report temperature, fan, voltage and power supply
> alarms as system event (0x680) logout frames. The frame is already
> classified as reportable, but without CONFIG_VERBOSE_MCHECK only the
> header line reaches the log, which does not say which sensor or what
> happened. Print the subpackets unconditionally.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/kernel/err_marvel.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marve=
l.c
> index 85f7a56816ce..46c521cea9a0 100644
> --- a/arch/alpha/kernel/err_marvel.c
> +++ b/arch/alpha/kernel/err_marvel.c
> @@ -37,7 +37,6 @@ marvel_env_state(u16 state)
>  static void
>  marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
>  {
> -#ifdef CONFIG_VERBOSE_MCHECK
>         struct ev7_pal_environmental_subpacket *env;
>         struct { int type; char *name; } ev_packets[] =3D {
>                 { EL_TYPE__PAL__ENV__AMBIENT_TEMPERATURE,
> @@ -68,7 +67,6 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_sub=
packets)
>                        marvel_env_state(env->state), env->cabinet,
>                        env->drawer, env->pe, env->sensor, env->state);
>         }
> -#endif /* CONFIG_VERBOSE_MCHECK */
>  }
>
>  static int
>
> --
> 2.56.1
>

Looks good to me:

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
