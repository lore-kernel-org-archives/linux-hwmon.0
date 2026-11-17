Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794946275;
	b=luvRuryigMUkYO8AGkEW4krHxYRuSHQvzGYZnZSZWY0XeLQZog52GKf7mEK5tcilxbGC
	 b+O/tqb91AO2YC310d9GsF1K4mDIWFDItwhX0Hku0H7Ou1/xw0MhQFBRaZIxv4PpkBw8r
	 vBqbKWDOQ8AnhQcYGbuz4Ui/4xrJH8qa48OGZF1Rc3dV+SOPXRkxb3UR9zkQTnVpysYxL
	 LZlomU1DNbj5WLuyY9CwfzxltCbCFkpJvGB63jf3iIAALI1xgagYKw+UvKIi2lmgdblGp
	 +YcynGBibUAvCfi22Q6XxNfozQWdbZ/HoV1tT8LbMI8hk9cnSaAxBGiY6E4VvzGw7ig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794946275;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TLCtbRBV1PGHwelDPw3GRpng9bhYRh7QH8AhnaQQo6Q=;
	b=ZaVei80TOQCgyeIoJKg80GUuKi4umAeQxiuMakEy6r76kwI7074KL5X48mz8quQz8Adh
	 WWmZlnQXlmsVZHO3+tw2poJN1yX1o0HZCmRajzr5XJoxzeCdIYH3mtb5fHt+EYDvqTHTr
	 HOj2HQqU4AZ9128ogC2bobzPLEdhOBXSVL4DLP8nyBURc9PP5JPvYq54MxQZ+IlzvJLWK
	 +Ka/JSg/KAx9iHCj5QIja5GOL9sdd9vvmQ/uxi+KrJfgyybpcK+Gi+lr9NoqLhDne8dpH
	 HWY9rDwfo6o6rqIdbIcq6pVuJYnieEt7mfrU8ssp5ttF91K8F78f3+isgL+nBrXSDJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qUYi/5Le";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.50
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BD4606A330
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 20:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11BD4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qUYi/5Le
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6b47c1a3c74so352613a12.3
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 12:11:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794946273; cv=none;
        d=google.com; s=arc-20260327;
        b=O2hoBEY7Rx8NRV9Gvq3rPZn4K4yMZ2fdBsvdP59pMFQ0yAfQILMxem8OYqU2LeFX/7
         H1DihDcjC4Nv7eAamJgwG5mR1t5als+TtLMNcqmGj2ezQw+/nSuIqUKjwvzcPtspyB4F
         +POJkse6O1QatgWtgIAJxtK09J4ck20yiP3nT6r7sbR51xGXoCRDRMtbMz3ne2Zya1kC
         bR3D+lSKIDqxiINZ052u3ZOsvlJaPYodFNCyVbZVNGk8GpO6pYiiLEbudyUYK3Q9HPjg
         AFsq5kwhOUSePSzzEERFwTTl0FuDRqBZ/ld7835a1Rwvc4AAbspSpBPTBA8y6KZKpmVs
         6+Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TLCtbRBV1PGHwelDPw3GRpng9bhYRh7QH8AhnaQQo6Q=;
        fh=vAKE0n/jFcZfDzUNLwV4wgH1WG0SjOj77zEF9XY5j7U=;
        b=qeCQamNwYw+Cv94yxJgJcrwtYzI5AeYwpViwZMNmhK3VTyr6mISnX4uL85OvAtxgI2
         e05HEUsZxPb0wMJapBIbvF4UP/aStcfr1ssQauOQGH9BaeSa0rghpGxqWLtcgWoTgp2o
         D4CBUW2Gy0TyhiiuuMMhU4RDARLlnDTh6kxikF9ZOBNuYkC7YJRLioNQVV0bl9fiohy0
         2c4Dmn/nJuA/r/28FcOiH9B/8Fr896/svK8BCtXi+B5bpPUnFrg3Q01VHgq4lNEP4u4M
         sojTqOGy2hovJL1JOxQZyuhcEpOdU0/O69jxsXOGZPu2i6NKgJLDv6nWUSO0tQfcyXtM
         5Ljg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794946273; x=1795551073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TLCtbRBV1PGHwelDPw3GRpng9bhYRh7QH8AhnaQQo6Q=;
        b=qUYi/5LegcyQhwlyDIHJSec0Wq3K+2MDjMtllRf2GD5+J5Uig/9eXAdGiQqKo8/rkQ
         UZY0yqFZJmXO5C+fY26YLqJTbicpoAFPaJne0z8tdr73jeA/O2peN0eoZQcjhpUXqVvW
         tAguCwDvHD48dKuWDUvRTubsfVcr5EjJrOWnWZ/j5/NTQVb87KZo5z9P8J1rVPZL7Y1c
         HhM6ygFFx0bpOQOkzjfHIHOd/Wp8IxoLnVzNadw9xrLc0YiACFGTCSdIxM2ydYHCOQ0A
         4Ikl7srSRBUzfzX30kFmwKpbgGeBSk4v5zhjeQwEF8VcqpIO+zaYvtltHJ2V41XuVmtM
         Xj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794946273; x=1795551073;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TLCtbRBV1PGHwelDPw3GRpng9bhYRh7QH8AhnaQQo6Q=;
        b=r1zeVVyPX0aalqZ8NkfGLcIjO0+PccjGP5/s3/I/wKc87J218RU8yP6wDsN3ckudRm
         QuoqhvJsS9GjA/TzFOunBXp4uoRsBr7nJ5h2E8f/Mc8LiWlfPPsdxHrcrhZoQ1hpa0Jj
         Hf5+gnQDzoarH5kg3MGNRzIcPkKs3RKO2xlxPyyAubIY9Ao/BBdqWGwrhmwPJesaT7Jv
         P2RxYoblMQ1A/hdXcT6ZaZ3dWgiVDTpLl9XHDLzELVuz2te3XnACMOYNs7Opi3jbecXv
         cvmHblpmYqaqG0cAKK7NmJ1WH4q5KQLamCuhQMUIx9W7FIKot2VagFmuxoYg3/Jpm90E
         v0MA==
X-Forwarded-Encrypted: i=1; AL+hErGPv8qAPzqbz0sRMxPMf5GRm4Lt5yZ/cfngEbWSkGbULo1a/2ml2RA3mbuQaXREm6a4AZEYeu9bkXPjTw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/t6wkxkgItbvd8GyM2iEVUX5pBddEjzXIIWsk/Wr8Yz7xkGo3a
	41DHCKjKAZDqDf3u+2BDF2BcYtw67Qg3RO6heCYgaSkNBwgOh60Zr76gge/g0da07VPxPh514q3
	hnooq3+tGEhVWim6ero4qBcaXBxiiaOw=
X-Gm-Gg: AYBFou0tdNM+Vwcd/1ZGi1dW7BHTx+8WpLfLakJk2E9Dvb3WOU54EV0BH0ovVqhTmWm
	1BcRPWAYUdMxu2fqztIuji9TF6DVF1+zQGuMD5bEmScxdcDnSCKwcYTSCqxqH1KN72KC+vhyRG4
	vOcCc0STDB4zoHN5N/8Ol/BwkSa2xq75f/40WBsnFjXss27ACjpCGhKE/GCalsJxckBsxze7gz6
	VLXpeeVVD2L4b5Nnj2BwEUJ4iu74cwPO0qejTvi9rBwHxf1fdzdzftm/txEqEslD2nRy90u3ubR
	bwSS5oy1SJ5p1FoBnqlu17jPjWFutSRxS65VUrmYUkcvFnLb4WQVmkxzr9bOP4hYhgUOkU4OG0H
	kJYV4+MDO2ImGewQbJ/NllPIihWem9UkbXM9fWDKHJpg5VZt2xR6cAlJE0uL1L+sIsJnrN3HCCi
	/pPULHJol2MqYhVuO4A/IcyFbR
X-Received: by 2002:a05:6402:1598:b0:6b7:164a:7228 with SMTP id
 4fb4d7f45d1cf-6b888111f83mr296086a12.41.1794946273014; Tue, 17 Nov 2026
 12:11:13 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-marvel-env-v3-0-0edc370fdca9@gmail.com> <20261117-marvel-env-v3-1-0edc370fdca9@gmail.com>
In-Reply-To: <20261117-marvel-env-v3-1-0edc370fdca9@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 21:11:01 +0100
X-Gm-Features: AclHuK_Xa5-PlkYMr0Ybe8c0xscp1fzE_6udpNRIkvpkKayBgek5aLFyZAumq5Y
Message-ID: <CA+=Fv5SFdf9Gr0zTGXJSW0GVB0eFoyp4a6PCWQ4PY2q3LGZTcw@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] alpha: marvel: fix the environmental subpacket layout
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
> struct ev7_pal_environmental_subpacket does not match what the MBM and
> CMM firmware (V2.7) put in system event frames, which is:
>
>   +0   cabinet
>   +2   drawer
>   +8   PE (the power and environment node holding the sensor)
>   +10  sensor index
>   +14  state: 0 ok, 1 warning, 2 fault, 0xfffe unknown, 0xffff removed
>
> So the byte printed as "Condition" was half of the sensor index, and the
> state was never printed. Use the firmware's layout and print the state
> along with the sensor's key. This matches the frames in the error log of
> an ES47.
>
> Signed-off-by: Matt Turner <mattst88@gmail.com>
> ---
>  arch/alpha/include/asm/err_ev7.h | 16 ++++++++++++----
>  arch/alpha/kernel/err_marvel.c   | 30 +++++++++++++++++++-----------
>  2 files changed, 31 insertions(+), 15 deletions(-)
>
> diff --git a/arch/alpha/include/asm/err_ev7.h b/arch/alpha/include/asm/er=
r_ev7.h
> index ab17e6333764..5d30af0221fb 100644
> --- a/arch/alpha/include/asm/err_ev7.h
> +++ b/arch/alpha/include/asm/err_ev7.h
> @@ -147,17 +147,25 @@ struct ev7_pal_io_subpacket {
>   *        class PAL (14), type POWER_SUPPLY (14)
>   *        class PAL (14), type LAN (15)
>   *        class PAL (14), type HOT_PLUG (16)
> + *
> + * Cabinet, drawer, PE and sensor are the keys of the sensor's GCT packe=
t.
>   */
>  struct ev7_pal_environmental_subpacket {
>         u16 cabinet;
>         u16 drawer;
>         u16 reserved1[2];
> -       u8 module_type;
> -       u8 unit_id;             /* unit reporting condition */
> -       u8 reserved2;
> -       u8 condition;           /* condition reported       */
> +       u16 pe;
> +       u16 sensor;
> +       u16 reserved2;
> +       u16 state;              /* EV7_ENV_STATE_* */
>  };
>
> +#define EV7_ENV_STATE_OK       0
> +#define EV7_ENV_STATE_WARNING  1
> +#define EV7_ENV_STATE_FAULT    2
> +#define EV7_ENV_STATE_UNKNOWN  0xfffe
> +#define EV7_ENV_STATE_REMOVED  0xffff
> +
>  /*
>   * Convert environmental type to index
>   */
> diff --git a/arch/alpha/kernel/err_marvel.c b/arch/alpha/kernel/err_marve=
l.c
> index c0c0ccefc467..9304ae74877d 100644
> --- a/arch/alpha/kernel/err_marvel.c
> +++ b/arch/alpha/kernel/err_marvel.c
> @@ -21,6 +21,21 @@
>  #include "err_impl.h"
>  #include "proto.h"
>
> +#ifdef CONFIG_VERBOSE_MCHECK
> +static const char *
> +marvel_env_state(u16 state)
> +{
> +       switch (state) {
> +       case EV7_ENV_STATE_OK:          return "ok";
> +       case EV7_ENV_STATE_WARNING:     return "warning";
> +       case EV7_ENV_STATE_FAULT:       return "fault";
> +       case EV7_ENV_STATE_UNKNOWN:     return "unknown";
> +       case EV7_ENV_STATE_REMOVED:     return "removed";
> +       default:                        return "unrecognized";
> +       }
> +}
> +#endif /* CONFIG_VERBOSE_MCHECK */
> +
>  static void
>  marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
>  {
> @@ -50,17 +65,10 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_s=
ubpackets)
>                 if (!env)
>                         continue;
>
> -               printk("%s**%s event (cabinet %d, drawer %d)\n",
> -                      err_print_prefix,
> -                      ev_packets[i].name,
> -                      env->cabinet,
> -                      env->drawer);
> -               printk("%s   Module Type: 0x%x - Unit ID 0x%x - "
> -                      "Condition 0x%x\n",
> -                      err_print_prefix,
> -                      env->module_type,
> -                      env->unit_id,
> -                      env->condition);
> +               printk("%s**%s %s (cabinet %u, drawer %u, PE %u, sensor %=
u, state %#x)\n",
> +                      err_print_prefix, ev_packets[i].name,
> +                      marvel_env_state(env->state), env->cabinet,
> +                      env->drawer, env->pe, env->sensor, env->state);
>         }
>  #endif /* CONFIG_VERBOSE_MCHECK */
>  }
>
> --
> 2.56.1
>

Thanks, this builds on its own now with VERBOSE_MCHECK=3Dn.

Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
