Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3768CC433E6
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Feb 2021 20:06:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3EEC64DAF
	for <linux-hwmon@archiver.kernel.org>; Mon,  1 Feb 2021 20:06:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232448AbhBAUGd (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 1 Feb 2021 15:06:33 -0500
Received: from smtp.outgoing.loopia.se ([93.188.3.37]:47984 "EHLO
        smtp.outgoing.loopia.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232471AbhBAUEC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 1 Feb 2021 15:04:02 -0500
Received: from s807.loopia.se (localhost [127.0.0.1])
        by s807.loopia.se (Postfix) with ESMTP id 29AFD1A93D6A
        for <linux-hwmon@vger.kernel.org>; Mon,  1 Feb 2021 20:59:49 +0100 (CET)
Received: from s500.loopia.se (unknown [172.22.191.6])
        by s807.loopia.se (Postfix) with ESMTP id 0A8342E2C94B;
        Mon,  1 Feb 2021 20:59:49 +0100 (CET)
Received: from s470.loopia.se (unknown [172.22.191.5])
        by s500.loopia.se (Postfix) with ESMTP id 0635D1E272BF;
        Mon,  1 Feb 2021 20:59:49 +0100 (CET)
X-Virus-Scanned: amavisd-new at amavis.loopia.se
Received: from s499.loopia.se ([172.22.191.5])
        by s470.loopia.se (s470.loopia.se [172.22.190.10]) (amavisd-new, port 10024)
        with LMTP id Cl2g_L6fVlvh; Mon,  1 Feb 2021 20:59:48 +0100 (CET)
X-Loopia-Auth: user
X-Loopia-User: carl@hgsystem.se
X-Loopia-Originating-IP: 155.4.131.176
Received: from localhost.localdomain (h-155-4-131-176.NA.cust.bahnhof.se [155.4.131.176])
        (Authenticated sender: carl@hgsystem.se)
        by s499.loopia.se (Postfix) with ESMTPSA id 3BE6B1CE5F16;
        Mon,  1 Feb 2021 20:59:48 +0100 (CET)
From:   Erik Rosen <erik.rosen@metormote.com>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     Erik Rosen <erik.rosen@metormote.com>
Subject: [PATCH 0/2] Set sensor->data to -ENODATA after write
Date:   Mon,  1 Feb 2021 20:59:27 +0100
Message-Id: <20210201195929.1200-1-erik.rosen@metormote.com>
X-Mailer: git-send-email 2.11.0 (Apple Git-81)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Problem:
When clear_cache() is called from within the pmbus_write_word_data()
callback, the sensor data is set _after_ the function returns to
pmbus_set_sensor(). The effect is that all sensor values are cleared
except the one just written to. This behaviour prevents reloading of
the sensor value as expected in the lm25066 driver.

Proposed solution:
Set the data field to -ENODATA after updates of the sensor value.
This will force a read from the chip next time the sensor value is
read. This will also ensure that the cached value matches the actual
value stored in the chip.
The impact would be that a sensor read after a write will always
trigger a chip access.


Erik Rosen (2):
  Clear sensor data after chip write
  Remove unnecessary pmbus_clear_cache function call

 drivers/hwmon/pmbus/lm25066.c    | 5 -----
 drivers/hwmon/pmbus/pmbus_core.c | 2 +-
 2 files changed, 1 insertion(+), 6 deletions(-)

-- 
2.20.1

