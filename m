Return-Path: <SRS0=7FvC=D5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46F84C4363A
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Oct 2020 07:09:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA2D821775
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Oct 2020 07:09:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Sv+/OHM9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505132AbgJVHJZ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 22 Oct 2020 03:09:25 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:56234 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505125AbgJVHJZ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Oct 2020 03:09:25 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09M6oSOL032033;
        Thu, 22 Oct 2020 07:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=H/7ut3HZ9Mm0LqMb92CGy2Gtz3YqHfFYbBgQ+jFKH3o=;
 b=Sv+/OHM9MVdrjDUg7ZMKdb7BIgxStDG/iyFjazjK4Sm58io6MjmxUUmVydwnA6JhzRg0
 WqVWnSox1+gasBsNLDpfOzhaHHmtFWQyHwUQtIGlw8Y0OowtrE7EdeqxuPnyGdS50CAE
 y8z55kLol77xsjmqmtt+2aCxn081WbKMvMs58V1KAOGUPLoX9COewhvCDtfP0jsBszB4
 EswimcAV2abs0H4kILfkeZpb6bcmGXv0z3IAwj58BtjZ2EFhfp4e9YVZBhmm9Ra7EqpH
 wIRN+LndQ25CEctI9zQkwZV5EXhcX6JiU5fV+Cmw/LeVH/mAVn/kMfPym4y4/lurg3Zp 6g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2120.oracle.com with ESMTP id 34ak16mhq0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 22 Oct 2020 07:09:07 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09M6njYN037158;
        Thu, 22 Oct 2020 07:07:07 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 348ah0h1n5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 22 Oct 2020 07:07:07 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 09M776Pl010394;
        Thu, 22 Oct 2020 07:07:06 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 22 Oct 2020 00:07:05 -0700
Date:   Thu, 22 Oct 2020 10:06:59 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Ugur Usug <Ugur.Usug@maximintegrated.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] hwmon: (pmbus/max20730) delete some dead code
Message-ID: <20201022070659.GA2817762@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9781 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010220044
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9781 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 mlxscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010220044
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The debugfs_create_dir() function never returns NULL.  Normal users are
not supposed to check the return value so the correct fix is just to
delete this check.

In the case where the debugfs_create_dir() fails, the function returns
NULL.  The other debugfs function check for NULL directory and handle
it.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hwmon/pmbus/max20730.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/hwmon/pmbus/max20730.c b/drivers/hwmon/pmbus/max20730.c
index be83b98411c7..00fea16acab4 100644
--- a/drivers/hwmon/pmbus/max20730.c
+++ b/drivers/hwmon/pmbus/max20730.c
@@ -328,8 +328,6 @@ static int max20730_init_debugfs(struct i2c_client *client,
 		return -ENOENT;
 
 	max20730_dir = debugfs_create_dir(client->name, debugfs);
-	if (!max20730_dir)
-		return -ENOENT;
 
 	for (i = 0; i < MAX20730_DEBUGFS_NUM_ENTRIES; ++i)
 		psu->debugfs_entries[i] = i;
-- 
2.28.0

