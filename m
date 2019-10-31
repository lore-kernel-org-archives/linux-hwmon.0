Return-Path: <SRS0=ti+p=YY=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8203ECA9EC3
	for <linux-hwmon@archiver.kernel.org>; Thu, 31 Oct 2019 09:45:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 51B262086D
	for <linux-hwmon@archiver.kernel.org>; Thu, 31 Oct 2019 09:45:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbfJaJpM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 31 Oct 2019 05:45:12 -0400
Received: from cyberdimension.org ([80.67.179.20]:40198 "EHLO
        gnutoo.cyberdimension.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726949AbfJaJpL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 31 Oct 2019 05:45:11 -0400
X-Greylist: delayed 401 seconds by postgrey-1.27 at vger.kernel.org; Thu, 31 Oct 2019 05:45:11 EDT
Received: from gnutoo.cyberdimension.org (localhost [127.0.0.1])
        by cyberdimension.org (OpenSMTPD) with ESMTP id d4af2476;
        Thu, 31 Oct 2019 09:37:40 +0000 (UTC)
Received: from primarylaptop.localdomain (localhost.localdomain [IPv6:::1])
        by gnutoo.cyberdimension.org (OpenSMTPD) with ESMTP id dab1ada1;
        Thu, 31 Oct 2019 09:37:40 +0000 (UTC)
Date:   Thu, 31 Oct 2019 10:38:46 +0100
From:   Denis 'GNUtoo' Carikli <GNUtoo@cyberdimension.org>
To:     Guenter Roeck <linux@roeck-us.net>,
        "amy.shih" <amy.shih@advantech.com.tw>, linux-hwmon@vger.kernel.org
Subject: git fsck broken due to "hwmon: (nct7904) Fix incorrect temperature
 limitation register setting of LTD."
Message-ID: <20191031103846.59a96454@primarylaptop.localdomain>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; i686-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/11kVLp9HaR3uoul1DoY9aVt";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

--Sig_/11kVLp9HaR3uoul1DoY9aVt
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi,

When fetching linux[1] I have:
> $ git fetch origin
> remote: Enumerating objects: 119615, done.
> remote: Counting objects: 100% (119615/119615), done.
> remote: Compressing objects: 100% (22639/22639), done.
> error: object 4a2d78822fdf1556dfbbfaedd71182fe5b562194:
> badDateOverflow: invalid author/committer line - date causes integer
> overflow
> fatal: fsck error in packed object
> fatal: index-pack failed

According to gitweb[2], 4a2d78822fdf1556dfbbfaedd71182fe5b562194
corresponds to "hwmon: (nct7904) Fix incorrect temperature limitation
register setting of LTD.".

The issue seem to be that the "Author date" is "2085-06-18 15:57:19
+0000" which seems wrong.

Is there still time to fix this date?

References:
-----------
[1]git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
[2]https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commi=
t/?id=3D4a2d78822fdf1556dfbbfaedd71182fe5b562194

Denis.

--Sig_/11kVLp9HaR3uoul1DoY9aVt
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEeC+d2+Nrp/PU3kkGX138wUF34mMFAl26q6YACgkQX138wUF3
4mMiJw/8CWqU7RCe2PU0wsulIa7bQ1qr6GjEDroL3cWYmr0cqpxJK4gx7BE4e72i
L9DtVB85UogAgApcSH/E/kCRPClQOPDaRSU0G4IHqICy0ldqpupeFOB5wwA03dwk
iP3p7yvyJI3YtcyqD3IphOsrcO8QBuLkA3rCpOu/fxpD8//QpmOjCjlY20E5Rehr
jolveaNf85dFD4D513unsFIVWPt+f6fAPTtR2v7o8arnQxNN28cK6OYem32uDU5z
2cP7pypI8YpsF1V7tLumIFxZJHPAFdqQDMdsngMMA/vhXNrqfzzSvJS4gyGoKDXg
xDa7C5ZgUSQus0CHJCQ9c+9ag99f9hcTwxB9ZbkZ6uC+rE4HYFsNhMCeHg6NOEWi
bdbz/BZbctYDN46LiZuHBHEdVZhgB9sinnfoZuwa7HVVKRwdWRmXvLX5+kzvAiNz
z1i5qPcMxwrwu0vHJBtk9riMHZUPULok/lkJXbtLnbsrr7PZvAzaKC9zk00fdbHN
Z9x1UMXMzzGd9aC7tIDo+j2sqzI5bvimJHbOJ4PCFOZ6ons/KM12s6C7zH/r7fDa
VwtTHdBTAdNuatLoVGtofX0BQQrsw9btJh27b6cki7TSECkjZRXC6748En5Mndqb
eDzBB3ieZkGqNSSD89L89U6aRtB+uHljrO3HLfjmmo0tCp2lBWw=
=/w+j
-----END PGP SIGNATURE-----

--Sig_/11kVLp9HaR3uoul1DoY9aVt--
