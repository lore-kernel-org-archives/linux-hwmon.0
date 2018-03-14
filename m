Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49446 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751459AbeCNWcW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Mar 2018 18:32:22 -0400
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w2EMUDVL022832
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Mar 2018 18:32:22 -0400
Received: from e18.ny.us.ibm.com (e18.ny.us.ibm.com [129.33.205.208])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2gqavabjac-1
        (version=TLSv1.2 cipher=AES256-SHA256 bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Mar 2018 18:32:21 -0400
Received: from localhost
        by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Wed, 14 Mar 2018 18:32:20 -0400
From: Eddie James <eajames@linux.vnet.ibm.com>
To: linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, jdelvare@suse.com,
        linux@roeck-us.net, joel@jms.id.au, andy.shevchenko@gmail.com,
        Eddie James <eajames@linux.vnet.ibm.com>
Subject: [PATCH v4 0/2] hwmon: (ucd9000) Add gpio and debugfs interfaces
Date: Wed, 14 Mar 2018 17:32:12 -0500
Message-Id: <1521066734-7985-1-git-send-email-eajames@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The ucd9000 series chips have gpio pins. Add a gpio chip interface to the ucd
device so that users can query and set the state of the gpio pins.

Add a debugfs interface using the existing pmbus debugfs directory to provide
MFR_STATUS and the status of the gpi faults to users.

Changes since v3:
 - remove setting of gpio_chip->owner
 - format the mfr_status data
 - switch to #ifdef rather than #if IS_ENABLED for debugfs

Changes since v2:
 - split the gpio registration into it's own function

Changes since v1:
 - dropped dev_err messages
 - made gpio chip registration conditional on having gpio pins
 - made mfr_status debugfs attribute more simple

Christopher Bostic (2):
  hwmon: (ucd9000) Add gpio chip interface
  hwmon: (ucd9000) Add debugfs attributes to provide mfr_status

 drivers/hwmon/pmbus/ucd9000.c | 354 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 353 insertions(+), 1 deletion(-)

-- 
1.8.3.1

