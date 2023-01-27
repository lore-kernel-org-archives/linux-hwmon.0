Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D602C54EAA
	for <linux-hwmon@archiver.kernel.org>; Fri, 27 Jan 2023 04:42:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbjA0EmD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 26 Jan 2023 23:42:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229496AbjA0EmC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 26 Jan 2023 23:42:02 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4DE9539CD1
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Jan 2023 20:42:00 -0800 (PST)
IronPort-SDR: 6xfREQDbBCLHIyk3Dt2FTpx2c7n9hWPx8JGh2JWFM0gLDNorfppoZ8hqAQgZ3FynEpc3pgIQxk
 H6QxZD0l0A+JOLEAtEkPnbZ7h4dP3lV/66YBhYzkvb/kTC/5zgc6mchiwJ4/3dVmQbzvGGCNnF
 dRJdHaIyUg5DelyWqTo3QJTyPrdgtXyp38XlIg3C/kbrnHPYeQXWCPE5rSMRMPgfvAgFqqT4Ix
 M5CVqWLZgcEj3z3q0ybAOrRMHX53c4uKba+/Ox4qnBoYc7oqfxFdfStmhozuvOfDFTUCMYIkzK
 y3kcqA5XAqzyBkDqBCEmfpBR
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2A2CACKVdNj//Qc8jxaHgEBCxIMSYE7C4ItgmCVbZ1Ag?=
 =?us-ascii?q?X4PAQ8BAUQEAQGFBwKFIyY2Bw4BAgQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBA?=
 =?us-ascii?q?QYEgSoHC1IHC1gHB4FBC4FhEwsDBAglDYZWAgEDMgENAQE3AQ8ZOFcGARIZg?=
 =?us-ascii?q?mWDI6wcgQGCCAEBBoJimmeBXgmBQIthgRSDN3pDP4FOgRWBPIE+boQBJRGGK?=
 =?us-ascii?q?iKOIo08CoE5eIElDkx6gQ8CCQIRdFkDCQMHBUlAAwsYDRYyChMsNQsLSisaG?=
 =?us-ascii?q?weBBiooFQMEBAMCBhMDIgINDRsxFAQpEw0nJiZDCQIDImIDAwQoLQk/ByYkP?=
 =?us-ascii?q?AdWNwYCDx83BgMJAwIfT3EvEhIFAwsVKkcECDYFBhw2EgIIDxIPLEQOQjc0E?=
 =?us-ascii?q?wZcASkIAw4RA1BHGW4EghEGKSafJAYBDhwTUYEngSkZknUcrWl+gTaDfIFSn?=
 =?us-ascii?q?n1MgUSCNYxfhmiRaoUWj2GCViCiBIEYhCsCCgcWgWkGgghNHxk7gmdPAQIBA?=
 =?us-ascii?q?QENAQIBAQMBAgEBAQkBAQEBggSMGYIskUthOwIHCwEBAwmMIwEB?=
IronPort-PHdr: A9a23:YHMwgR3w69a7IawcsmDPn1BlVkEcU/3cNA8J8dwskbtRfKO589LvO
 VGZ5PkrhUKaFYzB4KdCjOzb+7vlRXRG+5uEt2wPNZ1UAhEJhZ9EwAUpDJyJVRKrfqe4PScwR
 ZwQX1Q9oBmG
IronPort-Data: A9a23:+Zi7vKP9B+DwjIzvrR2BkcFynXyQoLVcMsEvi/4bfWQNrUon0DcHy
 TYeXWqHaKyPMTD9c40jaoi0pkIPupLSmtdiQQdrry1mRCsV+JGUWI/Bdh/9bynIf8OaQU49s
 JwSNIXKBc1lFXW0SjWFa+i59yMgvU2rqhsQLMaeZ0idkCc9EH9JZSpLwrJ/2sgy6TSAK1vlV
 ena+qUzBXf8s9JKGjJMg068gEsHUMTa4Fv0aXRjDRzjlAa2e0g9VPrzF4noR5fLatU88tqBe
 gr25OrRElU1XvsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0o2HKJ0VKtZt9mGt+th1
 d4OnKW+cggkOYb2ydsCYTNhKBgraMWq+JefSZS+mcaS01aAeGHl3PtpFk1wMIgFvOd7R2hTn
 RAaAG5VKErf3aTskPThFrUEascLdaEHOKsRoHhmzhnSF/85T5fZT+PH4MIe3Tt2j90m8fP2O
 5ZBOGcyM0mfC/FJEkgJLJQdmc73umC8diRxsgOz9aol/EGGmWSd15C2aIGFIIbbLSlPpW6cp
 2Tb7yH5HRQdMvSBxjeftHGhnOnCmWX8Qo16PLm58ON6qEeUy2cQTQANE122vZGRiEKzX8xWM
 UE84Tc1oO4580nDczXmd0Pg5STY5FtGC58KT7F88x2E1qvfpRqBCWlCRTlELtU73CMredA0/
 mSZgtiqLAVhi7KYTlmnp4iLnxmLAhFAeAfuehQ4ZQcC5tDipqQ6gRTOUstvHcaJYjvdRGGYL
 9ei8nVWulkDsSIY/+DgpgCY2m7ESozhF1NsvF2PAApJ+ysjPOaYi5qUBU/zxMsowGyxdUiNu
 nUV8yR1xLpWVcnleMClZugSVIqu+uqFeALVhVN0d6TNGhzzozv5IdoVumE7fhs1dN0YcCPoa
 wnPoQxQopRUOT2jcMebgr5d6ex2kcAM9vy/DZg4i+aihbArKme6ENlGPxL44owUuBFEfGFWE
 c7znTyQJXgbE7976zG9Wv0Q17QmrghnmzyPGs2kn0//iuLCDJJwdVvjGAbeBgzexP3ZyDg5D
 /4FZqNmNj0FD7anOXGHmWLtBQ1bdiJgbXwJlyCnXrXbeVo8QjBJ5w753asuM41jg6lPkOrUl
 kxRqWcGoGcSRBTvd223V5yUQOq3AMwg8ihmY3VE0JTB8yFLXLtDJZw3L/MfFYTLPsQ5pRKtZ
 /VaKciGHNpVTTHLp2YUYZXn9dwwfw6imgyJJSbjbT0iOZ9sAQXUo4e2cgzq/SgILyy2qcpn/
 eL6jFuBHMBbSlQwFtvSZdKu00i14yoXltVyaE2UcNNdT1q9ooFlJhv4guIzP8xRew7IwSGX1
 ljKDBpB/bvNroY5/cPnn6eBq4v1QeJyElADTzvQ97+pOy7A8iyuxJIGUerOdC2EDDH4/6CrZ
 ON0yfDgMaRZwwwQ69AhSe5mlPts6cHuqrlWyhVfME/KN1n7WKl9JnSm3NVUsvMfzLFuuTywB
 hCF9O5FaOeAN87SGVIMIBYoM7aY3vYOlziMsfk4LRmo5CJz+7bbA0xeMwPW035XLadudog/y
 Pgvv9QarQG6l1wrPpCPk3kMpWiLK3UBVYQht40bWdG00FBzkAwYOZGMWDXr5JyvaslXNhd4K
 DGjhJ3E2+ZWyH3dIig6GnX61OZAgYgD5UJRx1gYKlXXxtfI2q0t0BtK/WhlRwhZ1E4dgbwrf
 zI3bQgvdeDUo2sun9RKQ2GnXR1ZCxzf8Uv0jVIUzTWLQ06tX23LDWs8JefUoh9DqToGI2ID8
 eHK0nvhXBbrYNr1gnk4V3lj+q7qQtFG/wHfnNyqQpaeFJ4gbDu73qKjaALkcfc87R/dWaEfm
 dRXwQ==
IronPort-HdrOrdr: A9a23:E4GCLaHqD5BHGDD4pLqEMseALOsnbusQ8zAXPiBKIyC9vPb4qy
 nIpoVj6feX4Ax9ZJhEo7y90ca7MBDhHPJOjrX5eI3SODUO21HYSr2Kk7GSoQEIcheWnoVgPO
 VbAs9D4bbLbWSS4/yV3OE2fuxQuOVviJrY4Ns2100dMT2CdZsQkjuR1TzraXGflWF9dOAEKK
 Y=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 27 Jan 2023 15:11:59 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30R4fIgk2462776
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Fri, 27 Jan 2023 15:41:52 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30R4fIgk2462776
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674794513; bh=l8K/vWpF+NJex4qLWZCsbMrBM0Jhr5y34qoPkEoO/bQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qi83ITOUM/GzUj1zk5msLc8gaovIHOSsfqABgnse7LA2ZHlqcbdAlPggsOM8lPtKF
         ajRTUiBPA4Cd+Jfii8oPu8CnA6JYnBcbq5IuykDpFMPuRNjk6MoJxjpSbMBD/drHQf
         saX8EbFcIXxgQ+zza0d62tRM1gHI0zsuFYXvddYiL6TSIoicZ/1nmHe16Me+QQe0Iq
         wpVJ34zTU4/gtmaJhuXPgiBswTzjqs/o6eKhPP7Kpdj6TaMXXPVrA/ze9yLCoHZvCL
         ekXc8B0/miJmrJo4ANdYQQjRgtcpCcq10wkojNmNSfewiTLbcjEeI7Ht/F/KPxeNgt
         lVMHkFztlyWbA==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v2 7/7] hwmon: (it87) Updated documentation for recent updates to it87
Date:   Fri, 27 Jan 2023 15:41:16 +1100
Message-Id: <20230127044116.1257799-8-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230127044116.1257799-1-frank@crawford.emu.id.au>
References: <20230127044116.1257799-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Fri, 27 Jan 2023 15:41:53 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Updated the driver documentation to list all current chips and
describe the module parameters as per descriptions in the code.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---

v2:
 * No change.

---
 Documentation/hwmon/it87.rst | 47 ++++++++++++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 5 deletions(-)

diff --git a/Documentation/hwmon/it87.rst b/Documentation/hwmon/it87.rst
index 2d83f23bee93..5cef4f265000 100644
--- a/Documentation/hwmon/it87.rst
+++ b/Documentation/hwmon/it87.rst
@@ -145,6 +145,22 @@ Supported chips:
 
     Datasheet: Not publicly available
 
+  * IT8792E/IT8795E
+
+    Prefix: 'it8792'
+
+    Addresses scanned: from Super I/O config space (8 I/O ports)
+
+    Datasheet: Not publicly available
+
+  * IT87952E
+
+    Prefix: 'it87952'
+
+    Addresses scanned: from Super I/O config space (8 I/O ports)
+
+    Datasheet: Not publicly available
+
   * SiS950   [clone of IT8705F]
 
     Prefix: 'it87'
@@ -162,7 +178,7 @@ Authors:
 Module Parameters
 -----------------
 
-* update_vbat: int
+* update_vbat bool
     0 if vbat should report power on value, 1 if vbat should be updated after
     each read. Default is 0. On some boards the battery voltage is provided
     by either the battery or the onboard power supply. Only the first reading
@@ -171,11 +187,31 @@ Module Parameters
     the chip so can be read at any time. Excessive reading may decrease
     battery life but no information is given in the datasheet.
 
-* fix_pwm_polarity int
+* fix_pwm_polarity bool
     Force PWM polarity to active high (DANGEROUS). Some chips are
     misconfigured by BIOS - PWM values would be inverted. This option tries
     to fix this. Please contact your BIOS manufacturer and ask him for fix.
 
+* force_id short, short
+
+  Force multiple chip ID to specified value, separated by ','.
+  For example "force_id=0x8689,0x8633".  A value of 0 is ignored
+  for that chip.
+  Note: A single force_id value (e.g. "force_id=0x8689") is used for
+  all chips, to only set the first chip use "force_id=0x8689,0".
+  Should only be used for testing.
+
+* ignore_resource_conflict bool
+
+  Similar to acpi_enforce_resources=lax, but only affects this driver.
+  ACPI resource conflicts are ignored if this parameter is provided and
+  set to 1.
+  Provided since there are reports that system-wide acpi_enfore_resources=lax
+  can result in boot failures on some systems.
+  Note: This is inherently risky since it means that both ACPI and this driver
+  may access the chip at the same time. This can result in race conditions and,
+  worst case, result in unexpected system reboots.
+
 
 Hardware Interfaces
 -------------------
@@ -193,8 +229,8 @@ Description
 
 This driver implements support for the IT8603E, IT8620E, IT8623E, IT8628E,
 IT8705F, IT8712F, IT8716F, IT8718F, IT8720F, IT8721F, IT8726F, IT8728F, IT8732F,
-IT8758E, IT8771E, IT8772E, IT8781F, IT8782F, IT8783E/F, IT8786E, IT8790E, and
-SiS950 chips.
+IT8758E, IT8771E, IT8772E, IT8781F, IT8782F, IT8783E/F, IT8786E, IT8790E,
+IT8792E/IT8795E, IT87952E and SiS950 chips.
 
 These chips are 'Super I/O chips', supporting floppy disks, infrared ports,
 joysticks and other miscellaneous stuff. For hardware monitoring, they
@@ -238,7 +274,8 @@ of the fan is not supported (value 0 of pwmX_enable).
 The IT8620E and IT8628E are custom designs, hardware monitoring part is similar
 to IT8728F. It only supports 16-bit fan mode. Both chips support up to 6 fans.
 
-The IT8790E supports up to 3 fans. 16-bit fan mode is always enabled.
+The IT8790E, IT8792E/IT8795E and IT87952E support up to 3 fans. 16-bit fan
+mode is always enabled.
 
 The IT8732F supports a closed-loop mode for fan control, but this is not
 currently implemented by the driver.
-- 
2.39.1

