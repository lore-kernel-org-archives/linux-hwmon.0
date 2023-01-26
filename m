Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCAA2C54EAA
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Jan 2023 22:58:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbjAZW6O (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Jan 2023 17:58:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbjAZW6N (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Jan 2023 17:58:13 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 340C8577FE
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Jan 2023 14:58:07 -0800 (PST)
IronPort-SDR: PYD8+c+nRmRLNrBZQg/LvpLCctrt9PsWdgZ3nBxxzhvcH3Q7+JeUXkPE2VVgxl+YKQnW7N7i6Q
 bmBDsfSWozi8NRy1Y/dHAQd6H6K1SKMZQ9djgNpa2tPDL5EvkEWgobaF64HBKbSp5hS4myM6UA
 Wro8lAUY4mC+6/Smo+M5zMR7z3Itkl7WW1/uF8IC+fqXDH73RtyCvvB99gz3CZZBgzTlXh4/+E
 t4raXVwxzBCFvTFHamxXeox/1cOIE2ry91zveUf17x089wx0WAgUAIV5Jho5REUZaIZ2bW1GRo
 Xpnzu2jQEHDVqxc5bcgsiJ7u
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2ByAADeBNNj//Qc8jxaGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAUAJgTUDAQEBCwGCLIJglW0DnVGBag8BDwEBRAQBAYUHAoUjJjcGDgECB?=
 =?us-ascii?q?AEBAQEDAgMBAQEBAQEDAQEGAQEBAQEBBgSBKgcLUgcLWAcHgUELgWETCwMEC?=
 =?us-ascii?q?CUNhlYBAQEDJxkBATcBDwsOCi5XBhOGIaswgQEzgQGCCAEBBoJjmmaBXgmBQ?=
 =?us-ascii?q?AGMXYNOekM/gU6CUYFuPoEFgwIEOYY/jh+NPAqBOXiBJQ6BRoEPAgkCEXQfN?=
 =?us-ascii?q?wMZKx1AAws7Mgo/NQsLShAbGhsHgQYqKBUDBAQDAgYTAyICDSgxFAQpEw0nJ?=
 =?us-ascii?q?mkJAgMiYgMDBCgtCT8HFREkPAdWNwEFAg8fNwYDCQMCH09yLhETBQMLFSpHB?=
 =?us-ascii?q?Ag2BQYcNhICCA8SDwYmRA5CNzQTBlwBKQsOEQNQgU4EL4FiBikmnjlrB4EOg?=
 =?us-ascii?q?XGiRIEyoDCDfIFSn0mBRKdml02nZwIKBxaBeIF/TR8ZgyJPAQIBAQENAQIBA?=
 =?us-ascii?q?QMBAgEBAQkBAQEBgTOMagwLC4IKkUthOwIHCwEBAwmJSoJZAQE?=
IronPort-PHdr: A9a23:Ej/GBx2Bvooo661YsmDPn1BlVkEcU/3cNA8J8dwskbtRfKO589LvO
 VGZ5PkrhUKaFYzB4KdCjOzb+7vlRXRG+5uEt2wPNZ1UAhEJhZ9EwAUpDJyJVRKrfqe4PScwR
 ZwQX1Q9oBmG
IronPort-Data: A9a23:4+kt2aDWDbe13xVW/w3lw5YqxClBgxIJ4kV8jS/XYbTApDsng2FSy
 WMXD2/UPv6CM2b2e911a9myph8B65PUyN5kTldpryFnFS4To8GcVdjFdBagMSjIf8fOEhw55
 JVONdLpIZFvRBcwhD/0YuC79yUUOYJk51bYILSZUsykbVY8EE/NsTo6x6hhxNQAbeGRW2thg
 /uryyHiEAbNNwBcYjp8B52r8HuDjNyq0N/PlgFWiVhj5TcyplFNZH4tDfjZw0jQHuG4KtWHq
 9Prl9lVyI94EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPqsTbJIhhUlrZzqhp4oq6
 vJpmaGMFCwwAZHMk98MCBJ0KnQrVUFG0OevzXmXu82P1AvNaXLzzfJ0AAc7OJBe++oxCHwmG
 f4wdmhLNEzZwbjmhujnFoGAhex6RCXvFI0Fs3dj5TrDBOkoRorPBajP+JlZ0HE5m6iiGN6CO
 5JIMmYyN0uojxtnOXUWVZ8novySuUKvNCIFpHCVtas82j2GpOB2+OO1a4qPII3iqd9utkKZo
 H/WumTmBxYcHMKQxCDD8X+2gOLL2yThV+o6FrG18uBjmlC73XEIBVsdUl7Tif24jFOuc8hYJ
 kcXvzc1664/6CSWosLVAUX9+iLe+0RMHoAMT6sh9AiRy6GS/x6WBy4PSTsHYcFOWNIKqSIC7
 gXSvfTNKQFT7ZaMdk6d/YyF9jieAH1ARYMdXhMsQQwA6tjlhYg8iBPTU9pueJJZaPWoSVkcJ
 BjU8UADa6UvYd0jkv7grQ+e31pAsrCQE1dvvl2JNo6wxlkhDLNJcbBE/nDy0J6sxq6iX1WHs
 WlsdyO2trhWVflheASrTfpFJ7a0+/bNDzTYjEUHInXM32r1viT/J8UKsHQkeBsvKdoNZT7iJ
 lPLtgIX75hWenK3BUOWX25TI5h2pUQDPY6+PhwxUjapSsIvHDJrBAk0OSatM5nFySDBUcgXY
 P93i/qEA3cAErhAxzGrXeob2rJD7nlgmj+MGM+rlEz8ieb2iJuppVEtbQvmggcRsv7snekp2
 4wOXyd3408AC7SlOnm/HXA7cAFRdyNT6W/KRzx/LbbYclA8SQnN+tfN2bxpeop5kr5Tm/ugw
 51OchEw9bc+7FWZQTi3hodLM+u1B80m/SxgZUTB/z+AghAeXGpm149HH7NfQFXt3LULISdcQ
 6ZXdsOeLO5ITzibqT0RYYOk/N5pbh20iwWUM2yoZSV5fpImThGQoo3oeQ7m9S8vCCurtJJg/
 Of5hlqLEcQOF1Z4EcLbSPOz1Ffv73ITr+JFWReaKNdkZxS++YdnHCX9k/srLpxeMh7E3Dabi
 VqbDE5A9+nAqoM46vfTgqWAo9v7GudyBBMKTWLB5Km4MjPWuGem3MlBXKCBYGmFBm/z/ayjY
 8RTzu39aaNYxg8a6tosTbsylPAw/driobNe3z9IJnSTYgT5EK5kL1mHwdJL6P9HyIhZjg3qC
 EiBzcYLa7yGNfTsHEMVOAd4PP+I0usZm2eO4Pk4fBf66Stw8ObVWEleJUPX2iZcMKAzO5ks3
 ukmosJQ5gmizBsmdN+b13gG+2OJJ30GcqMmqpBDXtCx01pymgEcbMyOEDLy7bGOd85IbBsgL
 AiUs6ye1b5S8VWTIXM8GE/E0fdZmZlT6gtBy0UPJgrVl9eZ1OU72gZdrWY+QghPlU8Vjbo2Y
 DQxchclYP/So3FzmMFfXmvqBxlOBVuS/Um3wkZQzD/VSEyhV2rsKmwhOL/ToxpAozsMLmZWr
 OOC1WLocTf2Z8WtjCE8bkg0+fXsQOt4+hDGhM36Td+OGIM3YGS5j6KjDYbSR8AL3S/saJX7m
 NRX
IronPort-HdrOrdr: A9a23:NmkQaqDqCIlilxblHel855DYdb4zR+YMi2TDt3oadfWaSL36qy
 nIpoV86faUskd3ZJlD8ersBEDkex/hHPFOkOss1NuZPTUO/VHYSb2KjrGSuwEIeReQygc178
 4JGJSWSueAaWSS5vyV3ODXKbYdKZW8gdmVbWiy9QYXcehzUdAe0+5mMHfmLqSofng9OXLpfK
 Dsm/Z6mw==
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 27 Jan 2023 09:28:06 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30QMw2Co2380454
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Fri, 27 Jan 2023 09:58:02 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30QMw2Co2380454
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674773883; bh=joBxO67jfR+7d32odxldK60Y1MiPG3MgYkU4Wkrx1Cw=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=mOUT4GiU+oFPCp/FSj/CySu5ZyVjmEHfFTjpzuDFhpGZ2Bq4Osy66dPEygKl3Kmr5
         Z2tR6qmBvUlkWXyOhyPBfrJ+0gTPumFNDYE7TjaRQR+B3YSCIn6UgVemrNHpJQPDse
         vh2zWHevJYsT4RAbLnexy9qUSv9T5SbfTQb7UTc7MhiiV3dNDfjuf5kbU81bf89q7W
         nSMeVWvIC3ACJbVH1+7hpn/I+aa8YZmps2XLYeEqLb4293E6t/g4ctmehWmREDxSmS
         a/xvDvr8CqidD1QbMrflnqSZxOKkZU2DaQiszXfIueQHtIoD9/0/nRW6eR1rLpKAje
         w/qJofIx03ARQ==
Message-ID: <d228130f122f5f3f4c3dce2d14d6aca676e3888d.camel@crawford.emu.id.au>
Subject: Re: [PATCH v1 6/7] hwmon: (it87) Add new chipset IT87952E
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Date:   Fri, 27 Jan 2023 09:58:02 +1100
In-Reply-To: <20230126135314.GB1635195@roeck-us.net>
References: <20230126040223.986189-1-frank@crawford.emu.id.au>
         <20230126040223.986189-7-frank@crawford.emu.id.au>
         <20230126135314.GB1635195@roeck-us.net>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Fri, 27 Jan 2023 09:58:03 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, 2023-01-26 at 05:53 -0800, Guenter Roeck wrote:
> On Thu, Jan 26, 2023 at 03:02:22PM +1100, Frank Crawford wrote:
> > Add IT87952E, a new chip ID (DEV ID 0x8695), which appears to be an
> > updated version of the IT8792E and takes the same configuration.
> >=20
> > The model name comes from the model name printed on the chip.
> >=20
> > There is no datasheet publicly available.
> >=20
> > Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> > ---
> > =A0drivers/hwmon/it87.c | 17 ++++++++++++++++-
> > =A01 file changed, 16 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> > index e8eeedd23bee..85ecc61dbf9e 100644
> > --- a/drivers/hwmon/it87.c
> > +++ b/drivers/hwmon/it87.c
> > @@ -34,6 +34,7 @@
> > =A0 *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 IT8786E=A0 Super I/O chip w/LPC =
interface
> > =A0 *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 IT8790E=A0 Super I/O chip w/LPC =
interface
> > =A0 *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 IT8792E=A0 Super I/O chip w/LPC =
interface
> > + *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 IT87952E=A0 Super I/O chip w/LPC i=
nterface
> > =A0 *=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 Sis950=A0=A0 A clone of the IT87=
05F
> > =A0 *
> > =A0 *=A0 Copyright (C) 2001 Chris Gauthron
> > @@ -63,7 +64,7 @@
> > =A0
> > =A0enum chips { it87, it8712, it8716, it8718, it8720, it8721, it8728,
> > it8732,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 it8771, it8772, it8781, it8782, it=
8783, it8786,
> > it8790,
> > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 it8792, it8603, it8620, it8622, it86=
28 };
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 it8792, it8603, it8620, it8622, it86=
28, it87952 };
> > =A0
> > =A0static struct platform_device *it87_pdev[2];
> > =A0
> > @@ -160,6 +161,7 @@ static inline void superio_exit(int ioreg, bool
> > doexit)
> > =A0#define IT8622E_DEVID 0x8622
> > =A0#define IT8623E_DEVID 0x8623
> > =A0#define IT8628E_DEVID 0x8628
> > +#define IT87952E_DEVID 0x8695
> > =A0#define IT87_ACT_REG=A0 0x30
> > =A0#define IT87_BASE_REG 0x60
> > =A0
> > @@ -470,6 +472,15 @@ static const struct it87_devices
> > it87_devices[] =3D {
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | FEAT_SIX_TEMP | F=
EAT_VIN3_5V,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.peci_mask =3D 0x07,
> > =A0=A0=A0=A0=A0=A0=A0=A0},
> > +=A0=A0=A0=A0=A0=A0=A0[it87952] =3D {
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.name =3D "it87952",
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.model =3D "IT87952E",
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.features =3D FEAT_NEWER_=
AUTOPWM | FEAT_16BIT_FANS
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | FEAT_TEMP_OFFSET | =
FEAT_TEMP_OLD_PECI |
> > FEAT_TEMP_PECI
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 | FEAT_10_9MV_ADC | F=
EAT_IN7_INTERNAL,
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.peci_mask =3D 0x07,
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.old_peci_mask =3D 0x02,=
=A0=A0/* Actually reports PCH */
> > +=A0=A0=A0=A0=A0=A0=A0},
> > =A0};
> > =A0
> > =A0#define has_16bit_fans(data)=A0=A0=A0((data)->features &
> > FEAT_16BIT_FANS)
> > @@ -2501,6 +2512,10 @@ static int __init it87_find(int sioaddr,
> > unsigned short *address,
> > =A0=A0=A0=A0=A0=A0=A0=A0case IT8628E_DEVID:
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sio_data->type =3D it86=
28;
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0break;
> > +=A0=A0=A0=A0=A0=A0=A0case IT87952E_DEVID:
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0sio_data->type =3D it8795=
2;
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0doexit =3D false;=A0/* Se=
e IT8792E comment above */
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0break;
>=20
> Is that true for this chip as well ? I would have hoped they fix
> the problem for an updated version of the same chip.

Unfortunately my testing has been through others for this chip, and the
effects have been similar to the IT8792E, i.e. sometimes found
sometimes not.  I can't be sure if the testers did something wrong, but
I felt it was better to assume that part of the firmware is unchanged
and still contains the same bug.
>=20
> Thanks,
> Guenter

Regards
Frank
>=20
> > =A0=A0=A0=A0=A0=A0=A0=A0case 0xffff:=A0=A0=A0=A0/* No device at all */
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0goto exit;
> > =A0=A0=A0=A0=A0=A0=A0=A0default:
> > --=20
> > 2.39.1
> >=20
