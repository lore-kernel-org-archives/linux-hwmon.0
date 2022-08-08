Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02670C00140
	for <linux-hwmon@archiver.kernel.org>; Mon,  8 Aug 2022 07:54:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236874AbiHHHyR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 8 Aug 2022 03:54:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235426AbiHHHyQ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 8 Aug 2022 03:54:16 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E83D11C29
        for <linux-hwmon@vger.kernel.org>; Mon,  8 Aug 2022 00:54:15 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oKxaW-0007rB-Sf; Mon, 08 Aug 2022 09:54:12 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oKxaQ-002SHS-KX; Mon, 08 Aug 2022 09:54:08 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oKxaS-00AJFi-9p; Mon, 08 Aug 2022 09:54:08 +0200
Date:   Mon, 8 Aug 2022 09:54:08 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Lars Povlsen <lars.povlsen@microchip.com>,
        kernel@pengutronix.de,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] hwmon: Make use of devm_clk_get_enabled()
Message-ID: <20220808075408.i63dtoe66hm7xwta@pengutronix.de>
References: <20220808060640.272549-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="qilt5mazi3cx2pol"
Content-Disposition: inline
In-Reply-To: <20220808060640.272549-1-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


--qilt5mazi3cx2pol
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 08, 2022 at 08:06:40AM +0200, Uwe Kleine-K=F6nig wrote:
> Several drivers manually register a devm handler to disable their clk.
> Convert them to devm_clk_get_enabled().
>=20
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Nuno S=E1 <nuno.sa@analog.com>
> Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Oh, the tags by Nuno S=E1 and Jonathan Cameron are a fake. I picked them
by mistake from the (similar) patch for iio. Please take care about that
before application. (i.e. drop them, or make me resend the patch without
the tags, or make the two give the tags post-factum :-)

Best regards and sorry for the chaos,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qilt5mazi3cx2pol
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLwwR0ACgkQwfwUeK3K
7AkxFggAgSrrDHiwjxAkvS5Hj6mO81NEG2hQIDy2ufFGGlNxidAN9NPymi/9Nj0q
bjg46YBa8ZJStuqbyj9RAagvWjEpWJTW35d9Bv6/CPo+UsR79K86HWlz5doi0+B8
cE1qn0ipSxLrWaAMtWx4TeJKbdCG8QDAVwFRE9pdyyh4ZN1DpQftc8u+OLqfB20C
UTN9AT8REtcqANy/h6jCDTPOK6rY8TLl+60PBBoU5fhUzQ6PyNOINoB7jwgCiVZ+
VYaDcH5AhkbA2n+oi5Rq7L4LN+UX15QFrDUEBjmU7sM5bNW0NK9R9fO5M0EydITW
gU/13UfS/+zP0AEUeDPayamyxODwPA==
=NojX
-----END PGP SIGNATURE-----

--qilt5mazi3cx2pol--
