Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BBE8C433F5
	for <linux-hwmon@archiver.kernel.org>; Sat, 20 Nov 2021 20:40:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232156AbhKTUnL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 20 Nov 2021 15:43:11 -0500
Received: from o1.ptr2625.egauge.net ([167.89.112.53]:44868 "EHLO
        o1.ptr2625.egauge.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231818AbhKTUnL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 20 Nov 2021 15:43:11 -0500
X-Greylist: delayed 303 seconds by postgrey-1.27 at vger.kernel.org; Sat, 20 Nov 2021 15:43:11 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=egauge.net;
        h=from:subject:mime-version:to:cc:content-transfer-encoding:
        content-type;
        s=sgd; bh=TX0xMK7GUHeUHHgqvA7VUH7LvFvvcMijgypAUYumTPY=;
        b=Z1+Ak2Grk8XVn8l4I9FytkzWVpeC13ybYSTrD/hou3qiKv0b0afkGGnsl0Tesv8GNEk1
        X4BSPVSsYGcDnRxRFKawgfG3OMyVETNzhcZGEHW1IRqEAvyNGEu5jsWIl8fGFoSLIYJgq0
        kRe80npfFaTD+m4gxAPbV16Kq1jcJvX9Is0ztWzQlWmydYacBCivNmEf3UI6mxNsk+THds
        ufm2aKN1/wdmto9yXlcI/a8FRTKM4IdFjmAQ+yW3p07/Ar0O7JAqErkJQpUiNhDErgtfLl
        Veq2qKc/q2kz+v9wRb1/XICmbORSON/4wv5orSCBXNA831C6h7POWGXZBhH55crg==
Received: by filterdrecv-75ff7b5ffb-6sw96 with SMTP id filterdrecv-75ff7b5ffb-6sw96-1-61995BF8-2
        2021-11-20 20:35:04.086457464 +0000 UTC m=+6905716.158116308
Received: from pearl.egauge.net (unknown)
        by geopod-ismtpd-4-0 (SG)
        with ESMTP
        id jUsrcopHRv6xe-VWSe-96w
        Sat, 20 Nov 2021 20:35:03.946 +0000 (UTC)
Received: by pearl.egauge.net (Postfix, from userid 1000)
        id 70380700297; Sat, 20 Nov 2021 13:35:02 -0700 (MST)
From:   David Mosberger-Tang <davidm@egauge.net>
Subject: [PATCH 1/2] hwmon: (sht4x) Fix EREMOTEIO errors
Date:   Sat, 20 Nov 2021 20:35:04 +0000 (UTC)
Message-Id: <20211120203443.2299276-1-davidm@egauge.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?+kMxBqj35EdRUKoy8diX1j4AXmPtd302oan+iXZuF8m2Nw4HRW2irNspffT=2Fkh?=
 =?us-ascii?Q?ET6RJF6+Prbl0h=2FEtF1rRLvMrwroEOU1NSLm17o?=
 =?us-ascii?Q?cS6DEpPaWkl6Rqrm52602M3yBbGq0vVwQkE7zh4?=
 =?us-ascii?Q?ubqgrL2OXJIaOvTpEDfPn7frrgoQscHM5GcF33G?=
 =?us-ascii?Q?ZKhfcL7FRLyIAQc=2Fc9+kwvvSCWX7CQh3tBV3jI2?=
 =?us-ascii?Q?JH3NiHVMKtL1=2FT4WUXU=2FZ1RLCJDIS6bTY5LnHAB?=
 =?us-ascii?Q?UxIIIHtm3vFcBCOBcYGmQ=3D=3D?=
To:     Navin Sankar Velliangiri <navin@linumiz.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Mosberger-Tang <davidm@egauge.net>
X-Entity-ID: Xg4JGAcGrJFIz2kDG9eoaQ==
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=us-ascii
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Per datasheet, SHT4x may need up to 8.2ms for a "high repeatability"
measurement to complete.  Attempting to read the result too early
triggers a NAK which then causes an EREMOTEIO error.

This behavior has been confirmed with a logic analyzer while running
the I2C bus at only 40kHz.  The low frequency precludes any
signal-integrity issues, which was also confirmed by the absence of
any CRC8 errors.  In this configuration, a NAK occurred on any read
that followed the measurement command within less than 8.2ms.

Signed-off-by: David Mosberger-Tang <davidm@egauge.net>
---
 drivers/hwmon/sht4x.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/sht4x.c b/drivers/hwmon/sht4x.c
index 09c2a0b06444..3415d7a0e0fc 100644
--- a/drivers/hwmon/sht4x.c
+++ b/drivers/hwmon/sht4x.c
@@ -23,7 +23,7 @@
 /*
  * I2C command delays (in microseconds)
  */
-#define SHT4X_MEAS_DELAY	1000
+#define SHT4X_MEAS_DELAY_HPM	8200	/* see t_MEAS,h in datasheet */
 #define SHT4X_DELAY_EXTRA	10000
 
 /*
@@ -90,7 +90,7 @@ static int sht4x_read_values(struct sht4x_data *data)
 	if (ret < 0)
 		goto unlock;
 
-	usleep_range(SHT4X_MEAS_DELAY, SHT4X_MEAS_DELAY + SHT4X_DELAY_EXTRA);
+	usleep_range(SHT4X_MEAS_DELAY_HPM, SHT4X_MEAS_DELAY_HPM + SHT4X_DELAY_EXTRA);
 
 	ret = i2c_master_recv(client, raw_data, SHT4X_RESPONSE_LENGTH);
 	if (ret != SHT4X_RESPONSE_LENGTH) {
-- 
2.25.1

