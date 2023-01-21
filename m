Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B09C38142
	for <linux-hwmon@archiver.kernel.org>; Sat, 21 Jan 2023 23:31:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjAUXbS (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 21 Jan 2023 18:31:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjAUXbS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 21 Jan 2023 18:31:18 -0500
Received: from ipmail03.adl6.internode.on.net (ipmail03.adl6.internode.on.net [150.101.137.143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6D94B1F93F
        for <linux-hwmon@vger.kernel.org>; Sat, 21 Jan 2023 15:31:14 -0800 (PST)
IronPort-SDR: zut2XZjlafBHJjOTxiHiSW5KlSNcmgyqiMmt0/K3nN9+g00Xz9S1MaL/cQXuPUnLAKjAlyT+f0
 +buC+hjdn6krES2fEOjuizpACjuvVnQn22vPAwma/sr57Ngn1oKHE4hTl7v4CCSolm8fQVhPHs
 WocLM/8DVHtD1QKDiecroSeq7QOWNinse8Ug5wl3kcFQBk2ajd542L4DBdd7uNXJxlXSEAC2qr
 /Ij9L0d9nNpkItpnhohxm0UHIjydf3sd0+h9xf1Ah6r0oaL909Xz/6L1ppyWUcx/xA6XoV2eEV
 cdccY6osy30Lu2kD6o46X6CB
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2APAACLdMxjjPQc8jxaGgEBAQEBAQEBAQEDAQEBARIBA?=
 =?us-ascii?q?QEBAgIBAQEBQAmBMwQBAQEBCwGCLIJflXCdPoF+DwEPAQFEBAEBhQYChSAmN?=
 =?us-ascii?q?QgOAQIEAQEBAQMCAwEBAQEBAQMBAQYBAQEBAQEGBBQBAQEBQBgBOQcLUgcLW?=
 =?us-ascii?q?AcHgUELgWETCwMxDYZWAQEBAQIBQAEBNwEPCw4KLlcGARKCfoMAI6ZAeIE0g?=
 =?us-ascii?q?QGCCAEBBoJjmmaBXgmBQAGMb4M3ekM/gU6EPz6ERIY/mxMKgTt9gScOgUaBE?=
 =?us-ascii?q?gIJAhJpNwMZKx1AAws7MgpANQsLSisaGweBCCooFQMEBAMCBhMDIAINKDEUB?=
 =?us-ascii?q?CkTDScmaQkCAyFfBQMDBCgtCT8HFREkPAdWNwEFAg8fNwYDCQMCH09yLhETB?=
 =?us-ascii?q?QMLFSpHBAg2BQYbNhICCA8SDwYmRA5CNzQTBlwBKQsOEQNQgU4EL4FiBikon?=
 =?us-ascii?q?xeBDoE4on2BMqAwg3yBUp9JgUSnZpdNIKdHAgoHFoFjAYITTR8ZgyJPAQIBA?=
 =?us-ascii?q?QENAQIBAQMBAgEBAQkBAQEBjh0MDQkVgXWMOGE7AgcLAQEDCYwjAQE?=
IronPort-PHdr: A9a23:hT3++xMB5MQ1cKPzz5cl6nczWUAX0o4cdiYf64Y8zblUe7ut+I7ue
 kHa+LNsgBnAQNaT4uhP3uzRta2oQmkc+dCbvXUFbJEJVgdQh8kaxV5/CceJW0Gnc664Nn5oF
 84bDA1u9CnkWXU=
IronPort-Data: A9a23:DglaSK3NYMdbal/dJvbD5et3kn2cJEfYwER7XKvMYLTBsI5bpzBWm
 mQeWm/SO62MNDDxf9t3PYW28EoHsZ/RmNBqSgo9qSpjF3lE9ZqeC47FJ0urZnjNf5CSEUs3s
 J9ONNXNIp4dQy6HrH9BEJC4/SEmj/3gqpkQqQLgEnosLeOxYH550XqPo8Zg3sgwx4LR7zql4
 bsemeWGULOY82cc3lw8u/rrRCxH5JweiBtA1rDpTa0jUPf2zhH5PbpHTU2DByKQrrp8QoZWc
 93+IISRpQs1yfuM5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2Pc0MS9qZzu1c99Z8
 uQK5MK/cA4VYfPxpvsNWgVmQxtzMvgTkFPHCSDXXc27xUzaaD3n2fxxAkYsMcsV//sxAG0I/
 OFwxDIlMEjF3b7shujrDLMw2qzPL+GyVG8bkn96xDfaJf08SI/NRL/Go9JdwXExioZHAJ4yY
 uJDOGQ2NU6QPkYn1lE/MJQVsqCO3GXDXX5yhwq//aAqv2f55VkkuFTqGIGNIYzQH5Q9clyjj
 mbH+XnpRxEFMduZ4SSK/2jqheLVmy7/HoUIG9WQ9PJnhEOa3GE7EwANWB2wpvzRokq/Xc9PA
 1YT9yEt6LUpskqmUrHAswaQ/ibB5EJGHoAAVrdmtEeW1qPI4g3fGnALT3hKb9lgvdJeqSEWO
 kGhpeKuVGJgibSpFiygyKiEpC+MaRIYIjpXDcMbdjct797mqYA1qxvASNd/DaK45uEZ/xmum
 1hmSwBg2t0uYd43O7aTuAuc0231+vAlWiZsu1yNBjr7hu9sTNT9D7FE/2Q3+t5pEe51pHG6r
 XQCltn2AAsmV8nVzERhrM0rEa7h3PGYLD2UvldrEoJJythA0yD7ONoMunQkdAIzbppCYiPgf
 E7Y/x9J654VN3yvK6ZqC25QNyjI5fS+fTgGfqqPBjarXnSXXFXalM2JTRTOt10BaGB2zckC1
 W6zKK5A90oyB6V91yaRTOwAy7ItzS1W7TqNGsyglUn3iubGPCL9pVI53L2mMLlRAESs/li9z
 jqjH5Hao/mieLehOHiIod57wa4icyBnXc+eRzNrmh6reVI9SDt7Wpc9MJs9Y4MtnqJJm/3O8
 23VZ6Or4ASXuJEzEi3TMioLQO21Av5CQYcTYXRE0aCAhyF9Pe5CLc43K/MKQFXQ3LA7kqYtF
 6BcKpjo7zYmYm2vxgnxpKLV9ORKHClHTyrXV8Z8SDRgLZNmWSLT/droIlnm+CUUV3rlvtE3v
 LOnzA+dTJ8eAQVuSs/LMar9w1S0tHkbueRzQ0qRfIYKJxi1oNcwJnyjlOIzLuENNQ7HmGmQ2
 TGWNhFE9+PDlJBkotDGiJeNo5qtD+YjTFFRGHPW7OjqOCSDpjijzIZMXfymZzfYUG+oqqyua
 f8Mn6P3KvQYklFQv8xxFqstzK547sa2/+1WyQFtHXPqaVW3C+o+fSDZgJAf6fdAn+YLtxG3V
 0SD/shhFY+IYM61QkQMIAcFb/iY0a9GkDfl7cMzfBfw6hhoreiOXkhlNhWRjDBQceluO4Q/z
 OZ/5MMb5lDtihcuNdra3ClY+37WdS4KUrk88JoACZDljRAnjFxHfNrdBmn//cjXOdlLN0ArJ
 B6ShbbD3uoDnxWfKipsT3Wdj/BAgZkuuQxRyAFQLVq+mu3D2q090ipOoGY+QQlixxla1/5+Z
 zpwPEpvKKTQozpl2JpZU2a3F10TDRGV4BermQVR0TeFFQzyBimXcDF7IvqE4EEStX5EcTkd9
 7adjm/4CG64cMb01yo0eEhkt/26E4MoqVCbyJ/9EpTXBYQ+bBrknrSqOTgCpSzhUJE4i0Dwr
 OV3+Pp9NP/gPikKrqxlV4SX2Nz8kvxfyLCunB25wJ40IA==
IronPort-HdrOrdr: A9a23:cdeKtqsMsbBjlt+bdNd2/VC/7skDptV00zEX/kB9WHVpm6yj/f
 xGUs5rtiMc7wxhPk3I+OrwX5VpIxvnmKKdhLN8AV7MZniFhILFFuBfBM7Zsljd8k7Fh5ZgPM
 VbHJSWYeeYZTNHZITBkW2F+r0bruVvnprJuQ6T9QYVcenkBpsQlDuREjzrbXGeWjM2eabRy6
 DsnPaudlKbCAkqUvg=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl6.internode.on.net with ESMTP; 22 Jan 2023 10:01:11 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30LNUwlH3397884
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sun, 22 Jan 2023 10:30:59 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30LNUwlH3397884
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674343859; bh=TDGOIBKd0/tzykq9V9O/DoqFucy1PJ1P5LJMTWB3+dg=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=jZjgIColE5zXz1iTk/jVbKWhw+PIs9Po24MAXa2GPIJr5r0uGsHxC2x4ygSv9ZBI3
         YZ/DvTQLVCy1U2JPbJpXwfqZA2f3vijYGszOY8tkCk/Vx2kj4WzoF6C7wMhYLpJzc+
         bVN88BnOEWnROfRI3+2BG05DEET/1mN9CPVw4reTVlI94kwLNYqamKXEJiGBF/G94n
         J0TyvJdZvGlnygcNmxSiAR7ipkT47AEsMhOp09xO65dwd1MNqMmzP37hp7SOO77GRc
         tMwoCyBnt0xchnLgRf3rAx5DFWCiHlRypJniVoCh4DtJnU/pT1RNiB9YgsGbM7YqDD
         ZdEtAtKjEw8zg==
Message-ID: <77a8ef5fb54b9a9c9e9bd6147ff4c371aa55b588.camel@crawford.emu.id.au>
Subject: Re: [PATCH v1 2/2] hwmon: (it87) Added driver version to
 distinguish from dev version
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-hwmon@vger.kernel.org
Date:   Sun, 22 Jan 2023 10:30:58 +1100
In-Reply-To: <31a6d8dd-b501-6e9c-aa80-d695f8aab186@roeck-us.net>
References: <20230121085754.1693336-1-frank@crawford.emu.id.au>
         <20230121085754.1693336-3-frank@crawford.emu.id.au>
         <31a6d8dd-b501-6e9c-aa80-d695f8aab186@roeck-us.net>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sun, 22 Jan 2023 10:30:59 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, 2023-01-21 at 06:04 -0800, Guenter Roeck wrote:
> On 1/21/23 00:57, Frank Crawford wrote:
> > Add a driver version and log it on load, to make it easier to
> > distinguish between the in-tree version and any development version
> > from
> > an external source.
> >=20
>=20
> Sorry, no. Name your out of tree version as you want.

Okay, fair enough.

Do you want the other patch in the set resubmitted separately, or will
you assess it as is?

>=20
> Guenter

Regards
Frank
>=20
> > Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> > ---
> > =A0 drivers/hwmon/it87.c | 5 +++++
> > =A0 1 file changed, 5 insertions(+)
> >=20
> > diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> > index a8a6a0ffee82..632ab3d50bc6 100644
> > --- a/drivers/hwmon/it87.c
> > +++ b/drivers/hwmon/it87.c
> > @@ -59,6 +59,8 @@
> > =A0 #include <linux/acpi.h>
> > =A0 #include <linux/io.h>
> > =A0=20
> > +#define IT87_DRIVER_VERSION "v1.0-official"
> > +
> > =A0 #define DRVNAME "it87"
> > =A0=20
> > =A0 enum chips { it87, it8712, it8716, it8718, it8720, it8721,
> > it8728, it8732,
> > @@ -3398,6 +3400,8 @@ static int __init sm_it87_init(void)
> > =A0=A0=A0=A0=A0=A0=A0=A0bool found =3D false;
> > =A0=A0=A0=A0=A0=A0=A0=A0int i, err;
> > =A0=20
> > +=A0=A0=A0=A0=A0=A0=A0pr_info("it87 driver version %s\n", IT87_DRIVER_V=
ERSION);
> > +
> > =A0=A0=A0=A0=A0=A0=A0=A0err =3D platform_driver_register(&it87_driver);
> > =A0=A0=A0=A0=A0=A0=A0=A0if (err)
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0return err;
> > @@ -3470,6 +3474,7 @@ MODULE_PARM_DESC(fix_pwm_polarity,
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 "Force PWM polarity to=
 active high (DANGEROUS)");
> > =A0=20
> > =A0 MODULE_LICENSE("GPL");
> > +MODULE_VERSION(IT87_DRIVER_VERSION);
> > =A0=20
> > =A0 module_init(sm_it87_init);
> > =A0 module_exit(sm_it87_exit);
>=20
