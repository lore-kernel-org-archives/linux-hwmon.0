Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D226C07E9D
	for <linux-hwmon@archiver.kernel.org>; Sat, 24 Sep 2022 15:05:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbiIXPFT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 24 Sep 2022 11:05:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230222AbiIXPFR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 24 Sep 2022 11:05:17 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0895C83F23
        for <linux-hwmon@vger.kernel.org>; Sat, 24 Sep 2022 08:05:16 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oc6iR-0003vy-5y; Sat, 24 Sep 2022 17:05:15 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oc6iR-002fQi-Id; Sat, 24 Sep 2022 17:05:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oc6iP-003EYw-FU; Sat, 24 Sep 2022 17:05:13 +0200
Date:   Sat, 24 Sep 2022 17:05:10 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        kernel@pengutronix.de
Subject: Re: [PATCH 2/2] hwmon: sis5595: Reorder symbols to get rid of a few
 forward declarations
Message-ID: <20220924150510.fabwsnjwrjlwhvlu@pengutronix.de>
References: <20220924135738.234051-1-u.kleine-koenig@pengutronix.de>
 <20220924135738.234051-2-u.kleine-koenig@pengutronix.de>
 <20220924143729.GA2300272@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="y6fc34imabvcvoiz"
Content-Disposition: inline
In-Reply-To: <20220924143729.GA2300272@roeck-us.net>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


--y6fc34imabvcvoiz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Guenter,

On Sat, Sep 24, 2022 at 07:37:29AM -0700, Guenter Roeck wrote:
> On Sat, Sep 24, 2022 at 03:57:38PM +0200, Uwe Kleine-K=F6nig wrote:
> > Declarations for static symbols are useless repetition unless there are
> > cyclic dependencies.
> >=20
> > Reorder the functions and variables to get rid of 4 forward declaration=
s.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Applied, after fixing up subject (via686a, not sis5595).

When I pasted that into citool I had the plan to fix that ...

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--y6fc34imabvcvoiz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmMvHKMACgkQwfwUeK3K
7Al7cQf6Aw0q88fBaoqXrGCp9MjCtGZ59lGxLje++4AemZexooQjrCBvtqRRES4a
XayyyqqCCypTIsHsn43Fsth9efBhnG2uZ6dm/VCkkw3b5hMvB78e8Jplpy0kTldL
h0SrQgA62J7+0deIflZBoVlZAENm1TPf4AgmLwz3NO3bhxEJzxwYmuHUgcQ+Hclx
JzpjNcwoPbLtp0iXn4BTBpwVnNpAdDAh1QL+p67YeZ6S8SwKWLchYQaNmLja6IxE
AFVOi4hEYpX8ZiIJg8rzdPKnRIeiKzGGhwkANR9sPXCi5kbsEiHHonasGwPd4UwZ
Yd708VZHjJ0FIhmD6hWgDcdMPWLlgQ==
=A0KD
-----END PGP SIGNATURE-----

--y6fc34imabvcvoiz--
