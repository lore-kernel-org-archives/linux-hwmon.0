Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC98C433FE
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 Jan 2022 15:16:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241273AbiAEPQ2 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 5 Jan 2022 10:16:28 -0500
Received: from aposti.net ([89.234.176.197]:42272 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237011AbiAEPQT (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 5 Jan 2022 10:16:19 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, list@opendingux.net,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 1/2] ABI: hwmon: Document "label" sysfs attribute
Date:   Wed,  5 Jan 2022 15:15:50 +0000
Message-Id: <20220105151551.20285-2-paul@crapouillou.net>
In-Reply-To: <20220105151551.20285-1-paul@crapouillou.net>
References: <20220105151551.20285-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add the "label" sysfs attribute, which can contain a descriptive label
that allows to uniquely identify a device within the system.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: New patch

 Documentation/ABI/testing/sysfs-class-hwmon | 8 ++++++++
 Documentation/hwmon/sysfs-interface.rst     | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-hwmon b/Documentation/ABI/testing/sysfs-class-hwmon
index 1f20687def44..653d4c75eddb 100644
--- a/Documentation/ABI/testing/sysfs-class-hwmon
+++ b/Documentation/ABI/testing/sysfs-class-hwmon
@@ -9,6 +9,14 @@ Description:
 
 		RO
 
+What:		/sys/class/hwmon/hwmonX/label
+Description:
+		A descriptive label that allows to uniquely identify a
+		device within the system.
+		The contents of the label are free-form.
+
+		RO
+
 What:		/sys/class/hwmon/hwmonX/update_interval
 Description:
 		The interval at which the chip will update readings.
diff --git a/Documentation/hwmon/sysfs-interface.rst b/Documentation/hwmon/sysfs-interface.rst
index 85652a6aaa3e..209626fb2405 100644
--- a/Documentation/hwmon/sysfs-interface.rst
+++ b/Documentation/hwmon/sysfs-interface.rst
@@ -99,6 +99,10 @@ Global attributes
 `name`
 		The chip name.
 
+`label`
+		A descriptive label that allows to uniquely identify a device
+		within the system.
+
 `update_interval`
 		The interval at which the chip will update readings.
 
-- 
2.34.1

