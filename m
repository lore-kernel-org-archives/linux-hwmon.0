Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F89EC433F5
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 19:05:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5215560FE8
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 19:05:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230441AbhJUTIL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Oct 2021 15:08:11 -0400
Received: from mout.gmx.net ([212.227.15.18]:47895 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230267AbhJUTIL (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Oct 2021 15:08:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1634843138;
        bh=i1FCDvf0fe36+3EFlTapIEjo0Psx4IWGt4yQRHZqTtE=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=l1LqKjc4SxpIMqskjt9A7TlGCoz1hpUM187rTPDJNySvL0oEkRGFheo9ZvnS+x0Sz
         aD7XhZBt4qD+kGWtzn9L9O6PXNesvgOmTyBDuVXZ5bd62/GIexGR+G7C5VAqey8xLf
         B/p7RTCzYm4mh/L7m3TyvqwRoMGIUNqvtxZ1bQ24=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.137.126.34]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1M6llE-1md3pE1AGU-008FtF; Thu, 21 Oct 2021 21:05:38 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 2/5] hwmon: (dell-smm) Use strscpy_pad()
Date:   Thu, 21 Oct 2021 21:05:28 +0200
Message-Id: <20211021190531.17379-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211021190531.17379-1-W_Armin@gmx.de>
References: <20211021190531.17379-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:gHwMulcEyDqyJAklZHX6FevazPDs/H3cYzRMYb+1ssN1V81cVpt
 37alIFdoR5or0paHc9U5Zh3R6c+3GEI8v7NkJaXtcMa7Kcpmoa1GLjSjk9uxzZqZ1vlUwl2
 pxDtMrG5mY/Hp3OeETH1+cStTzEeqdlXR1nhh/UlW6nGUOYL4XSOHYv7Myxhk2D6/hOqcPM
 DSQekjQMJCgJ9K7tLePXg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:x6uJs92nP3I=:5FdFISdoyGVtnqpqshfw+8
 wPJhGyzoDbWusdtuAshxhAosvI3ieTxRJIxB2i1DXBF3LUnoOyYadJELVRlLeLL56/Y6wBHM/
 QC0vjwyQm/Lf6QpWaSqZkol76K1w8rq1Ad+iPQdGe9bE0zYfEGA9guxVxeBCTzF3mG6qFELiE
 ZfJByaXId36TpQ1mgtpIkqLm9H98UiCSX4IqAR0EsxdQjbxU/Cpv+CVcPzVeQZySMibkNlqCs
 zeA/BhgjKhVpbjdoAcWAd+Gg1UhalO3oEtwWMk9ZKUoVr7gk25gFa5+6yEjr9v5rxz9py2TLo
 dAmTI9iZRK/1wVMmNBwm0Qygt1moWmDuwSIyU9RRXXWB5qpveiFWpcVoCqw+fAW7cQoWL5M6H
 gixy0aizV1WaYSSnIECLx0CsC7LlvnOTnY85i2GBlXn6y04eKmbpn+zMWJgHtPh2jhCWyMOZw
 zCP0mICHDa1DdY4ET+xT+kRp+z2d5s4LrXZ5Y83mistGhFoflY4AEmH4qAt5N7BbXbWhxjrDh
 I6esKarUcPLQiltzloJOKaErSz5ew7H4GJTC/bXe0iMP70l3RXFTIfkDLemT3cO3JFBLKWbSf
 aPgm7gfJPbAZOC/OuuVz0Whc0BmxRf7jsrZfbEOEFU1ZCpRjr0KaMi5wtbOJtEmEOQhS+VMdl
 0ymQ6vvRRhD1WjaCgPkJWn+aTelU+gdiox42Bz5VpLIsSIJKAjnAR6/NCj5eQiyayNvJLN2l6
 hpSRpNQeSBQZUWAhjb7VI8JzPz5McUzuK6J0AB3YixIDvOUQftIjBnmSq63GdjpxBuI4RTGQE
 eHFU1eo2kzK3N8wMvjsQFzIfzZxj24nWbBSPrEk7JeRRHQbVioG4gNoscE9oxpf4OE93VCKQ0
 cASLAafdj7twnyXqR29MksQB77UTfdX19dlfCxI+STdx5MJN0QoahmQ7KVqXhrv0t5ZyyUsyq
 vfWXO8mywX84zVXGATDuZLd1G+SJm8JqjDZvPaELJ27Yg5XBzEkVtidhaTUOMe5SvgyFt8dsp
 X9n499u1IVM0wwSXYlYm5Kq/+teEM/NEiMm6otDmrjchbjZg1a20Gug1nY9QrAW3gP+Ro6G6t
 5N2khn31F4j1I4=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Using strscpy_pad() allows for fewer memory accesses
since memset() will not unconditionally zero-out
the whole buffer.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
Acked-by: Pali Roh=C3=A1r <pali@kernel.org>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 9773d6c0477a..b0c591bb761a 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -25,6 +25,7 @@
 #include <linux/platform_device.h>
 #include <linux/proc_fs.h>
 #include <linux/seq_file.h>
+#include <linux/string.h>
 #include <linux/smp.h>
 #include <linux/types.h>
 #include <linux/uaccess.h>
@@ -472,8 +473,7 @@ i8k_ioctl_unlocked(struct file *fp, struct dell_smm_da=
ta *data, unsigned int cmd
 		if (restricted && !capable(CAP_SYS_ADMIN))
 			return -EPERM;

-		memset(buff, 0, sizeof(buff));
-		strscpy(buff, data->bios_machineid, sizeof(buff));
+		strscpy_pad(buff, data->bios_machineid, sizeof(buff));
 		break;

 	case I8K_FN_STATUS:
=2D-
2.20.1

