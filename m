Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AAE4EB64DA
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jun 2023 20:00:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229939AbjF1UAe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Jun 2023 16:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231248AbjF1UAd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jun 2023 16:00:33 -0400
Received: from metis.ext.pengutronix.de (unknown [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFE431FE7
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Jun 2023 13:00:31 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1qEbKn-0001c1-5E; Wed, 28 Jun 2023 22:00:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qEbKk-00Ajsv-Op; Wed, 28 Jun 2023 22:00:10 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1qEbKk-000bX5-1k; Wed, 28 Jun 2023 22:00:10 +0200
Date:   Wed, 28 Jun 2023 22:00:09 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel@pengutronix.de, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] hwmon: (pmbus) Update documentation to not use
 .probe_new() any more
Message-ID: <20230628200009.6iu6b55keem3u4az@pengutronix.de>
References: <20230627064948.593804-1-u.kleine-koenig@pengutronix.de>
 <ba6e1b94-f79e-954a-592e-dfefe2a71f1f@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="egg3ybufyd4wnej3"
Content-Disposition: inline
In-Reply-To: <ba6e1b94-f79e-954a-592e-dfefe2a71f1f@roeck-us.net>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


--egg3ybufyd4wnej3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Guenter,

On Wed, Jun 28, 2023 at 09:46:26AM -0700, Guenter Roeck wrote:
> On 6/26/23 23:49, Uwe Kleine-K=F6nig wrote:
> > Since commit 03c835f498b5 ("i2c: Switch .probe() to not take an id
> > parameter") .probe() is the recommended callback to implement an i2c
> > driver (again). Reflect this in the documentation and don't mention
> > .probe_new() which will be dropped soon.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> > Hello,
> >=20
> > this patch was part of a patch dropping .probe_new() before (see
> > https://lore.kernel.org/linux-i2c/20230626094548.559542-1-u.kleine-koen=
ig@pengutronix.de).
> >=20
> > However this change makes already sense without dropping .probe_new, so
> > here it comes as a separate patch.
>=20
> I got this after sending my pull request, and I don't currently plan to s=
end
> another one. What is the time line for the probe_new removal ? If it is
> still planned for 6.5, you might want to keep it as part of the series.
> In that case,
>=20
> Acked-by: Guenter Roeck <linux@roeck-us.net>

Getting this final patch into next after 6.5-rc1 was my initial plan,
but on Monday I found a few newly introduced users of .probe_new().
Patches were send out, but I intend to postpone by one release cycle. So
if you take it during the merge window for 6.6-rc1 that's fine.

Thanks for your cooperation, very appreciated!

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--egg3ybufyd4wnej3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSckUkACgkQj4D7WH0S
/k5KrAf+LIBjUNwgUPF9N7zfAz5BBsgqWfmglfzvlm6hYDSyQu5GfBfdFhDtnSUR
LhNuewoBPDPdd5jhtc0YVOgeYBB913XTinQswgQvSziRvsNMfejSV/XEd3iQTMrs
Q2RuUwL1NVra4vDCfIFmBkXSquyGP6K80RJ2GQLyF15nAIo26fboSLezYHtCfB/V
9XHGc/LoOx/x7JcrkPA2svMmHmiyz4+seAIbi5Ki2xuYAbvLkLQ8YUr0g6eUf8uF
qzvmHMehRm4MIiRVJf2n9m01Vg+HlLkkTdU7lEBZYpu09fVbRO50F27pQljQwEBD
G+be/84KZ6rTpcT+xspOe+ViiIsulg==
=tYP2
-----END PGP SIGNATURE-----

--egg3ybufyd4wnej3--
