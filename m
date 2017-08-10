Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:56918 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752800AbdHJV56 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Aug 2017 17:57:58 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v7ALvKKo089357
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Aug 2017 17:57:57 -0400
Received: from e19.ny.us.ibm.com (e19.ny.us.ibm.com [129.33.205.209])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2c8rctfqar-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Aug 2017 17:57:57 -0400
Received: from localhost
        by e19.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Thu, 10 Aug 2017 17:57:56 -0400
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux@roeck-us.net
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, joel@jms.id.au, jk@ozlabs.org,
        andrew@aj.id.au, cbostic@linux.vnet.ibm.com,
        eajames@linux.vnet.ibm.com, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH v2 0/4] hwmon: (pmbus): Core extension for STATUS_WORD and debugfs
Date: Thu, 10 Aug 2017 16:57:46 -0500
Message-Id: <1502402270-15328-1-git-send-email-eajames@linux.vnet.ibm.com>
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

Since v1:
 * Pull all debugfs stuff into pmbus_core.c to prevent problems when running
   without SENSORS_PMBUS.
 * Better boolean attr conditional.
 * Don't cache additional attributes, and display uncached registers for
   debugfs.
 * #ifdef around debugfs stuff.

Since RFC series:
 * Just use u16 instead of complicated u8 method for STATUS_WORD.
 * Re-ordered the changes.
 * Added conditional for creating bool attr for higher byte STATUS_WORD bits.

Edward A. James (4):
  hwmon: (pmbus): Switch status registers to 16 bit
  hwmon: (pmbus): Access word data for STATUS_WORD
  hwmon: (pmbus): Add generic alarm bit for iin and pin
  hwmon: (pmbus): Add debugfs for status registers

 drivers/hwmon/pmbus/pmbus.h      |   6 +
 drivers/hwmon/pmbus/pmbus_core.c | 279 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 263 insertions(+), 22 deletions(-)

-- 
1.8.3.1

