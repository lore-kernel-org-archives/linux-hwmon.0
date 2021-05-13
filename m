Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40346C433ED
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 May 2021 15:46:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE6626101B
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 May 2021 15:46:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbhEMPra (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 13 May 2021 11:47:30 -0400
Received: from mout.gmx.net ([212.227.17.21]:59659 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231132AbhEMPr3 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 May 2021 11:47:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1620920759;
        bh=a+6xIS9kOEOvONvM6nR2/aY9BR2LoJfzzuG6ijMIltU=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=R1RNJQhLHgAwIFZhIVaGZUsvTHBavaB8WU7vyhWT/MTH6hs4U3LrsPVinZKM+fIDn
         sY6XGtfyZLD9lKisDAR7sO8kXVWjMi2Itpm/3bY8Ga12Yzp4cM/8LVLGfgwbpbcntp
         u52YINieqCfHobP78sfvtYF7SHBxNAXLEvm7e54E=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([84.154.212.154]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MzQgC-1lLIvf0Hpo-00vN2M; Thu, 13 May 2021 17:45:59 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux-hwmon@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com
Subject: [PATCH] hwmon: (dell-smm-hwmon) Fix index values
Date:   Thu, 13 May 2021 17:45:46 +0200
Message-Id: <20210513154546.12430-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LE3JUceotPiPUudwrAcTjz2+0B/ZUxnYfiYF0cxGZ+GoC/WCLH3
 kqPgRs8895WlVQdhLgr5rc1l8SESMfasxxuLrkhziVy95KAieudUe82+PzA6zR3Ny+BrhzT
 xJbpN2hGze51QSb2v4cIfJuvrrTkYQIufuup6C/3GuN3KvUrPoI9RUU+rM7diIewh65YZVp
 ZxCKAb4IjgQc8wRa+KDUg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:q0+iAWEtGkQ=:62IiRFDO+bdca6cyCQFV3a
 mLQIyA7LVH/ydurTyDqe683uiPYPYt4wEYof2amtClsUBJ3R6ctav+pOP7cIxOh/cKCJLrDV7
 +yuEzYhvBEmtoLDACwFU/aIVNjgnR9123grxvARKtVSBwYp2iT7MnW6EE1oPJ2cyk9YAHSrHz
 Ip7+PxTcElpnFetxb2J+GDZdquPC4D9gjoPoNQOdQT+suXiidrUaOYbE2lLqqielJFN/owhIn
 QC5ewwJRDuh6s++kj8GoG2weBWCwdTYwfjAWPoVWBi1ARuZVigCXuE748zIZ4RarHodL2YP3O
 k/VmPGwZlYxQhoZuNUG/x7/C0hvwcnjLFJrM3WpUGJItcG+S3kQSyPgrLAY3uP00v0tptyU2p
 GFkbsLCVIyNhyjMb+SPv3dMa8Voy1HIYH96OuaiYxqdDTlnVgDe1USAh6n10+jEyfOnPBVtvZ
 Z+qmXetSJJfEuWynT7XZUZVjPmC6/y4lN3x6qaRVjagOWSv0FnjvDo+2TXfyr/kW++AKrC3bb
 +hZSjguscMVueYK0ewrHlYpNJeibKr+9pauy/beasNoyt0i0yNnk79vZ/iGnUQb/MH0guGXXB
 AX3YewAo7ZGuh6YAfPbtS/IXz4oO8jTAa9U59nFrlInmIijCjlP0AlSaGhC8cnEmhwOwKsXnQ
 xn86GjrZm7VdHo6SjsPlockYtfCt0p1unoCQQyFdMMuNRjkGxDbeZvvf91JCRwEs221tUA6iS
 anFHBIkt9Qim+4YQQMWfp1yvGqhR6AlfIxCT+rnTgkZIQyXQ+QBcIzAujA1D7iZmdxpaZkARK
 GoIwNMC/R1zdsmtN1cAKJWjVNAQXx2Gzxg6q7NI4P+zOlGwQsIMgPsAfioK5lid+gQV8QWkYi
 GoXOSzP6AIgLRuMxgnaBG4lqhFWl6SV9HieDtvJKQ3XU1lwEKOU3cQvDf7MaSE8n3HpfflR8P
 Arrl1ndOIYayGXJv8FZViSgj9EZ7NaleNhrX4VYxcM9aZLaOQYbRcP9q4WiMl0Dzjtzo6EfeA
 h30gev1GQJVJ3QpZcsMQVTw9VuSAB2ZbEpE+ioYTqpCn3Rm625oRu2Yc1VSYxwtdWqf7jDsIN
 FsGOPkQRifhXJRQDVTMddcHdcqGG11bXQNEuHVkY6NAaes2J9pk/y5PdXwXlbxGA4jQWU+ZuS
 Dwdn7D5Ch0X9ubnSp0ll5RKX+MNd1H/+3yeDGUaipJcUfOZWKfNlDdaxeDjV4MK2xz1Is=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

When support for up to 10 temp sensors and for disabling automatic BIOS
fan control was added, noone updated the index values used for
disallowing fan support and fan type calls.
Fix those values.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
Tested on a Dell Latitude C600.
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 2970892bed82..f2221ca0aa7b 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -838,10 +838,10 @@ static struct attribute *i8k_attrs[] =3D {
 static umode_t i8k_is_visible(struct kobject *kobj, struct attribute *att=
r,
 			      int index)
 {
-	if (disallow_fan_support && index >=3D 8)
+	if (disallow_fan_support && index >=3D 20)
 		return 0;
 	if (disallow_fan_type_call &&
-	    (index =3D=3D 9 || index =3D=3D 12 || index =3D=3D 15))
+	    (index =3D=3D 21 || index =3D=3D 25 || index =3D=3D 28))
 		return 0;
 	if (index >=3D 0 && index <=3D 1 &&
 	    !(i8k_hwmon_flags & I8K_HWMON_HAVE_TEMP1))
=2D-
2.20.1

