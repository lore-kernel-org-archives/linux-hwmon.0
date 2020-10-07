Return-Path: <SRS0=KPlX=DO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 908D2C4363C
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Oct 2020 07:52:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 28B69207EA
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Oct 2020 07:52:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GfFRV5i9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727570AbgJGHwL (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 7 Oct 2020 03:52:11 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:42508 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726041AbgJGHwL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Oct 2020 03:52:11 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0977oBAR166717;
        Wed, 7 Oct 2020 07:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=ikR+VEwQwzc54jbFHnXgSRUTq7E7un73veYYybyYqYQ=;
 b=GfFRV5i9Oj9cCYu2ONL2S2nExuy4uyq2YLrYa7c28rnsnzYY5VmTMNdUUnf9YjhMiYGy
 +J7FOAX4GfOcnuItrn3+EY407yidAozstIE/aQ4oQgimW0JYe6jfGehxjl3y5oOf/Ng8
 5bVohYIbe/otsn4QA8+DcChQQI95QLLovft9YZekni32gMcANJxgLrzTlgV9DCfgIO5/
 2h5rkEZKaI2qSfESG6HnNQdNZDM/1o93bSkTshuy00R4QFIF+U5NNqDxJ+en3Esjz1xt
 OTAbNwIawqOVlO7rbxUepg05Kze2pbvbCqRH3PkPirkdkOISSQtHfGOrcPzvhT6BFM0Y SQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 33xetb0bug-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 07 Oct 2020 07:51:56 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0977oAw4133979;
        Wed, 7 Oct 2020 07:51:55 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by userp3030.oracle.com with ESMTP id 33y37y7ehn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 07 Oct 2020 07:51:55 +0000
Received: from abhmp0004.oracle.com (abhmp0004.oracle.com [141.146.116.10])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0977psDh006529;
        Wed, 7 Oct 2020 07:51:54 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Wed, 07 Oct 2020 00:51:53 -0700
Date:   Wed, 7 Oct 2020 10:51:48 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] hwmon: (acpi_power_meter) clean up freeing code
Message-ID: <20201007075148.GB2529578@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9766 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 spamscore=0
 mlxscore=0 malwarescore=0 suspectscore=2 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2010070051
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9766 signatures=668680
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxscore=0
 clxscore=1011 priorityscore=1501 adultscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 malwarescore=0 suspectscore=2 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2010070051
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This code works okay but Smatch flagged it as a double free.  I've
changed three things to make it more clear.  1)  Remove the call to
free_capabilities() in acpi_power_meter_add().  This call is a no-op
because the capabilities have not been allocated yet.  2)  Set "*str" to
NULL in free_capabilities() so that way the function can be called twice
in a row without leading to a double free.  3)  Call free_capabilities()
in read_capabilities() instead of open coding the free.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hwmon/acpi_power_meter.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/acpi_power_meter.c b/drivers/hwmon/acpi_power_meter.c
index a270b975e90b..848718ab7312 100644
--- a/drivers/hwmon/acpi_power_meter.c
+++ b/drivers/hwmon/acpi_power_meter.c
@@ -725,8 +725,10 @@ static void free_capabilities(struct acpi_power_meter_resource *resource)
 	int i;
 
 	str = &resource->model_number;
-	for (i = 0; i < 3; i++, str++)
+	for (i = 0; i < 3; i++, str++) {
 		kfree(*str);
+		*str = NULL;
+	}
 }
 
 static int read_capabilities(struct acpi_power_meter_resource *resource)
@@ -801,9 +803,7 @@ static int read_capabilities(struct acpi_power_meter_resource *resource)
 	dev_info(&resource->acpi_dev->dev, "Found ACPI power meter.\n");
 	goto end;
 error:
-	str = &resource->model_number;
-	for (i = 0; i < 3; i++, str++)
-		kfree(*str);
+	free_capabilities(resource);
 end:
 	kfree(buffer.pointer);
 	return res;
@@ -874,7 +874,6 @@ static int acpi_power_meter_add(struct acpi_device *device)
 	strcpy(acpi_device_class(device), ACPI_POWER_METER_CLASS);
 	device->driver_data = resource;
 
-	free_capabilities(resource);
 	res = read_capabilities(resource);
 	if (res)
 		goto exit_free;
-- 
2.28.0

