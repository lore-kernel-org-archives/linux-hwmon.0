Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E832EC433B4
	for <linux-hwmon@archiver.kernel.org>; Sat,  8 May 2021 13:15:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C156E6140F
	for <linux-hwmon@archiver.kernel.org>; Sat,  8 May 2021 13:15:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230486AbhEHNQj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 8 May 2021 09:16:39 -0400
Received: from mout.gmx.net ([212.227.15.19]:41491 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230438AbhEHNQh (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 8 May 2021 09:16:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1620479719;
        bh=c47mtKcTTDyETKykmcb/ghEg6LlaFnC4rQfErD3WyMU=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=O/07a7HxH5UuWioppg4pS5CCNj0l2H+YQ7czZCs47B8F+1saD16epi9XfWb5rMmdH
         59y/9uA/ySgZh/jF2Mlj6tw4GvAMGvKpzurUKdg8tzs1Ks6q+RUc2/gsm1VCtG7P8Y
         DwpEB7PsnvB2CsIfCWh02kS5mqrjmqd9eTDjPbnk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([84.154.223.76]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mw9UE-1lMatW37qe-00s4YF; Sat, 08 May 2021 15:15:18 +0200
From:   W_Armin@gmx.de
To:     hdegoede@redhat.com
Cc:     linux-hwmon@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com
Subject: [PATCH v2 2/4] hwmon: (sch56xx-common) Use strscpy
Date:   Sat,  8 May 2021 15:14:55 +0200
Message-Id: <20210508131457.12780-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210508131457.12780-1-W_Armin@gmx.de>
References: <20210508131457.12780-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1e2PHgUiNO4gc+EL7YXk9fZs2RdCDXFXfdWrTcUpv3Ug7H8xBLc
 lgRNFpdGUJ1vhs8e0otZkxUCgp3NxRYBwtqzmcpKXgCFE1sRfWKq17cBNeDvPYCmHBsPPFE
 jdoPvry7Hp/+qHAmFdXddCpd3QtmkNsC9Q+dOx4PweMH9f8eBRV3asyLg+wUIAobiLz8Aw9
 +sY0mlLfcBMdclxdVv1Mw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zv1kg+b3jQA=:/azFgoL3IVqhpP8EdNp2O5
 TmfWvEeQl2dgn2sfrP49aCiYz6wkyzvZntod4YvovlnbwnFB/2tzh+baFGgQi85Dikmp+SPkt
 C1QsN1+wIPgRIx0fY9p58pGtPrOT4bLFqWhKk0itJ03iM3TM/LtyoEATvE+Zcsvby+y4cUN2r
 7h5gVxsGKMFyf6H0OVdEZJUR4VQzIXTxppTcRvhx36nZDOTC7UOFiR7bUoI9BAXIb8AR0ZC6y
 N+v7zI/LlhWP1eWX/JpTa/ACXj4mPbFF8EqTjD5vJniASrrg+HHMTwM8Oqb1D+kpWt0MKt5yz
 LyHZFobrreVEe7JyN6cl7Cl2koijZhMAnURbfa3ZdTkVBfCS7iYEFXUzMW78pCGUR2sUWoUS6
 4VVgtzr3ZjUnBJsv5Mx0dVY1O6dXub9DGB2b9bnV6cF2pyMaqGufyuUfuJfUEiw6l6bfVygG/
 Tk1fYLq5xMVBKRQvqyFSMmdLIhZSjJTjORxx2wbEenBr9iw9Szin9YHn/rFYmHtbX7KRl07sk
 rFtsXLSYd8yNrJIt3IH7+AH+QTXHMV9QSLT5oQtvzp2lNUyflSQ85L0MQFfVNzX71cKOn+Kqt
 uV56qDUpjLufgK1P5dwgtXWft83ETwfcW5DVjf7nFWHut02drOFFiVuRxnqzNendoSpelzK04
 JIMJJehF8bmcy8D1NXISEAqOqFJpb1OLVJqsI8FL9GK6qPN89VxarDcSmwdwla6vNPNscwhZ2
 PTtv0wDJfIGWjiosuNaFpeJkauz6wuyiCs9cSzGue9fkcqAWSjKYVYTG2+QCcAKLUfvm3PLkc
 /BFkhhU5ptDeJEI92hy1G0AdqpDHLiNc5DpKY4QefNn3v0yt266Wh/LOofJNUbcS3mm4N8O82
 B3lZ84rpkg0yOjLhpeZLIcP6Rceg5yOKDKVcuDrjRugSctvkzqEdyIgYEiQnvJbEC0gkObj2G
 F4U13aiKRskD3ppG4JS8V6ZMLcLLyUFnKRTMIMsHOc0mzO4kgCgJ/hJfK0wlBh25DgzoS3GX8
 xrWLOiPdvB2kgBYGFsV6IEaHXI84SAX/CMgEhs9E3MXKcpm0FGmoGRMfc3sj8AZVRjmN5uIzP
 yqXR/QWVLdu/WLCLhiQahinKk94UXzJM1/TjGE8uY4vhB4DccS2uxHq5ARhzu/eDjWPvj5XjI
 SvZodpxDpUGghRNyX+BonoJmABLCgQwFc3q0QUdSMXB/q3W2yHoo64NHZvFzLzubht6NI=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

strlcpy is considered deprecated.
Replace it with strscpy.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/sch56xx-common.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/hwmon/sch56xx-common.c b/drivers/hwmon/sch56xx-common=
.c
index 2db3456ba6f1..0b3250fc57b8 100644
=2D-- a/drivers/hwmon/sch56xx-common.c
+++ b/drivers/hwmon/sch56xx-common.c
@@ -408,8 +408,7 @@ void sch56xx_watchdog_register(struct device *parent, =
u16 addr, u32 revision,
 	data->addr =3D addr;
 	data->io_lock =3D io_lock;

-	strlcpy(data->wdinfo.identity, "sch56xx watchdog",
-		sizeof(data->wdinfo.identity));
+	strscpy(data->wdinfo.identity, "sch56xx watchdog", sizeof(data->wdinfo.i=
dentity));
 	data->wdinfo.firmware_version =3D revision;
 	data->wdinfo.options =3D WDIOF_KEEPALIVEPING | WDIOF_SETTIMEOUT;
 	if (!nowayout)
=2D-
2.20.1

