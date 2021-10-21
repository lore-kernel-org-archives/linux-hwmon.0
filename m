Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE6BC433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 19:05:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED8A060FE8
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 19:05:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbhJUTIM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Oct 2021 15:08:12 -0400
Received: from mout.gmx.net ([212.227.15.18]:57711 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230434AbhJUTIL (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Oct 2021 15:08:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1634843139;
        bh=15joEZi4zx54NaKUF79r6g74phLxBhOZUBAyv6HLWEY=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=a4v3DVt5/eNiu8M3+GjxGgicIxYACgS9xmVdrZsfKrzuv8CicoWwhQeBSaKwxmWye
         +qLVgzYi6j6FHuv7HMluc2CfmhbNbW8XK/1CM+to7UB0mgTTJjvZD5II90G/vT0eGK
         eIJozgB7PydZzVskIVRnmaDdogLnMG/oBM4j2nBA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.137.126.34]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MyKDe-1mu2mN1RQi-00yiG3; Thu, 21 Oct 2021 21:05:39 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 3/5] hwmon: (dell-smm) Return -ENOIOCTLCMD instead of -EINVAL
Date:   Thu, 21 Oct 2021 21:05:29 +0200
Message-Id: <20211021190531.17379-4-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211021190531.17379-1-W_Armin@gmx.de>
References: <20211021190531.17379-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:SN85eiwjMPxvU4fczpagxkaa8OhCMURHu0NmRPekpxdlOuT4kFU
 kVOegNxxLsC3X3GoF87ARz/QpIjTfEwA9JzoDyhHsbClvL/P3xoAXeelIuJvXA/uD3wElUb
 gWyFGwzDBrA4AZSIF87U1xJLIf5MhGBiZLF51feGXzXSu0LkC0A5RblOqVcfrvpUhEAsS7l
 wQvriE8/E4IuanDybbkUA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:WLZ/GOwTdEI=:uK9Y6rwDDPc8NuP8uTRzKn
 kzfvwiz9j0O3CIJb/0dv937hT0J9+bCq6zme828FE5bhY+nNsPvlS/+osUB9ZSC86inemrp29
 Q5JH/gkoyj+CiY+x0pmGxZakQipEJ50Hu8wf+VJeVtzjoDdr3XEku/4KfFJYDh0/c4X6Erh8p
 mGcIJqVxk1djz5fpsRstj5aOlUJ09hVo2U1ZiE+Ej7b6KoR2LMToa1JY4Grhf+mHLnwWkbELR
 EE2q2Ey6avSAqMVRu6E6Y+7lbc6zdjwaGv1+MLXdnTXaNAWSMxy16YokB28VHyebTOdu+eHjf
 jTTkHpZNKs4drkiiLPmdMEmzXe52QEx50j/FwYw94Rmd+KX/XA2LRc/hFmXNMp5MGH0ZqrXY6
 M5u3J58TEOei89bkBwy/26yf/ybPEKVVrNbeQ2VSznqT6S7QIIMkCBHm3j9SabIY6Kx1ogjvO
 jdWgZSM55PLIc2ZDtHG34I3+vkr5L49sSkQ5+pl3t9ENTJf3XE6c/EuhBelC4od+fGw/TrvMh
 txJvt30X8VFTMTX5lzIiTZANnQ801QSbKEz2V6QIoqfA19QX4qwiNQ7RGk/fMUW/RaylHH/56
 CqeJ+FoJm9ZUPffDJ/Py2ZA59tVr1RTQAoF2CsKauzF5felbRmLRsKDwYSOGWwzhb6fsY3w3K
 XDZzjbt7x1NwqKxEyFFCIFTqZLAxqX0spi/Ds0s+RJ8I8YzAsfzMyt8zN6eiCtAf8kX1Jl5tF
 sY2jRB3aSsHjOVm8iNwDHtIrDcHnhoOhIsMhqz5Ef9NfyEGaXPO3ZC5yBldDL+UjC7kiAxG/g
 6ClytLwhpTpv6O3CdCmYLtv+tCXxS77F5W4h7iLquSj9oBD7QuoxhWFCLeqGY5pnHgf98kFo2
 Z7TAL/UoE+V/n/T4W1ihoSUkSLpJ+k/N1Etjsbocq3Dwe8fqSJlDYGnBzRqhaJy5X5U8/Nujj
 VTlHUI0DGMY91y6qun+hsrWCI7895rXds19X+pL5HJ0xSABaYjaLk5bKgnoZkcS7x0zaL5MKl
 654HCknZQXtKGP4y552z6htksGsNfw3HtTTN21Jc0yx5N91QM/0qQ0hWySWYHd6IdGI/K5hna
 oGtxf7DAUHllLQ=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Returning -ENOIOCTLCMD gives the callers a better
hint of what went wrong and is the recommended
behavior.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
Acked-by: Pali Roh=C3=A1r <pali@kernel.org>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index b0c591bb761a..5f0338b4a717 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -18,6 +18,7 @@
 #include <linux/delay.h>
 #include <linux/dmi.h>
 #include <linux/err.h>
+#include <linux/errno.h>
 #include <linux/hwmon.h>
 #include <linux/init.h>
 #include <linux/module.h>
@@ -516,7 +517,7 @@ i8k_ioctl_unlocked(struct file *fp, struct dell_smm_da=
ta *data, unsigned int cmd
 		break;

 	default:
-		return -EINVAL;
+		return -ENOIOCTLCMD;
 	}

 	if (val < 0)
=2D-
2.20.1

