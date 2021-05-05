Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE9B4C43462
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 May 2021 18:33:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C845613CB
	for <linux-hwmon@archiver.kernel.org>; Wed,  5 May 2021 18:33:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235109AbhEESeB (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 5 May 2021 14:34:01 -0400
Received: from smtp.outgoing.loopia.se ([93.188.3.37]:15005 "EHLO
        smtp.outgoing.loopia.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234953AbhEESd7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 5 May 2021 14:33:59 -0400
Received: from s807.loopia.se (localhost [127.0.0.1])
        by s807.loopia.se (Postfix) with ESMTP id 0C1701A9FC51
        for <linux-hwmon@vger.kernel.org>; Wed,  5 May 2021 20:33:00 +0200 (CEST)
Received: from s934.loopia.se (unknown [172.22.191.5])
        by s807.loopia.se (Postfix) with ESMTP id F00342E2C5CA;
        Wed,  5 May 2021 20:32:59 +0200 (CEST)
Received: from s475.loopia.se (unknown [172.22.191.5])
        by s934.loopia.se (Postfix) with ESMTP id EC14E7CE9D1;
        Wed,  5 May 2021 20:32:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at amavis.loopia.se
Received: from s645.loopia.se ([172.22.191.5])
        by s475.loopia.se (s475.loopia.se [172.22.190.15]) (amavisd-new, port 10024)
        with LMTP id A_f3cEmvDYkE; Wed,  5 May 2021 20:32:59 +0200 (CEST)
X-Loopia-Auth: user
X-Loopia-User: carl@hgsystem.se
X-Loopia-Originating-IP: 98.128.181.169
Received: from localhost.localdomain (h-98-128-181-169.NA.cust.bahnhof.se [98.128.181.169])
        (Authenticated sender: carl@hgsystem.se)
        by s645.loopia.se (Postfix) with ESMTPSA id 4669A157A02D;
        Wed,  5 May 2021 20:32:59 +0200 (CEST)
From:   Erik Rosen <erik.rosen@metormote.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Erik Rosen <erik.rosen@metormote.com>
Subject: [PATCH 2/3] hwmon: (pmbus) Add documentation for new flags
Date:   Wed,  5 May 2021 20:32:47 +0200
Message-Id: <20210505183248.57082-3-erik.rosen@metormote.com>
X-Mailer: git-send-email 2.11.0 (Apple Git-81)
In-Reply-To: <20210505183248.57082-1-erik.rosen@metormote.com>
References: <20210505183248.57082-1-erik.rosen@metormote.com>
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add documentation for the new pmbus flags PMBUS_WRITE_PROTECTED and
PMBUS_READ_STATUS_AFTER_FAILED_CHECK

Signed-off-by: Erik Rosen <erik.rosen@metormote.com>
---
 Documentation/hwmon/pmbus-core.rst | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/pmbus-core.rst b/Documentation/hwmon/pmbus-core.rst
index 73e23ab42cc3..001c64f0f8c0 100644
--- a/Documentation/hwmon/pmbus-core.rst
+++ b/Documentation/hwmon/pmbus-core.rst
@@ -289,9 +289,13 @@ PMBus driver platform data
 ==========================
 
 PMBus platform data is defined in include/linux/pmbus.h. Platform data
-currently only provides a flag field with a single bit used::
+currently only provides a flag field with three bits used::
 
-	#define PMBUS_SKIP_STATUS_CHECK (1 << 0)
+	#define PMBUS_SKIP_STATUS_CHECK  BIT(0)
+
+  #define PMBUS_WRITE_PROTECTED BIT(1)
+
+  #define PMBUS_READ_STATUS_AFTER_FAILED_CHECK  BIT(2)
 
 	struct pmbus_platform_data {
 		u32 flags;              /* Device specific flags */
@@ -315,3 +319,19 @@ status register must be disabled.
 Some i2c controllers do not support single-byte commands (write commands with
 no data, i2c_smbus_write_byte()). With such controllers, clearing the status
 register is impossible, and the PMBUS_SKIP_STATUS_CHECK flag must be set.
+
+PMBUS_WRITE_PROTECTED
+
+Set if the chip is write protected and write protection is not determined
+by the standard WRITE_PROTECT command.
+
+PMBUS_READ_STATUS_AFTER_FAILED_CHECK
+  Read the STATUS register after each failed register check.
+
+Some PMBus chips end up in an undefined state when trying to read an
+unsupported register. For such chips, it is necessary to reset the
+chip pmbus controller to a known state after a failed register check.
+This can be done by reading a known register. By setting this flag the
+driver will try to read the STATUS register after each failed
+register check. This read may fail, but it will put the chip into a
+known state.
\ No newline at end of file
-- 
2.20.1

