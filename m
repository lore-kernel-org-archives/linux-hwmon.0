Return-Path: <SRS0=c1px=3D=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB1C9C33CA9
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jan 2020 05:52:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ABEE52072B
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jan 2020 05:52:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EzwZJeJb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725860AbgANFwA (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jan 2020 00:52:00 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:46002 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbgANFwA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jan 2020 00:52:00 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00E5nJQD112741;
        Tue, 14 Jan 2020 05:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2019-08-05;
 bh=BAaV0c/xm/TzcUkVjeTotwCF5q0/dynqsi7TFS3d+Ao=;
 b=EzwZJeJbJV+wc3TurS1UUNSKv6Ba3d2NatnVAqrFEHGvv74K/gCxiqRJi5ROf6qQOTty
 VRelRMQWpIWMvG1nMcmkti0LhiwESVJc0TuY0q4kNL6X7EcfOQ7zLoMC25cdR0bqztoc
 lUaDbH7kEhYYv/X/JisOniPl0QpB522bVE2Nyg48HJCJlt9YJa3swpSeplUxd02oo9zY
 CqqujK2Xxvhj2M5nvniTlmQ94m5fjWDoa6tq5Emaak27A7Cdv6vHr9I1nFjNbdXowYF0
 Qlbe2BRukiD0FKt4n3jovvwF0L3y1byKmTDBTY5UrW4nwooK4wZwCu49jUt+vf80S4pE gg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 2xf73ybp5c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Jan 2020 05:51:36 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00E5nLd7150330;
        Tue, 14 Jan 2020 05:51:35 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3030.oracle.com with ESMTP id 2xh2sbwc42-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 14 Jan 2020 05:51:35 +0000
Received: from abhmp0019.oracle.com (abhmp0019.oracle.com [141.146.116.25])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 00E5pYQq010456;
        Tue, 14 Jan 2020 05:51:34 GMT
Received: from kili.mountain (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 13 Jan 2020 21:51:33 -0800
Date:   Tue, 14 Jan 2020 08:51:25 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Beniamin Bia <beniamin.bia@analog.com>
Cc:     Michael Hennerich <Michael.Hennerich@analog.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] hwmon: (adm1177) Fix adm1177_write_alert_thr()
Message-ID: <20200114055125.ro5slro6zewr56tx@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: NeoMutt/20170113 (1.7.2)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9499 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2001140051
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9499 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2001140051
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

There is a reversed condition so the adm1177_write_alert_thr() function
doesn't update "st->alert_threshold_ua".

Fixes: 829091f9c56c ("hwmon: (adm1177) Add ADM1177 Hot Swap Controller and Digital Power Monitor driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hwmon/adm1177.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/adm1177.c b/drivers/hwmon/adm1177.c
index 1f2ff7a29306..d314223a404a 100644
--- a/drivers/hwmon/adm1177.c
+++ b/drivers/hwmon/adm1177.c
@@ -63,7 +63,7 @@ static int adm1177_write_alert_thr(struct adm1177_state *st,
 
 	ret = i2c_smbus_write_byte_data(st->client, ADM1177_REG_ALERT_TH,
 					val);
-	if (!ret)
+	if (ret)
 		return ret;
 
 	st->alert_threshold_ua = alert_threshold_ua;
-- 
2.11.0

