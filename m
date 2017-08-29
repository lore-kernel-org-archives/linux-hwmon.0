Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:48260 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751317AbdH2SJU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Aug 2017 14:09:20 -0400
From: Vadim Pasternak <vadimp@mellanox.com>
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org, jiri@resnulli.us,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [patch v1 0/2] Add support for Intel VID protocol VR13 and for TI tps53679 device
Date: Tue, 29 Aug 2017 20:06:20 +0000
Message-Id: <1504037182-122747-1-git-send-email-vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This patchset adds support for:
- VID conversion for protocol VR13;
- Texas Instruments tps53679 device;

Vadim Pasternak (2):
  Add support for Intel VID protocol VR13
  Add support for Texas Instruments tps53679 device

 drivers/hwmon/pmbus/Kconfig      |  10 ++++
 drivers/hwmon/pmbus/Makefile     |   1 +
 drivers/hwmon/pmbus/pmbus.h      |   2 +-
 drivers/hwmon/pmbus/pmbus_core.c |   4 ++
 drivers/hwmon/pmbus/tps53679.c   | 126 +++++++++++++++++++++++++++++++++++++++
 5 files changed, 142 insertions(+), 1 deletion(-)
 create mode 100644 drivers/hwmon/pmbus/tps53679.c

-- 
2.1.4

