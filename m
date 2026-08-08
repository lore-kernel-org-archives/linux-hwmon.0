Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58E2205E02
	for <linux-hwmon@vger.kernel.org>; Sat,  8 Aug 2026 09:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786181913; cv=pass; b=rnQZ24MMSp6yXs1god1bAt67gk2Fd/XMA9MfHQID1QFPnwDdWyPGR1TzekoJHlpmPeGTlSf+QhTcyyYdpH+lIwDhPDLdoXn6lsAPJoxJrOKu1OMx7fl9otHvPKAOkvJ3qIkGTRpeyT9H9UZudsctfmsjQuUWn7ZjT9SQARLW8eU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786181913; c=relaxed/simple;
	bh=+X5YTpzoR40uFu6Nw8c+HNf/9wBeFm9Xzur6C4IpBbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WWRDAkNDDD/RMab1QNChCIVzBwLheDDYqgbq77/swj6u7E9OftpKhsZwQwvswoiKcZ0U30IDgPtWPA6N/T21v7w1GH79Dpqnqn4yyqSHXgmXfRqEgVDOWjVQhSYrcO/1ZwAAGOSbG5GWdRy/wo7UXih841IzAHM6cAZd3WOZT7w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q5usZGZt; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q5usZGZt"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8143daf89c7so2869297b3.1
        for <linux-hwmon@vger.kernel.org>; Sat, 08 Aug 2026 02:38:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786181910; cv=none;
        d=google.com; s=arc-20260327;
        b=a26HH2fgq0JY46LQoM41CLm3F0zTvcFmisQ7Aw0Rxg9Nz/RMKllUiCWfBNZ8Vp1vms
         k0onmPV2KQfipRNuxbCExYv7kg8Kqf7AZjsYRLGoT8/HjWvapiV3cOy2zFEyNqR1p/8J
         PRrRgSHDvhGvHyPwE2lnXTHt76cP+ah6aj0tiTMcsaC0eKm0bU19/q7f0A2MLSchD8Lu
         /D1tNuIY1SE2W7E57kY+L9zG8VD8QkGFlcXhLnL9r/aNQcye4BdYL58EfnzT7HxVvdH8
         MmGDLt/H1X5ov4X+HR4f2Gk6QzC9fmeQ5jz4uNFP+xJ5hZDESiSwmHqCVpaC1npxUKXc
         9SKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8P9ztDq65uskymseje35VOw9g9KDNjj2Y7InSXRtTGk=;
        fh=0hdvEPJRino8wRvGrrw1gATkOs6ExpSix2L2F38xNVA=;
        b=XJB+PUsBeEWP8hEwWwNkKn+QPUlcImzNwr2Xuo0Bi6Hpp3E2Fb5HiLvFGg6Xpx3C0M
         kR5PDgHmunQPYiUjuR6AdoY5raQJGmMELnw2CJmVx/WDFx77y6i/Y8MFLNIhts3lffW6
         0gXDZuwu98pzEWgKzfgQc1itf8ws5Z/cLOLbASXgSoa0IAcObUDMOyYnWGywuuVuiUSd
         oYZBQdE7C80+//YbSAN5FFNI+QUzmj3EgOeTC5/ty8JHOD43Po1TYomktcczFjkbqbpg
         g6VFOkVfP96OE0lqRSQuPnmwYxGUa0XB5mgOtTqeYGaY5MtEUF3hnxdxzQ9KUwUEfNIO
         7F4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786181910; x=1786786710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8P9ztDq65uskymseje35VOw9g9KDNjj2Y7InSXRtTGk=;
        b=Q5usZGZtq5t3P27SZtpS7UzurFoDZzWB5SyVLgpahmYx3TDTl8waPHa5MB+umWXMQx
         Ym80v/ziLgoAnDdhDY7C3Zyr3CmV0XTGVljIV/fV5tw7c6mJBBggH4B48UFcDk2cXC4S
         H6mzFLwfeh1B4hvYAFjPWavouekoVXSxtDJMrA38t82U09vfe6wvBaUMN44BVZv7lWZA
         b3o51SEtngEb6xwLuxYTLYyHJ3IAvttZvvlj/5293+r9QzxZfTsyhpJf4Vwam8ram0kr
         K+jUludhxH7YFlCB3LyrUl1EQ+HlTswNaItagAdU4EbZds8Ffd6Nd7u1vRyCnv2FAXg0
         DlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786181910; x=1786786710;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8P9ztDq65uskymseje35VOw9g9KDNjj2Y7InSXRtTGk=;
        b=q3xzAv0N3c30Prx26whjNmtZyHiVHzxbhhPEcgo3NZD5h3ZD6p2ctWUCtw9FEdNJyS
         oMwID4DiEuWp1nt86dzukPSUswGrHumZez51i+lDfLr0Ig6fvQkl3+jsul4UzMCyUksr
         JKKHqMyz1BoxzTo7Y/JKaaSTfK11nYbWyFJJkOZ8v8OVyxGH3O+nSou5BI3vAgWedGJW
         oqaBcgU5AJ9XOH3MNNqnbXlJISeqmvN9SnSxe7Dwx2+XNU3o4opZiJgNXGopqPJJzchB
         01QVrRy3YAB58Ls4jYaeRAqdaMTRuH0OVbK1z8W1JwzdWQJBwiZvh3pCWd9ZwCp8owRl
         mAUQ==
X-Gm-Message-State: AOJu0Yx6rd96fAjwqyJziluU1iuVK6B4ugSrGR4DZYLPkN8nrodgbk+Y
	QyFRN5xh1MYMqAw3H89oC9EelmIkCW7aA0+ApBYjxdoo0h8H0hNggYL0eshtzQVvxs5VoEteLI9
	XUdCQGGWPYSmkSiElh3UbdWszb9UdFPhy51MkxHOoVg==
X-Gm-Gg: AR+sD12GUvm2hV2x+u9QDF/8FsXU8E7n3aPBZO1bmaGACre6zJ+ivcrSS7qXJuKvI5V
	eackR6y11BgFog49Kv2iOdqO5Bt/8rp3RFm4XfqkE58UF+W3R+4yoskbhI+M9B7D/JzfP++9TLX
	ggjFQ3fvLwmZCQZStGgeELRzMSgCHo25MipL5j58lnIx5ru1Rm/4260Fbl94Q7achcKDxCfv0Ax
	yHb8Dse9tRtC9Xf6ztpUkvREij7tfTfl917nrAM9Ns5YdXnyTJW9BPHsGU5VIMUQnuAdOb/awgc
	v1ekeJ5VtzUZqS6maH/OjJ4QfQfL8DOmAAioTB/FqS+/aQ==
X-Received: by 2002:a05:690c:2702:b0:814:4755:2b2b with SMTP id
 00721157ae682-822576265c1mr99613807b3.3.1786181910553; Sat, 08 Aug 2026
 02:38:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808083718.2612205-1-congnt264@gmail.com> <20260808085811.ACB651F000E9@smtp.kernel.org>
 <CAJpJ=GuiQy0XtcER6=Va7VmfuGF__3BGSrjKiYRriEEUbUaEPA@mail.gmail.com>
In-Reply-To: <CAJpJ=GuiQy0XtcER6=Va7VmfuGF__3BGSrjKiYRriEEUbUaEPA@mail.gmail.com>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Sat, 8 Aug 2026 16:38:19 +0700
X-Gm-Features: AUfX_mzVkCvUiMCc3l3osMwc-IZ7bRJgtjhtnV2V88sfqxPRPpdDFxfK3QfDw0k
Message-ID: <CAJpJ=GvwdHj4J=1tTz4tzJQH-HVKC4zWprVRYU-de__ypaB9kg@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (max6621) fix negative temperature offset and crit readings
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2026 at 4:19=E2=80=AFPM Nguy=E1=BB=85n C=C3=B4ng <congnt264@=
gmail.com> wrote:
>
> On Sat, Aug 8, 2026 at 3:58=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> >
> > Thank you for your contribution! Sashiko AI review found 2 potential is=
sue(s) to consider:
> >
> > Pre-existing issues:
> > - [High] Writing the maximum allowed temperature of 128=C2=B0C to hwmon=
_temp_crit silently wraps to -128=C2=B0C in hardware.
> > - [Medium] Fractional temperature precision is discarded due to shiftin=
g and integer division before scaling.
> > --
> >
> > --- Patch [1]: [PATCH] hwmon: (max6621) fix negative temperature offset=
 and crit readings ---
> > commit a073f1d4838dda93adf9b46f8e3cc16f1b662f82
> > Author: Cong Nguyen <congnt264@gmail.com>
> >
> > hwmon: (max6621) fix negative temperature offset and crit readings
> >
> > This patch fixes temperature reporting for the max6621 driver. It
> > addresses an issue where negative temperatures were reported as large
> > positive numbers due to missing sign extension before scaling the 16-bi=
t
> > register values.
> >
> > Cc: stable@vger.kernel.org
> >
> > >       - temp_input used an s8 intermediate, which is correct for the
> > >         -127..127 range but reports the documented +128 degrees C max=
imum as
> > >         -128 degrees C.
> >
> > [Severity: High]
> > This is a pre-existing issue, but while fixing the read path for the +1=
28
> > degrees C maximum, is it possible that the write path still wraps to -1=
28
> > degrees C?
> >
> > When writing to hwmon_temp_crit, max6621_write() in drivers/hwmon/max66=
21.c
> > clamps the input to MAX6621_TEMP_INPUT_MAX (128000) and divides by 1000=
L:
> >
> > drivers/hwmon/max6621.c:max6621_write() {
> >     ...
> >     case hwmon_temp_crit:
> >         ...
> >         /* Clamp to allowed range to prevent overflow. */
> >         val =3D clamp_val(val, MAX6621_TEMP_INPUT_MIN,
> >                 MAX6621_TEMP_INPUT_MAX);
> >         val =3D val / 1000L;
> >
> >         return regmap_write(data->regmap, reg, val);
> > }
> >
> > If a user writes 128000 to temp_crit, it gets clamped and divided to 12=
8
> > (0x80). For an 8-bit two's complement alert register in the MAX6621
> > hardware, 0x80 is interpreted as -128 degrees C.
> >
> > Could this cause continuous false thermal alerts and potential unintend=
ed
> > system throttling?
> >
> > > diff --git a/drivers/hwmon/max6621.c b/drivers/hwmon/max6621.c
> > > index e86ec6d237ca6..9becd098d840b 100644
> > > --- a/drivers/hwmon/max6621.c
> > > +++ b/drivers/hwmon/max6621.c
> > [ ... ]
> > > @@ -225,8 +224,8 @@ max6621_read(struct device *dev, enum hwmon_senso=
r_types type, u32 attr,
> > >                        * The temperature is given in two's complement=
 and 8
> > >                        * bits is used for the register conversion.
> > >                        */
> > > -                     temp =3D (regval >> MAX6621_REG_TEMP_SHIFT);
> > > -                     *val =3D temp * 1000L;
> > > +                     *val =3D (sign_extend32(regval, 15) >>
> > > +                             MAX6621_REG_TEMP_SHIFT) * 1000L;
> >
> > [Severity: Medium]
> > This is a pre-existing issue, but does this arithmetic right shift disc=
ard
> > the hardware's fractional temperature precision?
> >
> > By shifting right by MAX6621_REG_TEMP_SHIFT (6 bits) before multiplying=
 by
> > 1000L, the lower 6 fractional bits are lost, dropping up to 0.984 degre=
es C
> > of precision.
> >
> > Would it be better to multiply by 1000L first and then shift or divide =
to
> > expose the full fractional precision provided by the MAX6621 device?
> >
> > The same precision loss also happens when writing hwmon_temp_offset in
> > drivers/hwmon/max6621.c:
> >
> > drivers/hwmon/max6621.c:max6621_temp_mc2reg() {
> >     return (val / 1000L) << MAX6621_REG_TEMP_SHIFT;
> > }
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260808083718.=
2612205-1-congnt264@gmail.com?part=3D1
>
> Thanks for the review. Both points are pre-existing and on the
> write/precision side, so I'd like to keep this patch focused on the
> sign-extension read fix and handle them separately:
>
> - temp_crit write / +128 =C2=B0C: agreed this is a pre-existing write-pat=
h
> issue. max6621_write() clamps to MAX6621_TEMP_INPUT_MAX (128000), so
> 128 =C2=B0C lands in the (non-shifted) alert register as 0x80; if that
> register is interpreted as signed, it wraps. I'll send a separate
> patch to tighten the clamp once I've confirmed the alert register
> width/sign against the datasheet =E2=80=94 it's orthogonal to this read-s=
ide
> fix.
> - Fractional precision: also pre-existing =E2=80=94 both the read (>>
> MAX6621_REG_TEMP_SHIFT before scaling) and the write
> (max6621_temp_mc2reg() divides by 1000 before shifting) discard the 6
> fractional bits, so the driver has always reported at 1 =C2=B0C resolutio=
n.
> Exposing the 1/64 =C2=B0C resolution is a behavioural change rather than =
a
> fix, so I'd prefer to do that as a follow-up.
>
> This patch only restores the sign of the existing values, which were
> being reported as large positives for negative offsets and crit
> thresholds.

Following up after checking the datasheet (MAX6621AUB):

All temperature values use 16-bit two's complement, left-shifted so that
the +1 C bit is bit 6 (1/64 C per LSB). The alternate integer
representation is optional and enabled via CONFIG0 bit 6, which this
driver never sets, so the device stays in the default shifted format.

The offset path already accounts for this: it shifts by
MAX6621_REG_TEMP_SHIFT on read and uses max6621_temp_mc2reg() (which
left-shifts by 6) on write. The temp_crit path does not -- it uses a
plain "regval * 1000" on read and "val / 1000" on write, i.e. the math
for the alternate/integer format that isn't enabled.

As far as I can tell the alert-threshold registers are in that same
shifted format (the datasheet doesn't give a separate worked example for
them, but they're compared against PECI temperatures in the current data
format, and CONFIG2/offset is explicitly "represented in the current data
format"). If so, the threshold is programmed 64x too low: a 95 C crit
stores 0x005f, which the device interprets as 0x5f/64 ~=3D 1.5 C, so ALERT
can assert almost immediately. It round-trips through sysfs (the read
undoes the write), which hides it from a simple read-after-write check.

So this is a scaling bug rather than the clamp/+128 wrap I mentioned
earlier -- with the shift in place, 128 C encodes as 0x2000 and there is
no wrap.

I'll send a patch scaling the crit read/write like the offset path. It
builds on the sign-extension fix in this patch, so I'd send it as a
follow-up on top -- happy to fold both crit changes into a v2 instead if
you'd prefer. Confirmation from someone with the hardware would be
welcome, since I've only verified this against the datasheet.

The 1/64 C precision point stands as a separate enhancement.
