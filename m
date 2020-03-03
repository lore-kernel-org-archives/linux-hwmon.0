Return-Path: <SRS0=zXU2=4U=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18233C3F2CD
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Mar 2020 10:16:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E3BF3214DB
	for <linux-hwmon@archiver.kernel.org>; Tue,  3 Mar 2020 10:16:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="a9632GbC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728341AbgCCKQi (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 3 Mar 2020 05:16:38 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:40006 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728242AbgCCKQi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Mar 2020 05:16:38 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023ADGfn161650;
        Tue, 3 Mar 2020 10:16:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=KNNkC4SB32z5Gd7xmQWZNd6PuADfU9CPDCFk2PdjZeY=;
 b=a9632GbCLuhMHSn1Hl+kJ/Wfhq+tsR6R05qjQX7g06YiH5jn5yZEtPvkuokF9uHAjKBZ
 dZtEv2pIzZeA0WVPWwLsBRTZPVpc1mDQcu2y7eyjY+SokC7/Nx5okujlAW+wmDU7Ly6I
 +02bVMCzMFBT3yg/VTffeIEeTjIS7Fk7NW1oocTT0u7pnyP9iAN2Eb0Sx/H2W1IHslnS
 g4ofHFxL6T3TQaZLOfLZjlC0k4Q4cbm3o+feZUDzEIdYbL3sG8LE3yHLM+x6Q4/dNcSI
 4oD4bt3FB9JHzWqI45Htwzuh7NcNAGPa+eiriH+IMshUhPxJIraFg/J88SOtDBxmIBu3 qA== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by userp2120.oracle.com with ESMTP id 2yghn31wfb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 03 Mar 2020 10:16:18 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 023ADB32105969;
        Tue, 3 Mar 2020 10:16:17 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by aserp3030.oracle.com with ESMTP id 2yg1gx44tk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 03 Mar 2020 10:16:17 +0000
Received: from abhmp0006.oracle.com (abhmp0006.oracle.com [141.146.116.12])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 023AGFnD018623;
        Tue, 3 Mar 2020 10:16:16 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 03 Mar 2020 02:16:15 -0800
Date:   Tue, 3 Mar 2020 13:16:08 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jean Delvare <jdelvare@suse.com>,
        "Darrick J. Wong" <darrick.wong@oracle.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] hwmon: (adt7462) Fix an error return in ADT7462_REG_VOLT()
Message-ID: <20200303101608.kqjwfcazu2ylhi2a@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9548 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003030077
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9548 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 mlxscore=0 adultscore=0 mlxlogscore=999 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2003030077
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This is only called from adt7462_update_device().  The caller expects it
to return zero on error.  I fixed a similar issue earlier in commit
a4bf06d58f21 ("hwmon: (adt7462) ADT7462_REG_VOLT_MAX() should return 0")
but I missed this one.

Fixes: c0b4e3ab0c76 ("adt7462: new hwmon driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hwmon/adt7462.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/adt7462.c b/drivers/hwmon/adt7462.c
index 9632e2e3c4bb..319a0519ebdb 100644
--- a/drivers/hwmon/adt7462.c
+++ b/drivers/hwmon/adt7462.c
@@ -413,7 +413,7 @@ static int ADT7462_REG_VOLT(struct adt7462_data *data, int which)
 			return 0x95;
 		break;
 	}
-	return -ENODEV;
+	return 0;
 }
 
 /* Provide labels for sysfs */
-- 
2.11.0

