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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40CBC433F5
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Sep 2021 19:01:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 889D86054F
	for <linux-hwmon@archiver.kernel.org>; Sun,  5 Sep 2021 19:01:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232213AbhIETCN (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sun, 5 Sep 2021 15:02:13 -0400
Received: from mout.gmx.net ([212.227.17.22]:59081 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229865AbhIETCN (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 5 Sep 2021 15:02:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1630868454;
        bh=nKgOg7zBqomEAg24LOizqssVyDmD1P43TzhYqtaOFQ0=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=ERNmaKOvSZHwy/hvQbCIcgUuiZx8OdfT8fEGLBibMakJvq9VVNcO5iDhRRO2wus3n
         fT+PcsJo3UQH8eW8+meE3YFuMeOxPwdiltroKWUviwnv6R4IXjoz/tPqoHRueo+eRZ
         3I0ZfFaUCPC8C/AuI8N98wDBCCOF1gnNU58puZtI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from esprimo-mx.fritz.box ([91.137.126.34]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MgvvJ-1msiAl322n-00hPZC; Sun, 05 Sep 2021 21:00:54 +0200
From:   W_Armin@gmx.de
To:     jdelvare@suse.com, linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: (raspberrypi) Use generic notification mechanism
Date:   Sun,  5 Sep 2021 21:00:49 +0200
Message-Id: <20210905190049.11381-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:78fX9w7Wfpiq8UbU3EsaiTfz+446chjOCOUoFxay8t41GwWyba/
 AKGJANmmbcOmw9OPNtAbTtVAPBbRFWVkZMAS+LBb1w6uIeTNylRVZ6BeJSxiA0VgOr7+kaG
 V3GLIK+fpq03Yi6qMGuvXWYSThe+WlT42PXyZt1khT5gMrGK+2uupmovZlDtznKpd1yRr4A
 zvDfMUe+vxmgVjl0DmELQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:68eClvW/uRU=:wOLypsupnL6c8fUzLgbADE
 urEoRCAKEdD4cycWXz7VoD4KbSNA2Oq6lCCGXT0d60Lx5Vr210pBVyusXNBufP7Dl2b3lCtrb
 BGMooeCMcBxm/H/bAxodKHUP/2KINdSP408vzIZ4KW1h4dSBAPDee1BGQ+BUdO1qVrMANxt/q
 cOu5FP5lzijWrYYXp1LDQzy1wEZBAYXpr8nI0PIh9jYREk8aPr1IN3+1In6r/gIpeCnf1gXIN
 ttDrLrx0GCwRFsPArOt8AnCsQt7H1Yd7qZU/g7dftk6ds2S6trATmFOe+mIjb0OcabwTv8xwu
 IGgOfZA6xH/xfEpgEObQfjgwQ4jCRoVuIZhnXMq+EgUvBLNj/hy5TXIt0NgwG/5Nz4tunkZv5
 qX70o+6M3RmEKzSd5+TCcDRdqhpS8/V+wVAzeCbPSdGXbNeRf/ugAXvZRzKw88GOvyzLfegks
 r/ZVcrbM7xFAAH4wkVnAW83Oti3EKdLafkP+awQCkLBJvkgFstZE0kupWXIeQ9S4J/3qhsbke
 u9aHPFKR2FfslDQwIDKPL7eHBDLBigT88j1pbd0DsVG0hUy3jkNe7sD3KObwPBbSXIH/iuG6+
 6GYn4Wd4RXw4tsd125i7ZOd52D5+t0YG9FNXqNfddusj0I0I2hwIH0/Wnq1+BW9Io2UavcpxA
 2Fn/siJirIE1Qa5B55OZvEJYfKbSE9/eSr7/naKjejYDEfxrfz7dcO+Idhu2YNgjLTLfHe10v
 dueOyJq2yKOBPkFroFWi3RvDX1iuG5uyOU5Yc9RtvMCzQW9SFFwWbP2fePXLgKLbvMkGF2pQl
 g2eqJ8rbC4l0e1giAAXZXMt/kZVXlon/XK/gw5x7vmL8u8lHm2vU6YzmIm83VGPO2P99r0Sdu
 k3Jv3jpXB9omPd5P7YL2AYvQSAKrzrl1Vu9kPFNkAsWYoQ/eBCfH6l8rjNaommmIQc8jEA565
 lDJzY39sv7Xc8YEKJW2wvd3lrpFWdvLVen4lmF5WdDcnUQtuQBwOV+lzDnf3fXPwKyhVsl4uW
 K+KbQwTWqO6x3870YBkUQLYPpzfPCqRIdeHY7VukGqTGxjDLtNkz1+8jS1gC4ruHmLVDA/Kva
 xDSu4XjRTUsrDIilfslkmaxmaSo+Eso/0t2eZcYpWgYSeO5912flseX+g==
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Armin Wolf <W_Armin@gmx.de>

Use hwmon_notify_event() to make the code easier to
understand and to also generate udev events.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/hwmon/raspberrypi-hwmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/raspberrypi-hwmon.c b/drivers/hwmon/raspberrypi=
-hwmon.c
index 805d396aa81b..573f53d52912 100644
=2D-- a/drivers/hwmon/raspberrypi-hwmon.c
+++ b/drivers/hwmon/raspberrypi-hwmon.c
@@ -53,7 +53,7 @@ static void rpi_firmware_get_throttled(struct rpi_hwmon_=
data *data)
 	else
 		dev_info(data->hwmon_dev, "Voltage normalised\n");

-	sysfs_notify(&data->hwmon_dev->kobj, NULL, "in0_lcrit_alarm");
+	hwmon_notify_event(data->hwmon_dev, hwmon_in, hwmon_in_lcrit_alarm, 0);
 }

 static void get_values_poll(struct work_struct *work)
=2D-
2.20.1

