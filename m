Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1113C04A95
	for <linux-hwmon@archiver.kernel.org>; Sun, 25 Sep 2022 19:18:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbiIYTSV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 25 Sep 2022 15:18:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229567AbiIYTSU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 25 Sep 2022 15:18:20 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AD3D2F38E
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Sep 2022 12:18:19 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ocX8r-0003nq-0w; Sun, 25 Sep 2022 21:18:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ocX8r-002tTq-7F; Sun, 25 Sep 2022 21:18:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1ocX8p-003U76-0R; Sun, 25 Sep 2022 21:18:15 +0200
Date:   Sun, 25 Sep 2022 21:18:10 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        kernel@pengutronix.de
Subject: Re: [PATCH] hwmon: f71882fg: Reorder symbols to get rid of a few
 forward declarations
Message-ID: <20220925191810.gnlkg53jifxk2glq@pengutronix.de>
References: <20220925142631.GA1751571@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="hxlbgl3lz5eycldx"
Content-Disposition: inline
In-Reply-To: <20220925142631.GA1751571@roeck-us.net>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


--hxlbgl3lz5eycldx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 25, 2022 at 07:26:31AM -0700, Guenter Roeck wrote:
> On Sat, Sep 24, 2022 at 11:28:52PM +0200, Uwe Kleine-K=F6nig wrote:
> > Declarations for static symbols are useless code repetition (unless
> > there are cyclic dependencies).
> >=20
> > Reorder some functions and variables which allows to get rid of 42
> > forward declarations.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Applied to hwmon-next.

Thanks for your prompt action on my patches, very appreciated!

Let me just note two things:

a) vger refused to accept this mail with "Message too long (>100000
chars)", so I guess it won't appear in the archives

b) Your reply didn't have a "In-Reply-To:" header, so the threading is
broken. Because of a) you cannot see this in the archives, but it
happend already before, but not on all the mail I got from you. An
earlier instance is

	https://lore.kernel.org/linux-hwmon/20220923002301.GA1159397@roeck-us.net

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--hxlbgl3lz5eycldx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmMwqW0ACgkQwfwUeK3K
7AkIxAf8DZS5afUOp5zgk1DYmbnquCf3OB7m24VMt+XqAwoTWzkGMruWBnqj1y7k
+cpqO5eKaB5O23Joi1PqQ5trJOb3TE+faT9umODF9lSDc8uDaiEtuOSTPoar6LQB
En2JnSzZlyze0q+mmpAqPt1perY8/qWPCRZSzscueGaNmRdhxzYu8PRgAxh/yzl/
sKYCPK7dSDGehmJU35q9ieF4e3MZU2oJaWy9lj1HQRgTyLBe050DorHPkTGbY2Nk
joqkiuPlIUxcmyLr+f5tXgGEudVoH9bbXpJd6DKvTjbp4k/Piu+rzmlmDn32emeC
Ngogyawtv+BeAvMawaIoUvCIuRlrrg==
=VCGs
-----END PGP SIGNATURE-----

--hxlbgl3lz5eycldx--
