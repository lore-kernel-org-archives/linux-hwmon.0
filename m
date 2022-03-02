Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E344C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed,  2 Mar 2022 09:49:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240632AbiCBJuf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 2 Mar 2022 04:50:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239845AbiCBJue (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 2 Mar 2022 04:50:34 -0500
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C8F7B91F4;
        Wed,  2 Mar 2022 01:49:51 -0800 (PST)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:105:465:1:3:0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4K7q8s3c4hz9spV;
        Wed,  2 Mar 2022 10:49:49 +0100 (CET)
From:   Marcello Sylvester Bauer <sylv@sylv.io>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sylv.io; s=MBO0001;
        t=1646214587;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=WspfyhO7TC+btHOAKHVih6axBfDGuMx5FJC+LFQ2iLw=;
        b=rgSWZUdzsZNOa6xxI87LxGuVBOXX3HTlQ4WbAyx0st3axQ5UJkvmDgPPTwXd0LcOFJdUz1
        OkyuJL/yJ9ZJ5FqrpuEOLNJPaeMsAfJaj3TdIJ29VzQIKx82QucZ+oeXq6HECkx5jbfO3P
        ZZRze35imxj6T0zEdk3qS5/MR2U8kiaEXpQNy6zj1tXYBvPiBJRpiTDQxHPWjxu8nWy0rR
        iNc0TgkOMTl6SzfXmAEwSHZgO0q+IxAqvLJZiUTvOizZG+4P3y/zX4ZtjUdzIaL/Gwxtx2
        0mEOdc/8WOATZLM+EC1/jbvGwEuGDXCBLj/dtb294YCPG+Etcu0qWjWLTGUSTw==
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Patrick Rudolph <patrick.rudolph@9elements.com>,
        Marcello Sylvester Bauer <sylv@sylv.io>
Subject: [PATCH v4 0/3] Support XDPE112
Date:   Wed,  2 Mar 2022 10:49:18 +0100
Message-Id: <cover.1646214248.git.sylv@sylv.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add support for Infineon Multi-phase XDPE112 family regulator. The main
difference to the XDPE122 family is it uses a different format for
voltage out. Add the required logic to the existing xdpe12284 driver
accordingly.

Changes in v4:
- move VOUT_MODE format detection into identify function

Changes in v3:
- detect VOUT_MODE during probing
- set xdpe122_identify/xdpe122_read_word_data only if VOUT is vid

Changes in v2:
- rebase on current hwmon-next branch

Marcello Sylvester Bauer (3):
  dt-bindings: trivial-devices: Add xdpe11280
  hwmon (xdpe12284): Add support for xdpe11280
  hwmon (xdpe12284): Add regulator support

 .../devicetree/bindings/trivial-devices.yaml  |  2 ++
 Documentation/hwmon/xdpe12284.rst             | 12 ++++---
 drivers/hwmon/pmbus/Kconfig                   |  6 ++++
 drivers/hwmon/pmbus/xdpe12284.c               | 32 +++++++++++++++++--
 4 files changed, 45 insertions(+), 7 deletions(-)

-- 
2.35.1

