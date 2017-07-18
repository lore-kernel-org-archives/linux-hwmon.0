Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:37675 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751336AbdGRDhI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Jul 2017 23:37:08 -0400
From: Andrew Jeffery <andrew@aj.id.au>
To: linux@roeck-us.net, linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, jdelvare@suse.com,
        linux-kernel@vger.kernel.org, joel@jms.id.au,
        openbmc@lists.ozlabs.org, msbarth@linux.vnet.ibm.com,
        mspinler@linux.vnet.ibm.com
Subject: [RFC PATCH v2 0/3] pmbus: Expand fan support and add MAX31785 driver
Date: Tue, 18 Jul 2017 13:06:50 +0930
Message-Id: <20170718033653.10298-1-andrew@aj.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hello,

This is a follow-up to the first RFC series[1] and includes some significant
reworks based on Guenter's feedback.

[1] https://lkml.org/lkml/2017/7/10/338

v2 retains the goal of exposing the fan[1-*]_target, pwm[1-*] and
pwm[1-*]_enable attributes, and implementing support for the MAX31785, but does
so in terms of virtual registers. The virtual register approach cuts the size
of the patch to the core roughly in half, reuses the struct pmbus_sensor
infrastructure and retains the same level of functionality. The additional
callbacks are dropped, I've reverted the change to the way the DIRECT
coefficients were structured, and there are no-longer modifications to struct
pmbus_sensor. I feel that the change is starting to become palatable.

With respect to the MAX31785 driver, I've thought about the dual tachometer
problem and resolved it with use of the read/write callbacks and only a small
modification to the core. The MAX31785 driver needs to track which fan inputs
have dual tachometer fans, and thus needs a context struct. To enable use of a
context struct I've exposed a pmbus_get_info() function that returns the
pointer to struct pmbus_driver_info provided at pmbus_do_probe(). This allows
the read/write callbacks to hoist themselves out to the containing context
struct without exposing the internals of struct pmbus_data, or injecting
driver-specific details into members of struct pmbus_data. I'm interested in
feedback here.

I've sent this as an RFC again to get feedback on the new approaches, but also
because the MAX31785 implementation is not quite where I want it to be:
bindings need to be developed, and the driver needs support for individual
sensor dual-tach support, not just assume that all present fans support it.
I'll work on these issues in parallel to feedback on the patches.

Andrew Jeffery (3):
  hwmon: pmbus: Add fan control support
  pmbus: Add and expose pmbus_get_info()
  pmbus: Add MAX31785 driver

 drivers/hwmon/pmbus/Kconfig      |  10 ++
 drivers/hwmon/pmbus/Makefile     |   1 +
 drivers/hwmon/pmbus/max31785.c   | 372 +++++++++++++++++++++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h      |  20 +++
 drivers/hwmon/pmbus/pmbus_core.c | 221 +++++++++++++++++++++--
 5 files changed, 607 insertions(+), 17 deletions(-)
 create mode 100644 drivers/hwmon/pmbus/max31785.c

-- 
2.11.0

