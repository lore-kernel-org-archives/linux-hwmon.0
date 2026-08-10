Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84551DDC38
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Aug 2026 04:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786336422; cv=pass; b=mdnKm2bt6V58UBrJ7cfIR69qyezuBM7uCTbD63vB1htDmwz6rs3FmfQpuvzhU6dkHOQkh+urc2zFVncQVCi7bgu6So01/3U1mdw0Pk6FLsSAA+0s2F9GFVi1gWvLRHw3BTEGipROp+o/nWrDKnYuG3kj0Wm0wznPKSvO0YN4caQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786336422; c=relaxed/simple;
	bh=C6qNkmU0coUgBq1FEmPA942LiRBWtCRkcfL34kHaeqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QRlANRxAygMNdXwydejxwFSKv8y5k/7bhzp30kycWAkrDPywyRsZ+gY1Nasyz7BUL44r7mOlxzPUlvxObIhbeT1207BMwPt7oWnMlnNR48+nfunQDjK5ndV+F3ybFDOek7xsOS3/MfMs1hDKy7GvAS4x40SQTVcBAwjOQUvyfvY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=khflqsX7; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="khflqsX7"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-81f3b227a4aso21113847b3.1
        for <linux-hwmon@vger.kernel.org>; Sun, 09 Aug 2026 21:33:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786336419; cv=none;
        d=google.com; s=arc-20260327;
        b=C38lAtvfoSQQH8OvHAH2EsBeFPTvpq/MIogakvj6QTm+LwLSxuWvKAYGKxUxv37DOh
         vKLMUiemn2P+oH96vM7o4rUBGXyQqxTGPCPT6Z3+T/fJPNj2oRfwfGb0n9Mr9zp8U6F2
         1BM/SxO/siOjO1knLK6NoRZDIri7y54adZBgJXW8DQx1giVTrAkDvLqE9CxT6HJGR862
         wncA621WATb3PtMjr1yq/ft/jMwnzo3bQq2rxIQgngAs/rBIlmnmwooiufhwjIpWwnNP
         N8Lcr9WhYzNtKrkpw1tHcolqZOBZ2fdswLDs1jq22N6AduuLd1QLzuz7n7f+ZjtblWQs
         BVjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CEo35ImDSn+yr471Riry03xryosykCvYZ9tXFIpOzZs=;
        fh=wq76tiplgzxAnCjrmxWyoAflDjregBH+YsJejUy70Ns=;
        b=Fr8A1cpvwN4q6SF3bdZmKVIzZs/dY+QFkeN7+ROirsUGHmdp+bC86olVX7f8HvgeL2
         naVprQHv0TqL6DmErBq9kzSXhS9VjBy4Yxfb4J1I7hp4kPlMA2ZJ7w/tP1ajWksvychL
         lIaLPUQXsf6l1b2QqqiWViZPOL3yDTbXdAn7GwwgYpMn3eui4+mrw6AFJ3a/PGZB9QRp
         S5wCxdPsI7LFuJ1Vm5HgGfWnLQpPzb2EMIc8W0vCguH3d+/jguq/72BYcAOOg5GQMTsY
         i0iM7/+sseDtRbiyXkjc+Eu+4d/p1b8lncXYgaCB0ERvuccH5ElGr6wHS1rUAkSyokGb
         U/2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786336419; x=1786941219; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CEo35ImDSn+yr471Riry03xryosykCvYZ9tXFIpOzZs=;
        b=khflqsX7hhVrxaa9a8qecGe0QYtOEIjAm3PEqUbzMGIy/mkIaVHuHY5D4l343eU5R0
         8uuYHhaO4bLop9Pvmzl2c9Vov3exJ8P5vZaMv2DmyjBoG9EFoGB9/UHXSqyzmEaFKmF4
         MCbT8ZI8bqHuB9ZQJ24osYxL1wPV8M1QAAHUXQty03FeWdLYswrtciGxPbtnuJmzKZYt
         82G5I3003kaTogK03FF1lxHhiUcYGxo2I5kz/ugYbA10kCyhX/py5nYjGPjwDVvjC7ev
         wlqcOwIdO7J8PufnF5HHHbPSC4wKwJjELiTtYVvW7f8tHvTrgH4AKiJ53fN/SdkeXuaF
         o/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786336419; x=1786941219;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CEo35ImDSn+yr471Riry03xryosykCvYZ9tXFIpOzZs=;
        b=XJz7ESLa7bhjOf1jrXtPAW7yZ4kLX9+/HPPKmJrIasg3/fq607aRg7RYuaUleB9bP2
         sebVuh/NLNIfBe2ri8II5KN5anU64oadNJtc+iPoblIGq0b2qJ1wsvfn1Xrdg62OaAom
         bBvxZaFTJsURXWWja9kZGswLaZjmcqHXZgDDd2u29Bhep850N9NWeTP/TDYbAF2XzH9c
         YlkRVVTNwkM/7lgAjVeS+hVGx59Y/3l8O21HKSAzMUPvKriyU4xwH0i4y/II5NyMYFc7
         xrxHOqbeeoQJh9jClPBrHHPYrywNJ6Nuoe2sFNcbguOMvmlBOqjKAc3lwQuJI7SgaSlF
         wneA==
X-Forwarded-Encrypted: i=1; AHgh+RoprLMZfx6fdaHbLaCh+9ubTeT79YJQhw1p1YD0N9UbpqAjTy49apc1n1KlF7mRS7Qxw0O1qAhEjT2fYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwvQf/kLm+tXZGZsmH33txL3Xxcmp5cnGSWEFDCxKLMb0UEYO0Z
	jOyQ4G181SxytelqSD82Kyy+UD6EwU1ave20Z6iNmEfzMqY6yAAgS2jk3L4UNLlBlr4AK+FCgF2
	dE01xFNNXnmG3oapYjV6flIT/IShqjVk=
X-Gm-Gg: AR+sD10OBq2HPoz1Nv4ELYfL6IQ3eaEJMN3cb8X7QNsLOzotAnOX3I1/3QRDY9iAa5e
	iDzOk07n1zH62jZh7dPLxWDNf33sGQ8VSuILxrbPhTsatWCZ53gSiwaL6Wp/U0W91xeKSS4JU6B
	eT38cdIFpC7oMyvrw+3lCe551AQRHzMC1CE568FlsPcEEKlnQm9KjmXjeyC9Pi9HbNqS/uIjJ0D
	Zqv1WCzOMVT6RXO4XIF+SEN9KXTjw73eScMizZfHJOSUq63gBWAeMf/tew/SgcQdYSAqaaSlZtH
	rc6LbS5pwx+0HZ/s9VvRraD0CLfOAnIxYSP6L98PULtWM+g8aQYR36SvCrgDvcFgcuKvHyaBoCK
	6QG8DdGFWJ54v
X-Received: by 2002:a05:690c:b01:b0:804:a2d5:1e04 with SMTP id
 00721157ae682-82574af4157mr111512297b3.16.1786336419583; Sun, 09 Aug 2026
 21:33:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808083718.2612205-1-congnt264@gmail.com> <2651758d-e588-4c2e-aa1d-13772e09874b@roeck-us.net>
 <CAJpJ=Gvh=M9_Fq8g7sCCWYz=d+9VS1m4zbwZFbnKJ+-YdQtneQ@mail.gmail.com> <6022de1c-1345-4f16-939f-480c3313143a@roeck-us.net>
In-Reply-To: <6022de1c-1345-4f16-939f-480c3313143a@roeck-us.net>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Mon, 10 Aug 2026 11:33:28 +0700
X-Gm-Features: AUfX_myyX7HoGQkv4weoDy3e6La5R3fbBZLX1ZK_u8UW3B_y4DMUjUxZiEsyTT8
Message-ID: <CAJpJ=Gts8OTq4xEJid=wFsK1EhdD=Lsv-dHGUJ5ExverAQqSbA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (max6621) fix negative temperature offset and crit readings
To: Guenter Roeck <linux@roeck-us.net>
Cc: Vadim Pasternak <vadimp@mellanox.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 9:45=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 8/8/26 08:54, Nguy=E1=BB=85n C=C3=B4ng wrote:
> > On Sat, Aug 8, 2026 at 9:48=E2=80=AFPM Guenter Roeck <linux@roeck-us.ne=
t> wrote:
> >>
> >> On 8/8/26 01:37, Cong Nguyen wrote:
> >>> max6621_read() reads the temperature input, offset and critical alert
> >>> registers into a u32 and assigns them to the output without sign
> >>> extension. The device reports these values in two's complement (the
> >>> driver comment and the write path, which clamps to
> >>> MAX6621_TEMP_INPUT_MIN =3D=3D -127000 and encodes negatives, both rel=
y on
> >>> this), so negative values are misreported as large positive numbers:
> >>>
> >>>     - temp_offset: *val =3D (regval >> MAX6621_REG_TEMP_SHIFT) * 1000=
, an
> >>>       unsigned shift, so e.g. a -10 degrees C offset (register 0xfd80=
)
> >>>       reads back as ~+1014000 millidegrees.
> >>>     - temp_crit: *val =3D regval * 1000, so a negative critical thres=
hold
> >>>       reads back as a large positive value.
> >>>     - temp_input used an s8 intermediate, which is correct for the
> >>>       -127..127 range but reports the documented +128 degrees C maxim=
um as
> >>>       -128 degrees C.
> >>>
> >>
> >> This problem does not exist. The AI is hallucinating a bit. There is n=
o mention
> >> of +128 degrees C in the datasheet.
> >>
> >> The problem here is that MAX6621_TEMP_INPUT_MIN (-127) and MAX6621_TEM=
P_INPUT_MAX (128)
> >> are wrong. That should be -128 and (+)127. I guess the AI doesn't see =
that.
> >>
> >>> The registers are 16-bit (the driver's own PECI error codes occupy
> >>> 0x8000-0x80ff), so sign-extend from bit 15 before scaling. This fixes
> >>> all three reads and drops the now-unused s8 intermediate.
> >>>
> >>
> >> The PECI error code reference is just confusing AI slop and completely=
 irrelevant
> >> for the patch.
> >>
> >>> Fixes: 92b64580f14b ("hwmon: (max6621) Add support for Maxim MAX6621 =
temperature sensor")
> >>> Cc: stable@vger.kernel.org
> >>> Assisted-by: Claude:claude-opus-4
> >>> Signed-off-by: Cong Nguyen <congnt264@gmail.com>
> >>> ---
> >>>    drivers/hwmon/max6621.c | 11 +++++------
> >>>    1 file changed, 5 insertions(+), 6 deletions(-)
> >>>
> >>> diff --git a/drivers/hwmon/max6621.c b/drivers/hwmon/max6621.c
> >>> index a7066f3a0bb4..03ac3eb5a594 100644
> >>> --- a/drivers/hwmon/max6621.c
> >>> +++ b/drivers/hwmon/max6621.c
> >>> @@ -204,7 +204,6 @@ max6621_read(struct device *dev, enum hwmon_senso=
r_types type, u32 attr,
> >>>        struct max6621_data *data =3D dev_get_drvdata(dev);
> >>>        u32 regval;
> >>>        int reg;
> >>> -     s8 temp;
> >>>        int ret;
> >>>
> >>>        switch (type) {
> >>> @@ -225,8 +224,8 @@ max6621_read(struct device *dev, enum hwmon_senso=
r_types type, u32 attr,
> >>>                         * The temperature is given in two's complemen=
t and 8
> >>>                         * bits is used for the register conversion.
> >>>                         */
> >>> -                     temp =3D (regval >> MAX6621_REG_TEMP_SHIFT);
> >>> -                     *val =3D temp * 1000L;
> >>> +                     *val =3D (sign_extend32(regval, 15) >>
> >>> +                             MAX6621_REG_TEMP_SHIFT) * 1000L;
> >>
> >>                          *val =3D ((s16)regval >> MAX6621_REG_TEMP_SHI=
FT) * 1000L;
> >>
> >> However, as mentioned above, this is not a problem in the first place
> >> but AI not understanding the code and the real problem..
> >>
> >> Guenter
> >>
> >>>
> >>>                        break;
> >>>                case hwmon_temp_offset:
> >>> @@ -239,8 +238,8 @@ max6621_read(struct device *dev, enum hwmon_senso=
r_types type, u32 attr,
> >>>                        if (ret)
> >>>                                return ret;
> >>>
> >>> -                     *val =3D (regval >> MAX6621_REG_TEMP_SHIFT) *
> >>> -                            1000L;
> >>> +                     *val =3D (sign_extend32(regval, 15) >>
> >>> +                             MAX6621_REG_TEMP_SHIFT) * 1000L;
> >>>
> >>>                        break;
> >>>                case hwmon_temp_crit:
> >>> @@ -254,7 +253,7 @@ max6621_read(struct device *dev, enum hwmon_senso=
r_types type, u32 attr,
> >>>                        if (ret)
> >>>                                return ret;
> >>>
> >>> -                     *val =3D regval * 1000L;
> >>> +                     *val =3D sign_extend32(regval, 15) * 1000L;
> >>>
> >>>                        break;
> >>>                case hwmon_temp_crit_alarm:
> >>
> >
> > You're right - temp_input is fine (the s8 already sign-extends -128..12=
7),
> > and the +128/PECI reasoning was wrong. Sorry for the noise.
> >
> > Agreed the real bug is the clamp range: MAX6621_TEMP_INPUT_MIN/MAX shou=
ld be
> > -128000/127000. Would you like me to send a v2 for that, or would you r=
ather
> > just fix it directly?
> >
> > If a v2 is useful: temp_offset/temp_crit also don't use the s8 - they s=
cale a
> > raw u32 - so a negative offset round-trips wrong (write -10 degC -> mc2=
reg
> > 0xfd80 -> reads back 1014000). I can fold a (s16) fix for those in too,=
 if you
> > agree it's a real issue.
> >
> It should be two patches: One fixing the range, the other fixing the nega=
tive
> temperature values in _offset and _crit.
>
> Thanks,
> Guenter
>

Yeah,
I just sent a v2 as two patches: (1) fix the -128000/127000 range, and
(2) sign-extend the _offset and _crit reads.
Thanks,
Cong
