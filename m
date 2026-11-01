Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793563587;
	b=vm/G1TWIyKQkgwNWLX2/uMvGb4FIREeVRiKKstkXLAw2noAZ5PLvsLEpCS3x3iMoJimx
	 rXItedCKxnKSbgDuI+fjjIW9OEIRBVfs3n0GeLt6ovfyzQRmtSh0aFEWI3klGsZtdk56J
	 JAbHHrWaiqRNgHgyP+RVjOlHGx13gMKlK3Ea9VdP3P5LolT4GeruEjDkNrjX5jNCl3P22
	 ICKeQyplHn+gQQkLQNAg562Wa2SA/YVj063FYPayja4rpmFSjGqevp7pHU7KyQtoMOaIq
	 MnTADjwNUuXee0c2+SemTw8M8Wg4s05laN3OjBWPfR1nYmP5ZFjHk5W/iOf0Rb8rgzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793563587;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 In-Reply-To:References:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding;
	bh=2y29sQ2dPba/54GelCiYbC4bFX1dedr3eek43WaIQkM=;
	b=IJgy8YTefCUlAL43+yfnPpmbt5q5WZGIg3pASpLXc4jK8dKvTx7YmJH96bD5HyAks6ZG
	 J1Up5sMiubT07spb2YiHiq210WYkiTov4V/E+4/rUQw/4w/bIYOHoy1t558JAWDn8I+nV
	 IaNwYlqMfHUZnvvKWVDQAhv0kIO/iI4eiMSbuUelAbr6Rk/XwvPb20Lz0w/O4eqyUwzn/
	 VcJxYERHpNihdbNYOvBgSwkxiWN2UquGJs5NJMP8pA4SBrQTMBMGID/pFPikzMJPHzqCY
	 DI6A5IXTOmuSLiZGEzlvNIUcKDzeOQxCz/CaLIJN9cjhRTVUjl/aSVbNqF/Zg0GK5iw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h0cE6znW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.41
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AFE9606A324
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Nov 2026 20:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AFE9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h0cE6znW
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7c19c6721a3so1567514137.2
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Nov 2026 12:06:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793563586; cv=none;
        d=google.com; s=arc-20260327;
        b=SQGZjOo9nDpBoU4o7xG3nSoFwlrXIZbm5tZ3LLYP4RutlVawLRM3AKkekjjOZjCuYG
         B7AhFLK3beU9eylyPllKDC/xX0FJ6z6wgo0AyeViS7lX51bB7h+lWe4xK2qxtxUZQwXk
         tUOWtZU5kah4wVPfh130FePO0tmP5FskmzyJgo9yiBkDv3LXroJqFGqcy/Dc6NJp34if
         RpwPwHYvjWKqUTrpL6+5hbZCsaedbdZYFL8hYKJwd8wCg3Y31FPfBLMq7dBWyMFmWMoJ
         e1GJc5zk8Gg2YghMVVhmpyzdLuh2LECc4LnBa2HOcdMJDzIkx6RkibvuS3X1Kw7gEAKu
         m+Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=2y29sQ2dPba/54GelCiYbC4bFX1dedr3eek43WaIQkM=;
        fh=XYEm73zIZpmdoFl+iRTo12jIN4q5yC3unDWFV58Bgc4=;
        b=b2HvwI+q1ytPzYOUJ/74XJ277fMVCJmrdxEz0dKiaCCSSuTp0loBT5iiqRuMW17i+Y
         lbO1/tkNwDIpwczQ8fkPbPp6BSYdNBNh6pCqRZx6GJvCY+G845cC1P96wqyp4lARbToW
         UudqyPf8RI6csqKWKrKxZ3IHT1x2cD7qCAvku/lm8UCBi2V6kAVmDkuA7o4zsL34PB6C
         Dwz7yohAn/J8kUTIoQWCs0q+KKgUJLW+e8AugEpqJrVYWWBBr6SfrtFMhPGIZa3HbfYq
         wYVzakQBzPWrojAK4dNjOP2uFetMm68ZbiJZ0vVkaTmr292q824+EpbnqqjmBRmR/My3
         dpkw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793563586; x=1794168386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:references:in-reply-to:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2y29sQ2dPba/54GelCiYbC4bFX1dedr3eek43WaIQkM=;
        b=h0cE6znWQAeBtkpJ5uqnF++TsX+Id/TQETw1gbIdQZEJxcmX/VCHnXvaE/+q1paWdN
         Q3HoE5XLzSJ9HO2lqjTHa6cKr2vgU23Zq/cN2qlhIctb0FtAxsnGTYpQ8FPZu54d4sYC
         bjMIgYj1kQpLYJYU/wlHk9Ig0T2nUwvd9gbz0HwFfkgFu4KVnpd/8/oCqCNcTfx/p0oS
         h+pG6RvnRGAjdcFK+FwX0fitrHDI6pXRWhlKOK/CxoCuypicKu8XUBz/secpMfrscyEE
         7USHtEICFat/L2Pqnuea8mtOjyjYMc9xjIf70FrTeE+xS2wK9wL8mcdxEMvMmLiK2cgu
         k4Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793563586; x=1794168386;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:references:in-reply-to:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2y29sQ2dPba/54GelCiYbC4bFX1dedr3eek43WaIQkM=;
        b=oWcrOcgSeHUX1VjOcPvGuP3rAWa1pZNB7eXkWCqmFO3FILJjydPGlLAtCbVWq7O1I1
         5oGksa8y3VPFhPYdNLJJ9C3o6W27Vq4uAegWvnEY4WwGNqucRl0GMqr48ft8Vmg9pC0U
         5HmvJdxQU+vx605pJ7zFwfU+K2Xlq0DPNgzbZfgqGuJxTVCAbrctI1tK0kk7YjsLIOOo
         ZzvRa6xid7/mjcHykqfn44t5Qu+nvQLxQWtmkwgRmBUXpe1R/z3JKA1BwC3ccqYEI2Cx
         W8czXlfCn7FenNYzd7zndQXLXw0cyFft4V0ECoBR7SiL5LRKJPDrJP5EWd9Gnv7fqPtq
         /0sA==
X-Gm-Message-State: APuU4Z/ZDI4Y7uyejLuBzd4PGOeLLTWL6h8hRymqXfyshzMGKmzC2OvC
	lSDqoggShNQxAb3vmOHZKimeuRR6PEsMDoZkumIYdSjD1JVzvKNOAKyPncfCa8PruPa3T2TG+Iu
	7ke3oE5NkCFSgfjsekswIybTRkotDJhR3wHC2
X-Gm-Gg: AYBFou1qMrQPUBvPyv+oaH0IJCPRRqlrHA08JD1iLKFdNTIVl/ZLac3ORRML8sq3JuM
	Sa+K7EsUQ92fdMIceyOQV0ya3yE3Qs835ZyHIg64JcoziPV8nK3qK/wViENbkBYJh0x8qH0w1EK
	ail99SKbAPh+xyjSLQSZ45VL99Kidq+cYiFSZXrM5qy/AArbiVCS3CEk32YbLYEklPerUUgb0FF
	53V7HKYsdqhZ7APUSm/N5dhvXnmjE5iElk7RJhP54QXJ8tWxUFzNMzrlWIub3cFrsiKfMPMMYeb
	tfcgAphhfAFLLmsmcrwcVBFspepbGtWCOSRGtVIk+HR1GordhAqLDzhrueE1XnONX6jYghAErzm
	wuzXGrYaZwthDZmi1vJiksZKr6WzEo54PKpzdRbL1JO9Sc1vmofyL3rlx/eZSkiqI9jUL9czvC3
	+HEUfJj7bbv05QYsSkcAg6LUVy2izA8F8L+pH4FSAracp7fdYX
X-Received: by 2002:a67:e111:0:b0:78e:1e0f:ea42 with SMTP id
 ada2fe7eead31-7d07223fbb2mr3225317137.2.1793563585821; Sun, 01 Nov 2026
 12:06:25 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 1 Nov 2026 15:06:25 -0500
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Sun, 1 Nov 2026 15:06:25 -0500
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <CAOD9jOO2Ncdu9H_HO_gXDUawQOc8BgkiVuzoMS4gvPEVHZ3GEQ@mail.gmail.com>
References: <CAOD9jOPXYG=n1BL+OjyLBz-zjy8RXnN3h9OTyapTFZwOvD1Rsg@mail.gmail.com>
 <de2db474-969d-4999-9b7b-1e5dc5f81ac2@gmx.de> <CAOD9jONjxwnyYdNUKYNy1pOv2yBTvVy9yT+iB_yatooisjG4GA@mail.gmail.com>
 <CAOD9jONGkoub7CPdBqmNGhSWvy8p5S=bJCY-43NxjkQPEqQzyw@mail.gmail.com>
 <dae6828e-2da3-441f-bc5e-a273819f7499@gmx.de> <CAOD9jOMcc78EK_HhkTMVGTihhVOLU1O=i0jh_R-C4SH=Gv8GzA@mail.gmail.com>
 <88d6dda7-49d1-4b58-a166-98e6e0c60d03@gmx.de> <d3a44b63-ec0d-42e9-bd0f-20ea388c6c14@roeck-us.net>
 <CAOD9jOO2Ncdu9H_HO_gXDUawQOc8BgkiVuzoMS4gvPEVHZ3GEQ@mail.gmail.com>
From: LIght JUNction <lightjunction.me@gmail.com>
Date: Sun, 1 Nov 2026 15:06:25 -0500
X-Gm-Features: AclHuK_Cvnzl9dSZxzibWMp0_e5DIbfyBCFep99jFu3TZ1e3TEwczm1I1RmmUTs
Message-ID: <CAOD9jOO4rJ09ezmSSvFVEAngOYW4XD3WKaPyS0teM_8VEk3y1Q@mail.gmail.com>
Subject: Re: [PATCH] hwmon: add read-only MECHREVO GM6PX0X sensor driver
To: W_Armin@gmx.de, linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Armin, Guenter,

For some additional context, the in-tree uniwill-laptop driver was
developed using TUXEDO's out-of-tree tuxedo-drivers implementation as
one of its references:

https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers

TUXEDO also maintains its own driver stack and currently blacklists
the in-tree uniwill_laptop module until feature parity is reached for
NB02 devices.

I also found that TUXEDO's driver stack can be made to work on my
GM6PX0X, although it still requires additional model-specific changes.
I have been maintaining these adaptations here:

https://github.com/LIghtJUNction/mechrevo-drivers

Some features have been validated on my hardware, but full
compatibility has not yet been established.

This leaves us in a rather complicated situation, with overlapping
functionality across the in-tree driver, TUXEDO's out-of-tree drivers,
and my own adaptations.

I agree that maintaining multiple drivers for the same EC interface is
not a good long-term solution. My goal is to resolve these
compatibility differences and consolidate the relevant changes into
the existing upstream uniwill-laptop driver.

Ideally, I would like to have a single upstream implementation that
supports this hardware safely, without maintaining a separate driver
or relying on module blacklisting as a workaround.

I also ran the requested commands on my GM6PX0X. The relevant output
is below. I have omitted the system serial number and UUID.

$ sudo dmidecode

BIOS vendor: American Megatrends International, LLC.
BIOS version: N.1.09MRO07
Embedded Controller Firmware Revision: 1.8
System Manufacturer: MECHREVO
Product Name: Kuangshi16Pro Series GM6PX0X
Baseboard Manufacturer: MECHREVO
Baseboard Product Name: GM6PX0X

The acpidump output identifies the INOU ACPI device and its ECRR
method. Relevant excerpts:

96530: 5F 53 42 5F 5B 82 45 EC 49 4E 4F 55 08 5F 48 49  _SB_[.E.INOU._HI
96540: 44 0D 49 4E 4F 55 30 30 30 30 00 08 5F 55 49 44  D.INOU0000.._UID
...
967D0: 52 57 68 01 0A 02 69 14 1A 45 43 52 52 01 72 0C  RWh...i..ECRR.r.
967E0: 00 00 41 FE 68 60 70 4D 4D 52 57 60 00 00 00 61  ..A.h`pMMRW`...a
967F0: A4 61 14 16 45 43 52 57 02 72 0C 00 00 41 FE 68  ..a..ECRW.r...A.h

The dump was 3,982,091 bytes across 42 ACPI tables. I have included
the INOU.ECRR excerpt relevant to the sensor path; the full dump is
too large to include inline.

The current read-only sensor path in my driver uses INOU.ECRR for
these addresses:

CPU EC temperature: 0x043e
GPU EC temperature: 0x044f
CPU fan counter:    high 0x0464, low 0x0465
GPU fan counter:    high 0x046c, low 0x046b
Probe project ID:   0x0740 (expects 0x10)
Probe capability:   0x078e (requires bit 6)

The driver matches the exact DMI identity and BIOS shown above. It
reads sensors only, checks the project ID and fan capability, and
exposes no fan controls. Fan reads use a high/low/high sample with up
to three retries if the high byte changes. These checks and values
have only been verified on this GM6PX0X with BIOS N.1.09MRO07.

Thanks,
LIghtJUNction

On Mon, 02 Nov 2026 04:03:25 +0800, LIght JUNction
<lightjunction.me@gmail.com> wrote:
> Hi Armin, Guenter,
>
> For some additional context, the in-tree `uniwill-laptop` driver was
> developed using TUXEDO's out-of-tree `tuxedo-drivers` implementation as o=
ne
> of its references:
>
> https://gitlab.com/tuxedocomputers/development/packages/tuxedo-drivers
>
> TUXEDO also maintains its own driver stack and currently blacklists the
> in-tree `uniwill_laptop` module until feature parity is reached for NB02
> devices.
>
> I also found that TUXEDO's driver stack can be made to work on my GM6PX0X=
,
> although it still requires additional model-specific changes. I have been
> maintaining these adaptations here:
>
> https://github.com/LIghtJUNction/mechrevo-drivers
>
> Some features have been validated on my hardware, but full compatibility
> has not yet been established.
>
> This leaves us in a rather complicated situation, with overlapping
> functionality across the in-tree driver, TUXEDO's out-of-tree drivers, an=
d
> my own adaptations.
>
> I agree that maintaining multiple drivers for the same EC interface is no=
t
> a good long-term solution. My goal is to resolve these compatibility
> differences and consolidate the relevant changes into the existing upstre=
am
> `uniwill-laptop` driver.
>
> Ideally, I would like to have a single upstream implementation that
> supports this hardware safely, without maintaining a separate driver or
> relying on module blacklisting as a workaround.
>
> I also ran the requested commands on my GM6PX0X. The relevant output is
> below. I have omitted the system serial number and UUID.
>
> `sudo dmidecode`:
>
> ```
> BIOS vendor: American Megatrends International, LLC.
> BIOS version: N.1.09MRO07
> Embedded Controller Firmware Revision: 1.8
> System Manufacturer: MECHREVO
> Product Name: Kuangshi16Pro Series GM6PX0X
> Baseboard Manufacturer: MECHREVO
> Baseboard Product Name: GM6PX0X
> ```
>
> The `acpidump` output identifies the `INOU` ACPI device and its `ECRR`
> method. Relevant excerpts:
>
> ```
> 96530: 5F 53 42 5F 5B 82 45 EC 49 4E 4F 55 08 5F 48 49  _SB_[.E.INOU._HI
> 96540: 44 0D 49 4E 4F 55 30 30 30 30 00 08 5F 55 49 44  D.INOU0000.._UID
> ...
> 967D0: 52 57 68 01 0A 02 69 14 1A 45 43 52 52 01 72 0C  RWh...i..ECRR.r.
> 967E0: 00 00 41 FE 68 60 70 4D 4D 52 57 60 00 00 00 61  ..A.h`pMMRW`...a
> 967F0: A4 61 14 16 45 43 52 57 02 72 0C 00 00 41 FE 68  ..a..ECRW.r...A.h
> ```
>
> The dump was 3,982,091 bytes across 42 ACPI tables. I have included the
> `INOU.ECRR` excerpt relevant to the sensor path; the full dump is too lar=
ge
> to include inline.
>
> The current read-only sensor path in my driver uses `INOU.ECRR` for these
> addresses:
>
> ```
> CPU EC temperature: 0x043e
> GPU EC temperature: 0x044f
> CPU fan counter:    high 0x0464, low 0x0465
> GPU fan counter:    high 0x046c, low 0x046b
> Probe project ID:   0x0740 (expects 0x10)
> Probe capability:   0x078e (requires bit 6)
> ```
>
> The driver matches the exact DMI identity and BIOS shown above. It reads
> sensors only, checks the project ID and fan capability, and exposes no fa=
n
> controls. Fan reads use a high/low/high sample with up to three retries i=
f
> the high byte changes. These checks and values have only been verified on
> this GM6PX0X with BIOS N.1.09MRO07.
>
> Thanks,
> LIghtJUNction
>
>
> On Sun, 01 Nov 2026 07:29:50 -0800, Guenter Roeck <linux@roeck-us.net>
> wrote:
> > On 11/1/26 06:47, Armin Wolf wrote:
> > > Am 30.10.26 um 21:44 schrieb LIght JUNction:
> > >
> > >> Hi Armin,
> > >>
> > >> I added 0x046D to the read-only ECRR probe and sampled it 10 times o=
n
> the GM6PX0X. With 0x046C as the high byte, 0x046D produced 4934=E2=80=934=
979 RPM;
> the verified 0x046B path produced 4994 RPM in the same samples. So 0x046D
> also gives plausible fan-speed readings, but the values differ. This does
> not establish which offset is correct; I can only confirm that 0x046B
> matches the existing sensor readings on this machine.
> > >>
> > > Interesting, on my machine register 0x046B always returns 0x0F, so it
> seems that only some models
> > > report values values inside this new register. Because of this i
> suggest that we use register 0x046D
> > > for now.
> > >
> > >> I still won't load uniwill_laptop with force=3D1 on this running sys=
tem.
> The probe writes several EC settings, including CTGP, lightbar and
> keyboard-backlight state, and I have no complete way to snapshot and
> restore them. I have not tested whether a cold boot reinitializes all of
> those settings, so I can't rely on that as a recovery method.
> > >>
> > > Can you share the output of acpidump and dmidecode? I can then provid=
e
> you with a patch that only enables
> > > a subset of known safe features on your device. Because i am very
> against having a second driver using the
> > > exact same hardware interface as the uniwill-laptop driver, so this
> patch will not fly with me.
> > >
> >
> > I agree. There should not be two drivers accessing the same EC firmware=
,
> > and the register value similarity can not be coincidence. Disable
> everything
> > but hardware monitoring for this system if needed, but please do not
> > introduce multiple drivers for the same underlying hardware / EC firmwa=
re
> > and use the existing drivers.
> >
> > Armin, thanks a lot for catching this.
> >
> > Guenter
