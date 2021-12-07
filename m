Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B4A0C433F5
	for <linux-hwmon@archiver.kernel.org>; Tue,  7 Dec 2021 07:16:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbhLGHUF (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Dec 2021 02:20:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbhLGHUF (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Dec 2021 02:20:05 -0500
Received: from thorn.bewilderbeest.net (thorn.bewilderbeest.net [IPv6:2605:2700:0:5::4713:9cab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08F3DC061746
        for <linux-hwmon@vger.kernel.org>; Mon,  6 Dec 2021 23:16:34 -0800 (PST)
Received: from hatter.bewilderbeest.net (174-21-184-96.tukw.qwest.net [174.21.184.96])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: zev)
        by thorn.bewilderbeest.net (Postfix) with ESMTPSA id A364B5DB;
        Mon,  6 Dec 2021 23:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bewilderbeest.net;
        s=thorn; t=1638861394;
        bh=n3lf8ZX9wB4UGjOjg6Z1qVUELnvM7wCuORiIvbZScM0=;
        h=From:To:Cc:Subject:Date:From;
        b=gEpQOjkiYPY1zW0THtvVtOx+ldpQepIBZDsKMtqLdS2+pNyuOx+m1ZRdzXPETdN9y
         cYlgDSVVDBNXjh5S/2vwCxFy1MR4lydKqKFe1y6d1ClpRB9iZXkdLKRhdQOGXIOV4U
         D8mqKtN19uH3u/yWuYxs7zW4GBoaD3+8n692glZ8=
From:   Zev Weiss <zev@bewilderbeest.net>
To:     linux-hwmon@vger.kernel.org
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, openbmc@lists.ozlabs.org,
        Zev Weiss <zev@bewilderbeest.net>
Subject: [PATCH v3 0/2] hwmon: (pmbus) Add Delta AHE-50DC fan control module driver
Date:   Mon,  6 Dec 2021 23:15:19 -0800
Message-Id: <20211207071521.543-1-zev@bewilderbeest.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello,

These patches add a hwmon pmbus driver for the integrated fan control
module in the Delta AHE-50DC Open19 power shelf.  I don't know of a
datasheet or any proper documentation for it; the registers it has
available have deen deduced from a combination of an existing GPL
driver in a code release from LinkedIn [0] and some manual
experimentation with i2cdump.  In addition to some standard PMBus
sensors (three temperature readings, four fan speeds, and one
voltage), it also has a manufacturer-specific fourth temperature
reading available, which is supported via a virtual second page (the
device itself is not paged, but the driver remaps
PMBUS_READ_TEMPERATURE_1 in page 1 to the manufacturer-specific
TEMPERATURE_4).


Thanks,
Zev Weiss

Changes since v2 [2]:
 - converted to pmbus driver

Changes since v1 [1]:
 - fixed invalid name warning from __hwmon_device_register()

[0] https://github.com/linkedin/o19-bmc-firmware/blob/master/meta-openbmc/meta-linkedin/meta-deltapower/recipes-kernel/fancontrol-mod/files/fancontrol.c
[1] https://lore.kernel.org/linux-hwmon/20211206224419.15736-1-zev@bewilderbeest.net/
[2] https://lore.kernel.org/linux-hwmon/20211206230153.16891-1-zev@bewilderbeest.net/

Zev Weiss (2):
  hwmon: (pmbus) Add Delta AHE-50DC fan control module driver
  dt-bindings: add Delta AHE-50DC fan control module

 .../devicetree/bindings/trivial-devices.yaml  |  2 +
 MAINTAINERS                                   |  6 ++
 drivers/hwmon/pmbus/Kconfig                   | 12 +++
 drivers/hwmon/pmbus/Makefile                  |  1 +
 drivers/hwmon/pmbus/delta-ahe50dc-fan.c       | 84 +++++++++++++++++++
 5 files changed, 105 insertions(+)
 create mode 100644 drivers/hwmon/pmbus/delta-ahe50dc-fan.c

-- 
2.34.1

