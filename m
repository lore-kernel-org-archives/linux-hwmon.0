Return-Path: <SRS0=LAd6=XS=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20676C04EBF
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Sep 2019 10:59:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E8A9020867
	for <linux-hwmon@archiver.kernel.org>; Mon, 23 Sep 2019 10:59:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729775AbfIWK7r (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 23 Sep 2019 06:59:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45472 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727569AbfIWK7r (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 23 Sep 2019 06:59:47 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 0F7F210C092E;
        Mon, 23 Sep 2019 10:59:47 +0000 (UTC)
Received: from box.home.lan.home.lan (ovpn-204-70.brq.redhat.com [10.40.204.70])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2798E5D713;
        Mon, 23 Sep 2019 10:59:40 +0000 (UTC)
From:   Lukas Zapletal <lzap+git@redhat.com>
To:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Lukas Zapletal <lzap+git@redhat.com>
Subject: [PATCH RESEND] k10temp: update docs and add temp2_input info
Date:   Mon, 23 Sep 2019 12:59:31 +0200
Message-Id: <20190923105931.27881-1-lzap+git@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.66]); Mon, 23 Sep 2019 10:59:47 +0000 (UTC)
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
 Documentation/hwmon/k10temp.rst | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/hwmon/k10temp.rst b/Documentation/hwmon/k10temp.rst
index 12a86ba17de9..fc9d2a5ad57d 100644
--- a/Documentation/hwmon/k10temp.rst
+++ b/Documentation/hwmon/k10temp.rst
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

