Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49836 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751274AbdLKVc5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 11 Dec 2017 16:32:57 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vBBLW7OB038101
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Dec 2017 16:32:57 -0500
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2et20bg3hn-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Mon, 11 Dec 2017 16:32:56 -0500
Received: from localhost
        by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Mon, 11 Dec 2017 16:32:56 -0500
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux@roeck-us.net,
        jdelvare@suse.com, eajames@linux.vnet.ibm.com, joel@jms.id.au,
        bjwyman@gmail.com, "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH v3 0/2] hwmon (pmbus): cffps: Add debugfs entries
Date: Mon, 11 Dec 2017 15:32:48 -0600
Message-Id: <1513027970-3494-1-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

From: "Edward A. James" <eajames@us.ibm.com>

This series enables debugfs entries in the IBM common form factor power supply
driver. In order to avoid multiple debugfs directories for the same driver, the
first patch in the series allows a pmbus client driver to query pmbus core for
it's debugfs directory.

The second patch in the series adds debugfs files for a number of attributes of
the power supply, including FRU (field replaceable unit) number, firmware
version, part number, serial number, and CCIN. There is also an entry for the
psu "input history" in binary format. This data represents previous 10 minutes
of power supply data.

Changes since v2:
 - CCIN is big-endian and has to be swapped.

Changes since v1:
 - Check for debugfs directory before allocating memory.
 - Add cffps1 sub-directory for the debugfs entries.
 - Always set last_update to jiffies - HZ.
 - Add EXPORT_SYMBOL_GPL for pmbus_get_debugfs_dir().

Edward A. James (2):
  hwmon (pmbus): Export pmbus device debugfs directory entry
  hwmon (pmbus): cffps: Add debugfs entries

 drivers/hwmon/pmbus/ibm-cffps.c  | 202 ++++++++++++++++++++++++++++++++++++++-
 drivers/hwmon/pmbus/pmbus.h      |   2 +
 drivers/hwmon/pmbus/pmbus_core.c |   8 ++
 3 files changed, 211 insertions(+), 1 deletion(-)

-- 
1.8.3.1

