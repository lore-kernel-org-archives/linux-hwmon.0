Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97592C48BDF
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jun 2021 13:46:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 80FC361222
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jun 2021 13:46:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231855AbhFRNsf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jun 2021 09:48:35 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:4664 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229782AbhFRNse (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jun 2021 09:48:34 -0400
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15IDhuWW017244;
        Fri, 18 Jun 2021 13:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=9raDCdunyKVJWbeCbttvLe3JNktRfAi9rmwb3NHQ8EY=;
 b=RiCoe3Gwu3ODAGVanV7vd9PItQa6NrGAJBlgTO5hJIEWnF/fYlNKaAxhvAtgS9KjIwUX
 TlAZlDFF5zHxvRbh6pP0Cj09AnNULwhGtEegyWGB5EO8jVDu4MNKT1WH1/VrjzWjJWFw
 NQPttD3LljZGntTBj8ty++bRY/b85yeXDauK89xjh1WJG2XDly1iqCHIY4qqGKc10Gjm
 TLOkQpbOF+TIXBg4Pa9fL2970pB0QHYE6Yw0Wk9J+AO3VLshNIFH/TQhiyZZHyAV4jsc
 Gb5bmL9DsRTiP8tjReyilabdQhiLnQTSca4xYHGKfhJBik1t/sRsb7dfKtDbHCFvO2Yw yA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 39893qswy8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 18 Jun 2021 13:46:11 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 15IDfQg8150446;
        Fri, 18 Jun 2021 13:46:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by aserp3030.oracle.com with ESMTP id 396wawrfn9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 18 Jun 2021 13:46:10 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
        by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 15IDkAme164152;
        Fri, 18 Jun 2021 13:46:10 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 396wawrfn2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 18 Jun 2021 13:46:10 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 15IDk849017872;
        Fri, 18 Jun 2021 13:46:08 GMT
Received: from mwanda (/102.222.70.252)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Fri, 18 Jun 2021 13:46:07 +0000
Date:   Fri, 18 Jun 2021 16:46:01 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] hwmon: (pmbus/dps920ab) Delete some dead code
Message-ID: <YMyjmR54ErLtc1sH@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-ORIG-GUID: b1ZdGEb3FyCqpBmr2hOzcTI5uVE6jMrD
X-Proofpoint-GUID: b1ZdGEb3FyCqpBmr2hOzcTI5uVE6jMrD
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The debugfs_create_dir() function returns error pointers, it doesn't
return NULL.  But debugfs functions don't need to be checked in normal
situations and we can just delete this code.

Fixes: 1f442e213ce5 ("hwmon: (pmbus) Add driver for Delta DPS-920AB PSU")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hwmon/pmbus/dps920ab.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/dps920ab.c b/drivers/hwmon/pmbus/dps920ab.c
index bd2df2a3c8e3..d3941f6eb29a 100644
--- a/drivers/hwmon/pmbus/dps920ab.c
+++ b/drivers/hwmon/pmbus/dps920ab.c
@@ -119,8 +119,6 @@ static void dps920ab_init_debugfs(struct dps920ab_data *data, struct i2c_client
 		return;
 
 	debugfs_dir = debugfs_create_dir(client->name, root);
-	if (!debugfs_dir)
-		return;
 
 	debugfs_create_file("mfr_id",
 			    0400,
-- 
2.30.2

