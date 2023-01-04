Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5351FC4332F
	for <linux-hwmon@archiver.kernel.org>; Wed,  4 Jan 2023 06:10:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbjADGKZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 4 Jan 2023 01:10:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233336AbjADGKC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 4 Jan 2023 01:10:02 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CD1D018695
        for <linux-hwmon@vger.kernel.org>; Tue,  3 Jan 2023 22:09:58 -0800 (PST)
IronPort-SDR: k4hbEVMrstG8bu8qXHfYO2bdeTSys4Sb0p0HjWSW69ymMp9lWKe9WUcu56hzekBrFADnStC5z2
 svEDtubj6WbOFIJJQQwGaVmMVBdw1g04uEDirjKOmTMRf4pVVEmPBHpspH8meK2VRjxTOw4Qed
 AVR3BwmzoFeS3XwWs0biVmRI6g4QWzTITl1kaCbjxJOQDWS0k/HMz5aGRu3OMYw80bpap70lW8
 IOWw1RnSYw3EjuEd6H/jG98kj1++7/2H4O5bz160Qu/X/NBW0/BFJCcqCxn1pBdBTQpCEfrwVg
 FNEx5/gyRQWp4GuN6B086zmv
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2CqBgDfFrVjjPQc8jxaHgEBCxIMSYE7C4Itgl+1Jw8BD?=
 =?us-ascii?q?wEBRAQBAYUFAoURJjcGDgECBAEBAQEDAgMBAQEBAQEDAQEGAQEBAQEBBgQUA?=
 =?us-ascii?q?QEBAUBSBwtSBwtYBweBQQuBYRMLAzENhlcCAQMyAQ0BATcBDxk4VwYBEoJ+g?=
 =?us-ascii?q?yOvQIEBgggBAQaCYppmgV4JgUABi1+BEoM3ekM/gU6CUYIsiwKMLoxnCoE9f?=
 =?us-ascii?q?IEnDkxXAwkDBwVJQAMLGA0WMgoTLTULC0srGhsHgQoqKBUDBAQDAgYTAyICD?=
 =?us-ascii?q?SgxFAQpEw0nJmsJAgMiYQUDAwQoLQlAByYkPAdWNwUDAg8fNwYDCQMCHk9xL?=
 =?us-ascii?q?xISBQMLFSpHBAg2BQYcNhICCA8SDyxDDkI3NhMGXAEqCw4TA1BGGW8EggwKB?=
 =?us-ascii?q?ikonQiBDsYCg3iBUJ52TIFEp2AtlxkgokJLhCgCCgcWgXiBf00fGYMiTwECA?=
 =?us-ascii?q?QEBDQECAQEDAQIBAQEJAQEBAY4dDA0JggqMOGE7AgcLAQEDCYwjAQE?=
IronPort-PHdr: A9a23:KHQoURUN295ulIiGMiXboM1va4rV8K3KAWYlg6HPw5pEc7i4uZ/4N
 VPR4u9hylLMQMPa57RNlrmeurrrDGoH55vJq3UeaNpWWhoClchTnhR1DsKJUx+kJffmPSBmQ
 5QQDQ039HviaRpeE56hD2A=
IronPort-Data: A9a23:Wt3c4qD+2P8knBVW/xvlw5YqxClBgxIJ4kV8jS/XYbTApGxx0jcFm
 zRNWTzSPfaNNmOgfNx+O4S/pEgHvcTSztBjQQI5q3g2RHxGo5CeWo3JcBqvYX/Ic52ZEktrs
 chGM4jpIZFvRBcwhD/0YuC79yUUOYJk51bYILSZUsykbVY8EE/NsTo6x6hhxNQAbeGRW2thg
 /uryyHiEAbNNwBcYjp8B52r8HuDjNyq0N/PlgFWiVhj5TcyplFNZH4tDfjZw0jQHuG4KtWHq
 9Prl9lVyI94EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPqsTbJIhhUlrZzqhmuogz
 e5OqcOJFRosP4bzs+5HVT5yDHQrVUFG0OevzXmXu82P1AvNaXLzzfJ0AAc7OJBe++oxCHwmG
 f4wdmhLNEzZwbjmhujnFoGAhex6RCXvFI0Fs3dj5TrDBOkoRorPBajP+JlZ0HE5m6iiGN6CP
 JtGMWY+N0mojxtnPm0YOawsw+2UrWjSSGUIgn2EmpVoyj2GpOB2+OO1a4qPII3iqd9utkKZo
 H/WumTmBxYcHMKQxCDD8X+2gOLL2yThV+o6ELy+6+5CmlqezW9WFQZQU1anydG7hkO6RdtFJ
 mQP5zEj66M18SSWosLVAUX9+iLe+0RMHoAMT6sh9AiRy6GS/x6WBy4PSTsHYcFOWNIKqSIC0
 2XYmujqGWNW7KCQSFmi3b3OqxSYJn1ARYMdXhMsQQwA6tjlhYg8iBPTU9pueJJZaPWrSFkcJ
 BjU90ADa6UvYd0jkv7grQ+e31pAsrCQE1dvvl2JNo6wxl4hDLNJcbBE/nDy0J6sxq6iX1WHs
 WlsdyO2trhWVflheASrTfpFJ7a0+/bNDzTYjEUHInXM32r1viT/J8UKsHQkeBsvKdoNZT7iJ
 lPLtgIX75hWenK3BUOWX25TI5hxpUQDPY6+PhwxUjaoSsIuHONg1HswDXN8J0i3zCARfVgXY
 P93i/qEA3cAErhAxzGrXeob2rJD7nlgmjmMGsillUv/jur2iJuppVEtbgrmggcRsvjsnekp2
 40GXyd3408AC7alMnG/HXA7cQ5SdiBT6W/KRzx/LbbYclA8SQnN+tfN2bxpeop5kr5Tm/ugw
 51OchEw9bYLvlWecV/iV5yWQO+3NXqJhS5iY3BE0JfB8yRLXLtDG49FK8BmJ+J7rLELIDwdZ
 6BtRvhsy89nElzvkwnxp7GmxGC7XBj01w+IIQS/Zz0zI8xpSwDTo4+2dRHm6ycJFCbxuM4j5
 byskArGGMJRSwNnBcfQSfSu01Lo4ydFwrgqAhqTL4kBYljo/ahrNzf10K09LfYMHhOflDGU4
 BnHUx4XqN7Er5Ix7NSU17uPqJ2kErUiE0cDRzvb4L+6ODP05G2mxYMcAu+EcSqEBDH/4qy9a
 +JPw7fxNeBBnVoMupclS+Rnyqc35t3Oob5Gz106Qy2RNQz2W+hteyDU09NOu6tBwq5ilTG3A
 k/fqMNHPbipOd/+FABDLgQSbtOFiaMelA7NvKY8L0jN7SNq+KaKDBdJNB6WhS0DcLZ4Pd93w
 eolv8JKuQWzhgBwaYSMjzxPsW+WJ2MOVL8r8JwfHcnqhkwi1wgaM5DbDyb35rCJaslNaxd1e
 mXO3PeT3LkMlFDfd3cTFGTW2bQPj5o5uCdMkA0IKWOWy4jMifIA1RFM9Sg6E1ZOxRJd3uMtZ
 mVmax9vKaOV82s6jcRPRTv2SV8ZQUfFoAmrmx5TyDGfVFWhSm3GanElNufL90cctWtBJ2AJ8
 LadwWfjcDDrYMCogHRqAxQ99q24QIwj7BDGleCmA9+BQ8swbw3j0/2namc/ohf6Bd882R/cr
 u5w8ecuNaD2OEb8eUHg51V2CFjIdC25GQ==
IronPort-HdrOrdr: A9a23:V/PwtK6ME6buRMBwCgPXwBLXdLJyesId70hD6qkQc3ZomwKj9v
 xG+85rrCMd6l4qNU3I/OrtBEDuewK+yXcY2+Ys1PKZLW3bUQiTXedfBPXZsl/d8kTFn4Y36U
 4jSdkYNDSaNzhHZKjBjjVRnLsbsaG6GdiT9ILjJm9WPH1Xgr9bnnpE49mgYzZLrNgvP+tCKK
 ah
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 04 Jan 2023 16:39:53 +1030
Received: from agc.com.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30469VlD3124168
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Wed, 4 Jan 2023 17:09:46 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30469VlD3124168
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1672812586; bh=prUI4jFWh12MC3Qn9mW7eRKQoghRyQjqQIGBqQKol/E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cKxtS2O7lS8z/dfXFbyJ7eDbzorM47qD3zVq+FrhdOP5foZ21i/ZO6pHS1ZcLivFx
         i5Mq+efkgC/3UpJ1G4uHdAVaLooNjbXgGf/Bl9Jv10Owj5CEm6gnprxzaakUoFRpH9
         2552+OAe2bHPbAQiWAwz0zDXPB+cLpL79QKChsYZ8oOLv8Pss0fd79rp5G7Q5+KXKK
         1yNSytEeb9D8sUs/UkVetAzK+FpFLVZuVP0ENBytV3OoGIo6R4hmKp28WhPuxxal3W
         bqa5HktxbWIVAzjdYuqB51tL2KqjrB+qrwH3mt3RSoNSAKRUGMt2HzACSh6kkYTxfn
         InPQXrtL9TupA==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 1/2] hwmon: (it87) Allow calling __superio_enter outside mux
Date:   Wed,  4 Jan 2023 17:09:25 +1100
Message-Id: <20230104060926.619686-2-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104060926.619686-1-frank@crawford.emu.id.au>
References: <20230104060926.619686-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Wed, 04 Jan 2023 17:09:46 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Allow for superio_enter to be called without requesting the muxed memory
region, in particular for initialisation of the second chipset, which must
be put into configuration mode, but without an associated call to leave
configuration mode.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---

v2:
 * Improved description for patch

---
 drivers/hwmon/it87.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index 9997f76b1f4a..4ebce2c661d7 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -87,6 +87,14 @@ static struct platform_device *it87_pdev[2];
 #define	DEVID	0x20	/* Register: Device ID */
 #define	DEVREV	0x22	/* Register: Device Revision */
 
+static inline void __superio_enter(int ioreg)
+{
+	outb(0x87, ioreg);
+	outb(0x01, ioreg);
+	outb(0x55, ioreg);
+	outb(ioreg == REG_4E ? 0xaa : 0x55, ioreg);
+}
+
 static inline int superio_inb(int ioreg, int reg)
 {
 	outb(reg, ioreg);
@@ -124,10 +132,7 @@ static inline int superio_enter(int ioreg)
 	if (!request_muxed_region(ioreg, 2, DRVNAME))
 		return -EBUSY;
 
-	outb(0x87, ioreg);
-	outb(0x01, ioreg);
-	outb(0x55, ioreg);
-	outb(ioreg == REG_4E ? 0xaa : 0x55, ioreg);
+	__superio_enter(ioreg);
 	return 0;
 }
 
-- 
2.38.1

