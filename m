Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3F2C433E6
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Jan 2021 05:58:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6ADF42070A
	for <linux-hwmon@archiver.kernel.org>; Wed, 27 Jan 2021 05:58:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231948AbhA0F56 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 27 Jan 2021 00:57:58 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:52614 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231219AbhA0F0v (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 27 Jan 2021 00:26:51 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10R5O5Hl170975;
        Wed, 27 Jan 2021 05:25:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=a8W9GPiY9fMYclSxP8ZR2NoYUKLXSCBw5HB87tfI4mo=;
 b=ZD/7DlW2926mWwQ0NVoxolRk2hCwD8sIwzOWjizW691KsL5P2lqX0dN8ZzNqjulwI8bE
 dlqliHVzoIpUxXPqzFvgFrDwqn2BnXQvWdfSyWQf+HNkOg9f7AmrjrnR2fRtgBTZ0S6e
 02ITQ8SGSFUMzQl0sg44B4HRGwe64NC8MKsWSKzFjALTHCRoNJN2/piD4b4g8tdHLl2Q
 h5l/nLR9WKEY7VePBq0BKtysi7j6JOsDg7smEqmq+5rhP/50unLXibNqn4CM6GI/Vkhp
 3kXm1AW3tvNubfsMzX2K32Bv6NN2nh2E6hxBdVDov6lsWLKu5vqeqPlrHhamZGaSZ23l eQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by userp2130.oracle.com with ESMTP id 368b7qw8gg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 27 Jan 2021 05:25:46 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10R5PiNw113216;
        Wed, 27 Jan 2021 05:25:44 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3020.oracle.com with ESMTP id 368wjs368q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 27 Jan 2021 05:25:44 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 10R5PXHF007140;
        Wed, 27 Jan 2021 05:25:33 GMT
Received: from mwanda (/102.36.221.92)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 26 Jan 2021 21:25:32 -0800
Date:   Wed, 27 Jan 2021 08:25:26 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Johannes Cornelis Draaijer <jcdra1@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] hwmon: (aht10) Unlock on error in aht10_read_values()
Message-ID: <YBD5Ro549hMJSnW4@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9876 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 malwarescore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101270031
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9876 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 mlxscore=0 clxscore=1011 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101270031
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This error path needs to drop the lock before returning.

Fixes: afd018716398 ("hwmon: Add AHT10 Temperature and Humidity Sensor Driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hwmon/aht10.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/aht10.c b/drivers/hwmon/aht10.c
index c70d8c2d0c1f..2d9770cb4401 100644
--- a/drivers/hwmon/aht10.c
+++ b/drivers/hwmon/aht10.c
@@ -138,8 +138,10 @@ static int aht10_read_values(struct aht10_data *data)
 	mutex_lock(&data->lock);
 	if (aht10_polltime_expired(data)) {
 		res = i2c_master_send(client, cmd_meas, sizeof(cmd_meas));
-		if (res < 0)
+		if (res < 0) {
+			mutex_unlock(&data->lock);
 			return res;
+		}
 
 		usleep_range(AHT10_MEAS_DELAY,
 			     AHT10_MEAS_DELAY + AHT10_DELAY_EXTRA);
-- 
2.29.2

