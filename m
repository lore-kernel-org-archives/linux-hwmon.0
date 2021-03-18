Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B25F7C433E6
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Mar 2021 21:25:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7659F64F24
	for <linux-hwmon@archiver.kernel.org>; Thu, 18 Mar 2021 21:25:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbhCRVZR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 18 Mar 2021 17:25:17 -0400
Received: from smtp.outgoing.loopia.se ([93.188.3.37]:11406 "EHLO
        smtp.outgoing.loopia.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbhCRVZI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Mar 2021 17:25:08 -0400
Received: from s807.loopia.se (localhost [127.0.0.1])
        by s807.loopia.se (Postfix) with ESMTP id D5F8E1A9AF83
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Mar 2021 22:25:04 +0100 (CET)
Received: from s630.loopia.se (unknown [172.22.191.5])
        by s807.loopia.se (Postfix) with ESMTP id C58762E28448;
        Thu, 18 Mar 2021 22:25:04 +0100 (CET)
Received: from s470.loopia.se (unknown [172.22.191.5])
        by s630.loopia.se (Postfix) with ESMTP id ADDB713B93A4;
        Thu, 18 Mar 2021 22:25:04 +0100 (CET)
X-Virus-Scanned: amavisd-new at amavis.loopia.se
Received: from s498.loopia.se ([172.22.191.6])
        by s470.loopia.se (s470.loopia.se [172.22.190.10]) (amavisd-new, port 10024)
        with LMTP id elWmU2YwZqbb; Thu, 18 Mar 2021 22:25:03 +0100 (CET)
X-Loopia-Auth: user
X-Loopia-User: carl@hgsystem.se
X-Loopia-Originating-IP: 155.4.131.157
Received: from localhost.localdomain (h-155-4-131-157.NA.cust.bahnhof.se [155.4.131.157])
        (Authenticated sender: carl@hgsystem.se)
        by s498.loopia.se (Postfix) with ESMTPSA id 66DAC48940A;
        Thu, 18 Mar 2021 22:25:03 +0100 (CET)
From:   Erik Rosen <erik.rosen@metormote.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Erik Rosen <erik.rosen@metormote.com>
Subject: [PATCH 0/2] Add hardware monitoring support for TI TPS53676
Date:   Thu, 18 Mar 2021 22:24:39 +0100
Message-Id: <20210318212441.69050-1-erik.rosen@metormote.com>
X-Mailer: git-send-email 2.11.0 (Apple Git-81)
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add hardware monitoring support for TI TPS53676 Dual-channel D-CAP+,
dual-channel (N + M <= 7 phases) step-down, multiphase controller with AVSBus.

The support is added to the existing pmbus/tps53679 driver.

This patch has been tested with a Flex BMR474 converter.

Erik Rosen (2):
  Add trivial device entry for TPS53676
  Add support for TPS53676

 .../devicetree/bindings/trivial-devices.yaml  |  2 +
 Documentation/hwmon/tps53679.rst              | 13 ++++-
 drivers/hwmon/pmbus/Kconfig                   |  4 +-
 drivers/hwmon/pmbus/tps53679.c                | 49 ++++++++++++++++++-
 4 files changed, 63 insertions(+), 5 deletions(-)


base-commit: 1e28eed17697bcf343c6743f0028cc3b5dd88bf0
-- 
2.20.1

