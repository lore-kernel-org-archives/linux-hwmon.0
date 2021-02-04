Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B6FCC433DB
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Feb 2021 13:25:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55B8C64F4D
	for <linux-hwmon@archiver.kernel.org>; Thu,  4 Feb 2021 13:25:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236276AbhBDNZJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 4 Feb 2021 08:25:09 -0500
Received: from smtp.outgoing.loopia.se ([93.188.3.37]:58840 "EHLO
        smtp.outgoing.loopia.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236277AbhBDNZI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 4 Feb 2021 08:25:08 -0500
Received: from s807.loopia.se (localhost [127.0.0.1])
        by s807.loopia.se (Postfix) with ESMTP id 99BFF24682A0
        for <linux-hwmon@vger.kernel.org>; Thu,  4 Feb 2021 14:20:54 +0100 (CET)
Received: from s498.loopia.se (unknown [172.22.191.6])
        by s807.loopia.se (Postfix) with ESMTP id 795042E2B872;
        Thu,  4 Feb 2021 14:20:54 +0100 (CET)
Received: from s473.loopia.se (unknown [172.22.191.5])
        by s498.loopia.se (Postfix) with ESMTP id 66A3E4744DC;
        Thu,  4 Feb 2021 14:20:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at amavis.loopia.se
Received: from s499.loopia.se ([172.22.191.6])
        by s473.loopia.se (s473.loopia.se [172.22.190.13]) (amavisd-new, port 10024)
        with LMTP id jKifK6UBgCuU; Thu,  4 Feb 2021 14:20:53 +0100 (CET)
X-Loopia-Auth: user
X-Loopia-User: carl@hgsystem.se
X-Loopia-Originating-IP: 155.4.131.176
Received: from localhost.localdomain (h-155-4-131-176.NA.cust.bahnhof.se [155.4.131.176])
        (Authenticated sender: carl@hgsystem.se)
        by s499.loopia.se (Postfix) with ESMTPSA id 5CACB1CE6058;
        Thu,  4 Feb 2021 14:20:53 +0100 (CET)
From:   Erik Rosen <erik.rosen@metormote.com>
To:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Erik Rosen <erik.rosen@metormote.com>
Subject: [PATCH v2 0/2] hwmon: (pmbus) Add ST STPDDC60 pmbus driver
Date:   Thu,  4 Feb 2021 14:20:38 +0100
Message-Id: <20210204132040.3868-1-erik.rosen@metormote.com>
X-Mailer: git-send-email 2.11.0 (Apple Git-81)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This patch series adds hardware monitoring support for the ST STPDDC60
chip. The driver has been tested with a Flex BMR481 converter.

The checkpatch script complains about an unneeded paranthesis in an
if-statement but gcc gives a warning if it is removed. I side with
gcc in this case.

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
2.30.0

