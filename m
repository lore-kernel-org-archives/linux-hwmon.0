Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:34239 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750829AbdIHEjy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 8 Sep 2017 00:39:54 -0400
From: Andrew Jeffery <andrew@aj.id.au>
To: linux@roeck-us.net, linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, robh+dt@kernel.org,
        mark.rutland@arm.com, jdelvare@suse.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        joel@jms.id.au, mspinler@linux.vnet.ibm.com,
        msbarth@linux.vnet.ibm.com, openbmc@lists.ozlabs.org
Subject: [PATCH v3 0/3] pmbus: Expand fan support and add MAX31785 driver
Date: Fri,  8 Sep 2017 14:39:16 +1000
Message-Id: <20170908043919.6924-1-andrew@aj.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hello,

These three patches lay the ground work for fan control in the pmbus core and
introduce a driver for the MAX31785 Intelligent Fan Controller that makes use
of the new control features.

Since v2[1] I've addressed Rob's comments on the bindings, integrating the thermal
support and cleaning up some warts. One of the warts was regarding the
maxim,tmp-fans property which was switched to use a list of fan phandles rather
than indexes. A corresponding change is made in the driver. I also did a
comparison with the Aspeed PWM/Tach bindings but I'm not convinced there's much
to take away from it other than those bindings are somewhat broken.

In v3 I've dropped patch 4 from v2, which was a bunch of work-arounds for bad
behaviour I observed in testing. At this stage the bad behaviour appears to be
a product of the larger hardware design, not necessarily a problem with the
Maxim chip. Guenter has performed some quick testing of a cut-down v2 driver
against the MAX31785 evaluation board and couldn't reproduce the results I was
seeing[2][3], which increases the likelyhood that it's not the Maxim chip and
the work-around patch is inappropriate.

Please review!

Andrew

[1] https://lkml.org/lkml/2017/8/2/88
[2] https://lkml.org/lkml/2017/9/7/669
[3] https://lkml.org/lkml/2017/9/5/53

Andrew Jeffery (3):
  dt-bindings: hwmon: pmbus: Add Maxim MAX31785 documentation
  hwmon: pmbus: Add fan control support
  pmbus: Add driver for Maxim MAX31785 Intelligent Fan Controller

 .../devicetree/bindings/hwmon/pmbus/max31785.txt   | 158 +++++
 drivers/hwmon/pmbus/Kconfig                        |  10 +
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/max31785.c                     | 673 +++++++++++++++++++++
 drivers/hwmon/pmbus/pmbus.h                        |  29 +
 drivers/hwmon/pmbus/pmbus_core.c                   | 224 ++++++-
 6 files changed, 1080 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/max31785.txt
 create mode 100644 drivers/hwmon/pmbus/max31785.c

-- 
2.11.0

