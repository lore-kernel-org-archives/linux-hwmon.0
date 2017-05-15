Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:57317 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751183AbdEOBan (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 14 May 2017 21:30:43 -0400
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: linux@roeck-us.net, linux-hwmon@vger.kernel.org, jdelvare@suse.com
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v4 0/3] (adt7475) small enhancements
Date: Mon, 15 May 2017 13:30:26 +1200
Message-Id: <20170515013029.31397-1-chris.packham@alliedtelesis.co.nz>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This is a series of small enhancements to the adt7475 driver. We're using an
adt7476 chip in several network switches and generally speaking the
requirement for this type of equipment is to keep the fan moving so that we
know it is working when we need it.

Chris Packham (3):
  hwmon: (adt7475) fan stall prevention
  hwmon: (adt7475) temperature smoothing
  hwmon: (adt7475) add high frequency support

Note: "hwmon: (adt7475) replace find_nearest() with find_closest()" has been
applied so not include in v4

 Documentation/hwmon/adt7475 |   9 +++
 drivers/hwmon/adt7475.c     | 150 ++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 155 insertions(+), 4 deletions(-)

-- 
2.11.0.24.ge6920cf

