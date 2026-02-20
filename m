Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06D5337BBA
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Feb 2026 10:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771583158; cv=none; b=mSr8uaDTFdzoPBntruu5+xkZpKy5V3dLxbQI/911jdsxT7qLV16GT5FLLiBdrYU6dz5IPXgJZVGk43fkvwKUFXBYMxP1yKOiFJ+eD/w2gYMn1pDEr6KNnGpNYXONK1U84flRX6pv7jOy+M4cl/kerKt0itlbC4YQcs2dh1pYNPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771583158; c=relaxed/simple;
	bh=ea6FoIyDdE50TNheY3dZvBnONWDw8MiuQPExl9pn4AY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SnBNo18ctcNahs+kbEK+pSIhFvff+JzCQJXriL01OfDT8fQqx7IFAQo9i+YopFdC6+qn3pKPG7AJRAiRlgp8Ru3FhQ1UfgnSC/2/7YHIF3SqCWm1Bw2cUuqYMX2Pza6chKYb/f+HNPetU+sdVbkY2jmjX0uKS4B+qidAWSAqzdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SDL8Ejwf; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SDL8Ejwf"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8217f2ad01eso2001334b3a.2
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Feb 2026 02:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771583156; x=1772187956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jT2fPsvFGwKp1vks8mSORfzqK5+lGI8gp2Wvz8JBoDY=;
        b=SDL8EjwfvDxYt2gOpcYpoTaEvuXWkZlwE2vIpB8GlQNPS3d0bc0zzgEzBF67B3eIwj
         URTiN3AcaRgzXjllsKyD7ky3DJFj2NSvyYGR9o378kY/sfhfDySQc09uxWK/u5T3Cyeu
         jiIYubTgQxHbhx1wT+QuRyoIlsvmm8OOgz8EPPEOIeMqRTzEuUG5WfxT4+qkVevlIEv+
         7SYJU7H2oCS/oJDqfcGJjIrGI8TK7jtuGW0Qs0w0IasmHdpmuqq3ptjNLG40i+AjQ4pB
         XG0CH9SP2cG6Mmr5ezqSUGo2dpvrsoc5VRnh9FPq0eE8D6RXPVzvdrOvAqf62i7jmeFK
         sTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771583156; x=1772187956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jT2fPsvFGwKp1vks8mSORfzqK5+lGI8gp2Wvz8JBoDY=;
        b=mWFfqYJn5sx7iOP76iBDwIFJzLTYqQ+d3b8Fz1AZYT2GG2uwcDsilESO/psTTx4svH
         ypfW8rpPTaGuHguk03UB/0s1zCDflEAEUdh9sn8ZxV4DLMvvDOkcCjWQXJOspprfCbDT
         P4PySma9wy6eyBJmwZJR8kO1yjuiormuXOelWgQ0F6KXqOuOvu35Vs4M6Qmhhv6+s/zh
         OEXNl3hvira24kdPhjAAZ7AZfHHe5zkkS7i0pLTxNZHZkNY1afjfB9IVDg/nJRQY8eB5
         22/alxLzJLWA1BjZ/6vY8mCQmk6TfSxUZxJNSUKPGaxgF39AiXYKwoG3FLSkl0G3usy6
         1Hfw==
X-Gm-Message-State: AOJu0YxMPF6ucEiEgZ2IQvPlSLWUVV7zgBVJ4olvIsFA2Y0Bhpg18pVP
	BHQyZk7+NqmpbNV4BOMvY7mwsuCl+aNWveU62OpRktz5RYs4psfsmRblnquPUQ==
X-Gm-Gg: AZuq6aJ0SR/2RIWZONnbPHViZtrDn9HI0XWoSZ+B9LVeELUAo9YaImWw6yXtoX6NlIr
	hZwFIPAZ/qHrttLSHtzIydfpBNzkIdMA3J1BZOPFrexUhdLfheYi0dE2JobK8mz1PVYtAZbSkFU
	ytMc26DK0KTpiVeYDogukMZr5D3cWP9wbwxoKV6kAIrchcD5V7jgzpHSQP6vecmz0ZV7P1PgN+e
	2AlkTCZk+QlCtEeB91gSPjCwq0cM8pAFC42tv7rkoUyxqFnnGC9FII0TigKIU67Gsy7z7rzJHhB
	8xcIQrDHmC0s2jtzcjZHO9h+j03fF7YcypveSSV/mVM/xAIuGciAp0xf+oxfh6UZ6lupCAJqKAF
	Z4yI56tW/OEwvEFfuHc5lHcv5gvQrWkPMLxF3zKn6mY2PrFKFTrmt69i+FzDGjJwfEsOEek7E6H
	hYtegx1Juf8EgzQA5QXHQ2ztapjFML7oTWJwPdoYTbe9u5fJjCZea2rB+e6MbwhwYRiAE0T2aC+
	bi+r28SQhgpBXP0u6OfFs28rCD0pZr52yxaoGSFGJn+BEawkNRQh3Lp9w7bq3z6WCkwdgPME5cA
	gtUuCVYs97KMHQ==
X-Received: by 2002:a05:6a00:3d4f:b0:824:b304:2cf0 with SMTP id d2e1a72fcca58-826d07a23ddmr1323427b3a.31.1771583155886;
        Fri, 20 Feb 2026 02:25:55 -0800 (PST)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b9084asm29378242b3a.43.2026.02.20.02.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 02:25:55 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>,
 Guenter Roeck <linux@roeck-us.net>
Cc: Guenter Roeck <linux@roeck-us.net>, Nathan Chancellor <nathan@kernel.org>,
 Neal Gompa <neal@gompa.dev>, Janne Grunau <j@jannau.net>
Subject:
 Re: [PATCH 1/2] hwmon: (macsmc) Fix regressions in Apple Silicon SMC hwmon
 driver
Date: Fri, 20 Feb 2026 20:20:37 +1000
Message-ID: <3032259.e9J7NaK4W3@setsuna>
In-Reply-To: <20260129175112.3751907-2-linux@roeck-us.net>
References:
 <20260129175112.3751907-1-linux@roeck-us.net>
 <20260129175112.3751907-2-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday, 30 January 2026 3:51:10=E2=80=AFam Australian Eastern Standard T=
ime
Guenter Roeck wrote:
> The recently added macsmc-hwmon driver contained several critical
> bugs in its sensor population logic and float conversion routines.
>=20
> Specifically:
> - The voltage sensor population loop used the wrong prefix ("volt-"
>   instead of "voltage-") and incorrectly assigned sensors to the
>   temperature sensor array (hwmon->temp.sensors) instead of the
>   voltage sensor array (hwmon->volt.sensors). This would lead to
>   out-of-bounds memory access or data corruption when both temperature
>   and voltage sensors were present.
> - The float conversion in macsmc_hwmon_write_f32() had flawed exponent
>   logic for values >=3D 2^24 and lacked masking for the mantissa, which
>   could lead to incorrect values being written to the SMC.
>=20
> Fix these issues to ensure correct sensor registration and reliable
> manual fan control.
>=20
> Confirm that the reported overflow in FIELD_PREP is fixed by declaring
> macsmc_hwmon_write_f32() as __always_inline for a compile test.
>=20
> Fixes: 785205fd8139 ("hwmon: Add Apple Silicon SMC hwmon driver")
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Closes: https://lore.kernel.org/linux-hwmon/20260119195817.GA1035354@ax16=
2/
> Cc: James Calligeros <jcalligeros99@gmail.com>
> Cc: Nathan Chancellor <nathan@kernel.org>
> Cc: Neal Gompa <neal@gompa.dev>
> Cc: Janne Grunau <j@jannau.net>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/macsmc-hwmon.c | 23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)
>=20

Reviewed-by: James Calligeros <jcalligeros99@gmail.com> for the series.

It would be helpful to Cc the Asahi list as per MAINTAINERS in the
future; any one of us could have reviewed and tested these two patches while
I had been unable to[1].

Regards,
James

[1] https://lore.kernel.org/asahi/CAHgNfTynZHNt3=3DJY82-WPR1b_1JyoJ=3Dhnazc=
PwJtSStOZsA1=3Dg@mail.gmail.com/


