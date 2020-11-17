Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF070C2D0E4
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 Nov 2020 07:26:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52C472463B
	for <linux-hwmon@archiver.kernel.org>; Tue, 17 Nov 2020 07:26:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="p/gnF/Va"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726511AbgKQH0x (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 17 Nov 2020 02:26:53 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:58044 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbgKQH0w (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 Nov 2020 02:26:52 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AH7Nu4N125481;
        Tue, 17 Nov 2020 07:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=LdOYEyOdL9XySTd7XDlW9yCUa8NLCtLfAr3prYad7zo=;
 b=p/gnF/Vaxi03vcAGHSiZWwzLeEfGTd3wB26/JDol7qC/yN1bo8SZrOdZ0KsneIim3B7S
 8+1qWqY06oPEf7jfQsc8H7G0xdjE9djNQvLqFnKadZ6jN4TXjeCRCoHOrUoUo+vRZQIO
 //mSypqHQF6WPcu8BXqalqjcEPufqQDcFlfZhbHH7EtRKbHJ1Nzws7RiZ1HTzenR0Bk4
 zMsVPpz1gLPBq4Czs3nxHtKPYo1FZXWAd7Si5CMNmbPmmLlGJSB+CG+aKJSIiAl7xXoz
 StH4H3pI7iCck5yJGInleGHzwiRsj8ANM4he2B/8BKyWmJVkH+JFxRE/EvQxu3Nki8y1 LQ== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 34t7vn0x2u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 17 Nov 2020 07:24:10 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 0AH7EX4o073840;
        Tue, 17 Nov 2020 07:24:09 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
        by userp3030.oracle.com with ESMTP id 34ts5vq1c3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 17 Nov 2020 07:24:09 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 0AH7O83l025443;
        Tue, 17 Nov 2020 07:24:08 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 16 Nov 2020 23:24:07 -0800
Date:   Tue, 17 Nov 2020 10:24:01 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Henrik Rydberg <rydberg@bitmath.org>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Brad Campbell <brad@fnarfbargle.com>,
        linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] hwmon: (applesmc) Fix smc_sane() function
Message-ID: <20201117072401.GE1111239@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9807 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011170051
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9807 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 phishscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2011170052
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This test is reversed so the function will return without sending
the APPLESMC_READ_CMD or completing the rest of the function.

Fixes: 4d64bb4ba5ec ("hwmon: (applesmc) Re-work SMC comms")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hwmon/applesmc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
index 79b498f816fe..289b39537683 100644
--- a/drivers/hwmon/applesmc.c
+++ b/drivers/hwmon/applesmc.c
@@ -227,7 +227,7 @@ static int smc_sane(void)
 	int ret;
 
 	ret = wait_status(0, SMC_STATUS_BUSY);
-	if (!ret)
+	if (ret)
 		return ret;
 	ret = send_command(APPLESMC_READ_CMD);
 	if (ret)
-- 
2.29.2

