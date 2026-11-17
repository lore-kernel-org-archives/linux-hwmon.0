Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794913869;
	b=eV2C4eTLfShsfJalWW+0uELHcYcyDka5bTbIRhg76g2Biz+id4KdtNeG3G/GQzeQr2/q
	 FJzVHXPlZ6MtHNykXxU/RFZNwr9JlUSSrpOgKo1H6C1jM6OhNWu4m81dIzNliICgbBlAO
	 U+R4Zqa8HTYjlAOZiBSWNXqbfdkaPmBOFFuV2lBTy6EEY2sjxxkbASqSkDEY5vJ3VaXW1
	 I1c6RMKSyvooDKVQMUGC5Y557INkzU84QOEdIh1c/he2+XSI7SCe6V6eLzCZyDtSLLesj
	 BiJBy4+TfWP53irJeajqD4SYjBYVQR7wfwta0Ai2hbQus2sorgCNPILGP1pac7nB7rA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=y3ENa1F0d9y28UWOmP0+YontQj5ZAWu0uOKB/L//CbQ=;
	b=P7gXtQfhgzv4OhJP93Q6S3ZR0CCth9Tni0ujwwiA3TmaAFC4Z/wgSKo+LtIgbjduZX95
	 USxrFEElIIfNFiLzHpCcaK22znXdFVstP0cRod7RVG2zJIrJ/liAePB0HmSGQneAxtmoI
	 K5hZ3Q3HUNiJG745NKoV+vVCI193H7ul9pm3WVjh60i+8i4BpBZ0bRhnvy4G82J5FlO4E
	 eX1BCLEfa8SItrxkxPB4LuiFXaTw5ZfKD+pLc8/Gm97u37bjrWbsu35/WgIKit3wuu2MW
	 OhkrKPU+UlSDtxZ1Al9jKlGXVupeLE96CVFVwnsMqmY5YmB6tM0DsNl1mSvFCDu6ung==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=moIxETzH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 140C6606A323
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 11:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 140C6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=moIxETzH
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b7bffb5b8fso5631096a12.3
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 03:11:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794913867; cv=none;
        d=google.com; s=arc-20260327;
        b=HESj+YFZcIevEM9Nn5GJlNPMFo2YQE/9DWRfy2fyItz869MFGCY86VOGDYIYDFJAc8
         RKZkd8s+9MAH64kWbynNgkQU6NHSYMhwZp7FJtiWRd/0hNcPqtUvHwUQE6pFgvMgZAuf
         b0t/Bjo4hYnI7Au5e5X0/2vXAj5mFadhPwtbN5bmtEuX3uXIw5Gjafwme+sUPh1P1Lkg
         3fSE+PKaEk+fAiMqbmlu0WBy0hHPBXP+Ujkh1ngUC2Ypp1pgLVanmlUkqiXIfyecZVho
         wFdvLE239ZeOinPLPT479Yb+kWNnW+HUJE4xznebZ2kcKK6P9pOZF7OuHKA3THJdIFr0
         SSrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=y3ENa1F0d9y28UWOmP0+YontQj5ZAWu0uOKB/L//CbQ=;
        fh=ywHzJMVQyjRY2/IGY6ijZzpxkHP4kJKGCre/iCYduT8=;
        b=dP4NGcGznWptf9crkjpFGFrYBxYS9XTR6kffzd0O9LlSfIfGWeRZRgDCZ1RVWFRZJB
         VAO/xE5U7tvl1xvu95j5wjNi96UL7+hbhKBop5WOwahj1lQm/ms4V97K7p2kjzmPdv6H
         5pKzb7sDSB+GSX4odc6bheeyj3LwzaOp+Eb0sgoUAnzl2og1sSdlKSoVpaPaq1fugsaf
         CeNRN8RZIAnmLsk2O3a2REb15HMKPqmlCvKqO6qvXUpNfjuVoPEOJJ9HImtERBLzJvPn
         oz4/uM9nDUEDZfcwD5VIIVVCzIR6UH01xUc09dRQp9VXF1YrpqYEw2i1m980na2b8O/b
         9UpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913867; x=1795518667; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y3ENa1F0d9y28UWOmP0+YontQj5ZAWu0uOKB/L//CbQ=;
        b=moIxETzHa0Oq01n7L4mzCWZwm33Qlqm57PUEdjACdCaFiZo0ueGyZTZaC/wKy5SOMK
         oXI0FM9+gSkDnkpXkD6q1VLY/HTVf4Z4buQ9pQMLMXvVB7vUyLnBFQbzotk6yVCr4iC5
         PfqYo4e11phlxLS+s6bPmjvyYm9H2cEjqvYUpvv60l+cCAz4oo31FFdQZuofiiHnUXk4
         9ZwUdgDAc0puWw+LIme2GDkOcXdRnvM/sLPo6bULbEvwYYc0NSjyfWsLmydzKblH1JO7
         hX9DD6A2nVioNZfFT60yg7Q397SzaWnpnFkWdV/ovcu7DMmLQhPK+iKjZG6jsXS5WS9s
         vP1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913867; x=1795518667;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y3ENa1F0d9y28UWOmP0+YontQj5ZAWu0uOKB/L//CbQ=;
        b=ZQWyggbm0iHS8t4YekN+RxfXVlawOHs9X6cAXf3jU2nu3OI7F/EeOBPlfwj1UOxLHs
         2HqeK9MM1g+ladP0uiphUfwSO76oBcLB2rfmh0TcvwNs7DO8acfpuFTsSPDkj0EelSex
         XN9KEOLIHSwHp3MK08ymv2lmuos7n1ojf7w325k/x4hyzq8eoNhN3mRXDgk+B7855OBG
         o2j/YxjH4Lc7Cwf7HYDJnmyckWC1k6PnduNpkhaS4twOoRRUzvGCdJrFdZkCGvnXi9HB
         VGC2uL4WrpZ1UPIYATAS/ZI2ZVeEP9FZHxGkCPX8X6x8GojHJMVBzzKkVqkmWMlwNXV9
         YpKQ==
X-Forwarded-Encrypted: i=1; AL+hErHWZoVtjyne0o4PsMBYsUwrOSVCpQ3mjVw6Ok+SDpQr6gM6NtLSnnVQFSXKnSFxEvqUGBrg9lK75+6OBQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z+PH+OT+AUQ6ycwyEuBvL9HD9LS4H9i5PQlSbHSmX00WEhvVih5
	gSk0RFQycM4UHXIMGMjY4CM5oOmTT5DgP9Tts+K26Wfa30KbHQTad8O1fRzF4lF56oPBuTNGucc
	P/1EcSf6NKrWgaF8zXN1kYXJ9ilQ5M2g=
X-Gm-Gg: AYBFou0LMKCgxYQ+eKP/TtiBsEbcGRUy+P+x2idcm8eWvdZi9metGw/YIn9n/4KiT+F
	X6Pp7++eg7rNGDjofi+PV/xDJkGGWp1iR/AEuftPGfxIJQ0SEgi8i3uvqJEko6+Raboseyu/nbZ
	JBZAx8+uu4DOpZ9serTMBSKqoZ5pl37f0NEVmRCMcgEr1oavEBbmpsC8Ij3EUTfiOk3fGRmEBdB
	6a9gFY5MBB9yTFX8VKLATyK6zyXzJa2rltAXGOI0XXjJVHCHUVEC72qSUl/CUrpebiiLgKOpHZG
	bnol5/q2588SstcW+IHEeIyN7BI8NZcHHlsj5HzLZtSERFlGFBg92Qz5r4D7x4J9zmTcNh9ZSKW
	5cVf6Ot5Fl4j1irES+mAO4c6xFMnBIA24LjV0VVbe7Xduj/5PtfEhoYirrCeDxqdCTCRmKDjJOM
	5LZoaNvo3QQ4427gWz5L/dY04=
X-Received: by 2002:a05:6402:c711:10b0:6b7:8b36:93f1 with SMTP id
 4fb4d7f45d1cf-6b7c098803fmr6702619a12.10.1794913866951; Tue, 17 Nov 2026
 03:11:06 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com> <20261116-marvel-env-v2-4-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-4-ef614eb2e7f1@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 12:10:54 +0100
X-Gm-Features: AclHuK-uU12m5JYQTGHnnby9FLfe8TB5m1Dddww0eP2k7bEnEFbxsuNSOldafTc
Message-ID: <CA+=Fv5S9+y3vuSpFd2MHFEAFOwa3Q_8gqPV=yei-ej0Zo-V-9A@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] alpha: marvel: notify environmental events
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
> A change in the state of a sensor arrives as a system event logout
> frame. Call an atomic notifier chain on each one, so that a sensor
> driver can reread its sensors and tell userspace without polling.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/marvel_env.h | 5 +++++
>  arch/alpha/kernel/err_marvel.c      | 9 ++++++++-
>  2 files changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/include/asm/marvel_env.h b/arch/alpha/include/asm=
/marvel_env.h
> index 16ccd2002a11..dbbf827a18ad 100644
> --- a/arch/alpha/include/asm/marvel_env.h
> +++ b/arch/alpha/include/asm/marvel_env.h
> @@ -2,6 +2,8 @@
>  #ifndef __ALPHA_MARVEL_ENV_H
>  #define __ALPHA_MARVEL_ENV_H
>
> +#include <linux/notifier.h>
> +
>  /*
>   * Ask the console to refresh the environmental readings of the GCT node=
 at
>   * @offset from the start of the GCT. Returns the console status, which =
is 1
> @@ -9,4 +11,7 @@
>   */
>  long marvel_cfgtree_partial_update(unsigned long offset);
>Reviewed-by: Magnus Lindholm <linmag7@gmail.com>Reviewed-by: Magnus Lindho=
lm <linmag7@gmail.com>
> +/* Called from machine check context on each environmental system event.=
 */
> +extern struct atomic_notifier_head marvel_env_notifier;
> +
>  #endif /* __ALPHA_MARVEL_ENV_H */
> diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marve=
l.c
> index 46c521cea9a0..6e0b0aabdaca 100644
> --- a/arch/alpha/kernel/err_marvel.c
> +++ b/arch/alpha/kernel/err_marvel.c
> @@ -17,10 +17,14 @@
>  #include <asm/smp.h>
>  #include <asm/err_common.h>
>  #include <asm/err_ev7.h>
> +#include <asm/marvel_env.h>
>
>  #include "err_impl.h"
>  #include "proto.h"
>
> +ATOMIC_NOTIFIER_HEAD(marvel_env_notifier);
> +EXPORT_SYMBOL_GPL(marvel_env_notifier);
> +
>  static const char *
>  marvel_env_state(u16 state)
>  {
> @@ -82,8 +86,11 @@ marvel_process_680_frame(struct ev7_lf_subpackets *lf_=
subpackets, int print)
>                         status =3D MCHK_DISPOSITION_REPORT;
>         }
>
> -       if (print)
> +       /* The frame is processed twice; notify on the printing pass only=
. */
> +       if (print) {
>                 marvel_print_680_frame(lf_subpackets);
> +               atomic_notifier_call_chain(&marvel_env_notifier, 0, NULL)=
;
> +       }
>
>         return status;
>  }
>
> --
> 2.56.1
>

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
