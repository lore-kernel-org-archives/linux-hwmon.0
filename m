Return-Path: <SRS0=kmu5=C7=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E8BC2D0E2
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Sep 2020 20:05:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A4FCE2388B
	for <linux-hwmon@archiver.kernel.org>; Tue, 22 Sep 2020 20:05:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726614AbgIVUFJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 22 Sep 2020 16:05:09 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:37813 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726567AbgIVUFJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 22 Sep 2020 16:05:09 -0400
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 22 Sep 2020 23:05:07 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 08MK560i012180;
        Tue, 22 Sep 2020 23:05:06 +0300
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     linux@roeck-us.net, robh+dt@kernel.org
Cc:     linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH hwmon-next v2 0/2] hwmon: (pmbus) Add support for MPS mp2975 controller
Date:   Tue, 22 Sep 2020 23:05:02 +0300
Message-Id: <20200922200504.15375-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The patchset includes:
Patch #1 - introduction of the driver for mp2975 device,
	   documentation for mp2975 device driver.
Patch #2 - extending of binding documentation for trivial devices.

Vadim Pasternak (2):
  hwmon: (pmbus) Add support for MPS Multi-phase mp2975 controller
  dt-bindings: Add MP2975 voltage regulator device

 .../devicetree/bindings/trivial-devices.yaml       |   2 +
 Documentation/hwmon/mp2975.rst                     | 116 +++
 drivers/hwmon/pmbus/Kconfig                        |   9 +
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/mp2975.c                       | 812 +++++++++++++++++++++
 5 files changed, 940 insertions(+)
 create mode 100644 Documentation/hwmon/mp2975.rst
 create mode 100644 drivers/hwmon/pmbus/mp2975.c

-- 
2.11.0

