Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794946369;
	b=PUvSBrQ0ON/e8a7x0RpK4z198B7XIM5zNS0me1NhlcrdCw32SMXEa204i79a1WZT7OHx
	 mN5mVo7jd3cAhnlL+ssTm5WAeXMP9tRd1p86vYSc0jke9HW+JMMXeX+ZwzuAYlr/e21CG
	 PPDCByvoKo6OfQhpo+O3TlycyF1G1JMMiTOWWBwJyucJ6qv05J1KT85sadhAXryBnlOFb
	 3yer2VfSVr0g77dyN+Q+DgGHIeLasNdh1b/eC3FoYFRcoySFvgy15VZgkqqmnBsWwoAPZ
	 RH/X/mpBeVBQb74DsgrZ3N5BX7DhQZCh/hz6rhpPF8cX8IbhHCYknB2DJKOvHF1MxqQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794946369;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dsWpC8hNFHdeBhWsKEhxBowEJkkinJKfFh6H6OuOq3k=;
	b=FCQuwnvewMvVp+Gf90VwAXzx3UuEZgDcIrxQKgzW1oyisSi7sE8sgoF9tfDILZS3cIxm
	 r6r6YgFy+fVfk1yp9sSbYFJkrffF2QxioK+DJSxb9/ey4qGVivc7CdAu+POBUeM5breqG
	 8wi4rMQZ0JaTGAFfPKldMXNVcJJzfq3tL9JlWPW8rswyp1H9WplHFTIKErcj9WVAz/WL8
	 GdmWCCvij+OdqXqJfN7fFNZCOcPD6otqg1+AZrXXNcfDrli5Cl3CLG4jWpdnYHy/EU67O
	 pi9OXrLfQOsvxDXeU+fIiysUoQ/JQLApDLpIzmyh9Pc40Tml8M4bKjaTCqmRqt9sPcw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K6D+D51+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9195F606A32F
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 20:12:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9195F606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K6D+D51+
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b8815693e2so379298a12.0
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 12:12:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794946368; cv=none;
        d=google.com; s=arc-20260327;
        b=XmVG3geGjFmTbzo3MJNW9TYoUjY2vueXpxOqdUDUIo10Qi4cOMPyQ70DsCNhsHXElX
         tvnSKPEpG7UAc6XRVht8+9rWc7Qc/Ni4bKaNtbGsRTGoK8KmGb2jQfgK8vJRdPmTSObG
         oo5TEYZk3EsOa2wEMDYVVFZWf5XMaGPWWOGloaKWf4gQ+B02lYl9H1kxCEUnRrkjgK+n
         m0BT2Ia5ksvSCHSeMvG63v33YHhzL7jxOKl4OKkGwMKSw1/A86MYD0dEkRJwrn5D2Poy
         GZdqkUKAjBEojaX64Lv5+X1NcRx4mFM0s7InD3sghOGeY7+xXzsOMKKL2Qhqb93ZufGG
         bwNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dsWpC8hNFHdeBhWsKEhxBowEJkkinJKfFh6H6OuOq3k=;
        fh=iI+oVFQfNCXO5EODZ5f7a3/29DwjhqNjAT4xTlXsnEo=;
        b=Bi5f+wBNgG09Hdbt+ZzzpePDJnV5nJ0hP46747e1FYUoaD1fiki2aysJP2nQlFsYIj
         i+Uolh2Gexuuw2aWSdQQVEj2N5l+EaV/ff+YECTIQswSSbLzW4zWOUqYZEewFWs0d2Ni
         SO3nEhFhc6THwNigrtc/Q8J2dAsKYOH96cqOjCkHeegr+LHo1Tn2OPNL90QIvN3VWeyV
         g09jQhPOfm1BWOuHnk2+9O984R2LNz9wkzWRwKBruADiRpfvuldhHTliHihL+AeOFs+d
         +9lRlye918MCbz/bFJhlKuomX4woO0edf5L/sybSPzTE8KUxXxp3bD9faEYiecqolTFm
         juvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794946368; x=1795551168; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dsWpC8hNFHdeBhWsKEhxBowEJkkinJKfFh6H6OuOq3k=;
        b=K6D+D51+XSTzYist+UzhJnGY6R3eGYB75bwKa5XnEwaaNA9Iou6XEjQr+MM4qF1i1d
         rrUqHdNcBJUN1vERSaitJUZzO4rYrgNWo7yW+UmCPcRcXpZtM02jU/oI3TFJclmvZnXM
         YQoBZRJJ5ivIDzbD+p7SJB1ohrZ7ZoxiyuxrD210CvfAB4Ytsh3whrzRJj5MK0zxiT/C
         iFi5BwdHz2/gcud/45+trXqF+YdinQUPnlCUK09p8t4M6kZTCMREu8hxdoT/Uxy+/TWA
         LUMWuUI7CHpcFM6MoqbQqs21aAjSbCEQBCqnd1JpMHpK7a311zszl05ZrLocPXqeVYms
         HemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794946368; x=1795551168;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dsWpC8hNFHdeBhWsKEhxBowEJkkinJKfFh6H6OuOq3k=;
        b=kd9hqWWsq0qbMplNliKtEopG8fj0c9QlrXj+8wXsKk2PP60/Cj0uVXpG4/FZdlj5Lc
         704CIbNfgY42Wab/H4VB2YoTVbKykv60FaFEsVDThLhc0fdnUUi7ge3v3TKWbm1295Y4
         orvbUxMifeEcMI3pPoIp630eTBGt9QT7nKOecuQWRjjbFabJuhogXeupanuy4KXH4FIm
         CYUeAUGuVerB5B5Npe9+seK2ZgDisiu+lYDsED1ziHfHSWHw4WualyVcy5Qp+X6xQziH
         b6ge13JyjxaVdM9a3+RsFaagbR24dBCixzBJ1pyFchZvU/GQiJQQIjtaFoh+aQcw9Y2F
         3r3w==
X-Forwarded-Encrypted: i=1; AL+hErFttetb9XGqmfGr8AetInOdr7MziSsv+L+m5k5846p0o5VXgMXHuBify/G3Do5S0ohvHyF2isTWKiZ/tw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8VVME38cYwwtY3Gx4jkN9GAozJB/RK60xbFSlRgZJWq7vNZwWf
	TKnhZtyA5YwvhCyh1eVSON/2pxNMzKShIdksU6uin9vz+g2wajUMUGCweiLLPDuddbHxz+YfIPp
	zQmsZonnEKRWVAAd49gC/IoVKud9Z8g0=
X-Gm-Gg: AYBFou2NAOSqBiJcI5laCI/yBS30iGhInj04gf624alKRmLqsG5MYQHrOsapGbAmiuD
	yAhikkmCEpLhzda4Ou7QeCQMh/WZQWlQSfEL9W6vv3a4nrW13GAstRfQnyfPVy0QSQNoH1pk+6g
	KfANTUGc8o3qwzk1lXJrPEbpknkY5E8uut6tRTKDF/wIsYY61ZDki/SKlfQNy9CBk7sukIwvj3t
	3torXbF8HUIkTf+qWWw25fip+oAOZ+5ShfVI1s37ZnlAvv77QvRXfueu5bxWIWb9oyinwoqeQrE
	zr9ZRlWIil9tc91BYXyaKw7umYsye8OZfGexvztoSPu2LZL4clMS6qBZK6McygLHtS8X7Nm8oTv
	hlT7RJS9Tcj06wZuzEKBykiDXF9G1CbNwbnxcCO21QwS3Gg/+AtQBwKfgUbMCOxrAv43mFQbG/7
	qVxaRfhOHMnjVd+T3LZ/55hVA=
X-Received: by 2002:a05:6402:42cb:b0:6b5:8695:f839 with SMTP id
 4fb4d7f45d1cf-6b887f1be04mr267366a12.45.1794946367691; Tue, 17 Nov 2026
 12:12:47 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com> <20261117-marvel-env-v3-3-0edc370fdca9@gmail.com>
In-Reply-To: <20261117-marvel-env-v3-3-0edc370fdca9@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 21:12:36 +0100
X-Gm-Features: AclHuK9UJHZpjj1pwmTs5vNVuvzEV8p-zx9UHIBTQLk_eJ3QQQd8LKACJqv-Qfs
Message-ID: <CA+=Fv5Q7FHfnsd5+uCG8mR0dR_U_ca8sw+NrB=of81OiHqdxkg@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] alpha: marvel: refresh environmental readings
 through the console
To: Matt Turner <mattst88@gmail.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, Guenter Roeck <linux@roeck-us.net>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Matt,

On Tue, Nov 17, 2026 at 7:13=E2=80=AFPM Matt Turner <mattst88@gmail.com> wr=
ote:
>
> The SRM console keeps the readings of the temperature, fan, voltage and
> power supply sensors in the power and environment (P&E) nodes of the
> config tree (GCT), and refreshes those of one node when asked through
> config tree callback 0x28, function 0x1f. The Alpha Architecture
> Reference Manual reserves every callback code it does not list, so this
> is a Marvel console extension; its code and function number come from
> Tru64 UNIX. Define CCB_CFGTREE in asm/console.h, and add the callback
> and marvel_cfgtree_partial_update() for a sensor driver to use,
> retrying, as Tru64 UNIX does, while the console reports busy.
>
> On an ES47 the callback takes 13 to 300 ms per node with interrupts
> disabled. The console callbacks are not reentrant: a refresh on one CPU
> while another printed to the SRM console killed the second CPU, and the
> service processor reset the partition. So export the srmcons callback
> lock and hold it around the call. The lock is declared even when SRM
> support is not built; there alpha_using_srm is the constant 0, and the
> call is compiled out.
>
> Tru64 UNIX makes this and its other runtime config tree callbacks only on
> the master CPU, and the Marvel PAL TOY calls are already known to work
> only on the boot CPU, so make the call there as well.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/console.h    |  5 ++++
>  arch/alpha/include/asm/marvel_env.h | 12 ++++++++++
>  arch/alpha/kernel/core_marvel.c     | 48 +++++++++++++++++++++++++++++++=
++++++
>  arch/alpha/kernel/proto.h           |  1 +
>  arch/alpha/kernel/srmcons.c         |  3 ++-
>  arch/alpha/lib/callback_srm.S       |  1 +
>  6 files changed, 69 insertions(+), 1 deletion(-)
>
> diff --git a/arch/alpha/include/asm/console.h b/arch/alpha/include/asm/co=
nsole.h
> index 1cabdb6064bb..4f5cf589aff7 100644
> --- a/arch/alpha/include/asm/console.h
> +++ b/arch/alpha/include/asm/console.h
> @@ -4,6 +4,9 @@
>
>  #include <uapi/asm/console.h>
>
> +/* Not architected: a Marvel console extension, as used by Tru64 UNIX. *=
/
> +#define CCB_CFGTREE            0x28
> +
>  #ifndef __ASSEMBLER__
>  extern long callback_puts(long unit, const char *s, long length);
>  extern long callback_getc(long unit);
> @@ -15,6 +18,8 @@ extern long callback_read(long channel, long count, con=
st char *buf, long lbn);
>  extern long callback_getenv(long id, const char *buf, unsigned long buf_=
size);
>  extern long callback_setenv(long id, const char *buf, unsigned long buf_=
size);
>  extern long callback_save_env(void);
> +extern long callback_cfgtree(long func, unsigned long arg1, unsigned lon=
g arg2,
> +                            unsigned long arg3, unsigned long arg4);
>
>  extern int srm_fixup(unsigned long new_callback_addr,
>                      unsigned long new_hwrpb_addr);
> diff --git a/arch/alpha/include/asm/marvel_env.h b/arch/alpha/include/asm=
/marvel_env.h
> new file mode 100644
> index 000000000000..16ccd2002a11
> --- /dev/null
> +++ b/arch/alpha/include/asm/marvel_env.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __ALPHA_MARVEL_ENV_H
> +#define __ALPHA_MARVEL_ENV_H
> +
> +/*
> + * Ask the console to refresh the environmental readings of the GCT node=
 at
> + * @offset from the start of the GCT. Returns the console status, which =
is 1
> + * or -0x4a on success.
> + */
> +long marvel_cfgtree_partial_update(unsigned long offset);
> +
> +#endif /* __ALPHA_MARVEL_ENV_H */
> diff --git a/arch/alpha/kernel/core_marvel.c b/arch/alpha/kernel/core_mar=
vel.c
> index 92e3312e786e..bd918028b410 100644
> --- a/arch/alpha/kernel/core_marvel.c
> +++ b/arch/alpha/kernel/core_marvel.c
> @@ -20,10 +20,13 @@
>  #include <linux/string.h>
>  #include <linux/module.h>
>  #include <linux/memblock.h>
> +#include <linux/workqueue.h>
>
>  #include <asm/ptrace.h>
>  #include <asm/smp.h>
>  #include <asm/gct.h>
> +#include <asm/console.h>
> +#include <asm/marvel_env.h>
>  #include <asm/tlbflush.h>
>  #include <asm/vga.h>
>
> @@ -1094,3 +1097,48 @@ marvel_agp_info(void)
>
>         return agp;
>  }
> +
> +/*
> + * The console refreshes the environmental packets of a GCT node through
> + * config tree callback function 0x1f, returning -26 while it is busy. T=
he
> + * callback runs for up to 300 ms with interrupts disabled. Hold the con=
sole
> + * callback lock: a concurrent callback from another CPU, such as SRM co=
nsole
> + * output, kills that CPU. Make the call on the boot CPU, as Tru64 UNIX =
does
> + * for its config tree callbacks; the PAL TOY calls also work only there=
.
> + */
> +#define CFGTREE_PARTIAL_UPDATE 0x1f
> +#define CFGTREE_BUSY           (-26)
> +
> +static long marvel_cfgtree_partial_update_local(void *arg)
> +{
> +       unsigned long flags;
> +       long status;
> +
> +       spin_lock_irqsave(&srmcons_callback_lock, flags);
> +       status =3D callback_cfgtree(CFGTREE_PARTIAL_UPDATE, (unsigned lon=
g)arg,
> +                                 0, 0, 0);
> +       spin_unlock_irqrestore(&srmcons_callback_lock, flags);
> +
> +       return status;
> +}
> +
> +long marvel_cfgtree_partial_update(unsigned long offset)
> +{
> +       long status;
> +       int tries;
> +
> +       if (!alpha_using_srm)
> +               return -ENODEV;
> +
> +       for (tries =3D 0; tries < 100; tries++) {
> +               status =3D work_on_cpu(boot_cpuid,
> +                                    marvel_cfgtree_partial_update_local,
> +                                    (void *)offset);
> +               if (status !=3D CFGTREE_BUSY)
> +                       break;
> +               usleep_range(10000, 20000);
> +       }
> +
> +       return status;
> +}
> +EXPORT_SYMBOL_GPL(marvel_cfgtree_partial_update);
> diff --git a/arch/alpha/kernel/proto.h b/arch/alpha/kernel/proto.h
> index c418333d0b89..dc4ae0e0ed05 100644
> --- a/arch/alpha/kernel/proto.h
> +++ b/arch/alpha/kernel/proto.h
> @@ -111,6 +111,7 @@ extern void * __init move_initrd(unsigned long);
>  extern struct screen_info vgacon_screen_info;
>
>  /* srmcons.c */
> +extern spinlock_t srmcons_callback_lock;
>  #if defined(CONFIG_ALPHA_GENERIC) || defined(CONFIG_ALPHA_SRM)
>  extern void register_srm_console(void);
>  extern void unregister_srm_console(void);
> diff --git a/arch/alpha/kernel/srmcons.c b/arch/alpha/kernel/srmcons.c
> index d19e51ec711d..45a10d539f19 100644
> --- a/arch/alpha/kernel/srmcons.c
> +++ b/arch/alpha/kernel/srmcons.c
> @@ -24,7 +24,8 @@
>  #include "proto.h"
>
>
> -static DEFINE_SPINLOCK(srmcons_callback_lock);
> +/* The console callbacks are not reentrant. */
> +DEFINE_SPINLOCK(srmcons_callback_lock);
>  static int srm_is_registered_console =3D 0;
>
>  /*
> diff --git a/arch/alpha/lib/callback_srm.S b/arch/alpha/lib/callback_srm.=
S
> index 36b63f295170..6d3c9ce6b815 100644
> --- a/arch/alpha/lib/callback_srm.S
> +++ b/arch/alpha/lib/callback_srm.S
> @@ -94,6 +94,7 @@ CALLBACK(reset_env, CCB_RESET_ENV, 4)
>  CALLBACK(save_env, CCB_SAVE_ENV, 1)
>  CALLBACK(pswitch, CCB_PSWITCH, 3)
>  CALLBACK(bios_emul, CCB_BIOS_EMUL, 5)
> +CALLBACK(cfgtree, CCB_CFGTREE, 6)
>
>  EXPORT_SYMBOL(callback_getenv)
>  EXPORT_SYMBOL(callback_setenv)
>
> --
> 2.56.1
>

Nice, Marvel kernel without SRM builds again.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
