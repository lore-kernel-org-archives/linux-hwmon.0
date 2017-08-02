Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:38463 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751156AbdHBHQS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 2 Aug 2017 03:16:18 -0400
From: Andrew Jeffery <andrew@aj.id.au>
To: linux@roeck-us.net, linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, robh+dt@kernel.org,
        mark.rutland@arm.com, jdelvare@suse.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        joel@jms.id.au, mspinler@linux.vnet.ibm.com,
        msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: [PATCH v2 0/4] pmbus: Expand fan support and add MAX31785 driver
Date: Wed,  2 Aug 2017 16:45:37 +0930
Message-Id: <20170802071541.3121-1-andrew@aj.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hello,

v1[1] spent some time in the OpenBMC kernel tree and it shook out a few issues:

1. The machines I was testing against had pre-prammed the installed-bit in
   FAN_CONFIG_1_2
2. There appears to be a hardware issue with some back-to-back writes to the
   MAX31785

Point 1. is a policy issue so we should have the ability to specify behaviour
in the devicetree. As such the bindings documentation has been updated to suit.

Point 2, well, it's a little ugly. We're in contact with Maxim to better
understand the nature of the issue. Patch 4 introduces a work-around. I've kept
this separate from the introduction of the driver so it's implementation and
the demonstration of new pmbus core features isn't obscured. The work-around
has proved reliable so-far, across a number of machines.

[1] https://lkml.org/lkml/2017/7/27/116

Changes from v1 to v2:

* Add the use-stored-presence devicetree property describing the hardware as
  canonical in terms of fan presence.
* Small optimsation in pmbus_update_fans(): Don't write FAN_CONFIG_x_y unless
  the new value is different to the current value
* Update the MAX31785 driver to consume use-stored-presence from the devicetree
* Add the back-to-back write work-around

Changes between RFC v2 to (non-RFC) v1

* Clean up issues identified in comments on the pmbus core changes 
* Define and implement bindings for the MAX31785
* Clean up issues identified in comments on the max31785 driver

Andrew Jeffery (4):
  dt-bindings: hwmon: pmbus: Add Maxim MAX31785 documentation
  hwmon: pmbus: Add fan control support
  pmbus: Add driver for Maxim MAX31785 Intelligent Fan Controller
  pmbus: max31785: Work around back-to-back writes with FAN_CONFIG_1_2

 .../devicetree/bindings/hwmon/pmbus/max31785.txt   | 126 ++++
 drivers/hwmon/pmbus/Kconfig                        |  10 +
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/max31785.c                     | 762 +++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h                        |  29 +
 drivers/hwmon/pmbus/pmbus_core.c                   | 224 +++++-
 6 files changed, 1137 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
 create mode 100644 drivers/hwmon/pmbus/max31785.c

-- 
2.11.0

