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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91FCDC433F5
	for <linux-hwmon@archiver.kernel.org>; Fri,  3 Sep 2021 14:25:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 711E361058
	for <linux-hwmon@archiver.kernel.org>; Fri,  3 Sep 2021 14:25:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349252AbhICO0Q (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 3 Sep 2021 10:26:16 -0400
Received: from mout.gmx.net ([212.227.17.21]:55027 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233092AbhICO0Q (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 3 Sep 2021 10:26:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1630679099;
        bh=+KvxeOBs3vYKrklqxvy9I7hhmL2+y2pU/XSjHkZuick=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=IaQC1WVVFQ2yhX2XK8hfS+hnYV+erjj4Qw7DuwYf7JXYGM6TxUpdCqXh3oeywFrC8
         QoQnB+U7NExuCyMY8FpDoDCKLFF0MYdXsk0T5RxzrTKny95rSvBldHKjMa/0DPaBzi
         I7MsVtRrAhScjWknlrCyf1U3aOnubZg6L8v33D5Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.137.126.34]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M1Ygt-1mO6CG2Hed-00354B; Fri, 03 Sep 2021 16:24:59 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: (dell-smm) Show fan_max param in sysfs
Date:   Fri,  3 Sep 2021 16:24:56 +0200
Message-Id: <20210903142456.9926-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lE4SnqdT8eLPlzxbqC2ZqRHJTK4ZAyGP3pK2X//1Difd+uN63XL
 visnwihBSeiGAuGUN+jYJSrfV16IxD7ELot3N5TN6rw8cOd93ssTSXJ7+VEe6L+saV8mY3D
 eZ+NJAStAp9auIRoOvGQQ+RsLG/834oxzi54glz5AuEzzxn2hSLpUQe6dS2QDFStsJuHaKk
 BXjVRt5hUxdDsCYSjDNow==
X-UI-Out-Filterresults: notjunk:1;V03:K0:h37hp/2c5yc=:ShClSWdl2Et14Ss7tO1rFG
 oBSICsC2HTQWfSl/jVwaj9WVN0FFRc9qoEV39f/HYrkDjnEhGErZzCrGKrq6oFYxLBIHOBLyY
 NIIOtWGq2VY1P3SQud9bzATob1XkC8jAYDtGCrwgaUabaC5K3CUQbIl59gwlDKx3nFnfy4L0J
 yKhsGUxmE0k73mmosZ/9HRmDiOMi1eUX9ylhAkiUDZBb8rnCWs/btfnsFyqzouglPV1/qcZjY
 o6iZWmDT4aoCTwPvEfMHNjsKrOM0LLk+MO7lrMhmT9ZMjX+QA9LOyI0ZoyuWRlXY1gZyRd7sc
 KxxW9jgEA0JRI1Ayz/Fq9VidBOnA6KZyYuQnmjEFuU2hwYLfF5s4CLK441ViLxMuARH4K7zNa
 LU2h4gCZnOAhowh+h2uZauHBEDd9YP6oUh9Dk0DccK5s39u3a1f0NJfgIbWHHSrU/E0BtqWRa
 ff5wN1M71Vddr5x77WByzPOqP4mKFPZuNAD+F8blXzHcSDvkwP4BjXcQhJ90GE9vgQGOc+EdI
 ujKNtBKXh+fuLOHt757GSTIf9/ZfVuKO+pS/RvoWWQ/7Uz3xvTUCRS7QywobYbFPNCedEOB65
 ZWQ8sSPqks/5QQ1aRwUqD/Tuh0vh4K26c5ngH6K+VyQd0LqCKCHDnBJxjiTcRLvA9p9vM1yu8
 1ibna7UbEPaAaKxfMuX9N1aX5LEiR4fdQt7lQWq96CqZ9zS8fmWXKAsJEhURCNU9YULiZ365o
 yEN9p2pjdPn6LIxAa2uFtqOJ+8NYe+JivDItZJCemPNV3H4FOi3q/uvHCCbrclpniYJJikvw2
 8LhFUADYumQa6X8qOV2SwxXybQGsZ4P9wiqeUUvkkuW2rd0j90cndd8AXAMuB3ZFO8jvHYc7e
 t5t5c6TiPeAbaszmlQF3lrkvHw6ZGgtqu3hndooUx0ciDIPAqYXCRcdoUDvvwCJiMk6UQS6Ky
 jq2vBSthLhJAmemeEvi18dBTWxaqVERX0pQVOxwOdr49A+kpNM69wZnSpBsN1Fx075Xd8IHuL
 LMKxQu5szxwFPOkns6+15WePDbjhLHT07mBIJDzaSEsOCAcmZbtXOe2POHQPpGztLHXrBRcsn
 wzv0OQB31Wq95fG6YVj5h01NbwWL8P2zBhSEnLbqP+XKJzEYVSst4XOGw==
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

For allowing tools like i8kutils to query the fan state
without having to rely on the deprecated /proc/i8k interface,
they need to scale the pwm values (0 - 255) back to the
real hardware values (0 - 2/3).
Show fan_max in sysfs to allow for such a scenario.

Tested on a Dell Latitude C600.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index 774c1b0715d9..6d3fd4f0f99d 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -107,7 +107,7 @@ module_param(fan_mult, uint, 0);
 MODULE_PARM_DESC(fan_mult, "Factor to multiply fan speed with (default: a=
utodetect)");

 static uint fan_max;
-module_param(fan_max, uint, 0);
+module_param(fan_max, uint, 0444);
 MODULE_PARM_DESC(fan_max, "Maximum configurable fan speed (default: autod=
etect)");

 struct smm_regs {
@@ -1245,7 +1245,10 @@ static int __init dell_smm_probe(struct platform_de=
vice *pdev)
 			fan_max =3D conf->fan_max;
 	}

-	data->i8k_fan_max =3D fan_max ? : I8K_FAN_HIGH;	/* Must not be 0 */
+	if (!fan_max)	/* Must not be 0*/
+		fan_max =3D I8K_FAN_HIGH;
+
+	data->i8k_fan_max =3D fan_max;
 	data->i8k_pwm_mult =3D DIV_ROUND_UP(255, data->i8k_fan_max);

 	fan_control =3D dmi_first_match(i8k_whitelist_fan_control);
=2D-
2.20.1

