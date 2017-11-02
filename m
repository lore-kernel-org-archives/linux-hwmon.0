Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:51388 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934073AbdKBDyC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 1 Nov 2017 23:54:02 -0400
From: Joel Stanley <joel@jms.id.au>
To: Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc: Philipp Zabel <philipp.zabel@gmail.com>,
        Mykola Kostenok <c_mykolak@mellanox.com>,
        Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
        Patrick Venture <venture@google.com>,
        Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] hwmon: Add reset support to aspeed-pwm-tach 
Date: Thu,  2 Nov 2017 14:53:46 +1100
Message-Id: <20171102035349.1902-1-joel@jms.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Gunter,

This adds reset controller support to the ASPEED pwm/tach driver. The reset
controller and clock driver is currently under review, so to test those patches
must be merged in to fully test these changes[1].

To address your concerns from v1:

This driver was not usable as-is upstream. I believe the developer(s) tested and
deployed it in the OpenBMC kernel tree which has some hacks in mach-aspeed to
release all of the resets. The other way they could have tested it is by
booting an OpenBMC kernel, which releases the resets, and then testing the
upstream kernel without performing a power cycle as the resets are not
reasserted on reboot.

I realise it is not ideal to be changing already merged bindings. I don't plan
on it becoming a habit.

There is no BIOS or other ROM that runs before Linux on a BMC to release
the resets. We do have u-boot, but that does not modify the pwm reset.

I haven't added a Kconfig dependency on the RESET_CONTROLLER as the driver can
build without it, and when the ASPEED clk/reset driver is merged, the platform
will always have that option selected.

I've given this version a day of testing on hardware I have access to.

[1] https://lwn.net/Articles/737697/

Joel Stanley (3):
  hwmon: (aspeed-pwm-tacho) Sort headers
  hwmon: (aspeed-pwm-tacho) Deassert reset in probe
  dt-bindings: hwmon: aspeed-pwm-tacho: Add reset node

 .../devicetree/bindings/hwmon/aspeed-pwm-tacho.txt | 14 ++++-------
 drivers/hwmon/aspeed-pwm-tacho.c                   | 27 +++++++++++++++++++---
 2 files changed, 29 insertions(+), 12 deletions(-)

-- 
2.14.1

