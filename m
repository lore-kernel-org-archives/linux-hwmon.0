Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:60277 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751761AbdKRD0m (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Nov 2017 22:26:42 -0500
From: Andrew Jeffery <andrew@aj.id.au>
To: linux-hwmon@vger.kernel.org
Cc: Andrew Jeffery <andrew@aj.id.au>, linux@roeck-us.net,
        robh+dt@kernel.org, mark.rutland@arm.com, jdelvare@suse.com,
        corbet@lwn.net, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: [PATCH v5 0/4] pmbus: Expand fan support and add MAX31785 driver
Date: Sat, 18 Nov 2017 13:56:02 +1030
Message-Id: <cover.8f64654fcede136901874050318e64de7f1a68cb.1510974230.git-series.andrew@aj.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hello,

This series introduces support for the MAX31785 intelligent fan controller, a
PMBus device providing closed-loop fan control among a number of other
features. Along the way the series adds support to control fans and create
virtual pages to the PMBus core, the latter to support some of the more
annoying design decisions found in the 'A' variant of the chip.

This is the fifth spin of the series. v4 can be found here:

    https://lkml.org/lkml/2017/11/3/15

The changes over v4 include a rework of the fan control support to provide a
more intuitive behaviour for fanX_target, pwmX. They now always read the value
last set (in v4 they returned 0 if they were not the active control mode, and
in even earlier spins they returned an error), which also allows implementation
of sane behaviour for pwmX_enable when switching control modes.

The default implementation for the PWM virtual registers is removed from pmbus
core in light of having no consumers (the max31785 driver implements them
itself), though whilst I was unsure about the generality of the scaling in
replies on v4, after some more thought I have reason to believe it should hold
in general. Regardless, it's gone for the moment, and I've added some
commentary about the scaling in the max31785 implementation.

Please review!

Andrew

Andrew Jeffery (4):
  pmbus (core): Add fan control support
  pmbus (max31785): Add fan control
  pmbus (core): Add virtual page config bit
  pmbus (max31785): Add dual tachometer support

 Documentation/hwmon/max31785     |  15 +-
 drivers/hwmon/pmbus/max31785.c   | 285 +++++++++++++++++++++++++++++++-
 drivers/hwmon/pmbus/pmbus.h      |  41 ++++-
 drivers/hwmon/pmbus/pmbus_core.c | 250 +++++++++++++++++++++++++---
 4 files changed, 566 insertions(+), 25 deletions(-)

base-commit: ded0eb83449e8fcba22fd2736826336e101ffbcb
-- 
git-series 0.9.1
