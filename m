Return-Path: <SRS0=8ZHx=CJ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEEA5C433E6
	for <linux-hwmon@archiver.kernel.org>; Mon, 31 Aug 2020 11:40:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 885DE20866
	for <linux-hwmon@archiver.kernel.org>; Mon, 31 Aug 2020 11:40:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mqq1HCCq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgHaLkf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 31 Aug 2020 07:40:35 -0400
Received: from userp2130.oracle.com ([156.151.31.86]:35278 "EHLO
        userp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgHaLke (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 31 Aug 2020 07:40:34 -0400
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
        by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07VBZGWN067899;
        Mon, 31 Aug 2020 11:40:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=X9lKjQ+8a4gAtfi/H/5gipuQgmVo/VqVtqjnK5/uRJE=;
 b=mqq1HCCqWD65r9dOV7XYAosbrOtvmdEZbPAdr6YHKuBI+GPfxf+HXQesnB3p8e43K6nE
 WcNccQBeGEi70SBJBLlew6gLTP2dI2rsJssu5VmqW5zqiFfvyzIkYGij1N84o/Q9zFJz
 u3VMcu26yQCm9ibaVn4L2FB0ArSeanTTaTn329ulfhFsHLx1SYv+Ij3lKle3mut/lwBu
 JgMIWN5AMmAJ1fYK9qDlLRW6Lqen5phq/bfQDmHDAFpXxNY7pSEbNTdAjU4Pk5UbLNNd
 c7cQ3cI7uwXUduZQiC03ft+R90NA7Wm905NOv7hT+8Z/PUdPC6518SOcX3rNkVoY74uy dg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by userp2130.oracle.com with ESMTP id 337eeqnsrb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 31 Aug 2020 11:40:06 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 07VBaXrI030282;
        Mon, 31 Aug 2020 11:40:06 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
        by aserp3020.oracle.com with ESMTP id 3380x01n4r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 31 Aug 2020 11:40:06 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
        by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 07VBe4pF032421;
        Mon, 31 Aug 2020 11:40:04 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Mon, 31 Aug 2020 04:40:04 -0700
Date:   Mon, 31 Aug 2020 14:39:58 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jean Delvare <jdelvare@suse.com>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] hwmon: replace impossible fallthroughs with breaks
Message-ID: <20200831113958.GB514373@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9729 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008310066
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9729 signatures=668679
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 mlxscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008310066
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

It's impossible to reach these fall through statements because all
the possible values are handled.  In that situation it's cleaner to
use a break statement instead of a fall through statement.

Fixes: c947e51cf803 ("hwmon: (adt7462) Mark expected switch fall-throughs")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hwmon/adt7462.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/adt7462.c b/drivers/hwmon/adt7462.c
index e75bbd87ad09..634a44591c7f 100644
--- a/drivers/hwmon/adt7462.c
+++ b/drivers/hwmon/adt7462.c
@@ -435,7 +435,7 @@ static const char *voltage_label(struct adt7462_data *data, int which)
 		case 3:
 			return "+1.5V";
 		}
-		fallthrough;
+		break;
 	case 2:
 		if (!(data->pin_cfg[1] & ADT7462_PIN22_INPUT))
 			return "+12V3";
@@ -493,7 +493,7 @@ static const char *voltage_label(struct adt7462_data *data, int which)
 		case 3:
 			return "+1.5";
 		}
-		fallthrough;
+		break;
 	case 11:
 		if (data->pin_cfg[3] >> ADT7462_PIN28_SHIFT ==
 					ADT7462_PIN28_VOLT &&
@@ -531,7 +531,7 @@ static int voltage_multiplier(struct adt7462_data *data, int which)
 		case 3:
 			return 7800;
 		}
-		fallthrough;
+		break;
 	case 2:
 		if (!(data->pin_cfg[1] & ADT7462_PIN22_INPUT))
 			return 62500;
@@ -589,7 +589,7 @@ static int voltage_multiplier(struct adt7462_data *data, int which)
 		case 3:
 			return 7800;
 		}
-		fallthrough;
+		break;
 	case 11:
 	case 12:
 		if (data->pin_cfg[3] >> ADT7462_PIN28_SHIFT ==
-- 
2.28.0

