Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DD8EC001DC
	for <linux-hwmon@archiver.kernel.org>; Thu, 27 Jul 2023 16:39:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232533AbjG0Qjp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 27 Jul 2023 12:39:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231561AbjG0Qjo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Jul 2023 12:39:44 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F1CA273D
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Jul 2023 09:39:43 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qP41c-0003CB-Ak; Thu, 27 Jul 2023 18:39:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qP41b-002WNO-41; Thu, 27 Jul 2023 18:39:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qP41a-008IQ0-62; Thu, 27 Jul 2023 18:39:38 +0200
Date:   Thu, 27 Jul 2023 18:39:36 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Andre Werner <andre.werner@systec-electronic.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH] hwmon: (hs3001) Switch to use i2c_driver's probe callback
Message-ID: <20230727163936.dnhav2mfho3ilubf@pengutronix.de>
References: <20230727071123.512966-1-u.kleine-koenig@pengutronix.de>
 <7ab9f3c0-5677-ceb5-b9af-81af12a32cbc@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2trg64cbemurrvul"
Content-Disposition: inline
In-Reply-To: <7ab9f3c0-5677-ceb5-b9af-81af12a32cbc@roeck-us.net>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


--2trg64cbemurrvul
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 27, 2023 at 06:34:14AM -0700, Guenter Roeck wrote:
> On 7/27/23 00:11, Uwe Kleine-K=F6nig wrote:
> > The previous mass switch of hwmon drivers done in commit 1975d167869e
> > ("hwmon: Switch i2c drivers back to use .probe()") was based on
> > v6.4-rc1. Since then this driver was added which needs to be converted
> > back in the same way before eventually .probe_new() can be dropped from
> > struct i2c_driver.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> > Hello,
> >=20
> > this driver appeared in next today. It would be great if this patch
> > could be added on top to not interfere with the quest to remove
> > .probe_new directly after v6.6-rc1.
> >=20
> I just made the change in the original patch.

fine for me.

> Thanks, and sorry for not noticing.

If that helps: this wasn't the first recent commit reintroducing a
=2Eprobe_new :-) Actually I wanted to drop .probe_new already in the last
cycle but didn't pay attention between v6.4 and v6.5-rc1 which
introduced a few more of these. In the current cycle this was already
the fifth.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--2trg64cbemurrvul
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmTCncYACgkQj4D7WH0S
/k52TQf/TU4gYK4NHbKW+uZt8/CCDfcGOKiSP7z2djkB40DYQuemM005Kg2d+ajp
oWZgmVOHLlFNlenKhfAHwcKj7MRQ69qBiIGfHELcP1BZAOYOtP6cw3mkyw3t6VQG
Ynh39chP0VO0yystA++IAD6n2av8KvjPFxfVzXKptrps5RyPkh01muTNmnZzcgni
Tfpii5hrpmwq1FHeqRmOoaI4tOXrVvIvNa+taV7ez38PqJEQ9VEMBrezvo8J/QIp
qAX9rtdbJs3l01DTX9NKnFrQKmFw7R3D3TMeUtQAWGy7/RKPE0VsOoFeTiYje5XP
le2/oaGT5FxG/sxlJddnKX6AmnVK/w==
=JZNA
-----END PGP SIGNATURE-----

--2trg64cbemurrvul--
