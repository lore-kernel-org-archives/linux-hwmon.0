Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C478EC38141
	for <linux-hwmon@archiver.kernel.org>; Sat, 21 Jan 2023 08:58:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229826AbjAUI60 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 21 Jan 2023 03:58:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbjAUI6Y (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 21 Jan 2023 03:58:24 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AC9041E1FB
        for <linux-hwmon@vger.kernel.org>; Sat, 21 Jan 2023 00:58:20 -0800 (PST)
IronPort-SDR: n726zeWZaSRvGMCiQj93ptS+jeOVpPuXBen3tclTn40cfSQM+xA1CSf4yRwsrYSLFVbKi7UxpQ
 8xW7gRJMxk2nvEzP79K0oCRJ7HlbNrnzSxbUG/nKuMvtnRXonVQz739NZNpz9wvN7Wn942E9/8
 kq6dyTLQSKUBC1MWtPX7bzh1c0nhdjt9v+cfSy8QQ7hDHugUVnwntMyo5vIR8bflUdHwGBvJU4
 uNJy0gdkT/q0jtMC6U4uuo/9wMetOexLzXpQJaHQdTofkB4TKSClwuRTTber1NDH7ek7qNQ7TH
 K2dINCk4G9w+BeFL2TZfDGS1
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2ATAQDLp8tjjPQc8jxaHQEBAQEJARIBBQUBSYE0BgELA?=
 =?us-ascii?q?YIsgl+VbZ1BgX4PAQ8BAUQEAQGFBgKFICY2Bw4BAgQBAQEBAwIDAQEBAQEBA?=
 =?us-ascii?q?wEBBgEBAQEBAQYEFAEBAQFAGAE5BwtSBwtYBweBQQuBYRMLAwQGJw2GVwIBA?=
 =?us-ascii?q?zIBDQEBNwEPGThXBgESgn6DI6tYgQGCCAEBBoJimmeBXgmBQAGLXYESgzd6Q?=
 =?us-ascii?q?z+BToEVgTyCLIQBNoZMjWiNLAqBO3yBJw5MeoESAgkCEoEgAwkDBwVJQAMLG?=
 =?us-ascii?q?A0WMgoTLTULC0orGhsHgQgqKBUDBAQDAgYTAyACDSgxFAQpEw0nJmkJAgMiX?=
 =?us-ascii?q?wUDAwQoLQk/ByYmPAdWNwYCDx83BgMJAwIfEj9xLxISBQMLFSpHBAg2BQYcN?=
 =?us-ascii?q?hICCA8SDyxDDkI3NBMGXAEpCw4RA1BHGW4EggwKBikonxtTOzCCdsJsg3qBU?=
 =?us-ascii?q?p59TIFEgjWTR5BggQotlx4ggiygb4QrAgoHFoFpC4IDTR8ZgyJPAQIBAQENA?=
 =?us-ascii?q?QIBAQMBAgEBAQkBAQEBjE6BTwwNCYIKjDhhOwIHCwEBAwmMIwEB?=
IronPort-PHdr: A9a23:oJGM3xUjPDn7y33SGBNEn0FeLtXV8K3KAWYlg6HPw5pEc7i4uZ/4N
 VPR4u9hylLMQMPa57RNlrmeurrrDGoH55vJq3UeaNpWWhoClchTnhR1DsKJUx+kJffmPSBmQ
 5QQDQ039HviaRpeE56hD2A=
IronPort-Data: A9a23:08lwnKuZysV0rxdejjvcdiPuCOfnVG9YMUV32f8akzHdYApBsoF/q
 tZmKW6OPauDZWOgeNEjOtyxpEtQvMPXzIVmHVc+qy4wRHlHo5SbCI+Udkr5NC/Nc5TOHBg4v
 s5BZoLKfJo6ESHQqEmEP+m6pxGQ94nRFuKmUrKs1gOd5ONAYH184f62s7dh2uaEufDgX0XV/
 4maT/T3YDdJ4RYtWo4pw/vrRC1H7KyaVAww5jTSVdgT1LMJvyR94Do3fMldHlOgKmVmNrfSq
 9XrkNlVyljkEyIFUbtJpFpannoiGdY+NSDW4pZftjPLbhJq/kTe2Y5jXBYQhNs+Zzihx7hMJ
 NtxWZOYERkyeab3udUncxhSEjlDIq9cpb/MCC3q2SCT5xWun3rEyfRyFwc9J4QH9OFtDSdD8
 OFeKTxLZw3ra+Cenur9ELU2wJ5zapO3YOvzuVk5pd3dJfg8SJbAa67Q7MBW2y08wM1LALDfa
 4wQdFKDaTycP0URYA5HVMpWcOGAgmjEMB95q06pgLsy4zD36wFb8bj3GY+AEjCNbZ4NxRbC/
 DOuE37CKhUbMsGPjDqa93WqrvHAkDm9W48IErC8sPlwjzW7wm0VFQ0+T1y2qvr8l1X4Xd9DQ
 2QW9icqs6Eo+WSwU8LwGRa/pRa5UgU0BYIVSbFgrVvdj/CIv0CCGmEYTzUHdMQptYk9Qjls3
 0Lhc87V6SJH6KOODnmm14aujTK4ODAoMm0YOC8PZF5QizX8m70bghXKR9dlNae6iNzpBD39q
 wxmSgBg393/auZVis2GEUD7byGE48OSHlFsum07Skr8s1ojPNb7D2C9wQKDhcusOrp1WXGog
 RDoceCl/ewIAIDleMelGr1VRNlFC96jPSKUullyA5lpyD2p9mXLQGy9yG8mYR01aINeKXqzP
 BOVoh9Y+J5YemeyYq4xaIW0Tc03pUQBKTgHfqyIBjatSsIqHONiwM2ITRTIt4wKuBJy+ZzTw
 b/BLa6R4Y8yUMyLNgaeSeYHyqMMzSsj327VTp2T5035jubEPy/JE+hfbQPmggUFAEWs/ly9H
 zF3aZbi9vmjeLeuCsUq2dRMdwFVfShT6W7e9ZQKKrDrzvVa9JEJUKeKkel7KuSJboxJjuiA/
 3ehV1VexUaXuJE0AVviV5yXU5u2BcwXhSxhYkQR0aOAhyBLjXCHsP5BK/PavNAPqIRe8BKDZ
 6JfI57QU60SEVwqOV01NPHAkWCrTzzz7SrmAsZvSGFXk0dIS1Ob99n6UBHo8SVSXCO7udFn8
 ++rzArET50ZS0JvCduQaf7pxk7o5SoRn+d7Xk3pJNhPeRyyr9E0en2t3646c5MWNBHO5jqGz
 ALIUx0Wkun6pdNn+tf+mvHWpoikJOJyA05GEjSJ9r2xLyTboDauzNYYAuaFdDzQTk3u/6Cma
 bkHxv3wKqRXzl1QupVyFKxni687+p3uq/lT0108TnnMal2qDJJmI2WHhJcQ7/Mcl+MI6AbvA
 xCB4NhXP7mNKfjJKl9JKVp3dPmH2NEVhiLWs6Y/LnL60ykrrrCJZloDbRCDhRtUIKZxLI54k
 /wqv9Qb6lLjhxcnboSGgyRT+zjeJ3AMSf985JsbHJStgRAi1V9Fe5CaByrrppCDLdxRaxF4L
 jiRjavEprJd2kubLSVqSymcgbsMiMRcog1OwX8DO0+NxIjPiMg36xsNoz45eRsEnBxI3tV6N
 nVvK0Aod76F+C1lhZYfUm3wSRtNAgaVph74x1cTzzeLERHtDDCXaTdtfLzRoAYC72tAfzMd4
 KmXySDuVjOsddyohnk+XktsqvrCS91t91Scx5n5TpXZTsg3MWj/n6ujRWsUsB+7U8k/s0uW9
 +Bl8dF5ZbD/KSNN8bYwDJOX1OpMRR2JTICYrSqNIE/U8bngRQyP
IronPort-HdrOrdr: A9a23:AEQ20K+l8s/OxvvyUVxuk+ACI+orL9Y04lQ7vn2ZKSY+TiVXra
 GTdZMgpGbJYFR4YhwdcLW7VJVoLkmslqKdjbN/AV7mZniDhILKFvAF0WKd+UyDJ8SWzIc0vp
 uIMZIOb+EYZmIbsS+V2meF+1lM+qj+zEnRv5a68550d3AXV0h/1XYFNu9FKDwMeOGWbaBJbq
 ah2g==
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 21 Jan 2023 19:28:19 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30L8vxu32985116
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 21 Jan 2023 19:58:14 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30L8vxu32985116
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674291494; bh=8F103dRLrYEfzlD604HLoT559+l4Xjd27vExN5AC28k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FTgM89o8q4+TY1Lq2G0wXRo4h9Y3itJKgm3+R1FY8wtJ8qmtHhm8D+4yPIc2l4Vdc
         po1DT7LjDDskTbap1eRmgwcHMl1OJldPCahppNZ2sXbVpkDEetXdxT553KnoKexr9G
         VgsPyErgiGM1wX7vAmr8RJS3Ye5JPxq4+ZxuEy8foT87H4Hz17fKZHayQfM4j9JZgE
         +KlabJ9as9u/2HRXOZHISCiY36DuB1Vbnt5/JVSXbGJhFygYszyLo5vMkLY6JgSYOU
         sgNNaEiNA7uWawNDcGXViJMaeRbTsWIPhLsE9DVFi3wYOZC8pmXawvmQaUt5X9IqmM
         3b77XOnX1CPfw==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 1/2] hwmon: (it87) Group all related MODULE_PARM definitions together
Date:   Sat, 21 Jan 2023 19:57:53 +1100
Message-Id: <20230121085754.1693336-2-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230121085754.1693336-1-frank@crawford.emu.id.au>
References: <20230121085754.1693336-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 21 Jan 2023 19:58:14 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Group the MODULE_PARM definitions together to make them easier for
future maintenance, rather than having them spread across the file.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---
 drivers/hwmon/it87.c | 23 +++++++++++++++--------
 1 file changed, 15 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index ee48e238e46f..a8a6a0ffee82 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -65,14 +65,6 @@ enum chips { it87, it8712, it8716, it8718, it8720, it8721, it8728, it8732,
 	     it8771, it8772, it8781, it8782, it8783, it8786, it8790,
 	     it8792, it8603, it8620, it8622, it8628 };
 
-static unsigned short force_id;
-module_param(force_id, ushort, 0);
-MODULE_PARM_DESC(force_id, "Override the detected device ID");
-
-static bool ignore_resource_conflict;
-module_param(ignore_resource_conflict, bool, 0);
-MODULE_PARM_DESC(ignore_resource_conflict, "Ignore ACPI resource conflict");
-
 static struct platform_device *it87_pdev[2];
 
 #define	REG_2E	0x2e	/* The register to read/write */
@@ -181,6 +173,12 @@ static inline void superio_exit(int ioreg)
 #define IT87_SIO_VID_REG	0xfc	/* VID value */
 #define IT87_SIO_BEEP_PIN_REG	0xf6	/* Beep pin mapping */
 
+/* Force chip ID to specified value. Should only be used for testing */
+static unsigned short force_id;
+
+/* ACPI resource conflicts are ignored if this parameter is set to 1 */
+static bool ignore_resource_conflict;
+
 /* Update battery voltage after every reading if true */
 static bool update_vbat;
 
@@ -3457,11 +3455,20 @@ static void __exit sm_it87_exit(void)
 
 MODULE_AUTHOR("Chris Gauthron, Jean Delvare <jdelvare@suse.de>");
 MODULE_DESCRIPTION("IT8705F/IT871xF/IT872xF hardware monitoring driver");
+
+module_param(force_id, ushort, 0);
+MODULE_PARM_DESC(force_id, "Override the detected device ID");
+
+module_param(ignore_resource_conflict, bool, 0);
+MODULE_PARM_DESC(ignore_resource_conflict, "Ignore ACPI resource conflict");
+
 module_param(update_vbat, bool, 0);
 MODULE_PARM_DESC(update_vbat, "Update vbat if set else return powerup value");
+
 module_param(fix_pwm_polarity, bool, 0);
 MODULE_PARM_DESC(fix_pwm_polarity,
 		 "Force PWM polarity to active high (DANGEROUS)");
+
 MODULE_LICENSE("GPL");
 
 module_init(sm_it87_init);
-- 
2.39.0

