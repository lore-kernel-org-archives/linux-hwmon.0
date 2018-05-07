Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:39828 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752158AbeEGKZz (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 7 May 2018 06:25:55 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w47AO2p5076048
        for <linux-hwmon@vger.kernel.org>; Mon, 7 May 2018 06:25:54 -0400
Received: from e06smtp15.uk.ibm.com (e06smtp15.uk.ibm.com [195.75.94.111])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2htkw82sta-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Mon, 07 May 2018 06:25:53 -0400
Received: from localhost
        by e06smtp15.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <shilpa.bhat@linux.vnet.ibm.com>;
        Mon, 7 May 2018 11:25:51 +0100
From: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
To: linux@roeck-us.net, mpe@ellerman.id.au
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-hwmon@vger.kernel.org, benh@kernel.crashing.org,
        paulus@samba.org, jdelvare@suse.com, stewart@linux.vnet.ibm.com,
        Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
Subject: [PATCH 2/3] hwmon: (ibmpowernv): Add support to read 64 bit sensors
Date: Mon,  7 May 2018 15:55:37 +0530
In-Reply-To: <1525688738-9185-1-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
References: <1525688738-9185-1-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
Message-Id: <1525688738-9185-3-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The firmware has supported for reading sensor values of size u32.
This patch adds support to use newer firmware functions which allows
to read the sensors of size u64.

Signed-off-by: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
---
 drivers/hwmon/ibmpowernv.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/ibmpowernv.c b/drivers/hwmon/ibmpowernv.c
index 5ccdd0b..74d9b5a 100644
--- a/drivers/hwmon/ibmpowernv.c
+++ b/drivers/hwmon/ibmpowernv.c
@@ -101,9 +101,10 @@ static ssize_t show_sensor(struct device *dev, struct device_attribute *devattr,
 	struct sensor_data *sdata = container_of(devattr, struct sensor_data,
 						 dev_attr);
 	ssize_t ret;
-	u32 x;
+	u64 x;
+
+	ret =  opal_get_sensor_data_u64(sdata->id, &x);
 
-	ret = opal_get_sensor_data(sdata->id, &x);
 	if (ret)
 		return ret;
 
@@ -114,7 +115,7 @@ static ssize_t show_sensor(struct device *dev, struct device_attribute *devattr,
 	else if (sdata->type == POWER_INPUT)
 		x *= 1000000;
 
-	return sprintf(buf, "%u\n", x);
+	return sprintf(buf, "%llu\n", x);
 }
 
 static ssize_t show_label(struct device *dev, struct device_attribute *devattr,
-- 
1.8.3.1

