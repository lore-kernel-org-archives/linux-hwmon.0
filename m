Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794913753;
	b=QkwUafc8Pp85kCQRRc71tZ56n2hAjp8LdQkma61UEC2ZNqmla2EB8nZFJMXm3MOvAACr
	 uW+MdYGKn9lbabGoi/R9BhUyJg+Y9XOTAItOWM67I7D6Fx3SfrhYyUobiD519LpWECpCX
	 2B3Ij3umWoYOeEtkYsWFIXkvzRpci4y9uE6AYLvecWLbRBxcIRgGvL4GJYDnINsBJii+H
	 ncmNNj2MMukITUUg2E/Q37UXjzDygJ0pQVqLsyfmCJWCoyzc/ZLaaSVyBaca0XyY57Sct
	 c84/FXRgLPVLTmZ2ukAGXCRYaNPGgr7vMa2U8U+hRS35z0eosxA0wEXnPeFPhf2K7nA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913753;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=+5RFtFeHVJYTUWfudaVF9Kzy7VFX5fFixoIPN3O+g6o=;
	b=TSvgHyt6Sy8+HjfGamZUlD4yXGDS/8YUPlv5654A9oQDkqH2j4vd9UIV2lUEEUi+5sp0
	 Zt4QlO09ffcitZxH+XGkC0Ws1JKiIcq+yIrL9xQ7H6zCE/v8wLyrK6PxxMy3Cq9yfHRcI
	 cCTPr6y4eyvUAJnX+ZOVgQ1x/Ut4QdNsDOerVshZdibWK4Q16LC1ZPGoBirhDd8RSlS7Z
	 SqIMRYm//BACY+85nRYREvM0JAa7NyKAnnm9D6eK7InX3EWK6aPSWgQAzW1Z/KcoGLUiG
	 s+7DqDAZwr6iSAUz/aACcGJDToqFw0r6D2go4eEv4acojv20im2Jy2kerM9mQ6QrOOg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="o/On8or2";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01435606A33B
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 11:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01435606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o/On8or2
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4cb6834eaaso286769966b.2
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Nov 2026 03:09:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794913751; cv=none;
        d=google.com; s=arc-20260327;
        b=Skkx7GFMZthTjGB0+JynKxp1BqoBwvQ4KL5mu+oNfgU9Fw8oT+IIl1z8+TYjb/WlwF
         lpoE9vsf9bKBKLx7yrCCuMWW0LNDUNYBe5+j2NpKeGuYtvBGYY2nh1kwGwYq4YCH2Gl4
         TdjsbJ6XatHp6xrWoWnJ328HpWDCnn6Hj/c9NEZhPxEIE/OzCh90WeYeSXX4CjzkDnF9
         Fk3hE5r95y1mqXBdScaKxkYcFzxj9+lD4wQ9TB5P1rOmdWmZGhGyZ5GybP4hOy0wDE9e
         RdlZTMdBsXH8B0H9mGjYVxBB02BFQFTXr+tAqu45+AP2K6rmpbo+itUFlHjBR6tadSA+
         zHdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+5RFtFeHVJYTUWfudaVF9Kzy7VFX5fFixoIPN3O+g6o=;
        fh=3ABS2JcnsVqstWgdh8tTkFsHCoGLBYz8UxaFMpmnpdg=;
        b=pd/4td9TRpdRDgYOO+MgKx4P2HwMLn2XN2vr/qNu7YlxeTM3v9EMwDslE1VbzCfpKh
         eBnCzrTlfDlzZqHYtX+nIZkIQD2udi/pUpkY6ufSYZ1HcuGO+k0iZJ/9iIXmXEThwoTI
         XIQCr/ODxKc8ziwKGx75qATg4tX1qYdRnV8xBTMJhQpbFcagYFlmVCeVufCJhwyZG7+q
         KC6Ti0DA6H5aBVAxseOyeDjG66/GXstSLoR0Gu3mtA5MT+J2VytfWDN9QD04VQxxmiI4
         N1r7p5NTpaMlm6J/yWWmkmLhznk0vU4Guk7OnEcXvw4V/J96KzUrkw9iGdBr4Oxo9ddL
         uV7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913751; x=1795518551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+5RFtFeHVJYTUWfudaVF9Kzy7VFX5fFixoIPN3O+g6o=;
        b=o/On8or2Oy8aXwijm1DRzoNacf/V3nZElWzRSDwSRPXorudIiUm7z5ReWWOfwU7t+N
         FxE/Zvi47jjzme9Lysc90014NGArwMqIcUWi1NYFUM8PGTsn0bgMLOPQrBG43NR0rn+r
         OAL9Xdd5h+X7DKdyMUjyhkIzkyeE3GBWqk42Xc0VSLCaZ+S0UPci6he5xnxPl94FgAaj
         wttOV9UE9SqgW7Uw8I13SZYbzfRGSfffzi2z866IVOZrsXAq8YgbJFOApgpnjlrIQK/N
         CKvAAkRpHLdc6K9YBdByBff7iopDEzkKBYCjKdwo84c44cflbcMF8ZrDZFb2PtRkXdPF
         YiFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913751; x=1795518551;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+5RFtFeHVJYTUWfudaVF9Kzy7VFX5fFixoIPN3O+g6o=;
        b=sDjf2za03T8b3BisDY/hrXGw1y+n40CaGlqQzouh0glbRvgoBPAdXo4Or/d8wV1Fh7
         xXOt1tU/uFdz8Uyy3F+Ej7cqr6f0fx5l5af1jPrW0KSRCOfE6jgh8GmdTY0nwMtGuNxe
         rmellPJRD7BUqRznUYI3zJ2oieRuezE1j50E9MeB3nuiY7ShZFqpUNm2tdpYWZILE2mt
         0Pq++z9ygUkcH3xt88s+3merPCC93366awzMePGwLaDSAmSpZhnL8rUo9m1cWoGHGZE0
         7l+ittWFfnp2rOVR+pzzD8bj/GyAxFXuYXfKNq6vSt/y3NttWuIz4B93H7UR0Dqob0Ce
         qoAA==
X-Forwarded-Encrypted: i=1; AL+hErFvEk3wPoI09ib6OM4q8wL2LNitKdyIEsVoACoJOmQNmKFuUOg5KMrNGsVl0OBAKlTc7CDzFbngtyAQzA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8s9IZXDrfpisrjCFnri4+EQALBBOzdXVV/mZNZgtgQXVan5TtL
	YMmx5uU6kK2xA/tiBkS4E6Tls1+hULTW1iEZbh6xxl9HJvTHOaZMDtOqXK8TPy2PeOuXJKzN5Yi
	NKuchhjTJfJbKMa9MqN91oWMpk1v2mbY=
X-Gm-Gg: AYBFou1CZhYJ6B/t9/AMp3rMz+2aD+dMo2kDGxHT5/XeZtY/5qwt4oQM06bGOrWV7pB
	2kWvRAJta/ciSBgfmTcYIL853QtTJTMgqwdXHRXEIX0LuJfUpiuX1sL4NU4oBBDt9+FFrUgs+Gb
	DOLBar6X3GHZ2gbxXPXFRKAD4DUipyR8AXf0z06mAi7a4Gj3paIiOc7teDuKJuU05Tpnu7ouJgR
	AHFs899qskAYQFFJuGvkMLgJRYiB3rt/VnbXQOv9R/ufdbHbULyRN0Eq+/yPgsQiF7iiHEzyxJh
	iJXVSafRGt2CNkdapkEFavjUMcvlLCjVuSgbf05aHlj/mwRbzzYkew/lTq6D9o0BjhYpFPyo+Zb
	6PJZQAnI+B5aUwNaSMRwhzWSp2PqccTFPbgTXMRMC3OcYEHAHCnsfQossWs/gS6Kyy7V5cTPL45
	9JnSal6RSB41D7LqmORG9Y4D0=
X-Received: by 2002:a17:907:94c2:b0:c41:26b8:c49d with SMTP id
 a640c23a62f3a-c50963cccbdmr1046355966b.38.1794913751100; Tue, 17 Nov 2026
 03:09:11 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com> <20261116-marvel-env-v2-1-ef614eb2e7f1@gmail.com>
In-Reply-To: <20261116-marvel-env-v2-1-ef614eb2e7f1@gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 17 Nov 2026 12:08:59 +0100
X-Gm-Features: AclHuK9H_8vU3hJPZ8dHPtT7XE9N0U_m1mhQuXonsqEgANhu7g6ac_7o1E3AWCc
Message-ID: <CA+=Fv5Ttsa=cbSPJSxx86krBNwcm=DRNNASfV+tvZY-sYySU6Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] alpha: marvel: fix the environmental subpacket layout
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
>  arch/alpha/kernel/err_marvel.c   | 28 +++++++++++++++++-----------
>  2 files changed, 29 insertions(+), 15 deletions(-)
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
> index c0c0ccefc467..85f7a56816ce 100644
> --- a/arch/alpha/kernel/err_marvel.c
> +++ b/arch/alpha/kernel/err_marvel.c
> @@ -21,6 +21,19 @@
>  #include "err_impl.h"
>  #include "proto.h"
>
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
> +

After the reorder this sits outside the CONFIG_VERBOSE_MCHECK block but
is only used inside it until 2/7, so this patch alone warns with
VERBOSE_MCHECK=3Dn (and fails with CONFIG_WERROR):

  arch/alpha/kernel/err_marvel.c:25:1: warning: 'marvel_env_state'
defined but not used [-Wunused-function]

Wrapping it in #ifdef CONFIG_VERBOSE_MCHECK here and dropping that in
2/7 with the other one fixes it.

Growing the struct to 16 bytes is safe, since
ev7_collect_logout_frame_subpackets() steps by each subpacket's own
length (err_ev7.c).

>  static void
>  marvel_print_680_frame(struct ev7_lf_subpackets *lf_subpackets)
>  {
> @@ -50,17 +63,10 @@ marvel_print_680_frame(struct ev7_lf_subpackets *lf_s=
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


Magnus
