Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792565174;
	b=pdgO7cPLAtH9DW4aYWCBkpR4sl5g5HpnxNFKqe2wzm2lqf90DNB8qbP8mKcy17iMbWVy
	 01NK5kqdpGtqPFR1uD7tgw2YzGaIr8OoDYeT4aICZZj4Q091saxjW1HqkBXkLOx91r/g7
	 uPxKxb+f4Bcld7OBEzOG9BpuGHqyP0UFVtSfCb/OLlDMvBIiIuOTx34lJBANndU818Eg2
	 MbN3I946muw8o+3r1B2MM7rkMFRmtERVyv7RGSLXEd9A/O0XYEg9L8hJUIW6EMljC2ipB
	 yEcV6PrKCvsiOTvQvktCK7PJS1YWwMbfP7rtob8I806z8Mq6Gxr/BKf+FmMrMfosgGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792565174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ijjheEMdAZYOTtTGE4e3W26/a2l3yNs/YuDbeMhOKVg=;
	b=XfDRrgDxSXWURRfQwHe/imRPSuj18kXw9oR6QQMjQlIIzXhCULH+ZNXhxAFiQZM/mnD+
	 RSB7oTrg35KA/msW47mKcwcYFPbhlrRqEhgH68jWox9me4E2ExWWqdd8siB+Ojgj9+Uj6
	 hXRNf9JHlycfoRx1GG9lGsDDn4B+iqEOqClYD5P8VYQ1uuiDUlF1dohu+Ng+/EA4c5zHa
	 nqcoUzWHHRhji3xOoeLYeIdPKu8UkGo3lj+jyq42f54inQJjfkgQkwyu/yuOVSrkA/DGO
	 aX6uN21rqHQ/LPNhVdwM4wtwvhTJYj8P9nZE9dTGFQfzzMaSHELOEzvgx/UJbk51rOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B53606A31B
	for <linux-hwmon@vger.kernel.org>; Wed, 21 Oct 2026 06:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8B53606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-917aca1aee5so4754036d6.2
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 23:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792565173; cv=none;
        d=google.com; s=arc-20260327;
        b=FTeXFB8QFyUjX+rpsw1fEgAH9LBxOAhVi9ULPxIbDiQskqCQAldeJ5r6v756wIkdoU
         7Y4u5zvVRXE1xC4GHK8hXGdy0upU/EPRVXEoq7XRN3I7HFvXtFajDxvJoDFTBhnNkd0w
         3hqu67/ePW8FZV9fWQYL9jcuY6JapcxVigMrY7WEPcmQKG5/1ZuZBey9uEZqIEa1GPZT
         SLP7fkx1JIQ5KDT8I9ISNYmV/Jkqa5R23DrtCFlNeMECCeao1gSEVNls2ze6w8j27PpJ
         hmy0XxTDtl96Wyf3tLdiH9qSoYoUrkDpWGdzD3rv1ynlCk8Bs+7BWp5TNdq+wcvd0RCK
         T5oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ijjheEMdAZYOTtTGE4e3W26/a2l3yNs/YuDbeMhOKVg=;
        fh=M24CiqUisfud0I5JkuWBouJ49ohAjC+TvxZcqgAsM/Y=;
        b=OJnibVh59roXWwV5TrthxdotfLNPYeaTVmFAxvB2nGYivKI5P3udmDs6Vkm5P5xf57
         2hh9uC/EIp8f3O2bEz9gHvP6VEof5GQELlnS2ksATxkfg6TadN497kQDOTWgX6I2S/NP
         QDZ69UokhprwHa7YCJk9zcg5KaN1hKZrzHZ+9ts1fQsi+GhsGyCcxm1w0DkBIk3hflwo
         yJH/E/qiFLXijkT33EtQY/KNyT8siQSEqV7IoMaPMORLPrufvoleKSgWACfN0D27+BEl
         BU6FEk0JYa8eVTsDLZp26p4+ZsupWF0EHITYJVIBIE3jyJseAUkQchuUG1Wr86U3gjKx
         qC4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792565173; x=1793169973; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ijjheEMdAZYOTtTGE4e3W26/a2l3yNs/YuDbeMhOKVg=;
        b=N3K8Bbb9tNmHLFt6ZXFDabkPNwYz0MlgUzh0K/zfhr2yAjtdkvQ+atM46OurewOaR1
         5GpHZ1w3HZLexrrVA23itcwJ6z/A3tv78GFsLEvhUonkAC/73dFWQMqQxs4AzcszUoAg
         QywB+6q06BHod6vzHnLg7lTEveFPsMcBeMrLr3fmzfBfZu7SyUZlS+rtU0CFP/tt5s8g
         rXTl04SHDbrB/z7e3KtddFWqAgqZuw1vN7ipKBmLQJ+HhmthCk+mdogVDq20OH2zdFz9
         er4Y6laPpOvP7dFZUifXCwXVCDWoAe8f6eCGE6CSv2DC0EwRrBbnT+ttWzNfLh3PEE/8
         ufzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792565173; x=1793169973;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ijjheEMdAZYOTtTGE4e3W26/a2l3yNs/YuDbeMhOKVg=;
        b=L1ERSa5sjv4DJsODpKPdhDOQNRLotz6hK3vy7tr9yTFzj0EaCOdUdVWCKk5LVvcToU
         5HWn0U8K6JyUVatgyKu8JUbgVQqMQSE9UBFtuUAVKbnbipOKPKr4+ci5C5UmfFOKDav9
         OxnNHEi5GfOVqzj5QRPh2tzRxjRcK7T5vg1CyjNcJmcIbJUpj80H37tS9I1miH5YQ5Yf
         rEOlzbvoB4PQsRzSlA4RKrUe9ZxylgViR/Uh1XMbMWUWU08UGgYPgTSZCT5TCztINntO
         fsWnjomnLIDwzOA7E+9tBT28axKgpnaaolQGBApYzxhcDpKH9oHVBMUMvzooLONRnCNk
         EexQ==
X-Forwarded-Encrypted: i=1; AKwUvBw171trn23Nu/OGyEHuGky5ugYIszUNOrf4WYbApjI9y/oHELOCmyErKmi5dRxTqa9Pq5MCq+krJ+8F+Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYJTVdYulJ2S2R+xsn68AG0SCUAyhBaxJr0NFZ2cNziON4Bt/9O6
	pfY7nyymnFd99Ghf8kkmPUXT9fTHAC58vRUnQXExmBGc9Ajyq+J2FydN6Bv5m5RaxfEgIID0mz8
	KH7kMIGpxOi43vp3L/iQDVpZWOvKYUTs=
X-Gm-Gg: AYBFou13AGjWQA8R1hq4K85gBHFmLmwub08F7/kSB+sh4B3GYXvAOB0q+8tFKS++XxM
	xeGxIe7zgWNzGfIlV0c3w7GrBsvaouYlw000J7eQP3/hbqxCXkxWmb+/2U37woTWIjeN5bg8QHV
	PhMO5KqgUZ3ShS6To1IK1Zm8QGWduS4JjfhpbPWD/S4TP/rittviASYKPsiPUANIv/48vLqnx7H
	NdL1Nv4canpNKlb/zt7hIFNS8ICg/mL7PaLsLer/luhtuVLg5yeMK8/dGIyU8Sgwdghwz9B+pVd
	DD7/UZkp4Jk8w7hpofC6eTiD5YAIHU6lUcTQXI/p947eOpfCdbn8SbDqX3FZJf2WgELCYGmd4+6
	Tn03zaFPczCFodqqk4po2/GAxUePWUXEQIHQytpNri8xPcNtihKjBLL6KkB8=
X-Received: by 2002:a05:6214:487:b0:91b:cafe:58e2 with SMTP id
 6a1803df08f44-91c12eb7b30mr18765456d6.14.1792565172936; Tue, 20 Oct 2026
 23:46:12 -0700 (PDT)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013063259.2734757-1-a0282524688@gmail.com>
 <20261013063259.2734757-6-a0282524688@gmail.com> <sashiko-outbox-169117@kernel.org>
In-Reply-To: <sashiko-outbox-169117@kernel.org>
From: Ming Yu <a0282524688@gmail.com>
Date: Wed, 21 Oct 2026 14:46:01 +0800
X-Gm-Features: AclHuK_sk3N3reGEV1vFqkhXmWhSRT0CO9e7SvF9FhuKig6lX9RUqvijqALmuJY
Message-ID: <CAOoeyxWNsBt6nDn82bCv0DUpar3c_K19su87UEbjm4CfCJbbHA@mail.gmail.com>
Subject: Re: [PATCH v9 05/12] mfd: nct6694: Move module type macros to shared header
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, mfd@lists.linux.dev, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Oliver Hartkopp <socketcan@hartkopp.net>, 
	Vincent Mailhol <mailhol@kernel.org>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, lee@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<sashiko-bot@kernel.org> =E6=96=BC 2026=E5=B9=B410=E6=9C=8813=E6=97=A5=E9=
=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=882:40=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Low] mfd: driver-specific header modified in global include/linux/mfd/
> --
...
> > --- a/include/linux/mfd/nct6694.h
> > +++ b/include/linux/mfd/nct6694.h
> > @@ -8,6 +8,15 @@
> >  #ifndef __MFD_NCT6694_H
> >  #define __MFD_NCT6694_H
> >
> > +#define NCT6694_HWMON_MOD    0x00
> > +#define NCT6694_PWM_MOD              0x01
> > +#define NCT6694_I2C_MOD              0x03
> > +#define NCT6694_CANFD_MOD    0x05
> > +#define NCT6694_WDT_MOD              0x07
> > +#define NCT6694_RTC_MOD              0x08
> > +#define NCT6694_RPT_MOD              0xFF
> > +#define NCT6694_GPIO_MOD     NCT6694_RPT_MOD
> > +
>
> [Severity: Low]
> Are these driver-specific module type macros only used by the parent and =
its
> immediate children?
>
> According to MFD subsystem guidelines, driver-specific header files shoul=
d not
> be placed in the global include/linux/mfd/ directory if they are only use=
d
> by the parent and its immediate children. They should be kept local to
> drivers/mfd/ instead.
>
> Does this addition of driver-specific macros to the global header violate
> the subsystem architecture guidelines?
>

The sub-device drivers under gpio, i2c, can, hwmon, rtc, watchdog and
pwm also use these definitions, so the header needs to stay in
include/linux/mfd/.
