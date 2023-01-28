Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC23C61DA4
	for <linux-hwmon@archiver.kernel.org>; Sat, 28 Jan 2023 06:04:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjA1GER (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 28 Jan 2023 01:04:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbjA1GER (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 28 Jan 2023 01:04:17 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2B7737C70D
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Jan 2023 22:04:14 -0800 (PST)
IronPort-SDR: 9Kq2EQKYxMi4CC/lWREMh+xXZBc4nmkN7jhh4KpIkG4jgL3FQyEunTXrJDgH+r5oK6nobeUBSs
 vcpbBQV1+QZ0U5YNqrmYG5Ovsbdosri2GxPuXxI1mJh0aMDwdojxhwxCWP3c+jqe/54Jzla7m9
 DZfonuZvu0k98wqAxMn/PjooGLZO3FTUiByAWNANqO5haWZI/KP00dkdpki9iOeYMbhbGVmcGp
 eksZCuwaj6rOKTlfwNZOTdXE764GYZzparkc29y1HdARtJ3I8gADRo2xcad9KYFDG06UN2mk8C
 WbZwd2nJUlrmYF4Lhitm4ykU
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2CoBwBJutRj//Qc8jxaHgEBCxIMSYE7C4ItgmCVbZ1Ag?=
 =?us-ascii?q?X4PAQ8BAUQEAQGFBwKFJSY1CA4BAgQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBA?=
 =?us-ascii?q?QYEgSoHC1IHC1gHB4FBC4FhEwsDBAglDYZWAgEDMgENAQE3AQ8ZOFcGARIZg?=
 =?us-ascii?q?mWDI6shgQGCCAEBBoJimmeBXgmBQItigRSDNnpDP4FOgRWBPIE+boQBJRGGK?=
 =?us-ascii?q?iKOMY1CCoE5d4ElDkx6gQ8CCQIRdHkDCQMHBUlAAwsYDRYyChMsNQsLSisaG?=
 =?us-ascii?q?weBBiooFQMEBAMCBhMDIAINDRsxFAQpEw0nJiZDCQIDIl8FAwMEKC0JPwcmJ?=
 =?us-ascii?q?DwHVjcGAg8fNwYDCQMCH1BxLxISBQMLFSpHBAg2BQYcNhICCA8SDyxDDkI3N?=
 =?us-ascii?q?BMGXAEpCAMOEQNQRhluBIIMCgYpJp85BgEOHBNRgSeBKRmSdRyta36BNoN+g?=
 =?us-ascii?q?VKefkyBRII1jGKGaZFrhRePYoJWIKIEgRiEKwIKBxaBZAKCEU0fGTuCZ08BA?=
 =?us-ascii?q?gEBAQ0BAgEBAwECAQEBCQEBAQGCBIwZgiyRS2E7AgcLAQEDCYwjAQE?=
IronPort-PHdr: A9a23:Z/+pMx8ltTMHiP9uWBXoyV9kXcBvk7/1IhVT4YAulLxJaKjl8pH/e
 k3To/xw3xfAR46O7fVChqLNtrz4H3YN5JGdvTUDaMlCWxNf25oflgByDJLaWR+ifqzhZXViT
 s9JDAANwg==
IronPort-Data: A9a23:NtYc/qx20AW+UZmDMU96t+cawCrEfRIJ4+MujC+fZmUNrF6WrkUCm
 2YdUGqEafbcNGWjctx2atvkoBxUvcDVzdNrTwVvqiBjHiNA8MDPD9qVcUypYHicJJWdRUs45
 MwUM9PJJ5pqZ3KN/R3F3prJ9Ckkj/vULlbf5E8oHggrGGeInQ940UoLd9YR29Iu2Z7ja++0k
 YuaT/f3YTdJ5hYtWo4qw/LbwP9QlKyaVAMw5jTSstgW1LN2vyB94KM3fcldHVOhKmVnNrLSq
 9L48V2M1jixEyHBqz+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRYRQR8/ttmHozx+4
 N9PkregCggTB7Dds91DCiV/HwE9P7ITrdcrIVDn2SCS50fHb2CqyO9nE08xJ4Fe9+NqR2BCs
 /UFQNwPRk7bwbjqmvThGq822phLwMrDZevzvllu1zjfDt4tW5ncTaLQ6ZlV2Sp2h8wIFOu2i
 88xNWY2NEyaOUQSUrsRILdvw8iBg3eiSGZ/tUm39PoewWruxzUkhdABN/KOIofaH58E9qqCn
 UrC/mLkElQaK9mYzxKb/X+2wOzChyX2XMQVDrLQ3vprhkCD7nYUBRYVEEag5/+0liaWWd5SL
 1Id4CcGtrUp+QqgSdyVYvGjiCDc+0RAAZ8KQ6hgtF3L0bbd/weSQHQcQT8HY9sj8sYrLdA36
 rOXt9nrIhd/87KvcG+M3Y7K9A+VNQhWL3BXMEfoUjA5y9XkpYgyiDfGQdBiDLO5g7XJ9dfYn
 WjiQM8W2eh7sCIb60mo1RWc2GLz/8Shohodv1iOBDr9sGuVcab/P+SVBU7nAeFoBbvxorOph
 2kIncWPhAzlJcvVzHTlrAklOry2r82CLSHcyWFmG5Q6nwlBFlb9JcUKvGs7fhcsaJpYPyT1a
 VPSskVN/JBSenCtaOl+fupd6vjGL4C8SbwJtdiONbKih6SdkifdpEmCgmbKgQjQfLAEy/1XB
 HtiWZ/E4LZzIf0PIMCKb+kcy6Q34Ss12HneQ5v2pzz+j+XCNCLJE+1bbQHeBgzc0E9iiFuNm
 zq4H5XXoyizrMWkM0E7DKZJcgtRdiVhbXwIg5EGLLbaSuaZJI3RI6SJmuN7Id0Nc1V9iv/Ht
 nC7RkJCzlfj7UAr2i3UAk2OqdrHA/5CkJ7MFXVyZgb4hyR/P9zHAWV2X8JfQITLPddLlZZcJ
 8Tpse3ZUpyjkxzLpGYQa4fTtotneEj5jA6CJXP1MjMldoFuQBbFvNLhY03u+G8HE3Pv58c5p
 rSh0CLdQIYCHlo9VpyHM6L0k17h72IAnO9SXlfTJocBckvb8L9sd377gMgocpMFJhj0zzeH0
 xqbXEUDru7Xro5rrNTE3PjWr4qgH+ZkMFBdGm3XseS/OSXApzrxypVJT+iPZzybWWbpvqSuI
 +xIlqmuPPoClVdMkox9D7cyk/1kvYq09+QGw109TnvRblmtBrdxGVW83JFC5v9X27tUmQqqQ
 UbRqNNUDrW+Pp+3GlAmO1t3Z+uO4vgYhz3O4KlnO079/iJ2ouaKXEgObRmBjCtRcOl8PI8/m
 7xzss8K8Eq0kBM1PNGcgmZZ8nnKL3BGWrh+7sMWB4riiwwKzFBeYMWCVXWsscrfMIlBYhswP
 zuZpKvenLAClEDMRHoEEySf1+RqmsVcsR9H+1YOOlCVl4eXnfQwxhBQr2g6Q1gH1BlByO4va
 GFnO1cuf/fQp3Iy2JIGBTDpQV0dQgaF81DwwB0VjGLYCUKvUyrEMTRla+qK+UkY9UNafyRap
 e/Hkjy0CmaxIMyhjDEvXUNFquD4SYAj/AP1npH1FsuIKJA2fD75j/L8fmEPsRbmX588iUCvS
 TOGJwqshXAX7RItnpA=
IronPort-HdrOrdr: A9a23:gMi7q6phoLTentYt4RchuxAaV5rxeYIsimQD101hICG9Evbzqy
 lhppUmPHjP+U8ssBNJo7290cy7LU80mqQFgrX5UY3MYOCighrNEGgA1/qF/9SfIVydygc178
 4JGJSWSueAamSS5vyb3ODXKbgdKFbrytHRuQ6n9QYJcehzUdAd0+5mMHfnLqSofng8OXLpfK
 DsnPZ6mw==
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 28 Jan 2023 16:33:54 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30S63ChF2973396
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Sat, 28 Jan 2023 17:03:50 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30S63ChF2973396
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674885830; bh=MSNYIPrAfW4K6tz4R4oTou9pEQiEgFnaPs8051r27P8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MM0zgOVp06+ttY1sffwZ9G0/DrpyOyBcfvl7mtVZe92owD+mbsSIH6mQqr/k80OFS
         IJhmD8nObgiN/ry/6ogEMIjz0KCibXGmwaGQB/HSx7OVNIrm7qTtK4vzjSqlLgLVPw
         /hcTRKrme0HX6utgSbZxShQ7DoxnmviAqa7plxn+x+zM0yTaEUPJ6cmk8Xzy252z6W
         VX0i5T3aJPbX58kFsObDnd3ZxWw5njrES16AdlVo/HwM/YjSKRh83Ds4bQyEMX8E2L
         eqo1zv5VabMWGpy/f7chJuxmjg3SWJLS6sf8N6V3y/BBwLGJGLLd5gD0cOBF83AuUL
         I8U8pCEP3FBMg==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v3 7/7] hwmon: (it87) Updated documentation for recent updates to it87
Date:   Sat, 28 Jan 2023 17:03:08 +1100
Message-Id: <20230128060308.1549707-8-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230128060308.1549707-1-frank@crawford.emu.id.au>
References: <20230128060308.1549707-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Sat, 28 Jan 2023 17:03:50 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Updated the driver documentation to list all current chips and
describe the module parameters as per descriptions in the code.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
---

v3:
 * No change.

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

