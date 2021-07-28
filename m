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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F8A4C432BE
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 20:52:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8023E60FD7
	for <linux-hwmon@archiver.kernel.org>; Wed, 28 Jul 2021 20:52:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231719AbhG1UwZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 28 Jul 2021 16:52:25 -0400
Received: from mout.gmx.net ([212.227.17.21]:50767 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231807AbhG1UwT (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Jul 2021 16:52:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1627505520;
        bh=pBqnwbhq2wS79c+CFpFdztPnuWDlqUQe4f4HZKsls3w=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=efPM1lilIbWY0w9uH8UQMTLy6zJbIqFQ+NAPYERQqkKH/RV9gacNTDFl/Kob5zMAN
         fQypEWuxk6eAv6IK2WClilaCUT3T4WQQpo+BR+j+nA5UAy7KiRDLayVRufu0EO6eUR
         rhm5c5N9ZbpT9lGqwC8ZwWwdrHMrTKWJjDdJVxbE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.190.212]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MvbG2-1n15a21sf8-00sfEh; Wed, 28 Jul 2021 22:52:00 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v6 6/6] hwmon: (dell-smm-hwmon) Fix fan mutliplier detection for 3rd fan
Date:   Wed, 28 Jul 2021 22:51:42 +0200
Message-Id: <20210728205142.8959-7-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210728205142.8959-1-W_Armin@gmx.de>
References: <20210728205142.8959-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:hbmkCm8+mNraPO3r/PDd/wQ74KRKxJ0QPe+Frfn6/emBgZfSHbU
 BAryU3rUdBdB+8QJtJMbR6/M5BMyDNf7u6V/Eu5B+QuPQPIERXHW37TGPnG13olfLHOHAhs
 fOav0wHRHg7zaxgyYoUreH+M/4G9dMRF3ek5/gJmQck72uRwMoBnDqSHAX/WNvfutVEupFg
 Aw1Pdxs7lZbCoD9F0wJ8g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:s9r9+7BVRnU=:yPbFcStBISBvztLST5bdNs
 fvgEh3NBQTiDwpEZkDF0RuJLBx+IMwdXC7WTZ4EnX1Pckn7dwXytUx2oWP/XdUt9jipmn6i9i
 RAyCTbEFpFF71g/y51t++MgW62nt6JjRMu4sb+ol565o164V4C1EWi7/ZbMG63Y/qZ7JmUiov
 7jEY33wANJ9PihbXtBA6Ayv1FiAFl0y6AWNv/QxHUkA+CL4ru43bziBIokqdztXWhVRaD3eAg
 pQQN++jffOlClnZb38/Fw2/wry9WPUkM4942rnWkHvBC2cVEBC8pmfcHH1qCbErac+PfcR1/n
 PNzE9uT56bILqsHetQbGmHB1UqUIin3mfydoluJV6boAJPoKNJKEPr9N5DHZzu9jsyyfxoa5n
 j3vxfeEYfyXHLerJ2HyBp5WT5Pf4ep7LOWFpZ5+abQBkJucvbjAhv7vqHbVp3KBSDb4c+RAuf
 776juqyogO47eTiMZtKsCgbdz7AJ05j3S3V53iTw8vExjNI2EoFAd4oJfkd/FCGkWdXlYvmtX
 VW4GLBzn7OItGLNQ6UivHxuUHo/1MxPNstPWukfA8VdY0ljzdBR1218ScTmQxYhcJGSy1QRbC
 WYGF2ErpIhKnm+UQnELLnKZBr7ATtictpnje0XIXi7EQ099Cjjvblw84Qkbv4kmY6/xynM2vB
 juYmss5sZffiWwXnKee8YMNjefx1okJGC+fzHnYGTcHo5F1X47W6k5ORVKAj2RtcA5Gup7rlg
 BovV601cM9CWP2bCCNjof3JQPPEDBEpinghUC35JPq1JEckldZIBSJ3VNR2VtEiWG5LCoEII6
 QY3Sz5X57/Zw0LijTKXovbV/okx8vzSXZnRxX+KyQlZ+EY7sWboXUF6uZiD1Me76X78HFa95X
 vPOdCJpjsk9pqOPWjZsL5vZn2yEFkoP10JXFFeEaiCggRjrEAGtgIhbnngVF/XAPG7p8/ViW/
 HX4nZPdLY5clx3RnxhyV/UFW70kiQCCfNKumFTFJPWg+0prHaC8hFgo5bPK6TPvIWRciwRKdk
 j0qMdA1Gvu5C040+iry+kz7kmeGvmMoBfOlqV2NVJfFqVsnoSaBdsK82IDgR64eh/PGFTTBGK
 b9gCvijqM6l7iQZjdX56AhXw/QxOmV0QHMt
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

There are up to three fans, but the detection omits the 3rd one.
Fix that by using DELL_SMM_NO_FANS.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
Fixes: 747bc8b063ae (hwmon: (dell-smm) Detect fan with index=3D2)
=2D--
 drivers/hwmon/dell-smm-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon=
.c
index e842901d770f..1305e73e6741 100644
=2D-- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1257,7 +1257,7 @@ static int __init dell_smm_probe(struct platform_dev=
ice *pdev)
 		 * Autodetect fan multiplier based on nominal rpm
 		 * If fan reports rpm value too high then set multiplier to 1
 		 */
-		for (fan =3D 0; fan < 2; ++fan) {
+		for (fan =3D 0; fan < DELL_SMM_NO_FANS; ++fan) {
 			ret =3D i8k_get_fan_nominal_speed(data, fan, data->i8k_fan_max);
 			if (ret < 0)
 				continue;
=2D-
2.20.1

