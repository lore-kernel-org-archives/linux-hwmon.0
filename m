Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA51EC433E6
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Jan 2021 09:47:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 765B62076E
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Jan 2021 09:47:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235453AbhA0Jqp (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Jan 2021 04:46:45 -0500
Received: from smtp.outgoing.loopia.se ([93.188.3.37]:29476 "EHLO
        smtp.outgoing.loopia.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232864AbhA0I7r (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Jan 2021 03:59:47 -0500
X-Greylist: delayed 772 seconds by postgrey-1.27 at vger.kernel.org; Wed, 27 Jan 2021 03:59:46 EST
Received: from s807.loopia.se (localhost [127.0.0.1])
        by s807.loopia.se (Postfix) with ESMTP id 555162464450
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Jan 2021 09:42:35 +0100 (CET)
Received: from s500.loopia.se (unknown [172.22.191.5])
        by s807.loopia.se (Postfix) with ESMTP id 354E52E29A02;
        Wed, 27 Jan 2021 09:42:35 +0100 (CET)
Received: from s471.loopia.se (unknown [172.22.191.6])
        by s500.loopia.se (Postfix) with ESMTP id 241561E28537;
        Wed, 27 Jan 2021 09:42:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at amavis.loopia.se
Received: from s500.loopia.se ([172.22.191.6])
        by s471.loopia.se (s471.loopia.se [172.22.190.11]) (amavisd-new, port 10024)
        with LMTP id qXO9IDQ8dZBx; Wed, 27 Jan 2021 09:42:34 +0100 (CET)
X-Loopia-Auth: user
X-Loopia-User: carl@hgsystem.se
X-Loopia-Originating-IP: 94.234.44.220
Received: from localhost.localdomain (unknown [94.234.44.220])
        (Authenticated sender: carl@hgsystem.se)
        by s500.loopia.se (Postfix) with ESMTPSA id 174361E24FD1;
        Wed, 27 Jan 2021 09:42:34 +0100 (CET)
From:   Erik Rosen <erik.rosen@metormote.com>
To:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Erik Rosen <erik.rosen@metormote.com>
Subject: [PATCH 0/1] Add ST STPDDC60 pmbus driver
Date:   Wed, 27 Jan 2021 09:41:39 +0100
Message-Id: <20210127084140.35626-1-erik.rosen@metormote.com>
X-Mailer: git-send-email 2.11.0 (Apple Git-81)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This patch adds a pmbus client driver for the ST STPDDC60 Universal
Digital Multicell Controller chip. The technical specification is
not made publicly available, but the pmbus parts are described in the
specification for the BMR481 converter.

The patch has been tested with a Flex BMR481 converter module.


Erik Rosen (1):
  Add ST STPDDC60 pmbus driver

 Documentation/hwmon/index.rst    |   1 +
 Documentation/hwmon/stpddc60.rst |  79 +++++++++++++
 MAINTAINERS                      |   7 ++
 drivers/hwmon/pmbus/Kconfig      |  10 ++
 drivers/hwmon/pmbus/Makefile     |   2 +
 drivers/hwmon/pmbus/stpddc60.c   | 188 +++++++++++++++++++++++++++++++
 6 files changed, 287 insertions(+)
 create mode 100644 Documentation/hwmon/stpddc60.rst
 create mode 100644 drivers/hwmon/pmbus/stpddc60.c

-- 
2.20.1

