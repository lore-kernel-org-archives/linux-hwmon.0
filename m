Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:44686 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752465AbdHIWUG (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 9 Aug 2017 18:20:06 -0400
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v79MK49W075476
        for <linux-hwmon@vger.kernel.org>; Wed, 9 Aug 2017 18:20:06 -0400
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2c89w1u9ee-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Wed, 09 Aug 2017 18:20:06 -0400
Received: from localhost
        by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Wed, 9 Aug 2017 16:19:25 -0600
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux@roeck-us.net
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, joel@jms.id.au, jk@ozlabs.org,
        andrew@aj.id.au, cbostic@linux.vnet.ibm.com,
        eajames@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH 0/4] drivers/hwmon/pmbus: Core extensions for STATUS_WORD support and debugfs
Date: Wed,  9 Aug 2017 17:19:13 -0500
Message-Id: <1502317157-12648-1-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

This series adds some functionality to the pmbus core.

The first two patches provide support for the STATUS_WORD register. This allows
more default alarm attributes to be used, as the upper byte of the status
register is available. The third patch then uses the STATUS_INPUT bit of the
status register to setup boolean attributes for input voltage and input power
attributes.

The fourth patch provides support for raw reads of pmbus status registers
through the debugfs interface. These can be very useful for hardware
diagnostics, especially on multi-page pmbus devices, as user-space access of
the i2c space could corrupt the pmbus page accounting.

Since RFC series:
 * Just use u16 instead of complicated u8 method for STATUS_WORD.
 * Re-ordered the changes.
 * Added conditional for creating bool attr for higher byte STATUS_WORD bits.

Edward A. James (4):
  drivers/hwmon/pmbus: Switch status registers to 16 bit
  drivers/hwmon/pmbus: Access word data for STATUS_WORD
  drivers/hwmon/pmbus: Add generic alarm bit for iin and pin
  drivers/hwmon/pmbus: Add debugfs for status registers

 drivers/hwmon/pmbus/pmbus.c      |  24 +++-
 drivers/hwmon/pmbus/pmbus.h      |  11 ++
 drivers/hwmon/pmbus/pmbus_core.c | 251 +++++++++++++++++++++++++++++++++++----
 3 files changed, 263 insertions(+), 23 deletions(-)

-- 
1.8.3.1

