Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793574551;
	b=tBzNutv2XHg446Gm6Mz2oOwLvGfRkSaY6Z7n8rK8K03W/wb2fxsfi5h6L3LGI0V1jiUy
	 5o0dOWLAdh8RcKm6PrVCoMN1xhZjr6MmGKM5G1AvSONsbdEPDow168G9l+RxW9wZLayoT
	 Nc39QpIuAkOyEzYvTaOputydNCUwpA6UQfWGG9m6MW8dPhunHKLuXQG5sNcz/gHngeydK
	 62i78WzPZEtQLu7njRARZTM7IYtw+BIkzAxJcrcByH00+SEVwGCnQ3a4fS2e3uR8CzNRX
	 /p/1ftsUyvcGtS7Bh10Urk4Hh45ZvBjZ/onmyfJVWPmu0Id8VKOMm8U2/zgMbE6+OUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793574551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding;
	bh=JihEDu+FoOCeg/zB5yGNRcVSZTNGvd8Vgblq91agW58=;
	b=voW4Q0s9D73riRsF3XLYEwphyy1QNnhf7ffNTQyuZeo2PpO6fvQ4GzJG+q+wUQRT2rS5
	 WzgFlTCfc/4q5JkK7xdGUPJ/kozjdLRF/JTvtj0VHMshWUZVVa2srlpjhZYN0Vdvpwji9
	 Xi//+QOYRG0OIRQS7HFw9x+57TG8bp7lYgtbUdaAX/DYxppAHqMUzvweLG/S/Q8e+AhUA
	 DTQfoQr53CL6DXeGps0RAITT2KDzgs9WPAF8VuCgO0/w+1Yb++264ba1w0MD5cpQfuMSf
	 Q99ct3xeE1GMZm5hxm2Jhb9CYNhVP2Yx71iQdCjg44mxjuOXqcy6RBMLvGDmIg3PayQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YWG+FVsv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62CC606A324
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2026 23:09:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B62CC606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YWG+FVsv
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7d06763335aso755648137.2
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Nov 2026 15:09:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793574550; cv=none;
        d=google.com; s=arc-20260327;
        b=HUBtMxjyb4V6qip31V9twvkQrCBUiW9aRuDkN3SP4xbpaJvrqUCuiaBJQHOVCdNcsc
         5c0K/1tdFThbzHTUDNqPs7tXGeQ+jeU9mZbv2KYnqK5EMmq6AR53O6kbzwpt/iBsPTjI
         hWMZLbCWkXrHtoB4zh6JiQBfs6CGvRCUiR4DSLuLFF/4WEKTpJHG/tP+Kr2nDk5zDf2X
         1i+HAf9KMYS1mBoGFLch33xdhUgK26sHW1cN4e2JZN5eYQjQ8JK/RBjhiFIp6KgHqhJq
         7a40ETNZS/QHSEsWxjDRNg74DIblp8l67CgN0Ne99aDtwein2WschAMcCl7lSzVBUyK/
         j/cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=JihEDu+FoOCeg/zB5yGNRcVSZTNGvd8Vgblq91agW58=;
        fh=IYH6+ixpsqgUMmS9I/Zqkrcz5vf24LF+/v/0eqPkGbg=;
        b=OFgmXY1SNxcCozpYN1Rx3PVHNEiIvtF8TeiGdI7J8eSkYGJ3h4cmWlkktmwjZQPvHU
         1PSlGRd3ZKMA//94pkZArPRrCk6bqL6tx4LzFAU9oYN9KPoyvxp+RSXOD0EqamTGkE34
         tcEDTze4VlY+D5O7StG4sXyPopybVPvkyFwb9kbnA1uCGMLp4d2iav+Qx7WD9DRtcry4
         BZFT7ksGAJNHyQAjtlScYYxufPiJLKcKbwh+VCP9WTI6M+yPYuZsGQLUdAHNsWSYis4u
         KFWskfXO4AxDvZfs0iIpAwQNIgMM1GC44w6nG3Fboj/r2Ays8ZtwcuzZG4H0YqCCBnbY
         JMGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793574550; x=1794179350; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:references:in-reply-to:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JihEDu+FoOCeg/zB5yGNRcVSZTNGvd8Vgblq91agW58=;
        b=YWG+FVsvlqR3fGd8kRrWEbfNRtq2GD03aQsG+xCVnGRRsOCVjRZy3FJYnss6qTN/WD
         oVWhcim3A5RYornLrPULqGWHXMbIVHNTxAsjFIs8fwwwZb5CseB9WAw7jf+y/Nd1Tw4k
         Hsx+NOEltjnKc61i2xMMBRFByefxvBvShQWNkPhTgaW6jYriGNt3V1tTotea9ZCVBykn
         tlHzmVxFyk1ir6bn6E/mjujM5LpHy/wVfv36suk8B0hnjSg+VzDkcZ2OIawMU5CTME0u
         nIjFAKrxAgT8CUkLlsr327tdpTxIcoTJYSUlATJbbk37oMzJqLUv9/mcDlJXDhq31VbI
         Lo9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793574550; x=1794179350;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:references:in-reply-to:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JihEDu+FoOCeg/zB5yGNRcVSZTNGvd8Vgblq91agW58=;
        b=sfGAdK0MY/fJbpEF3uTluDuEOt7sNJnNb4lRhw79ugDcKBoBL9XGPNbSck+P4T4hDf
         e/ImDlPK1z+uZw9TNev9ovgrFFbKsmtZTqCyCP0S47h57ySeYZ9+qS4VNWVHKep/ceT9
         eO1+V8q0rlgTPdXrCEklg726MuGphL8wy0s3o0YvK7dWp18K7FuWYlpKFyCJ+Ctq2aVK
         RTOIBFuD5aUTkfgfTi4cuIa2vm4nFYX1UxIwE4wKVYf+eAGMpHnoq1a9l/IoQGgztJox
         3UGiYJD6cMqn/Pp6oaLNg88auwrk9IuygF9Rdx2+AGClkTyG/2PZL0d0GGywmi3Dad9t
         shAA==
X-Gm-Message-State: APuU4Z9x4t0WGI5vJkX0xa5MwwNtYFYa7eWI3sZTRCSiSCeEiB2RnTX3
	ELGxPTtRVh84xT32BMi2fO/AEp1o6McnXs8g8/nQqYyh6hLFuzegKOR8c2sZd27Mp4ExOy7vx0y
	lwH6WJHVUTybsLPHvy/savUaNt0iJBnVM8Rkk
X-Gm-Gg: AYBFou1oYqVlJDCBL7RZ26o25A88fGtXwzJk1ietPOqcCKnfcpuDzF3VrjJnw24qcir
	0ih2A5+B60YB8F4kQK9V2i/knn49so5nnm4On40SpAmyh2DLZVo0zGrvRqpPWXnj8qvOQYQPuk3
	29hShxranEPukUwoqMSlpKuRj7nfc9EqcVC0asKJ57/lArPJF81BDlp1TvTVwVL3T30FH8+B+LG
	yhHnfksjV1Q1G/KTRFdbp/kRnstlZyfOuxoxV8PuZfMNM0RaVDu4mO3SN7G1nIzP9274RB5Y59X
	kfpM4xZcyn+XXm4HaU5zC5bVS+cZ0ytcFKUbOQLl/rm8Ca2DQEx95BGgbulPJnlhc4WsPkCSeBM
	4DnGYYhnblZqZIHkCCCB8tcqty+34aVEk+IpZlrjJI05Zbmo+L++u8VJ3maLG1cSp0f6usRcTiH
	5CZdMPu16XOpmD3QN9U6QGL5W40BFv8kU7W3WL4IBpyNK2uERl
X-Received: by 2002:a05:6102:3e84:b0:7cc:26e4:1943 with SMTP id
 ada2fe7eead31-7d072ce1bd2mr2845373137.28.1793574549079; Sun, 01 Nov 2026
 15:09:09 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 1 Nov 2026 18:09:08 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 1 Nov 2026 18:09:08 -0500
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CAOD9jOO4rJ09ezmSSvFVEAngOYW4XD3WKaPyS0teM_8VEk3y1Q@mail.gmail.com>
References: <CAOD9jOPXYG=n1BL+OjyLBz-zjy8RXnN3h9OTyapTFZwOvD1Rsg@mail.gmail.com>
 <de2db474-969d-4999-9b7b-1e5dc5f81ac2@gmx.de> <CAOD9jONjxwnyYdNUKYNy1pOv2yBTvVy9yT+iB_yatooisjG4GA@mail.gmail.com>
 <CAOD9jONGkoub7CPdBqmNGhSWvy8p5S=bJCY-43NxjkQPEqQzyw@mail.gmail.com>
 <dae6828e-2da3-441f-bc5e-a273819f7499@gmx.de> <CAOD9jOMcc78EK_HhkTMVGTihhVOLU1O=i0jh_R-C4SH=Gv8GzA@mail.gmail.com>
 <88d6dda7-49d1-4b58-a166-98e6e0c60d03@gmx.de> <d3a44b63-ec0d-42e9-bd0f-20ea388c6c14@roeck-us.net>
 <CAOD9jOO2Ncdu9H_HO_gXDUawQOc8BgkiVuzoMS4gvPEVHZ3GEQ@mail.gmail.com> <CAOD9jOO4rJ09ezmSSvFVEAngOYW4XD3WKaPyS0teM_8VEk3y1Q@mail.gmail.com>
From: LIght JUNction <lightjunction.me@gmail.com>
Date: Sun, 1 Nov 2026 18:09:08 -0500
X-Gm-Features: AclHuK9sEEEZrmHm7n2ifLbkEfuIuwsmihNfJhEuHC9sE05YR45ev6yL6EyrXm8
Message-ID: <CAOD9jOM4ORmgwMQkL4tu0V7XrXKMqFEVrSz=UX4a7FMTmA40Ag@mail.gmail.com>
Subject: Re: [PATCH] hwmon: add read-only MECHREVO GM6PX0X sensor driver
To: linux-hwmon@vger.kernel.org
Cc: W_Armin@gmx.de, linux@roeck-us.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Armin, Guenter,

As a supplement, I uploaded the original binary ACPI tables from this
GM6PX0X (DSDT.dat and SSDT1.dat through SSDT15.dat, captured on
2026-09-30) as a ZIP archive:

https://drive.google.com/open?id=3D1tDRnea8kPbO91oamV_wRXXphaVJPCEeq

The archive contains the 16 raw AML table files only. It is 810,171
bytes uncompressed; SHA-256 of the ZIP is
687f41db767f923bab6c2a28c93d09cf0caf75157b3ff2978f8b328ae620de29.

The Drive link is enabled for anyone with the link to view/download.
The complete acpidump text reported earlier was 3,982,091 bytes across
42 tables; these preserved raw table files come from the same GM6PX0X,
but were captured separately on 2026-09-30.

Thanks,
LIghtJUNction

On Sun, 01 Nov 2026 15:06:25 -0500, LIght JUNction
<lightjunction.me@gmail.com> wrote:
> Hi Armin, Guenter,
>
> For some additional context, the in-tree uniwill-laptop driver was develo=
ped using TUXEDO's out-of-tree tuxedo-drivers implementation as one of its =
references:
>
> https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers
>
> TUXEDO also maintains its own driver stack and currently blacklists the i=
n-tree uniwill_laptop module until feature parity is reached for NB02 devic=
es.
>
> I also found that TUXEDO's driver stack can be made to work on my GM6PX0X=
, although it still requires additional model-specific changes. I have been=
 maintaining these adaptations here:
>
> https://github.com/LIghtJUNction/mechrevo-drivers
>
> Some features have been validated on my hardware, but full compatibility =
has not yet been established.
>
> This leaves us in a rather complicated situation, with overlapping functi=
onality across the in-tree driver, TUXEDO's out-of-tree drivers, and my own=
 adaptations.
>
> I agree that maintaining multiple drivers for the same EC interface is no=
t a good long-term solution. My goal is to resolve these compatibility diff=
erences and consolidate the relevant changes into the existing upstream uni=
will-laptop driver.
>
> Ideally, I would like to have a single upstream implementation that suppo=
rts this hardware safely, without maintaining a separate driver or relying =
on module blacklisting as a workaround.
>
> I also ran the requested commands on my GM6PX0X. The relevant output is b=
elow. I have omitted the system serial number and UUID.
>
> $ sudo dmidecode
>
> BIOS vendor: American Megatrends International, LLC.
> BIOS version: N.1.09MRO07
> Embedded Controller Firmware Revision: 1.8
> System Manufacturer: MECHREVO
> Product Name: Kuangshi16Pro Series GM6PX0X
> Baseboard Manufacturer: MECHREVO
> Baseboard Product Name: GM6PX0X
>
> The acpidump output identifies the INOU ACPI device and its ECRR method. =
Relevant excerpts:
>
> 96530: 5F 53 42 5F 5B 82 45 EC 49 4E 4F 55 08 5F 48 49  _SB_[.E.INOU._HI
> 96540: 44 0D 49 4E 4F 55 30 30 30 30 00 08 5F 55 49 44  D.INOU0000.._UID
> ...
> 967D0: 52 57 68 01 0A 02 69 14 1A 45 43 52 52 01 72 0C  RWh...i..ECRR.r.
> 967E0: 00 00 41 FE 68 60 70 4D 4D 52 57 60 00 00 00 61  ..A.h`pMMRW`...a
> 967F0: A4 61 14 16 45 43 52 57 02 72 0C 00 00 41 FE 68  ..a..ECRW.r...A.h
>
> The dump was 3,982,091 bytes across 42 ACPI tables. I have included the I=
NOU.ECRR excerpt relevant to the sensor path; the full dump is too large to=
 include inline.
>
> The current read-only sensor path in my driver uses INOU.ECRR for these a=
ddresses:
>
> CPU EC temperature: 0x043e
> GPU EC temperature: 0x044f
> CPU fan counter:    high 0x0464, low 0x0465
> GPU fan counter:    high 0x046c, low 0x046b
> Probe project ID:   0x0740 (expects 0x10)
> Probe capability:   0x078e (requires bit 6)
>
> The driver matches the exact DMI identity and BIOS shown above. It reads =
sensors only, checks the project ID and fan capability, and exposes no fan =
controls. Fan reads use a high/low/high sample with up to three retries if =
the high byte changes. These checks and values have only been verified on t=
his GM6PX0X with BIOS N.1.09MRO07.
>
> Thanks,
> LIghtJUNction
>
> On Mon, 02 Nov 2026 04:03:25 +0800, LIght JUNction <lightjunction.me@gmai=
l.com> wrote:
> > Hi Armin, Guenter,
> >
> > For some additional context, the in-tree `uniwill-laptop` driver was
> > developed using TUXEDO's out-of-tree `tuxedo-drivers` implementation as=
 one
> > of its references:
> >
> > https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers
> >
> > TUXEDO also maintains its own driver stack and currently blacklists the
> > in-tree `uniwill_laptop` module until feature parity is reached for NB0=
2
> > devices.
> >
> > I also found that TUXEDO's driver stack can be made to work on my GM6PX=
0X,
> > although it still requires additional model-specific changes. I have be=
en
> > maintaining these adaptations here:
> >
> > https://github.com/LIghtJUNction/mechrevo-drivers
> >
> > Some features have been validated on my hardware, but full compatibilit=
y
> > has not yet been established.
> >
> > This leaves us in a rather complicated situation, with overlapping
> > functionality across the in-tree driver, TUXEDO's out-of-tree drivers, =
and
> > my own adaptations.
> >
> > I agree that maintaining multiple drivers for the same EC interface is =
not
> > a good long-term solution. My goal is to resolve these compatibility
> > differences and consolidate the relevant changes into the existing upst=
ream
> > `uniwill-laptop` driver.
> >
> > Ideally, I would like to have a single upstream implementation that
> > supports this hardware safely, without maintaining a separate driver or
> > relying on module blacklisting as a workaround.
> >
> > I also ran the requested commands on my GM6PX0X. The relevant output is
> > below. I have omitted the system serial number and UUID.
> >
> > `sudo dmidecode`:
> >
> > ```
> > BIOS vendor: American Megatrends International, LLC.
> > BIOS version: N.1.09MRO07
> > Embedded Controller Firmware Revision: 1.8
> > System Manufacturer: MECHREVO
> > Product Name: Kuangshi16Pro Series GM6PX0X
> > Baseboard Manufacturer: MECHREVO
> > Baseboard Product Name: GM6PX0X
> > ```
> >
> > The `acpidump` output identifies the `INOU` ACPI device and its `ECRR`
> > method. Relevant excerpts:
> >
> > ```
> > 96530: 5F 53 42 5F 5B 82 45 EC 49 4E 4F 55 08 5F 48 49  _SB_[.E.INOU._H=
I
> > 96540: 44 0D 49 4E 4F 55 30 30 30 30 00 08 5F 55 49 44  D.INOU0000.._UI=
D
> > ...
> > 967D0: 52 57 68 01 0A 02 69 14 1A 45 43 52 52 01 72 0C  RWh...i..ECRR.r=
.
> > 967E0: 00 00 41 FE 68 60 70 4D 4D 52 57 60 00 00 00 61  ..A.h`pMMRW`...=
a
> > 967F0: A4 61 14 16 45 43 52 57 02 72 0C 00 00 41 FE 68  ..a..ECRW.r...A=
.h
> > ```
> >
> > The dump was 3,982,091 bytes across 42 ACPI tables. I have included the
> > `INOU.ECRR` excerpt relevant to the sensor path; the full dump is too l=
arge
> > to include inline.
> >
> > The current read-only sensor path in my driver uses `INOU.ECRR` for the=
se
> > addresses:
> >
> > ```
> > CPU EC temperature: 0x043e
> > GPU EC temperature: 0x044f
> > CPU fan counter:    high 0x0464, low 0x0465
> > GPU fan counter:    high 0x046c, low 0x046b
> > Probe project ID:   0x0740 (expects 0x10)
> > Probe capability:   0x078e (requires bit 6)
> > ```
> >
> > The driver matches the exact DMI identity and BIOS shown above. It read=
s
> > sensors only, checks the project ID and fan capability, and exposes no =
fan
> > controls. Fan reads use a high/low/high sample with up to three retries=
 if
> > the high byte changes. These checks and values have only been verified =
on
> > this GM6PX0X with BIOS N.1.09MRO07.
> >
> > Thanks,
> > LIghtJUNction
> >
> >
> > On Sun, 01 Nov 2026 07:29:50 -0800, Guenter Roeck <linux@roeck-us.net>
> > wrote:
> > > On 11/1/26 06:47, Armin Wolf wrote:
> > > > Am 30.10.26 um 21:44 schrieb LIght JUNction:
> > > >
> > > >> Hi Armin,
> > > >>
> > > >> I added 0x046D to the read-only ECRR probe and sampled it 10 times=
 on
> > the GM6PX0X. With 0x046C as the high byte, 0x046D produced 4934=E2=80=
=934979 RPM;
> > the verified 0x046B path produced 4994 RPM in the same samples. So 0x04=
6D
> > also gives plausible fan-speed readings, but the values differ. This do=
es
> > not establish which offset is correct; I can only confirm that 0x046B
> > matches the existing sensor readings on this machine.
> > > >>
> > > > Interesting, on my machine register 0x046B always returns 0x0F, so =
it
> > seems that only some models
> > > > report values values inside this new register. Because of this i
> > suggest that we use register 0x046D
> > > > for now.
> > > >
> > > >> I still won't load uniwill_laptop with force=3D1 on this running s=
ystem.
> > The probe writes several EC settings, including CTGP, lightbar and
> > keyboard-backlight state, and I have no complete way to snapshot and
> > restore them. I have not tested whether a cold boot reinitializes all o=
f
> > those settings, so I can't rely on that as a recovery method.
> > > >>
> > > > Can you share the output of acpidump and dmidecode? I can then prov=
ide
> > you with a patch that only enables
> > > > a subset of known safe features on your device. Because i am very
> > against having a second driver using the
> > > > exact same hardware interface as the uniwill-laptop driver, so this
> > patch will not fly with me.
> > > >
> > >
> > > I agree. There should not be two drivers accessing the same EC firmwa=
re,
> > > and the register value similarity can not be coincidence. Disable
> > everything
> > > but hardware monitoring for this system if needed, but please do not
> > > introduce multiple drivers for the same underlying hardware / EC firm=
ware
> > > and use the existing drivers.
> > >
> > > Armin, thanks a lot for catching this.
> > >
> > > Guenter
