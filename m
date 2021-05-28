Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34D6CC4708C
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 17:37:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1BE0B613F0
	for <linux-hwmon@archiver.kernel.org>; Fri, 28 May 2021 17:37:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229463AbhE1Rj0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 28 May 2021 13:39:26 -0400
Received: from mout.gmx.net ([212.227.17.21]:55667 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229493AbhE1Rj0 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 May 2021 13:39:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1622223455;
        bh=KuMTUIIsIrpb4G+jJ2PFkRLp1LBaTpZJra+7FRfTOa8=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ayNQCZyVH6N5PMhS1zLHwRCEEkl+okS8EeoDeBnMUnw3ff7qHBsyD6LkrXOzSp2PC
         11kyVeY8yufbkX8CpATzODsiuF/exJDgyterSKq2uHN9LGI9uyY3cpzzJ1uIJFbIlI
         i/9sEkF/s9GL2sCxaPOzGCUeQm3Hx9J18J7MdTnI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([79.242.180.99]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MulqN-1lVZ5339Rj-00rmvh; Fri, 28 May 2021 19:37:34 +0200
From:   W_Armin@gmx.de
To:     pali@kernel.org
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: [PATCH v2 6/6] hwmon: (dell-smm-hwmon) Update docs
Date:   Fri, 28 May 2021 19:37:16 +0200
Message-Id: <20210528173716.10975-7-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210528173716.10975-1-W_Armin@gmx.de>
References: <20210528173716.10975-1-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:acdOMRJjFjil+MS983GRums+e2HdOo5jCncNDkJv9w3M75RQ7pm
 wByJGLaCuUq7zwhThH5duexvmJkcC2XT2A2VScuUoUeX8/s4lkM2yDHghXvWfDn6BnAuad6
 ZDfn0CB+2FSGTM4FwYK+SlByczEzHBg+XepMTzHcNr7fDpV3A8mkxvZyZca8EasKm5M9/W7
 PfKXN9RDqT9j7237HOcug==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8uQ4UMUU5kE=:VC3xa+6dUNntTVYLpEs1EK
 a99R2Twk5zZoduVQ0g4mOG3WSP4hcqHcpRQS+uSNnw3yKTTf573hZz7Tm0pSawTUAJIuja/7x
 Djk4pbji3lEx1UzzHXWuXWoEKSlLTGX/QlUK8x2c3CvHKaknjJtjFo2YNRfAfhRaCntFNRh8f
 st9+vPXLhPVHD2WcafW2oisyYjbeRJGVcz3YYvKdqq/eGdxbfZyQalqa0BnVMLptoykHBDggl
 TCJKdr4qgxjKKfS5xt3pJ7QVDCB27T7L7AMTMdb4u0QeLKmU0l76wnO+npxxd/lPBjgvJbGZu
 SwQe21pL5wPo5YbcIPvkDpG12JCvEry5vx6KdCAWzOKCNbuQVR4me1WihZ6aYAjcvgWkSY+wn
 mPsIIo+z2gzdhiFmKpRe2+aZFf/6bxUWkv2tS6gaaq7OCqgOcryyUM0GhNup7+0ZgJEGJ1UnA
 zhnCdi9fOO+SpenZQXD0nRsYd6YCayTwLmRBEqZWUwRjdc0q/KbUS8D5sE0kz2quXw+wUB3Rz
 mL73iJlH3hRQKD82K/6p176sQi0QxFXs401gKytUM5wTKiuGGAKsJOd7WLndQXfHk/MOTfwxi
 moSzI2/UEIrUvfYYB5r7kBb08yZ58XeveL07G44x+s9nbn9aF0Hl5xqt0KFALeJPNmjkYZWe6
 yj03KulrRS+dr8Qkt2EtMCCfUYVcpwJx7H8LsAcZzFYgJmj5RJr3JdmWPM/CY+cwRzCxlTekn
 b5IECxy2EwJnYE0hryG0nx4OPiXdy4lyjgpOD630TMcRrhItyIQCsAd7aSnqbXniB5If19Tg/
 owTSBh9AfWFztVDCrX/TyhMDu4s/DplTQFSC3B9sqdisYgq394JRwmB7cI4xC0SmDU6nKy4ul
 gGNS0XHpcxNGbXcqCeSZT565cFCTwIbHkuQE1AQXSqBIaZZn2fEcQfuN9qlD2mM3jF4GznX+H
 w9NB9OOqjMygZv43FQFLsoPEPWGwHUxuTgDhV0QsfFsiG0DZizDJaWE80RD/AumzGy+vCmt56
 McMbFILTKOsNESQ29jOgvxpT3eGeRDgZPcdGhOj/rynXi/30ihER1l8xSLVRvoTVxK7VXwTQz
 HH0pQOEcv1vBLWfwW3W8YEFUT1IPiC88STyame1cSfKhKrB1YInNTFDdjl1I1XRXT83IJsxlX
 R/n9Zi5v7jfU0ZCFL3uhYuQ2OsdUbxf5xOjKzXAPrMJ0GFsP9YsnkDD+MLYPunDeYNwFc=
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

pwm1_enable is now readable too.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 Documentation/hwmon/dell-smm-hwmon.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/dell-smm-hwmon.rst b/Documentation/hwmon/=
dell-smm-hwmon.rst
index 3bf77a5df995..d6fe9b8a2c40 100644
=2D-- a/Documentation/hwmon/dell-smm-hwmon.rst
+++ b/Documentation/hwmon/dell-smm-hwmon.rst
@@ -35,7 +35,7 @@ Name				Perm	Description
 fan[1-3]_input                  RO      Fan speed in RPM.
 fan[1-3]_label                  RO      Fan label.
 pwm[1-3]                        RW      Control the fan PWM duty-cycle.
-pwm1_enable                     WO      Enable or disable automatic BIOS =
fan
+pwm1_enable                     RW      Enable or disable automatic BIOS =
fan
                                         control (not supported on all lap=
tops,
                                         see below for details).
 temp[1-10]_input                RO      Temperature reading in milli-degr=
ees
=2D-
2.20.1

