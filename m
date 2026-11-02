Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793639359;
	b=2UahlVlnHwE6rOk4/Cm0nCCt1ZGbAXaAaMOsRvHuDSO90COOaDCYUHx0E1DeVmJy95uU
	 r9JVMaChnulOE/xzFLWsJU0kibjvOeSv3aWfcTXVuXoGl74Hj2zI8Zs2TkXt8AvB+5UKy
	 NPow5GuEgL1hhO24GztB6RaBGtCj1Jy7xAAu3vUyg0OZE0zs/SnlssLsHgfxEWGaM7/GG
	 s5CPlBdXISgH/h18LEDfG6xtx5Z9pjfAMLqcoSgmT5BQjebGpxNN1GVRgiqA4BfYJeSkU
	 XzFeV8S9RyiFZpnbdaNzjGeOyScetpmtSW5FXlnbh8tZFw1opvSu05AqX6z9iJFOzAQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639359;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=D2kI2cJmhka2UbJogvZr2p/l/soLn2HY1MgkmJ1YjWo=;
	b=A80h+SRxT1LORBFg/C8Bg5MHdirlH8qVvUSyJP+6nGneCJVrwUDGAj/e0t+C16u3ACg8
	 IJIpiSiGD5fnApHQ7uy/tHUto19j2GRbYQvInnoyORXeetpiUuHqGHPS8ryX29z9RaAvt
	 FJ5mjjNAZU9sd8DAoC6ZUt4cEnLsWdN6bse2LN74cOBWtvmE93H/i6Nb7QkG21bO3CsjH
	 ntKXH0G8DNSwsXANC+6ytNehzXciRA6XANTvaLXNi9fd2lB+mX7NUtZF/EMSDiw9hY5xI
	 77WgHLx45eLtb+h5OYemVVMQ1ILHyWgM65xM8WlSpR57oELS2szxxMqI22JkCzjR6BA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qZG/DAP9";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C47160716E2
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Nov 2026 17:09:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C47160716E2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qZG/DAP9
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e9e53d011eso26233155ad.1
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Nov 2026 09:09:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793639359; cv=none;
        d=google.com; s=arc-20260327;
        b=Rdv8J3flxocokrLPFUjCWoymIY3f5P7Q/jBbLmLXO8J+a9ITnrKJcEMElfup9uUfKf
         p5wNBMQMAs66/dyZvObsngM12oCfaBNYvTtLSbOoAGOGHAJ1AYBE7i1IeA5rJ6b5oQ4E
         Q7pMWHtloqtipXyHscdAC4mCRH+J009Day2tdBz1HO72UYZmtLUpRFC+IPlgJBLUHAsg
         8Zr/kps/87gs7Xx9LKmhl0yo2FR0BMqaGXv3iQxlBgS3louo2sdOd4AH1r9evfksok3j
         6iNC8hM4HMSqrvgUqQRDak8BUZwKQwXjsL6h/OQRd5XyUQGvqmWvi/xMfF6gXmT4tbS6
         BT3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D2kI2cJmhka2UbJogvZr2p/l/soLn2HY1MgkmJ1YjWo=;
        fh=eMN+c//3djJVo3WF1qbzQrugUNEJ6ke1YC0w6djYHGk=;
        b=Kg8kI3kUkuHe2f3vb6r15oly2yejNj1XPrCXF9zz0hkMGoOs8BNlv6g68CQBJ/8WuZ
         wsifuSsZad15DGCokczSqlRfYPKysOW6YiEIPKI12hQ3Vw3Lh7keSPWy673nf875ZGSr
         H+DHnEVJXGBSGv3zcuUm6pxsGsdgdRW3s3JUrVDZT/RmSDa/ux1hFt2tFAl5XsweCtEQ
         AU2qTBJ3MZS75OiG9cW2K9e+9NFkR1lTd6VX34K5l9YHSAFbeDJC81fgqha3eh8T42o7
         +GeebHg2V0o9iD2wNsaZ113arWk6Lj+N74R8nLRSCdmj/41e8egkvjufvHxl8hOZ9J3d
         wxTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793639359; x=1794244159; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D2kI2cJmhka2UbJogvZr2p/l/soLn2HY1MgkmJ1YjWo=;
        b=qZG/DAP9EpMtV6yowajORYFDYgnMFqjU7gPigRDZ/sYGkfOtenh6u6wxPmZWF6dTEg
         uXKoUdjpSPsjOyt+OSqzJuyhkbL0hI1T7eVHwdUamiSIOgm4PbYONkQgplXW++9CbwVT
         gGckQ1hqD754TK9lLUfgyYikkPgukXiR4PWrWj2FQ97xyAjBVvYooXJS/txtq7LzQnvY
         pQ1fD0aTxuO5/lDX2K1oVxVwIXFbtBxodEOM8NVBtV70Pzw8kAPJ2nMyxXNqbdltxHmQ
         QbK4zpfefwau1qInM6yIzoajMWPEqX0O5DMlCfNGYxtasOfmi+0A14eO1RdlSRAU7Vrn
         rkqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793639359; x=1794244159;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D2kI2cJmhka2UbJogvZr2p/l/soLn2HY1MgkmJ1YjWo=;
        b=GTGGDpvVkCYODjV15IG8dyXlxaHUlXP7we84Je/s4G06/IWZG9s9yRcETmpzlv0Jxb
         T4aNXlSp28d7e8YqSLoExJv711c6FjOWDH6c8caRHTFyoBLZOKUC/KgBO8wEndsSGccP
         VrGOlkUQpzHxDHUtSLPdbwGbZmAQGUdylWefoBJLLvMfVZD96tnWkQgWIXQJ+/2EmThV
         m21N/tksqNBRUQcDFdPO11Xa0Z6m5conwl+tTrM7ynycbExCrT4TUUofu+HPcAlBejL7
         iq1j0bsb71qouyGRVmqYHZrIASfY3JZPDwt+/LS2doBDIQIV0FNeyhpkCKUV9UCux2aK
         LQnA==
X-Forwarded-Encrypted: i=1; AKwUvBzeg4n5WWjpXQqT8oqdD871r9gKoxLFIJ4weBdhjzr3L/lB0oQnzXku5AKSZaq4jqMQ+EoZQo3N+PkRRw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+sydCxhSesiUoaMMpDRF4K4pVyLXxDL9GSuoXyqDI8cydtBqEl
	zQGHbFAkzS5j2R4ZB23HsqJwadMriCDPH4wSwIogu1M1sbGi6jxs/Hfdz6+zP9wfdkIdrNtblJj
	FQyYYju8FPQXqpnDX2w+XtLMREyMBc+I=
X-Gm-Gg: AYBFou1HlaZZs9ub4Bsxw9DfKfL/uXDwIRdzL6NhdzHPb11fNYkq9TWNxxLQHXNNy55
	QV9h9wnHfJtiVLcUkcW3Wxmrxz627Mxy6+EO399GHl2JB6NPs8+v18QJy9EQGxdsPYgtcMQ6jbn
	V0ykeNCEeW1Is+PIJk/AUB5WyzKBkziMGMLTK5jLRxZNL1i40TZq1PPWNINCnrfmf0kHhevFKPc
	C7euU3fDYuOKPrVqVd2XEq5OWbVuuO+hbAu/6brFRkXJgTJNid+cvqBs/3mbT9J3fOq90Hg4L/X
	+iqv4gc6rnjL9CCIip2iQZs5ziCwg/Gxk3Z/rofORtBbWc7gjRRmF+C3Vd/E3Xrdzkj0RU70JBl
	Hb2ZB+z5tTLoSsHs7rOlwFqgc6BSbl40hIPGxrRylfUFEXbqniEtG
X-Received: by 2002:a17:903:124a:b0:2cc:6018:f030 with SMTP id
 d9443c01a7336-2eb36495fe9mr103186595ad.14.1793639358420; Mon, 02 Nov 2026
 09:09:18 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101223125.302001-1-pmazzini@gmail.com> <20261101223125.302001-6-pmazzini@gmail.com>
 <2c48d47a-85f5-48e8-a675-239b033eb0ce@roeck-us.net> <20261102112522.76e02b83@kemnade.info>
 <54497841-56cd-4a41-9f42-e4e6f9c17b51@roeck-us.net>
In-Reply-To: <54497841-56cd-4a41-9f42-e4e6f9c17b51@roeck-us.net>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Mon, 2 Nov 2026 17:09:03 +0000
X-Gm-Features: AclHuK-4o-94Gye_cwvUE8cxTJMD-fDe29dNuoUHFNwsKrrKn9e8LbK9-VQetWY
Message-ID: <CAAxh=jvFn1MfEbmqtQsanMrOzrp_t2L5aX6fBCLzpmRa9=9aoA@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] hwmon: sy7636a: read the temperature only while
 the rails are on
To: Guenter Roeck <linux@roeck-us.net>
Cc: Andreas Kemnade <andreas@kemnade.info>, Alistair Francis <alistair@alistair23.me>, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OK, I will explain it in a comment in v3, including the limitation.

On Mon, Nov 2, 2026 at 2:43=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 11/2/26 02:25, Andreas Kemnade wrote:
> > On Sun, 1 Nov 2026 19:35:16 -0800
> > Guenter Roeck <linux@roeck-us.net> wrote:
> >
> >> On 11/1/26 14:31, Pablo Mazzini wrote:
> >>> The driver enables VCOM at probe, which keeps the panel's high voltag=
e
> >>> rails on for good, and gets a dummy regulator if it probes before the
> >>> regulator exists. Read the temperature only while the rails are on, w=
hen
> >>> the chip samples it, and return -ENODATA otherwise. Read power good w=
ith
> >>> it in one transfer, so the value can not be from before the first sam=
ple
> >>> or after the rails went off. Register it under the chip name, as the
> >>> TPS65185 and FP9931 drivers do.
> >>>
> >>> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> >>> ---
> >>>    drivers/hwmon/sy7636a-hwmon.c | 25 ++++++++++++++-----------
> >>>    1 file changed, 14 insertions(+), 11 deletions(-)
> >>>
> >>> diff --git a/drivers/hwmon/sy7636a-hwmon.c b/drivers/hwmon/sy7636a-hw=
mon.c
> >>> index f01f368d68e5..475aff997c2d 100644
> >>> --- a/drivers/hwmon/sy7636a-hwmon.c
> >>> +++ b/drivers/hwmon/sy7636a-hwmon.c
> >>> @@ -14,7 +14,6 @@
> >>>    #include <linux/module.h>
> >>>    #include <linux/platform_device.h>
> >>>    #include <linux/regmap.h>
> >>> -#include <linux/regulator/machine.h
> >>>
> >>>    #include <linux/mfd/sy7636a.h>
> >>>
> >>> @@ -22,14 +21,22 @@ static int sy7636a_read(struct device *dev, enum =
hwmon_sensor_types type,
> >>>                     u32 attr, int channel, long *temp)
> >>>    {
> >>>     struct regmap *regmap =3D dev_get_drvdata(dev);
> >>> -   int ret, reg_val;
> >>> -
> >>> -   ret =3D regmap_read(regmap,
> >>> -                     SY7636A_REG_TERMISTOR_READOUT, &reg_val);
> >>> +   u8 buf[2];
> >>> +   int ret;
> >>> +
> >>> +   /*
> >>> +    * Read power good and the thermistor in one transfer: the thermi=
stor is
> >>> +    * only sampled while the rails are on, and power good comes afte=
r the
> >>> +    * first sample
> >>> +    */
> >>> +   ret =3D regmap_bulk_read(regmap, SY7636A_REG_FAULT_FLAG, buf, siz=
eof(buf));
> >>>     if (ret)
> >>>             return ret;
> >>>
> >>> -   *temp =3D (s8)reg_val * 1000;
> >>> +   if (!(buf[0] & SY7636A_FAULT_FLAG_PG))
> >>> +           return -ENODATA;
> >>> +
> >>
> >> I had a look at the datasheet. It does not say anything about the
> >> temperature not being measured when PG is not set.
> >>
> > That is what I read from there, too. But the PG bit will only
> > be set if the On/Off bit is also set.
> >
> >> The datasheet does suggest that temperatures are only measured
> >> if bit 7 of the operation mode register is set, but that is
> >> different from the "power good" bit in the fault register.
> >>
> > I can confirm from tests that temperature reads zero if regulator
> > was not yet powered on.
> >
> > I read the datasheet in that way so things happen it that order:
> >
> > 1. on bit is set
> > 2. ramping up voltages start / temperature sampling starts.
> > 3. after some time (sampling time + conversion time (ADC_SPL+ADC_DEL)?)=
,
> >     the first sample is ready and the temperature can be read.
> > 4. after some more time voltage lines stabilize
> > 5. after 1.5 ms PG is asserted
> >
> >> So why the association with the PG bit and not with the On/Off bit
> >> of the operation mode register ? That warrants some more explanation.
> >
> > That should definitively be commented in the code. I have pointed out
> > races earlier. This has of course the drawback that it limits the time
> > frame in which reads are possible a bit. I doubt it is worth dealing wi=
th
> > synchronisation code to use that on/off bit (although posssible).
> >
> As mentioned in the other mail, downside is that the temperature will not
> be reported if EN=3D1 and PG=3D0 (for whatever reason), even though
> the temperature may be available. At the very least the reason for
> accepting this limitation will need to be explained in the driver.
>
> Guenter
>
