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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AEF1C4338F
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 22:16:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 309526103C
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 22:16:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232110AbhG1WQX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Jul 2021 18:16:23 -0400
Received: from mout.gmx.net ([212.227.15.18]:43563 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232075AbhG1WQW (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jul 2021 18:16:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1627510563;
        bh=Er6k5tLiUJPuW1WNmYTS1PUHAIWkMV1+c3yIe+8Tf8E=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=AVTqfH/7bOV18Pg34DB+GBaCWOCbIDaXLAkYr4PaBmtTgQPSFPXzfUlym8RXt5Bex
         gqQTOux6nxl+mebwF58gChp8MJMm3Dg79h9Hgmc4XPrBrtdS/XdUHxXubtAyeeUBYq
         kgP1GWI3lbMwMEmdnpT7y8ho9VM6xz57I0vp0OtY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.190.212]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MuDc7-1n2UEp3lwT-00udsx; Thu, 29 Jul 2021 00:16:03 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v7 2/6] hwmon: (dell-smm-hwmon) Mark functions as __init
Date:   Thu, 29 Jul 2021 00:15:53 +0200
Message-Id: <20210728221557.8891-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210728221557.8891-1-W_Armin@gmx.de>
References: <20210728221557.8891-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:S4ZdK8O5FNh7q7Z36yDNMTzq+PZEs+66RZ3u10mLL2WU0W0KMx9
 QsV6eos9npOh0rNI4d2xjmdE/+mkP3/rkO4mN5Mu8fOlOPAjpb4VDcAE76B7MAWS4nORhiL
 xO6YnCjt/EuCdqmnWLK9UNz0hQCsW5eJDevrYyRCciFGUE+tMrWh0Xu4kFP/ICSndHh5hp7
 sFXbf5/HEcq9acIitOs3g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:cEt6rXN2QYg=:uR6r5+4Y9On5C4/sb48Zqx
 v7R+7B884GtjdhsdPEkqSSLXZljRwcxgS+wmBd1Im75bu82VDkRNKWh5F1ysVZIEioOQBgAmq
 4hPimpAtcfngMCuo15vQRY/A7FUzoceE/UOgQgyJyoa1fFRpLPA3wBBdYTz4wqdxa00d2bwlo
 Ho8Dn9Rl5bhsJVJMRSKRnb18H12RcgKzr4SF65V9W1KbtMaIO3mofqyUeOHzgIZg2UfudiCrN
 FdMuPLhaL/tGOr3uW99SQAkpCnlEPjFzLh/TY8vF+uhbyFJ5UjhkZLnmqlF9VE1aoSIgaERnd
 TlQT4nLe0IcyT4gkFMSzaDPrqwIO8V9LikU/maqIwThScI7PgZSPUFie5DtraDQ1J1zXPyFjk
 GeenOLvXJXUMDlRWzMwzpJ+fqJEIHx5yKNqd9Sz8wf5gcqdjNeboQvoBTOL0BvrOvlMoCz1SI
 WuEv4IB/1NI+cIS4ra4YkHPxuWI0m1FOCjqnoOQrJjKfWcjNMdCjX+Vq1orznKZASHAw9COfw
 LbSpwGuPhayPudPVpUvWx1LJiPW66gvm9xoHe5kKGLIHIFpPWBRTJo05fwzN97PrGFC7Oi4+G
 tty3QvOMVrPywTI9yCPy3Ks1Vpzq68XpiE7NvErJbSxYdxd7QpuQ1FaGaGMqPtKfYaDYfcXrz
 RT92qpDQCIVtIMlvzav4h5t+QO32t6tNxyj2Ybs5e/u1+cX9jt98/NaknelfUU95PNsri8dT9
 cBC7U5moQNowx/5px9cYFhiATxBKKIJY5YoTUBrv3NVwAD/klpwVa2vCtBFY1nSdC0kUBxCGk
 UwXKrYeUBVhtHjHSM/txvlxwWosW7ar79RVcvPA3D/lGkEwBCFSepUkQk8s5XCeho0M52b4ig
 o4MrUWX3T+H2OObgn1oODIr361BQrZhfvNJsY3zjZDGxnFkIrK+A+HPxK+df6000Oqtlt2ezY
 /j0RNHFglCx1YpklWAZQe61tClqm/cjAXs6Beu95FkoZ0WpJAcWx/x2c/81XYgJeJlB2XIidD
 B0IwBQlOICd1D4N/9iSh2JTJP8V7Dy6bz8veZSNKcxnYaV//Zuj6cxgKv/eJZNfEe3Srmn+Rm
 /4RW1f2xQDRbOYk2FqVzMqg+P8+VViitI0L
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

i8k_get_dmi_data() and i8k_get_dell_signature() are
only called during module init and probe, which both
are marked as __init.
Also mark these function as __init to lower the runtime
memory footprint.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Pali Roh=C3=A1r <pali@kernel.org>
Tested-by: Pali Roh=C3=A1r <pali@kernel.org>
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index f06873413aea..c898d6bd6a18 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -128,7 +128,7 @@ struct smm_regs {
 	unsigned int edi __packed;
 };

-static inline const char *i8k_get_dmi_data(int field)
+static inline const char __init *i8k_get_dmi_data(int field)
 {
 	const char *dmi_data =3D dmi_get_system_info(field);

@@ -384,7 +384,7 @@ static int i8k_get_temp(int sensor)
 	return temp;
 }

-static int i8k_get_dell_signature(int req_fn)
+static int __init i8k_get_dell_signature(int req_fn)
 {
 	struct smm_regs regs =3D { .eax =3D req_fn, };
 	int rc;
=2D-
2.20.1

