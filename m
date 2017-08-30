Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34137 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751254AbdH3Szu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Aug 2017 14:55:50 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v7UIsW02092307
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Aug 2017 14:55:50 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2cnx1vvp5n-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Aug 2017 14:55:50 -0400
Received: from localhost
        by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <cbostic@linux.vnet.ibm.com>;
        Wed, 30 Aug 2017 14:55:49 -0400
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
To: jdelvare@suse.com, linux@roeck-us.net, corbet@lwn.net,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Christopher Bostic <cbostic@linux.vnet.ibm.com>,
        openbmc@lists.ozlabs.org
Subject: [PATCH 0/2] hwmon: (ucd9000) Add sysfs interface to clear logged faults
Date: Wed, 30 Aug 2017 13:55:34 -0500
Message-Id: <20170830185536.71307-1-cbostic@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

This set covers changes required to allow user space to clear logged faults
on ucd9000 type devices via sysfs.   A write to this new file with any value
will perform the clear operation.

Patch 1: Document new sysfs file.
Patch 2: Implementation of new file and clear process.

Christopher Bostic (2):
  hwmon: (ucd9000) Add support for clearing logged faults via sysfs
  hwmon: (ucd9000) Add sysfs attribute to clear logged faults

 Documentation/hwmon/ucd9000   |  2 ++
 drivers/hwmon/pmbus/ucd9000.c | 45 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 46 insertions(+), 1 deletion(-)

-- 
1.8.2.2

