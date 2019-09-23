Return-Path: <SRS0=LAd6=XS=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD1E5C3A5A6
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Sep 2019 07:11:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7E3A52087C
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Sep 2019 07:11:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729903AbfIWHLm (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 23 Sep 2019 03:11:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37736 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726001AbfIWHLm (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Sep 2019 03:11:42 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id D52BD8A1C91;
        Mon, 23 Sep 2019 07:11:41 +0000 (UTC)
Received: from box.home.lan.home.lan (ovpn-204-70.brq.redhat.com [10.40.204.70])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6C04B5D704;
        Mon, 23 Sep 2019 07:11:35 +0000 (UTC)
From:   Lukas Zapletal <lzap+git@redhat.com>
To:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Lukas Zapletal <lzap+git@redhat.com>
Subject: [PATCH] k10temp: update documentation
Date:   Mon, 23 Sep 2019 09:10:52 +0200
Message-Id: <20190923071052.25320-1-lzap+git@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.69]); Mon, 23 Sep 2019 07:11:41 +0000 (UTC)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

It's been a while since the k10temp documentation has been updated.
There are new CPU families supported as well as Tdie temp was added.
This patch adds all missing families which I was able to find from git
history and provides more info about Tctl vs Tdie exported temps.

Signed-off-by: Lukas Zapletal <lzap+git@redhat.com>
---
 Documentation/hwmon/k10temp.rst | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/k10temp.rst b/Documentation/hwmon/k10temp.rst
index 12a86ba17de9..bb2d0a02dc45 100644
--- a/Documentation/hwmon/k10temp.rst
+++ b/Documentation/hwmon/k10temp.rst
@@ -1,7 +1,7 @@
 Kernel driver k10temp
 =====================
 
-Supported chips:
+Although the driver is named k10temp, it supports wide range of AMD CPUs:
 
 * AMD Family 10h processors:
 
@@ -21,10 +21,16 @@ Supported chips:
 
 * AMD Family 14h processors: "Brazos" (C/E/G/Z-Series)
 
-* AMD Family 15h processors: "Bulldozer" (FX-Series), "Trinity", "Kaveri", "Carrizo"
+* AMD Family 15h processors: "Bulldozer" (FX-Series), "Trinity", "Kaveri", "Carrizo", "Stoney Ridge", "Bristol Ridge"
 
 * AMD Family 16h processors: "Kabini", "Mullins"
 
+* AMD Family 17h processors: "Zen", "Zen 2"
+
+* AMD Family 18h processors: "Hygon Dhyana"
+
+* AMD Family 19h processors: "Zen 3"
+
   Prefix: 'k10temp'
 
   Addresses scanned: PCI space
@@ -110,3 +116,12 @@ The maximum value for Tctl is available in the file temp1_max.
 If the BIOS has enabled hardware temperature control, the threshold at
 which the processor will throttle itself to avoid damage is available in
 temp1_crit and temp1_crit_hyst.
+
+On some AMD CPUs, there is a difference between the die temperature (Tdie) and
+the reported temperature (Tctl). Tdie is the real measured temperature, and
+Tctl is used for fan control. While Tctl is always available as temp1_input,
+the driver exports Tdie temperature as temp2_input for those CPUs which support
+it.
+
+Models from 17h family report relative temperature, the driver aims to
+compensate and report the real temperature.
-- 
2.21.0

