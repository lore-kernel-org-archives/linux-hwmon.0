Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:48886 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752518AbdBFU1W (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 6 Feb 2017 15:27:22 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v16KOgiT055734
        for <linux-hwmon@vger.kernel.org>; Mon, 6 Feb 2017 15:27:21 -0500
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
        by mx0b-001b2d01.pphosted.com with ESMTP id 28ew59ydv6-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Feb 2017 15:27:21 -0500
Received: from localhost
        by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Mon, 6 Feb 2017 13:27:20 -0700
From: eajames@linux.vnet.ibm.com
To: linux@roeck-us.net
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        jdelvare@suse.com, corbet@lwn.net, mark.rutland@arm.com,
        robh+dt@kernel.org, wsa@the-dreams.de, andrew@aj.id.au,
        joel@jms.id.au, benh@kernel.crashing.org,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH linux v6 0/6] drivers: hwmon: Add On-Chip Controller driver
Date: Mon,  6 Feb 2017 14:27:06 -0600
Message-Id: <1486412832-21854-1-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

This patchset adds a hwmon driver to support the OCC (On-Chip Controller)
on the IBM POWER8 and POWER9 processors, from a BMC (Baseboard Management
Controller). The OCC is an embedded processor that provides real time
power and thermal monitoring.

The driver provides an interface on a BMC to poll OCC sensor data, set
user power caps, and perform some basic OCC error handling. It interfaces
with userspace through hwmon.

The driver is currently functional only for the OCC on POWER8 chips.
Communicating with the POWER9 OCC requries FSI support.

Edward A. James (6):
  hwmon: Add core On-Chip Controller support for POWER CPUs
  hwmon: occ: Add sysfs interface
  hwmon: occ: Add I2C transport implementation for SCOM operations
  hwmon: occ: Add callbacks for parsing P8 OCC datastructures
  hwmon: occ: Add hwmon implementation for the P8 OCC
  hwmon: occ: Add callbacks for parsing P9 OCC datastructures

 Documentation/devicetree/bindings/hwmon/occ.txt |  13 +
 Documentation/hwmon/occ                         | 114 ++++++
 MAINTAINERS                                     |   7 +
 drivers/hwmon/Kconfig                           |   2 +
 drivers/hwmon/Makefile                          |   1 +
 drivers/hwmon/occ/Kconfig                       |  29 ++
 drivers/hwmon/occ/Makefile                      |   2 +
 drivers/hwmon/occ/occ.c                         | 450 ++++++++++++++++++++++++
 drivers/hwmon/occ/occ.h                         |  81 +++++
 drivers/hwmon/occ/occ_p8.c                      | 248 +++++++++++++
 drivers/hwmon/occ/occ_p8.h                      |  30 ++
 drivers/hwmon/occ/occ_p9.c                      | 309 ++++++++++++++++
 drivers/hwmon/occ/occ_p9.h                      |  30 ++
 drivers/hwmon/occ/occ_scom_i2c.c                |  77 ++++
 drivers/hwmon/occ/occ_scom_i2c.h                |  26 ++
 drivers/hwmon/occ/occ_sysfs.c                   | 251 +++++++++++++
 drivers/hwmon/occ/occ_sysfs.h                   |  30 ++
 drivers/hwmon/occ/p8_occ_i2c.c                  | 104 ++++++
 drivers/hwmon/occ/scom.h                        |  47 +++
 19 files changed, 1851 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/occ.txt
 create mode 100644 Documentation/hwmon/occ
 create mode 100644 drivers/hwmon/occ/Kconfig
 create mode 100644 drivers/hwmon/occ/Makefile
 create mode 100644 drivers/hwmon/occ/occ.c
 create mode 100644 drivers/hwmon/occ/occ.h
 create mode 100644 drivers/hwmon/occ/occ_p8.c
 create mode 100644 drivers/hwmon/occ/occ_p8.h
 create mode 100644 drivers/hwmon/occ/occ_p9.c
 create mode 100644 drivers/hwmon/occ/occ_p9.h
 create mode 100644 drivers/hwmon/occ/occ_scom_i2c.c
 create mode 100644 drivers/hwmon/occ/occ_scom_i2c.h
 create mode 100644 drivers/hwmon/occ/occ_sysfs.c
 create mode 100644 drivers/hwmon/occ/occ_sysfs.h
 create mode 100644 drivers/hwmon/occ/p8_occ_i2c.c
 create mode 100644 drivers/hwmon/occ/scom.h

-- 
1.8.3.1

