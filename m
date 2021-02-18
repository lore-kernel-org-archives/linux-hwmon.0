Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6CC7C433E0
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Feb 2021 14:40:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8681664E85
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Feb 2021 14:40:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230314AbhBROkV (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 18 Feb 2021 09:40:21 -0500
Received: from smtp.outgoing.loopia.se ([93.188.3.37]:41605 "EHLO
        smtp.outgoing.loopia.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231735AbhBRL5w (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Feb 2021 06:57:52 -0500
Received: from s807.loopia.se (localhost [127.0.0.1])
        by s807.loopia.se (Postfix) with ESMTP id 7A0A42467BD4
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Feb 2021 12:53:08 +0100 (CET)
Received: from s499.loopia.se (unknown [172.22.191.5])
        by s807.loopia.se (Postfix) with ESMTP id 5A5222E2759E;
        Thu, 18 Feb 2021 12:53:08 +0100 (CET)
Received: from s476.loopia.se (unknown [172.22.191.6])
        by s499.loopia.se (Postfix) with ESMTP id 4A7A91CE61FF;
        Thu, 18 Feb 2021 12:53:08 +0100 (CET)
X-Virus-Scanned: amavisd-new at amavis.loopia.se
Received: from s630.loopia.se ([172.22.191.5])
        by s476.loopia.se (s476.loopia.se [172.22.190.16]) (amavisd-new, port 10024)
        with LMTP id UAaIMZeNH7Cm; Thu, 18 Feb 2021 12:53:07 +0100 (CET)
X-Loopia-Auth: user
X-Loopia-User: carl@hgsystem.se
X-Loopia-Originating-IP: 94.234.46.141
Received: from localhost.localdomain (c-5eea2e8d-74736162.cust.telenor.se [94.234.46.141])
        (Authenticated sender: carl@hgsystem.se)
        by s630.loopia.se (Postfix) with ESMTPSA id D7DF713ABE15;
        Thu, 18 Feb 2021 12:53:06 +0100 (CET)
From:   Erik Rosen <erik.rosen@metormote.com>
To:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Erik Rosen <erik.rosen@metormote.com>
Subject: [PATCH v3 0/2] hwmon: (pmbus) Add ST STPDDC60 pmbus driver
Date:   Thu, 18 Feb 2021 12:52:47 +0100
Message-Id: <20210218115249.28513-1-erik.rosen@metormote.com>
X-Mailer: git-send-email 2.11.0 (Apple Git-81)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This patch series adds hardware monitoring support for the ST STPDDC60
chip. The driver has been tested with a Flex BMR481 converter.

The checkpatch script complains about an unneeded paranthesis in an
if-statement but gcc gives a warning if it is removed.

v3
stpddc60_get_offset:
  -Change type from u8 to int for "offset" to avoid potential overflow in calculation
  -Simplify if-expression for checking limits

v2
-Remove "chips" enum since it is not used
-Remove stpddc60_vid2mv function
-Remove stpddc60_mv2l function
-Add stpddc60_get_offset function
-Add stpddc60_adjust_linear function
stpddc60_read_word_data:
  -Return the value reported by MFR_READ_VOUT to avoid having to convert from VID
  -Add explanation why only 11 bits are used
stpddc60_write_word_data:
  -Rewrite comment
  -Add support writing vout limits
  -Adjust linear exponent to match read value
-Use the probe_new function callback

Erik Rosen (2):
  Add pmbus_set_update() function to set update flag on selected sensors
  Add ST STPDDC60 pmbus driver

 Documentation/hwmon/index.rst    |   1 +
 Documentation/hwmon/stpddc60.rst |  90 +++++++++++
 MAINTAINERS                      |   7 +
 drivers/hwmon/pmbus/Kconfig      |  10 ++
 drivers/hwmon/pmbus/Makefile     |   2 +
 drivers/hwmon/pmbus/pmbus.h      |   1 +
 drivers/hwmon/pmbus/pmbus_core.c |  11 ++
 drivers/hwmon/pmbus/stpddc60.c   | 248 +++++++++++++++++++++++++++++++
 8 files changed, 370 insertions(+)
 create mode 100644 Documentation/hwmon/stpddc60.rst
 create mode 100644 drivers/hwmon/pmbus/stpddc60.c


base-commit: 6ee1d745b7c9fd573fba142a2efdad76a9f1cb04
-- 
2.20.1

