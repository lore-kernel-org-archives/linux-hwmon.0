Return-Path: <linux-hwmon-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6235EC05027
	for <linux-hwmon@archiver.kernel.org>; Thu, 26 Jan 2023 04:03:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbjAZEDM (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 25 Jan 2023 23:03:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbjAZEDL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 25 Jan 2023 23:03:11 -0500
Received: from ipmail06.adl3.internode.on.net (ipmail06.adl3.internode.on.net [150.101.137.16])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 36DB02D72
        for <linux-hwmon@vger.kernel.org>; Wed, 25 Jan 2023 20:03:10 -0800 (PST)
IronPort-SDR: psbGyEhsS9L2cm2XCYpJ2mjSx8cqU8nIK3n8hgq2XauspANQRdRhDTlLAhr1Ve4RZI7BTGbKSI
 D2yD0mFh8pStxN2U8hP+bMn0iNNPDX3KjiomDVTO0zPZKHipGY8N5OC6H0kIelm39Yqi6cLNCE
 nw+t89jQhrlxQ8e44O9609CTQnyntK0B1LQ9+89vMDGIPSjGJ2bXxu+wU1Xs4izVqkogSNdpCI
 7xuUdzHbDCi+vfyBVNEXRLXqCHz0gXhOZScIQ3iZul9ILboA0ETa0DaQS90mg0RU4paBAsGtG7
 EaY6tLtRhsGpszeSgDsDpvCY
X-SMTP-MATCH: 0
X-IPAS-Result: =?us-ascii?q?A2A1BgCK+tFjjPQc8jxaHgEBCxIMSYE7C4ItgmCVbZ1Ag?=
 =?us-ascii?q?X4PAQ8BAUQEAQGFBgKFIyY2Bw4BAgQBAQEBAwIDAQEBAQEBAwEBBgEBAQEBA?=
 =?us-ascii?q?QYEFAEBAQFAUgcLUgcLWAcHgUELgWETCwMECCUNhlYCAQMyAQ0BATcBDxk4V?=
 =?us-ascii?q?wYBEhmCZYMjrRaBAYIIAQEGgmKaZ4FeCYFAi2GBFIM3ekM/gU6BFYE8gT5uh?=
 =?us-ascii?q?AElEYYqIo4IjTYKgTl4gSUOTHqBDwIJAhGBLAMJAwcFSUADCxgNFjIKEyw1C?=
 =?us-ascii?q?wtKKxobB4EGKigVAwQEAwIGEwMgAg0NGzEUBCkTDScmJkMJAgMhXwUDAwQoL?=
 =?us-ascii?q?Qk/ByYkPAdWNwYCDx83BgMJAwIfT3EvEhIFAwsVKkcECDYFBhw2EgIIDxIPL?=
 =?us-ascii?q?EQOQjc0EwZcASkIAw4RA1BHGW4EghEGKSafBwcOHBNRgSeBKRmSdRytaX6BN?=
 =?us-ascii?q?oN8gVKefUyBRII1jF+GaJFqhRaPYYJWIKIEgRiEKwIKBxaBaQKCDE0fGTuCZ?=
 =?us-ascii?q?08BAgEBAQ0BAgEBAwECAQEBCQEBAQGCBIwZGYITjDhhOwIHCwEBAwmMIwEB?=
IronPort-PHdr: A9a23:jp1W+BbJVNvQXNmoc+wTLmz/LTAZhN3EVzX9orItiq5VNK+59ovsO
 1bTo/hokRnIUcPS9qEMgvDd5qbnX2FI+pOdqDYYfZlLSxJAiN1DkQAsWpzaAET3fvK2MHxoR
 ZYQX1U8pyOwOhAKcPs=
IronPort-Data: A9a23:2znzwaz8i8Aa7tAutBZ6t+cDwCrEfRIJ4+MujC+fZmUNrF6WrkVVm
 jBNUWGHO/aIYmXwfNl3YY2z9h4EsZGAmNVkQFBopS4wQi0aoJbJXd7FfhqoZnLCcMefF05rt
 ZwSO4SRJ59kZ3KN/R3F3prJ9Ckkj/vULlbf5E8oHggrGGeInQ940UoLd9YR29Iu2Z7ja++0k
 YuaT/f3YTdJ5hYtWo4qw/LbwP9QlKyaVAMw5jTSstgW1LN2vyB94KM3fcldHVOhKmVnNrLSq
 9L48V2M1jixEyHBqz+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRYRQR8/ttmHozx+4
 MVUlp6XRy4oApH3xeVGYytoUAZlfpQTrdcrIVDn2SCS50fHb2CqyO9nE08xJ4Fe9+NqR2BCs
 /UFQNwPRk7bwbjqmvThGq822phLwMrDZevzvllu1zjfDt4tW5ncTaLQ6ZlV2Sp2h8wIFOu2i
 88xNWY3PEWcOUEUUrsRILQYjsP2un70TwRFsFWX4qA0+k3W1AMkhdABN/KOIofaH58E9qqCn
 UrC/mLkElQaK9mYzxKb/X+2wOzChyX2XMQVDrLQ3vprhkCD7nYUBRYVEEag5/+0liaWWd5SL
 1Id4CcGtrUp+QqgSdyVYvGjiCDc+0RAAZ8KQ6hgtF3L0bbd/weSQHQcQT8HY9sj8sYrLdA36
 rOXt8PwJj5IvpSUdU6mq7bPnQGCeg8OblZXMEfoUjA5y9XkpYgyiDfGQdBiDLO5g7XJ9dfYn
 WniQM8W2eh7sCIb60mo1RWc2GLz/8Shohodv1iOBDr9sGuVcab/P+SVBU7nAeFoBbvxorOph
 2kIncWPhAzlJcvVzHTlrAklOry2r82CLSHcyWFmG5Q6nwlBFlb9JcUKvGs7fhcsaJpYPyT1a
 VPSskVN/JBSenCtaOl+fupd6vjGL4C8SbwJtdiONbKih6SdkyfdoklTiba4hTyFraTVufhX1
 W2nWcitF20GLq9s0SC7QewQuZdymH9imzyKGcqkl0T8uVZ7WJJzYelcWLdpRr5khJ5oXC2Po
 r6zyuPQlE4GC7WuCsUp2dNDcwlSRZTEOXwGg5cPLb7ZeFsO9JAJF+feibInZ4F/malJ/tokD
 VnjMnK0PGHX3CWdQThmn1g/MNsDq74j9CxnVcHtVH70s0UejXGHs/pPLMdnLOF5nAGhpNYtJ
 8Q4lwy7KqwnYlz6F/41NPERdaRuK0amgxygJS2gbGRtdpJsXVWZqNT+dxTh8zMCSCeyqI0/r
 /upy1qDE5YEQg1jCufQae6ulg3u5yFEw70iD0aYcMNOfEjM8ZRxL3KjhPEAI/YKdUfJyAyFh
 lSfDhovrOXQp5M4rYvSjqeeoob3T+ZzRxIIH2TS4busGzPd+26vnd1JXOqSJGCPX3n956ulf
 +kTwvThdvwL2l9X6tIuH7FuxKM4xt3uu74DkFs+RSyQMAT7B+o5cHec3MRJuqlc/ZNjuFO7C
 hCV591XGbSVI8e7QlQfEwoSaLjR3/8jhWiA5Ps4F0z2+Str8efVSk5VJRSN1nBQIbYpYoMox
 eAt5Jwf5wCl0EF4ONealWZf7W2TIHsaX+Mqs4xcAYOtgxdykgNOZpnVCynX5pCTaowSbRNze
 2TL1PrP1+ZG207PU3svDnyTj+BTspQ5vkwYxlE1OAXbk9XIsfY7wRlN/GllVQ9S1BhGjb5+N
 zQ5LUFzPqnSrT5kiNIYBTLyQ0QbWEfcoBy0kQdV0nbFRlWpXSrRNGI8f+2K+QYQ7jsELDRc+
 biZzkfjUCrrJZ+uhHJrAhE1+/GzH8Zs8gDimdy8G5jXFZcNZ2u3i6CjUmMEth/7DJ5jn0bAv
 +Rrorp9ZKCT2fT8eEHn51R2DYgtdS0=
IronPort-HdrOrdr: A9a23:814RcaG+FgMWrTULpLqEMseALOsnbusQ8zAXPiBKIyC9vPb4qy
 nIpoVj6feX4Ax9ZJhEo7y90ca7MBDhHPJOjrX5eI3SODUO21HYSr2Kk7GSoQEIcheWnoVgPO
 VbAs9D4bbLbWSS4/yV3OE2fuxQuOVviJrY4Ns2100dMT2CdZsQkjuR1TzraXGflWF9dOAEKK
 Y=
X-IronPort-Anti-Spam-Filtered: true
Received: from 60-242-28-244.static.tpgi.com.au (HELO bits.crawford.emu.id.au) ([60.242.28.244])
  by ipmail06.adl3.internode.on.net with ESMTP; 26 Jan 2023 14:33:08 +1030
Received: from agc.crawford.emu.id.au (agc.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc07])
        (authenticated bits=0)
        by bits.crawford.emu.id.au (8.17.1/8.17.1) with ESMTPSA id 30Q42O5a1960730
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Thu, 26 Jan 2023 15:02:59 +1100
Authentication-Results: bits.crawford.emu.id.au; arc=none smtp.remote-ip=fdd2:7aad:d478:1::cb10:cc07
DKIM-Filter: OpenDKIM Filter v2.11.0 bits.crawford.emu.id.au 30Q42O5a1960730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crawford.emu.id.au;
        s=s1; t=1674705780; bh=qvNHfDoiv+ywiowF+uC67ZtVUGDsZYxajcY210GkE+8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FZjLUo7B75n8Hfs6PbIngfUVdxRwfotCe/5I8gM1HVlP0ZIsxwpGutA6GFaxWcb4Y
         etmfpIxyKfW6A6ZrXc1WUNBn7ihuMDimT6XPijjik7hSo+BqRLm+s+o7IwKLya6qFV
         A97LfEuxLtZ0WDrODvvvazCLwLHTZ86sWiYuMNu93hWDJtQ8EYFNed816Vj/aQM9X7
         8oKKP4tkq79pML9YfUFeY3Q+9pphVpRPRWgM7XQc2YDdAWDvvQ+6ntfKY322JlIRfC
         2cfwspM7HbEDL7L8M3FJLzpNVQda+lJDlrzEB/mTlOiofoz0FuRlMPxmq7AITpwLIq
         VgxjAtsnARMPw==
From:   Frank Crawford <frank@crawford.emu.id.au>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org,
        Frank Crawford <frank@crawford.emu.id.au>
Subject: [PATCH v1 7/7] hwmon: (it87) Updated documentation for recent updates to it87
Date:   Thu, 26 Jan 2023 15:02:23 +1100
Message-Id: <20230126040223.986189-8-frank@crawford.emu.id.au>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126040223.986189-1-frank@crawford.emu.id.au>
References: <20230126040223.986189-1-frank@crawford.emu.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.6.4 (bits.crawford.emu.id.au [IPv6:fdd2:7aad:d478:1:0:0:cb10:cc01]); Thu, 26 Jan 2023 15:03:00 +1100 (AEDT)
X-Virus-Scanned: clamav-milter 0.103.7 at bits.crawford.emu.id.au
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Updated the driver documentation to list all current chips and
describe the module parameters as per descriptions in the code.

Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
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

