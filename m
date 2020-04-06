Return-Path: <SRS0=rtMO=5W=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6BA0C2BA1A
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Apr 2020 23:57:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 692E820768
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Apr 2020 23:57:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="g1NUA6xs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726303AbgDFX5u (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Apr 2020 19:57:50 -0400
Received: from mout.gmx.net ([212.227.15.18]:51931 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726287AbgDFX5u (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 6 Apr 2020 19:57:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1586217445;
        bh=tkaalPzWoW0YHaTyWgNGeG93WVc+U8cfsK4hFndJWVM=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=g1NUA6xsWGTiiGIFo/cVKU8d8DBt/6F42mFBM5c1vIFlU1A0dYnTzWaYuv61W48Xk
         CF0Imgj+gPRUQfHwwHLAG+qZrpS6fzt4d0LXtXKc88gzLWZkgZaOoM3ZEeGpOKy+98
         PB9vrm/ha6QonJMZM4cRfIGsa2QdW9NF+w12joAY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from bedhanger.strangled.net ([188.194.167.134]) by mail.gmx.com
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MRCOE-1jiemX225c-00NCQt; Tue, 07 Apr 2020 01:57:25 +0200
From:   Ann T Ropea <bedhanger@gmx.de>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     Ann T Ropea <bedhanger@gmx.de>
Subject: [PATCH] hwmon: use drivetemp's true module name in Kconfig section
Date:   Tue,  7 Apr 2020 01:55:21 +0200
Message-Id: <20200406235521.185309-1-bedhanger@gmx.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:2uQm2b0yoBv/vQNX01JaS+xrVY0PPtP831dmKU2/St4RYmTMCyn
 eaWQOMjm8010ola8NwUXJKmK6/WSJW6okc4n6ub0Jc/oEoy5CuIboct6pLjgQSppbnKLjCP
 YUnBF+eei4vQGEzE8ulItmwdfojQikogZnIVX3A8pklI3pBc9i9/BaFNVZIfouEcON5U1PR
 Eac7dRb0jQojhTzSexXuw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:bt0V8O8LW0M=:gjz3a15jz6dl4rTDGaXf13
 x4Lk1BJcMyML3Z+iHXpqo5kUElEStU3C24GVYZaDRGnT+77oL3A1XmjRN4rBghFrUKV3Hsg61
 DnwYUZew3h+R0NxMt6RM9D1D1zXNiNC/CDSHDw19Md/9eBGP9uC8m+Cue7ul+dexx9nMroL2p
 XGhaGG3u/r3SmvBeoRx3ROzotNudDgCDRqQZeucpUqp2aApZz16i5Zfcr2YjiZ54LUL71J2/r
 EdXjSRoHqLWey03P3eO4x1FWz6y/hFhbgXkuGyLVVYJ9G1y4dPOOmzoLmaMmMB7JwfEQKtaWJ
 ob9Hc489TGhODm+SiAdaQq6wREaLP2HbUXV/GQDR1j1N31ITAXNw7PY1edKkfgQtZFVusmPBh
 WpTGIXvjsL0GdkXVYErnx7oBCnBM3bnAur2gt4i79tLiBIHo8IJ5VyQcemBEYOdHQQozWHLQJ
 gyttI65z9WgkMv2zHBjaceTSp+RJMzaX6usSMkEtthU8gBOqdL7L4q05hSIm3eDbmBNhpJyH7
 EiugRvFIbvnMlNhMe3XF6brh0fs5D6Qe8qoq6rq+wxOKa/T7ZEzHrAeYsAWrRDU96qQ3CUD6v
 bH6lglrUrQzlmmc0/eFcRjSXU8S9HOUa+qGldl1JpE1cbw8CcGYsxlW5RP6P2G2d1W7LOBaXv
 kMR59XwDH2j7oPyNsuIIZ1vqd7cunwCXiGNQEywN3PL/6vOxyRgBNkleNG4Em0E4RK65eQuTv
 B9WrKhmMZAMzQkKg81Xf4FPtVt4JJjWTT0vh3XopAv9D8HnfCgGIEKQMoPuJ0wri+bIS7CFTy
 sMIWuj/X/pTRuusYxUs6KYiJuMR3EfdWEbQL3K7QnFq2uBxBdWqHwLJkbS7HaqqgfSMujtek6
 Kq2bXd6q8lRBhRB3drFD55b/RoQL0GjOIalPRwXv6HiK1RRy13x/QbCk0A0450mrHHIspe74f
 XLS68a1IBRFpeJRSqPisCrCaijCvvGjzAvc5panZvHHgPONzRco7z8vOKgbFiOJOd3lt6QJ7z
 zmYfeN5U/JDVe9nS4CVpEiB8TU7UchcMoPUk6cHrMEAzqBIgN2VQguwTfyz0pXfpzaiTYc+Ze
 Ar8bz4uxgCOyewYpLoJ30jS3g1iHswrJGmbFgzsmIlCuSOxAgJkk1GIJwuVdCBv2io3Ft9Atx
 ktT4e6XDDGs+EmSEyvEbPjcAC7457Z9ZJS3jlGQ1bT09T0Qii5kAjuL/aX7S9Tba5G92ll6ur
 LJL7XRL+kXgwt924V
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The addition of the support for reading the temperature of ATA drives as
per commit 5b46903d8bf3 ("hwmon: Driver for disk and solid state drives
with temperature sensors") lists in the respective Kconfig section the
name of the module to be optionally built as "satatemp".

However, building the kernel modules with "CONFIG_SENSORS_DRIVETEMP=3Dm",
does not generate a file named "satatemp.ko".

Instead, the rest of the original commit uses the term "drivetemp" and
a file named "drivetemp.ko" ends up in the kernel's modules directory.
This file has the right ingredients:

	$ strings /path/to/drivetemp.ko | grep ^description
	description=3DHard drive temperature monitor

and modprobing it produces the expected result:

	# drivetemp is not loaded
	$ sensors -u drivetemp-scsi-4-0
	Specified sensor(s) not found!
	$ sudo modprobe drivetemp
	$ sensors -u drivetemp-scsi-4-0
	drivetemp-scsi-4-0
	Adapter: SCSI adapter
	temp1:
	  temp1_input: 35.000
	  temp1_max: 60.000
	  temp1_min: 0.000
	  temp1_crit: 70.000
	  temp1_lcrit: -40.000
	  temp1_lowest: 20.000
	  temp1_highest: 36.000

Fix Kconfig by referring to the true name of the module.

Fixes: 5b46903d8bf3 ("hwmon: Driver for disk and solid state drives with t=
emperature sensors")
Signed-off-by: Ann T Ropea <bedhanger@gmx.de>
=2D--
 drivers/hwmon/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 05a30832c6ba..4c62f900bf7e 100644
=2D-- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -412,7 +412,7 @@ config SENSORS_DRIVETEMP
 	  hard disk drives.

 	  This driver can also be built as a module. If so, the module
-	  will be called satatemp.
+	  will be called drivetemp.

 config SENSORS_DS620
 	tristate "Dallas Semiconductor DS620"
=2D-
2.24.1

