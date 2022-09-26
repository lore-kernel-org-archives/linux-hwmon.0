Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B322EC07E9D
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Sep 2022 07:04:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233279AbiIZHEV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 26 Sep 2022 03:04:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233274AbiIZHEV (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Sep 2022 03:04:21 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C47772494A
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Sep 2022 00:04:19 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oci9e-0006rg-5x; Mon, 26 Sep 2022 09:03:50 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oci9e-002zCO-7k; Mon, 26 Sep 2022 09:03:48 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oci9c-003a8G-5J; Mon, 26 Sep 2022 09:03:48 +0200
Date:   Mon, 26 Sep 2022 09:03:46 +0200
From:   Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        kernel@pengutronix.de
Subject: Re: [PATCH] hwmon: f71882fg: Reorder symbols to get rid of a few
 forward declarations
Message-ID: <20220926070346.u665ljwqpoycpl5w@pengutronix.de>
References: <20220925142631.GA1751571@roeck-us.net>
 <20220925191810.gnlkg53jifxk2glq@pengutronix.de>
 <02b28838-846d-e3cd-ce3b-25fc2a9d5881@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="nam4jqoffqsgqcet"
Content-Disposition: inline
In-Reply-To: <02b28838-846d-e3cd-ce3b-25fc2a9d5881@roeck-us.net>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-hwmon@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org


--nam4jqoffqsgqcet
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Guenter,

On Sun, Sep 25, 2022 at 12:50:55PM -0700, Guenter Roeck wrote:
> On 9/25/22 12:18, Uwe Kleine-K=F6nig wrote:
> > On Sun, Sep 25, 2022 at 07:26:31AM -0700, Guenter Roeck wrote:
> > > On Sat, Sep 24, 2022 at 11:28:52PM +0200, Uwe Kleine-K=F6nig wrote:
> > > > Declarations for static symbols are useless code repetition (unless
> > > > there are cyclic dependencies).
> > > >=20
> > > > Reorder some functions and variables which allows to get rid of 42
> > > > forward declarations.
> > > >=20
> > > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > >=20
> > > Applied to hwmon-next.
> >=20
> > Thanks for your prompt action on my patches, very appreciated!
> >=20
> > Let me just note two things:
> >=20
> > a) vger refused to accept this mail with "Message too long (>100000
> > chars)", so I guess it won't appear in the archives
>=20
> I guess that explains why I don't see all patches in patchwork.

The f71882fg was the first one of my patches that vger refused. I didn't
check, but vger at least didn't tell me about my other patches that it
refused any of them.

> > b) Your reply didn't have a "In-Reply-To:" header, so the threading is
> > broken. Because of a) you cannot see this in the archives, but it
> > happend already before, but not on all the mail I got from you. An
> > earlier instance is
> >=20
> > 	https://lore.kernel.org/linux-hwmon/20220923002301.GA1159397@roeck-us.=
net
> >=20
>=20
> Some of the e-mails I reply from mutt, others from Thunderbird. I suspect
> that one of them doesn't add the "In-Reply-To:" header. This one is from
> Thunderbird. I'll send another one without Cc: from mutt. Please let me k=
now
> which one is missing the header.

Both of these mails have the In-Reply-To header.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--nam4jqoffqsgqcet
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmMxTs8ACgkQwfwUeK3K
7An2Vwf8DYNeWnIIuzmaJzvdXC+WF1VT0RFfjG5F+UyBjIQRKxVwcr08v2rCfQiz
A7hECwZ0fH6FDG1RJwaUbiqrDgSJbWihn/2MrdPAVgKqWRuWnwvK2lA9GylurtLd
84gSz4g11mmBJNdPolTxJHZrvLqGKZe9UhCCidmskv+YRwbMg6acN1NuteKJNfu1
Nk1vvVq69gMmrNXce8sBnAgKnRUf8Pmwhj9I4v5cpNzRQFTPGAlE9L6JwMcAsaZq
JLyovmavtgBu+F0KhiwJkeUZ3Hbo5fW2JT23K/UTkEe4yq5ijhWIgBwsmag3+Rwu
oR11ySvSEBruFJ2A6+NSgvWWDCF5Uw==
=68A5
-----END PGP SIGNATURE-----

--nam4jqoffqsgqcet--
