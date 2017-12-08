Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:43736 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1753399AbdLHRnD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 8 Dec 2017 12:43:03 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id vB8Hh2Xn143973
        for <linux-hwmon@vger.kernel.org>; Fri, 8 Dec 2017 12:43:03 -0500
Received: from e31.co.us.ibm.com (e31.co.us.ibm.com [32.97.110.149])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2eqy810tg1-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Fri, 08 Dec 2017 12:43:03 -0500
Received: from localhost
        by e31.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Fri, 8 Dec 2017 10:42:56 -0700
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux@roeck-us.net,
        jdelvare@suse.com, eajames@linux.vnet.ibm.com, joel@jms.id.au,
        "Edward A. James" <eajames@us.ibm.com>
Subject: [PATCH v2 0/2] hwmon (pmbus): cffps: Add debugfs entries
Date: Fri,  8 Dec 2017 11:42:47 -0600
Message-Id: <1512754969-6556-1-git-send-email-eajames@linux.vnet.ibm.com>
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

Changes since v1:
 - Check for debugfs directory before allocating memory.
 - Add cffps1 sub-directory for the debugfs entries.
 - Always set last_update to jiffies - HZ.
 - Add EXPORT_SYMBOL_GPL for pmbus_get_debugfs_dir().

Edward A. James (2):
  hwmon: (pmbus): Export pmbus device debugfs directory entry
  hwmon (pmbus): cffps: Add debugfs entries

 drivers/hwmon/pmbus/ibm-cffps.c  | 202 ++++++++++++++++++++++++++++++++++++++-
 drivers/hwmon/pmbus/pmbus.h      |   2 +
 drivers/hwmon/pmbus/pmbus_core.c |   8 ++
 3 files changed, 211 insertions(+), 1 deletion(-)

-- 
1.8.3.1

