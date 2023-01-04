Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B68C3DA7D
	for <linux-hwmon@archiver.kernel.org>; Wed,  4 Jan 2023 00:43:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234227AbjADAnp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 3 Jan 2023 19:43:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229712AbjADAnk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Jan 2023 19:43:40 -0500
Received: from ipmail03.adl6.internode.on.net (ipmail03.adl6.internode.on.net [150.101.137.143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 19F22164A4
        for <linux-hwmon@vger.kernel.org>; Tue,  3 Jan 2023 16:43:38 -0800 (PST)
IronPort-SDR: kTHxLLzbn6COL8O0CmIRf6ifac2QlGbB9bk+FB0HFOX2OJYZNgjoIjC8pJeVyiYSg/an7DNfjm
 XcNBhdAUxHysNcHIkaMLZwRJDaPvmHVPrA2aYG6hhYTz2ejDsK9bZSMKNhgQjQ9yrO0c+rLuaI
 he9zigyAy2tIjRab6qAxQvLd1AWlhKy83x7egn4oFpWhQ4/enIFKi89M73lOr/cK3ykZZW7i+z
 ZNVVj/1mCDSAgXvDY2UlbQlRYLqDd1twmoN1Ow8lYXVHyUt56hiZ1KytzVDZ51/V+NZwzX/Mkb
 ZvUKUlRK4zazuDZJbV5qwxyZ
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2BIBACGyrRjjPQc8jxaHAEBAQEBAQcBARIBAQQEAQFAC?=
 =?us-ascii?q?YFGgi2CX5VtA583DwEPAQFEBAEBhQUChREmOBMBAgQBAQEBAwIDAQEBAQEBA?=
 =?us-ascii?q?wEBBgEBAQEBAQYEFAEBAQFAUgcLUgcLWAcHgUELgWETCwMxDYZWAQEBAQIBQ?=
 =?us-ascii?q?AEBNwEPCw4KLlcGE4J+gwAjriR4gTSBAYIIAQEGgmOaZYFeCYFAkCl6Qz+BT?=
 =?us-ascii?q?oEVgTyBbj6DfEiGPowujGcKgT18gScObDcDGSsdQAMLOzIKQDULC0srGhsHg?=
 =?us-ascii?q?QoqKBUDBAQDAgYTAyICDSgxFAQpEw0nJmsJAgMiYQUDAwQoLQlABxURJDwHV?=
 =?us-ascii?q?jcBBAMCDx83BgMJAwIeT3IuERMFAwsVKkcECDYFBhw2EgIIDxIPBiZDDkI3N?=
 =?us-ascii?q?hMGXAEqCw4TA1CBTgQvgV0KBikonACBCB9vgXEIe6E2gTKMJpQAg3iBUJ9Cg?=
 =?us-ascii?q?USCNaUrLZcZgkufSoVAAgoHFoF5gX5NHxk7gmdPAQIBAQENAQIBAQMBAgEBA?=
 =?us-ascii?q?QkBAQEBjh0ZghOMOGE7AgcLAQEDCYlbgkgBAQ?=
IronPort-PHdr: A9a23:ZGRpRxSVVh3k6W7DxVNLELr1P9pso4vLVj580XJvo7hPbr/l9I7rI
 0LY//krgVrUG4TXrftZ2KLfqau1X2sG7N6atWwaNoZBUhgZhIAXh1kuDMLfWxLyJfK4Y3BlT
 JYbBg1u9SjjY0NeQJmWWg==
IronPort-Data: A9a23:yJWkaqkk0AFqjkH2P1U0LEXo5gy8IERdPkR7XQ2eYbSJt1+Wr1Gzt
 xIaWD2FPvmNM2b8eot0Ptzi9xtX6pfcmNdgT1Y6qXtnRHtH9ZOfVIrFdxaqY3+fcJedRh86s
 5hHMIOdccs5Ey6Bjxr8abKJQVtUjPHQHOCgYALn1oGdYSc+FU/NXDo6w7ZRbrZA2IT/W0XX0
 T/Li5W31GWNglaYD0pNg069gEM31BjNkGtwUmwWPZina3eD/5W9JMt3yZCZdxMUcKENdgKJb
 7qrIIWCw4/s10xF5uVJM1rMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKtao23hojx/9
 DlCnYWuRQhzJ/PNov5DYStbPxkuBJ1I5IaSdBBTseTLp6HHW3Ht3+4oB1s/IoMf4OoxDGRTs
 /0UbjkQBvyBr7zuhujnEK821oJ5cJWD0IA34xmMyRnXF/8gQrjIWazV69hC0HE9g90IHPqYb
 tdxhT9HNkWdP0IRagtPYH44tMj2qXjcLBBklE6U+pYtsnXSki1Sy4G4ZbI5ffTRHZ4FxBzJz
 o7cxEz9AxcHJJmf1j+C9FqyieLV2yD2QoQfEPu/7PECqF+fy2gNAQcbfUCmuvT/gUm7M/pbK
 koJ6gI0qqU59wm2VZ/7UgHQnZKflkBEHoAMSahguETXlvaS+BqQGmkPCCJZZ91gv8gzAzU3v
 rOUoz/3LSVxvLLPUCyczK3KnwGxFRBFFF8MeRZRGGPp/OLfiI00ixvOSPNqH6i0ksD5FFnML
 9ai8nlWa1I705Vj6kmrwbzUq3f3/ciWF1JdChH/Bz/8tFshOuZJcqT1sTDmAeB8wJGxZ2TpU
 JIsoNmS6u0fZX1mvHbVGL1l8F2BwfuaeAbbnEJvV6Yo8zm2k0NPkKgOuHQkeB0saJZBI2O1J
 lTPsB9Q79lPJHSrK6RwZsS4FqzGLJQM9/y5DZg4jfIUOfCdkTNrGgk0OiZ8OEi3ziARfVkXY
 8vzTCpVJS9y5V5b5DS3XfwB9rQg2zozw2jeLbiikUv9juXGOiTKEehVWLdrUgzfxP3VyOky2
 4gEX/ZmNz0ECYUSnwGNrtVIdgBSRZTFLcyo85cPHgJ8HuaWMDp5UK+Lm+JJl31Ng7xa3ubO4
 nynXEJEoGcTdlWZQThmnktLMeu1NauTWFpnZUTAy370giZ/CWtuhY9DH6YKkU4Pr7w8kaMqE
 6BVJa1twJ1nE1z6xtjUVrGlxKQKSfhhrVvm0/ONbGdtcph+aRbO/9O4LALj+DNXXni8r8Ihr
 bq62kXWRIdFRggkBduPMKCjyFa4vH48nuNuXhKWfYEJIBy0qddne37rk/s6A8AQMhGdlDGU4
 AahB0tKr+f6vN5n+dbEsqmIsoO1HrYsBUFdBWTas+q7OHCCrGquyINNSsiSejXZWD+m8amuf
 7wFnfrmOeIJm0xG9Yd5DvBqweQ3+oK39bNdyw1lGlTNbkiqU+0/eiPehJEW6aAUn+1Xowq7X
 E6L6+J2A7TRNZO3CkMVKSokcv+Hi6MelA7S2vJpck/00zAmrrOIXHJbMwSIlCEAfqB+N5kow
 Ll9tcMbt16/hx4tPorUhyxY7T7XfHYBT75hvYsTH4HskAZtx1RfJ53QTCbrucndZ9JJO0gsA
 zmVmKub2esEnBKbKyNsGCifx/dZiLQPpAtOkg0IKWOJrdyZ1PU56wIAoz04QzNcwghDz+8ua
 HNgMFd4JPvS8jo01tJPWXugR1NICBGDoRajlQNMzjGDChP4EzaRcCsmJe+R/Utf73pTf35Q+
 7TewXu8CWTme8T43y0TX095qqW9EoQrrlSawZ+qT5afAp03QTv5mavyN2AGnB22U8o+iXrOq
 fRu4OstO7bwMjQdovNnBoSXvVjKpMto+ICfrSldwZ40
IronPort-HdrOrdr: A9a23:9dXNca7MlNDewDl5kwPXwBjXdLJyesId70hD6qkQc3ZomwKj5q
 OTdZMgpHnJYVcqKRYdcbLpAsS9qBbnmaKdjrNhX4tKMDOGhILsFvAG0WKA+UyZJ8SdzIFgPM
 5bGsAUNDSzNykfsS+Q2meF+rgboOVvvJrY/Ns3QBpWPHpXgrlbnnhE4xigYzFLrdZ9dOAE/E
 v13Ls7mwad
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail03.adl6.internode.on.net with ESMTP; 04 Jan 2023 11:13:38 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 3040hWIj3045976
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Wed, 4 Jan 2023 11:43:32 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 3040hWIj3045976
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1672793012; bh=taziu2iqO7WNnyY/Mw/9pO29kxAdZ5Ty48TMR/c0I9M=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=FfU3aFfr6JkGcHF05WTWXb4n/O9s9WI78jWTQep/CuoD25uOMFgQvgw1qg+Sx0tPd
         kaBfMDx7BqWycLvBlgZJnQD/EyDfXNpF6t2SXmBoVIJQkw6fbniJTToyYKwYSrpGSt
         a3K/cuRD/LjzfWdObh4RqurpaEAJvctu5+v5RAqJmh6uM8o/zRkFHeeen9XMY4aIpd
         j88WPnu/lEw4fSvFqpRIVRou4X8LjcOzl0iK+GGefEPBw1nMHGAis7rsswuA4ruDBI
         4cKHioOBBpHQ2k6+1Xrvrwhiy+/L7wAMLyovKyljdSwYHUJ3eIvjelD7gz57UrEdV7
         DZS4OeSd0dLoA==
Message-ID: <279a18744006c3bacc3c09b458d4ee8e9faebe46.camel@crawford.emu.id.au>
Subject: Re: [PATCH v1 2/2] hwmon: (it87) Add entries to dmi_table
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Date:   Wed, 04 Jan 2023 11:43:32 +1100
In-Reply-To: <20230103184650.GB204971@roeck-us.net>
References: <20230103064612.404401-1-frank@crawford.emu.id.au>
         <20230103064612.404401-3-frank@crawford.emu.id.au>
         <20230103184650.GB204971@roeck-us.net>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.2 (3.46.2-1.fc37) 
MIME-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Wed, 04 Jan 2023 11:43:32 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 2023-01-03 at 10:46 -0800, Guenter Roeck wrote:
> On Tue, Jan 03, 2023 at 05:46:12PM +1100, Frank Crawford wrote:
> > Call initialisation of second chipset.
> >=20
> > Update the dmi_table with mother boards that have been tested.
> >=20
>=20
> That doesn't really describe what is done and why. See
> Documentation/process/submitting-patches.rst, "Describe your
> changes".
> The comment iin the code is much better.=20

Will fix up the descriptions.

> > Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> > ---
> > =A0drivers/hwmon/it87.c | 58
> > ++++++++++++++++++++++++++++++++++++++++++++
> > =A01 file changed, 58 insertions(+)
> >=20
> > diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> > index 4ebce2c661d7..2ecfa2c901f6 100644
> > --- a/drivers/hwmon/it87.c
> > +++ b/drivers/hwmon/it87.c
> > @@ -3315,6 +3315,27 @@ static int it87_dmi_cb(const struct
> > dmi_system_id *dmi_entry)
> > =A0=A0=A0=A0=A0=A0=A0=A0return 1;
> > =A0}
> > =A0
> > +/*
> > + * On various Gigabyte AM4 boards (AB350, AX370), the second
> > Super-IO chip
> > + * (IT8792E) needs to be in configuration mode before accessing
> > the first
> > + * due to a bug in IT8792E which otherwise results in LPC bus
> > access errors.
> > + * This needs to be done before accessing the first Super-IO chip
> > since
> > + * the second chip may have been accessed prior to loading this
> > driver.
> > + *
> > + * The problem is also reported to affect IT8795E, which is used
> > on X299 boards
> > + * and has the same chip ID as IT8792E (0x8733). It also appears
> > to affect
> > + * systems with IT8790E, which is used on some Z97X-Gaming boards
> > as well as
> > + * Z87X-OC.
> > + * DMI entries for those systems will be added as they become
> > available and
> > + * as the problem is confirmed to affect those boards.
> > + */
> > +static int gigabyte_sio2_force(const struct dmi_system_id
> > *dmi_entry)
>=20
> s/gigabyte/it87/
>=20
> While this is seen on Gigabyte boards, it doesn't _have_ to be
> Gigabyte
> specific. Other boards i using the same chips (it there are any) may
> be
> affected as well.

Will update it.
>=20
> > +{
> > +=A0=A0=A0=A0=A0=A0=A0__superio_enter(REG_4E);
> > +
> > +=A0=A0=A0=A0=A0=A0=A0return it87_dmi_cb(dmi_entry);
> > +};
> > +
> > =A0/*
> > =A0 * On the Shuttle SN68PT, FAN_CTL2 is apparently not
> > =A0 * connected to a fan, but to something else. One user
> > @@ -3337,7 +3358,44 @@ static struct it87_dmi_data nvidia_fn68pt =3D
> > {
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0.driver_data =3D data, =
\
> > =A0=A0=A0=A0=A0=A0=A0=A0}
> > =A0
> > +#define IT87_DMI_MATCH_GBT(name, cb, data) \
> > +=A0=A0=A0=A0=A0=A0=A0IT87_DMI_MATCH_VND("Gigabyte Technology Co., Ltd.=
", name,
> > cb, data)
> > +
> > =A0static const struct dmi_system_id it87_dmi_table[] __initconst =3D {
> > +=A0=A0=A0=A0=A0=A0=A0IT87_DMI_MATCH_GBT("AB350", gigabyte_sio2_force, =
NULL),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* ? + IT8792E/IT8795E */
> > +=A0=A0=A0=A0=A0=A0=A0IT87_DMI_MATCH_GBT("AX370", gigabyte_sio2_force, =
NULL),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* ? + IT8792E/IT8795E */
> > +=A0=A0=A0=A0=A0=A0=A0IT87_DMI_MATCH_GBT("Z97X-Gaming G1", gigabyte_sio=
2_force,
> > NULL),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* ? + IT8790E */
> > +=A0=A0=A0=A0=A0=A0=A0IT87_DMI_MATCH_GBT("TRX40 AORUS XTREME",
> > gigabyte_sio2_force, NULL),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* IT8688E + IT8792E/IT87=
95E */
> > +=A0=A0=A0=A0=A0=A0=A0IT87_DMI_MATCH_GBT("Z390 AORUS ULTRA-CF",
> > gigabyte_sio2_force, NULL),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* IT8688E + IT8792E/IT87=
95E */
> > +=A0=A0=A0=A0=A0=A0=A0IT87_DMI_MATCH_GBT("Z490 AORUS ELITE AC", it87_dm=
i_cb,
> > NULL),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* IT8688E */
>=20
> Why list boards with only a single chip ?

Because I'm stupid and just copied and pasted from my other code.

I'll drop out the single chips and resubmit.
>=20
> > +=A0=A0=A0=A0=A0=A0=A0IT87_DMI_MATCH_GBT("B550 AORUS PRO AC",
> > gigabyte_sio2_force, NULL),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* IT8688E + IT8792E/IT87=
95E */
> > +=A0=A0=A0=A0=A0=A0=A0IT87_DMI_MATCH_GBT("B560I AORUS PRO AX", it87_dmi=
_cb,
> > NULL),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* IT8689E */
> > +=A0=A0=A0=A0=A0=A0=A0IT87_DMI_MATCH_GBT("X570 AORUS ELITE WIFI", it87_=
dmi_cb,
> > NULL),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* IT8688E */
> > +=A0=A0=A0=A0=A0=A0=A0IT87_DMI_MATCH_GBT("X570 AORUS MASTER",
> > gigabyte_sio2_force, NULL),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* IT8688E + IT8792E/IT87=
95E */
> > +=A0=A0=A0=A0=A0=A0=A0IT87_DMI_MATCH_GBT("X570 AORUS PRO", gigabyte_sio=
2_force,
> > NULL),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* IT8688E + IT8792E/IT87=
95E */
> > +=A0=A0=A0=A0=A0=A0=A0IT87_DMI_MATCH_GBT("X570 AORUS PRO WIFI",
> > gigabyte_sio2_force, NULL),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* IT8688E + IT8792E/IT87=
95E */
> > +=A0=A0=A0=A0=A0=A0=A0IT87_DMI_MATCH_GBT("X570 I AORUS PRO WIFI", it87_=
dmi_cb,
> > NULL),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* IT8688E */
> > +=A0=A0=A0=A0=A0=A0=A0IT87_DMI_MATCH_GBT("X570S AERO G", gigabyte_sio2_=
force,
> > NULL),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* IT8689E + IT87952E */
>=20
> IT87952E ? Is that chip known to be affected as well ?
>=20
> > +=A0=A0=A0=A0=A0=A0=A0IT87_DMI_MATCH_GBT("X670E AORUS MASTER", it87_dmi=
_cb,
> > NULL),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* IT8689E - Note there m=
ay also be a second chip
> > */
>=20
> Don't add an entry unless known that it is needed.

That is more a note for future testing, but for now will drop this
board as it is currently treated as a single chip board.
>=20
> > +=A0=A0=A0=A0=A0=A0=A0IT87_DMI_MATCH_GBT("Z690 AORUS PRO DDR4",
> > gigabyte_sio2_force, NULL),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* IT8689E + IT87952E */
> > +=A0=A0=A0=A0=A0=A0=A0IT87_DMI_MATCH_GBT("Z690 AORUS PRO", gigabyte_sio=
2_force,
> > NULL),
> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0/* IT8689E + IT87952E */
> > =A0=A0=A0=A0=A0=A0=A0=A0IT87_DMI_MATCH_VND("nVIDIA", "FN68PT", it87_dmi=
_cb,
> > &nvidia_fn68pt),
> > =A0=A0=A0=A0=A0=A0=A0=A0{ }
> > =A0
> > --=20
> > 2.38.1

Regards
Frank
>=20
