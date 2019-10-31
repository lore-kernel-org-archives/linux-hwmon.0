Return-Path: <SRS0=ti+p=YY=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D73CA9ECB
	for <linux-hwmon@archiver.kernel.org>; Thu, 31 Oct 2019 23:42:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 95E4820862
	for <linux-hwmon@archiver.kernel.org>; Thu, 31 Oct 2019 23:42:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727529AbfJaXmx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 31 Oct 2019 19:42:53 -0400
Received: from cyberdimension.org ([80.67.179.20]:40436 "EHLO
        gnutoo.cyberdimension.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726540AbfJaXmx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 31 Oct 2019 19:42:53 -0400
Received: from gnutoo.cyberdimension.org (localhost [127.0.0.1])
        by cyberdimension.org (OpenSMTPD) with ESMTP id 85d5a83e;
        Thu, 31 Oct 2019 23:41:56 +0000 (UTC)
Received: from primarylaptop.localdomain (localhost.localdomain [IPv6:::1])
        by gnutoo.cyberdimension.org (OpenSMTPD) with ESMTP id 8620cd77;
        Thu, 31 Oct 2019 23:41:56 +0000 (UTC)
Date:   Fri, 1 Nov 2019 00:43:14 +0100
From:   Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     "amy.shih" <amy.shih@advantech.com.tw>, linux-hwmon@vger.kernel.org
Subject: Re: git fsck broken due to "hwmon: (nct7904) Fix incorrect
 temperature limitation register setting of LTD."
Message-ID: <20191101004314.60bbfcb1@primarylaptop.localdomain>
In-Reply-To: <aa0c664e-b0cb-36b1-e16f-7d4b11487184@roeck-us.net>
References: <20191031103846.59a96454@primarylaptop.localdomain>
        <aa0c664e-b0cb-36b1-e16f-7d4b11487184@roeck-us.net>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/fwNhzTfxxPglnhQLo.S.qcY";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

--Sig_/fwNhzTfxxPglnhQLo.S.qcY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 31 Oct 2019 06:16:10 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> Sorry for the trouble. Unfortunately I didn't catch it before it was
> pushed. I don't think it can be fixed; my understanding is that the
> git tree can not be modified.
>=20
> What is your git version ? I don't see the problem with git version
> 2.17.1.
This may be because you may not have fsckobjects set to true.

I've git 2.23.0 with:
- transfer.fsckobjects =3D true=20
- fetch.fsckobjects =3D true

Denis.

--Sig_/fwNhzTfxxPglnhQLo.S.qcY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeC+d2+Nrp/PU3kkGX138wUF34mMFAl27cZIACgkQX138wUF3
4mM3rhAAne3kvZ4D9K+pLdj3/eMKvdjCamYVj3JnfZxJQKCaN1lF2vHm0tg1fBQ+
q66iQ3+i1ETRRKynfdi4IxRgOjVi3KYGi3LtFvmgSrEOcsUVJ4y9OYRyEjnpchu3
YymHhgGGGypFGLMX/wWScHAjGZCM2iOabygrU9VIkO7Y7S00GuVpQxl7YTgylhUP
v/gI4JfGkAh5yQDNRODC56ph4/qQjjna3vCRoix7T1cB/sK0o1zPxxbXhqqF90Y7
FjiyVLdspg3y8pBHtfXF5JegasSVS91NqDUBirsPmaLHVDOXJ0dSr0jIXlodH2nb
WGNNGSFR+sKuqSSrSMNOEY8nlPa8w4yF6O92+Xz7cb/XBpiL7WbibieUzWpYVEM2
S+GS8RdowZVZMCJrT3nz6Wkw9LdePLCMCbYHxFD+Ut5NTLw/4ItsPUtg68mpI2Uw
kq6RqrxHdpSla2tIo9xQFV+YqUnS3GmI6jOgPA6VOCMhia3vbDjg2apO2/Uga5i8
m0mvLEpDu7TUziZ4HWzeiz/FLnw8ZP9k1yOPsGaihKISnNWLGZ4WVp86BgbRxMSD
6MaaFGMUChYLCkluD2qJv2xw94lY+2FFgFtvQIvHn4JqOXt7wk2jbSPwTPn6OdVB
PcqrRsFi36EDH6a/CLeQlkQN+ZL5fis0si5+DAFW+aDt+bUz400=
=cNDC
-----END PGP SIGNATURE-----

--Sig_/fwNhzTfxxPglnhQLo.S.qcY--
