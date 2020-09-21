Return-Path: <SRS0=2DcV=C6=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF238C43465
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Sep 2020 12:52:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C8562151B
	for <linux-hwmon@archiver.kernel.org>; Mon, 21 Sep 2020 12:52:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="a8OgNYDc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbgIUMwl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 21 Sep 2020 08:52:41 -0400
Received: from aserp2120.oracle.com ([141.146.126.78]:36250 "EHLO
        aserp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726417AbgIUMwl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Sep 2020 08:52:41 -0400
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
        by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08LCn6IO093467;
        Mon, 21 Sep 2020 12:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=Qef+jF9kIxJP77qktGupJNb5jDIKeVj25Kv/QMU9w7s=;
 b=a8OgNYDc/L96t0bUCuE/Mjb5A97x2QScU1+rIyDidU16AmuCcvQpY3Afj1EAXuhtFroB
 myYpxkCo/AolnnGca63bBCrvk6muCegR5PeiB8aHEbLpHPCoHV67egouv6k0RAMlr2YK
 cnJEzVxDQvVdgTzrIh9Tu4tzuo7jgt9rcFXLDnLWGtubBiBezdprOQclEzyc97klGwp8
 Oy5M2L2N/sPf+qlawJdGUxszIpGu/3AUg/6Iol0TYo+v7cmC3dVakh2idna4o3QeCxHE
 fFUgKMUNE1OUF7eQun87rPOVVoSlRUbu/GFqjZq/khi1wC+Y8lufp0yYESgGBfpkiXo6 xA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by aserp2120.oracle.com with ESMTP id 33n9xkne5c-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 21 Sep 2020 12:52:22 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 08LCp3BX133010;
        Mon, 21 Sep 2020 12:52:22 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
        by userp3020.oracle.com with ESMTP id 33nurqjskg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 21 Sep 2020 12:52:22 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
        by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 08LCqIFY021954;
        Mon, 21 Sep 2020 12:52:20 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 21 Sep 2020 05:52:18 -0700
Date:   Mon, 21 Sep 2020 15:52:12 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jean Delvare <jdelvare@suse.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] hwmon: (w83627ehf) Fix a resource leak in probe
Message-ID: <20200921125212.GA1128194@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9750 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009210093
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9750 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 bulkscore=0 mlxscore=0 phishscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2009210093
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Smatch has a new check for resource leaks which found a bug in probe:

    drivers/hwmon/w83627ehf.c:2417 w83627ehf_probe()
    warn: 'res->start' not released on lines: 2412.

We need to clean up if devm_hwmon_device_register_with_info() fails.

Fixes: 266cd5835947 ("hwmon: (w83627ehf) convert to with_info interface")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hwmon/w83627ehf.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
index 5a5120121e50..3964ceab2817 100644
--- a/drivers/hwmon/w83627ehf.c
+++ b/drivers/hwmon/w83627ehf.c
@@ -1951,8 +1951,12 @@ static int w83627ehf_probe(struct platform_device *pdev)
 							 data,
 							 &w83627ehf_chip_info,
 							 w83627ehf_groups);
+	if (IS_ERR(hwmon_dev)) {
+		err = PTR_ERR(hwmon_dev);
+		goto exit_release;
+	}
 
-	return PTR_ERR_OR_ZERO(hwmon_dev);
+	return 0;
 
 exit_release:
 	release_region(res->start, IOREGION_LENGTH);
-- 
2.28.0

