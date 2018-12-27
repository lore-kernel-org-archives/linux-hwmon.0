Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.andi.de1.cc ([85.214.239.24]:60222 "EHLO
        h2641619.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727211AbeL0POK (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Dec 2018 10:14:10 -0500
From: Andreas Kemnade <andreas@kemnade.info>
To: jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH 0/2] hwmon: devicetree support for hih6130
Date: Thu, 27 Dec 2018 16:13:47 +0100
Message-Id: <20181227151349.29753-1-andreas@kemnade.info>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This patch set adds devicetree support for hih6130, so it can
be properly auto-probed using devicetree files

Andreas Kemnade (2):
  hwmon: (hih6130) add dtb compatibility tables
  devicetree: hwmon: Add bindings documentation for HIH6130

 Documentation/devicetree/bindings/hwmon/hih6130.txt | 12 ++++++++++++
 drivers/hwmon/hih6130.c                             | 11 ++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/hih6130.txt

-- 
2.11.0
