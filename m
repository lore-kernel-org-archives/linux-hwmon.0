Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FEBFC4332F
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Nov 2022 15:36:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242032AbiKRPgh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Nov 2022 10:36:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242382AbiKRPgc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Nov 2022 10:36:32 -0500
Received: from scadrial.mjdsystems.ca (scadrial.mjdsystems.ca [192.99.73.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7269973BB4;
        Fri, 18 Nov 2022 07:36:23 -0800 (PST)
Received: from cwmtaff.localnet (mc-109-208.ipreg.mcmaster.ca [130.113.109.208])
        by scadrial.mjdsystems.ca (Postfix) with ESMTPSA id 97FA7889C73B;
        Fri, 18 Nov 2022 10:36:22 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/relaxed; d=mjdsystems.ca;
        s=202010; t=1668785782;
        bh=LVdqwwqRoIHLqSYZnboOGXFWnLkHvoUC0sl9Jw0oACg=;
        h=From:To:Cc:Subject:Date:From;
        b=dGkqu/4/BTp1K7Rn2L315JxTr/wAuniljiO5M40SQl50TpUrOQQ7oTfuOIZDSLn4E
         aUo7U9iz+6qNHcwXTGMrI9P4FNVrhWSCKeyixDqHOpxTF8r/dyZrgZDIur2kKkehSo
         fwwwQyq/OvIORxFsmeVhYqad9Q58btrwtBIxMRTdchIW+0KFyxRC2FJl+dNM7qulOF
         qTN/OU1UAsCjfEJ6/A8eMQbEjB3xaP3cObvTIndVVFrCQqy5/4obC/xLvhR5/y2f+s
         VvBS8hwxZpMOHr8ABILj32lrZV8+WwGEcd/TgyuAB2NUOXgQpxMvV1ax8PBo9QgT6m
         cvJ1UKK+bhlrsLsFZZ6P+7n40q7efZ+e09RyvxugWMLcBpf1wtsA++L5tViYQxDnDH
         g+FipHu0CzOSeVUD21RJHBMbdOMTFIQTRgxuyZ8eN3ndfL1ZO8JByli0iTkW/QSUTu
         b40ztjpUFft25lmOwVdI13WlmCFU9x2gWlgyEDTXD/dnqP3jYSV8qfTQYljmbIgD6P
         f+2o7Zs1EgSgfFoN8FNGjmRKAB+u5Lw08MZMhRHA9AEd7a5RTNqFg7eCqUTqPtDu0E
         kpsPHagXTBVNSuh8czNvbZAuh/fFM/Cf6QE2rrbtQWEbHVxCePC1R6zYKRQidWuYY+
         OKcuo28DOhVIQ/6UkXdG43rA=
From:   Matthew Dawson <matthew@mjdsystems.ca>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Eugene Shalygin <eugene.shalygin@gmail.com>
Subject: [PATCH v2] hwmon: (asus-ec-sensors) add definitions for ROG ZENITH II EXTREME ALPHA
Date:   Fri, 18 Nov 2022 10:36:22 -0500
Message-ID: <2407243.vFx2qVVIhK@cwmtaff>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for the Zenith II Extreme Alpha.  It is basically the same
board as the Zenith II Extreme, and has a similar sensor suite.  The
DSDT is basically the same except for some address, so use the same
board information as the non-Alpha board.

Cc: stable@vger.kernel.org

Signed-off-by: Matthew Dawson <matthew@mjdsystems.ca>
---
v2: Add missing Documentation change

 Documentation/hwmon/asus_ec_sensors.rst | 1 +
 drivers/hwmon/asus-ec-sensors.c         | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/
asus_ec_sensors.rst
index 02f4ad314a1e..a4039f2f9ca4 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -23,6 +23,7 @@ Supported boards:
  * ROG STRIX X570-I GAMING
  * ROG STRIX Z690-A GAMING WIFI D4
  * ROG ZENITH II EXTREME
+ * ROG ZENITH II EXTREME ALPHA
 
 Authors:
     - Eugene Shalygin <eugene.shalygin@gmail.com>
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 81e688975c6a..ac0459be04c7 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -466,6 +466,8 @@ static const struct dmi_system_id dmi_table[] = {
                                        &board_info_strix_z690_a_gaming_wifi_d4),
        DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG ZENITH II EXTREME",
                                        &board_info_zenith_ii_extreme),
+       DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG ZENITH II EXTREME ALPHA",
+                                       &board_info_zenith_ii_extreme),
        {},
 };
 
-- 
2.37.4


