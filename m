Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DB238E131
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Feb 2026 07:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772091431; cv=pass; b=CDAjy2/6aeBJeOK7LuRcsZQZJgzTHfqmDq7c+LJzv7lglDkYt0qOP4FlRi+V0UJX0eCya/io6P63PhHdM5IQjnoS9479Z9WGg/Qsui28SgTNsTBuJTv4IWOL15joJR5Z0eDl9wG/XhRGoJ00GsMssnA/TyOk+bbU+ayvN01lcwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772091431; c=relaxed/simple;
	bh=zMMoC9tW+ovG5gEv/EikKuLCdiFcENkonHNXGvJwtY4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DIIXOWOCFr0k2u2mwcAcmLrXCEBisAEVb7njGOOq6zBxONFU+dy7vgviYNY1oygiWtuvka+1noPZQ0/Sn3bbg4FJ2RNzAaElyWP52tqfVLRHM+dxELU1qItZ29mnZEWsNsHkv5pW2Vh3868WrbWUvEhG48xvhEWWMlDZOKP8BKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=XaVSBYMS; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="XaVSBYMS"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b935ff845c8so22685066b.2
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Feb 2026 23:37:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772091428; cv=none;
        d=google.com; s=arc-20240605;
        b=gfUi1WMLuPUo+j4O5yIRV4JDfRyUlSK4p34NfjoK/+26pDinL8+YsDjxy2ZlkjApYg
         8kPq6TlNaUObc/j4h4pvYnCIhVrfo+LEa0GynRIfwcDTK9N71heC7PHP7k930GLIbRAQ
         iACDxQ0PVZC0pOXyGgKGRAitmYq7/RmJvC7E6OYXhoQ47KCLX1JzAPCKBpqZUnvoR8i5
         NMJ9ON0fCyPBzTTEBcffwJT1r75mIOB1Y2MaZA0ZdKnSEn5Ay3jIupXEO7PdGsOgQf+S
         JLZzThLMLb1f1sIv/uesTf7Q3mywEPXTtcxbqFdNMsjnVD+8s43JlGYomg7VyYIjuX1s
         I8WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sy5pSpIT1+34GDUf2p6GIfTrx9hUeuZulWhjNSVORZ0=;
        fh=AHuFujf2uvjEfgILr1VEglSFVs43ti6YTT0P2JdqiKQ=;
        b=VJ9F1+7P+olPfjE5/Qil+w9dWjpWPtxNmStDSobWWysPqoE0Lw/7pAdxCC5pdNEQ5K
         c2E9N8OpkdkGeo85XydqoxTW6aGNxt7tgY9vST4y6cXYT4nXPVG3s43DIEdo4pux8HhY
         YxaFzql60XEwgPaIUjSYk8Ri3T/mon35eorg47NMJ+U/458p++ENFdiDBI1ZujPpSvu/
         8KL1AhE/ndWqygJsJc/zcxi1q935bYgOiv/1nHYoUV2GVeDYjg7SYwHTQ/dEEgqN26Wr
         hUO7si49jFlyMYjLMJoJTqIvc4gq4bQhcV5/cUSAKmIF14Zskkg/oQN+7/Kn7vPxJzAy
         Wi2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1772091428; x=1772696228; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sy5pSpIT1+34GDUf2p6GIfTrx9hUeuZulWhjNSVORZ0=;
        b=XaVSBYMSAUm9nzMMq86NELNAi6N9riA8DiEAaFERPF3uqnbS7/3NFU7cDP40m2MKT2
         zLtusYZ3u0VWmwn9UueNQeRfuzN0PYurOM5hm/dPOMImUp4zNhCz0Fh8O/30Fd6iNRt2
         qlZ6qD4QUDS+KDp2F2hxPK+0kX7mZfw9S82pS76Z+/kBoh1IqIxDwrKn5vT5aBH727U4
         3l1qHH4Hw7g8mmY22EIZZXPFGC+Fo+ipLk//1s2t5Rft+xOuezKcMwBeHmz9Py74d2AL
         EmiZdjM9EiubBYnGbavfBP8mjfiWUg4IsIYUSLrfED5v18B9d8UvZT8h5t8AWtBEPB+v
         knIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772091428; x=1772696228;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sy5pSpIT1+34GDUf2p6GIfTrx9hUeuZulWhjNSVORZ0=;
        b=ttGJYsek7gdsvfeqoVF5Zf1zY0qAHqeIc7zFU7fisttzP3vZvi3quBlVFvHaeo2LTW
         3/Ni3FxmD0Q5l4R+Val7l3sIEqDRm6vOz1tWv4uF0IJP0eY54zfPfG1lbsS+zJ1YsN2x
         B5rkN6PjL8QuBi3CK2p+d79cFXfiXl1oehrr00MEuge7EfpznNrsxcsPOPd5pR+Jcvmk
         Njq1YxkWXJeXnRQ0SCuCMJix86etEFMFdRFTZ4LeuIrGFC4wqxz2BC1JS7aC5cuhB5oN
         TvsQt3X0HPKv+fHlye3wjyXWO3VRe8cRpiAUEwlWnkmbwfkWtXcMCxG8nIA/Q+YVkxRR
         Mf7g==
X-Forwarded-Encrypted: i=1; AJvYcCUSmw1U9/nQPqJY1Tyof3KSjRQDt9o5sMrU0kT3MQMqdEHB/guB/iqWet9IS2EYsFo6Y6ILa+mMnMT69A==@vger.kernel.org
X-Gm-Message-State: AOJu0YweQdNGQjxwk/mFbUy8eiXze3vI/yThwCyxFuorIRy2Y1Vv1MlA
	zZiPZZup4DPTTypHYfj6HI5QcKUXmzorcwthPk5hAyIxP5dx77lBOpV7nWVHRcpi404Ee5WvLIp
	CfPl0HOnmvwPnut1TofA2siEow6+psruKWfpmNadulA==
X-Gm-Gg: ATEYQzyg/zty2FZ0V+H2+UuA6Wfm13sDCcERFiZzeItFUYZ03Y7koWUttpfynHLq3+Y
	+kmHnTOvjxudFHDeXhVwAqSRNCzQg1adVYDpbEh6mriNIsrrgBSB1iSzs7TDofqkLOPwYkY81Rp
	qCsQCZyUKjow4+1TppezeMK8+FRQIIDisPDOeE5iwvapQOjHxoUMLegj5wB2s43SJFX2IOloLDD
	tlUGIsEmI9Sf9g3Rsuy/+OjapxanmKOcPdcxqHuvZb95JvslsgBqNKJT/dovTFR0Z6u4lfER6w3
	UOTQyg==
X-Received: by 2002:a17:907:1b10:b0:b90:bc06:2abf with SMTP id
 a640c23a62f3a-b9351492d3bmr217956066b.4.1772091428009; Wed, 25 Feb 2026
 23:37:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225-ina4230-v1-2-92b1de981d46@flipper.net> <202602260418.XKPUlQmZ-lkp@intel.com>
In-Reply-To: <202602260418.XKPUlQmZ-lkp@intel.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 26 Feb 2026 11:36:58 +0400
X-Gm-Features: AaiRm523uaAkpoMIzz0BIKHXKFT4QsucGv2thoPccSpDCoItrF8k9Gyi_Md5Wd0
Message-ID: <CAKTNdwEoHEKeRGvz=XoMT1RON3ud4rMrUW2oY0M5Uhx2z_gyCQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] hwmon: Add support for TI INA4230 power monitor
To: kernel test robot <lkp@intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 26, 2026 at 12:33=E2=80=AFAM kernel test robot <lkp@intel.com> =
wrote:
>
> Hi Alexey,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 3ef088b0c5772a6f75634e54aa34f5fc0a2c041c]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Alexey-Charkov/dt-=
bindings-hwmon-Add-DT-schema-for-TI-INA4230/20260225-173657
> base:   3ef088b0c5772a6f75634e54aa34f5fc0a2c041c
> patch link:    https://lore.kernel.org/r/20260225-ina4230-v1-2-92b1de981d=
46%40flipper.net
> patch subject: [PATCH 2/2] hwmon: Add support for TI INA4230 power monito=
r
> config: arm-allyesconfig (https://download.01.org/0day-ci/archive/2026022=
6/202602260418.XKPUlQmZ-lkp@intel.com/config)
> compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20260226/202602260418.XKPUlQmZ-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202602260418.XKPUlQmZ-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    arm-linux-gnueabi-ld: drivers/hwmon/ina4230.o: in function `ina4230_se=
t_calibration':
> >> ina4230.c:(.text.ina4230_set_calibration+0x584): undefined reference t=
o `__aeabi_uldivmod'

Alright, I'm spoiled by AArch64. Thanks bot, I'll rework this part in
v2 to avoid the 64-bit division.

Best regards,
Alexey
