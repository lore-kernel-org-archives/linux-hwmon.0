Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:32792 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751487AbdHJWTz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 10 Aug 2017 18:19:55 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v7AMJQtM012933
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Aug 2017 18:19:55 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2c8ssk20aj-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Aug 2017 18:19:54 -0400
Received: from localhost
        by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Thu, 10 Aug 2017 18:19:54 -0400
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux@roeck-us.net
Cc: robh+dt@kernel.org, jdelvare@suse.com,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        joel@jms.id.au, jk@ozlabs.org, andrew@aj.id.au,
        eajames@linux.vnet.ibm.com, mark.rutland@arm.com,
        devicetree@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH v2 0/3] hwmon: (pmbus): Add POWER System power supply driver
Date: Thu, 10 Aug 2017 17:19:43 -0500
Message-Id: <1502403586-20549-1-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

This series adds a hwmon pmbus driver for a POWER System power supply. The
core monitoring functionality is provided by pmbus.

This series depends on the pmbus core extensions for debugfs recently submitted
to the mailing list (latest: https://lkml.org/lkml/2017/8/10/881).

Since v1:
 * Renamed the driver.
 * Removed non-hwmon attributes.
 * Simplified word and byte data reads.

Edward A. James (3):
  dt-bindings: i2c: Document the POWER system power supply device
  hwmon: (pmbus): Add POWER system power supply driver
  Documentation: hwmon: Add POWER system power supply documentation

 .../devicetree/bindings/i2c/ibm,power-ps.txt       |  21 +++
 Documentation/hwmon/powerps                        |  54 ++++++++
 drivers/hwmon/pmbus/Kconfig                        |  10 ++
 drivers/hwmon/pmbus/Makefile                       |   1 +
 drivers/hwmon/pmbus/powerps.c                      | 144 +++++++++++++++++++++
 5 files changed, 230 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/ibm,power-ps.txt
 create mode 100644 Documentation/hwmon/powerps
 create mode 100644 drivers/hwmon/pmbus/powerps.c

-- 
1.8.3.1

