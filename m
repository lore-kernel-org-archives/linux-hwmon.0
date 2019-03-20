Return-Path: <SRS0=9YG5=RX=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15924C43381
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 Mar 2019 14:59:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E3CC32146E
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 Mar 2019 14:59:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728461AbfCTO7S (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 20 Mar 2019 10:59:18 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:51056 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726487AbfCTO7R (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 20 Mar 2019 10:59:17 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x2KEcv9a010502;
        Wed, 20 Mar 2019 09:58:22 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail1.cirrus.com (mail1.cirrus.com [141.131.3.20])
        by mx0b-001ae601.pphosted.com with ESMTP id 2ratwujc50-1;
        Wed, 20 Mar 2019 09:58:21 -0500
Received: from EX17.ad.cirrus.com (unknown [172.20.9.81])
        by mail1.cirrus.com (Postfix) with ESMTP id 938FF611C8B7;
        Wed, 20 Mar 2019 09:58:21 -0500 (CDT)
Received: from imbe.wolfsonmicro.main (198.61.95.81) by EX17.ad.cirrus.com
 (172.20.9.81) with Microsoft SMTP Server id 14.3.408.0; Wed, 20 Mar 2019
 14:58:20 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by imbe.wolfsonmicro.main (8.14.4/8.14.4) with ESMTP id x2KEwIMP023819; Wed,
 20 Mar 2019 14:58:20 GMT
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>
CC:     <linux-hwmon@vger.kernel.org>, <corbet@lwn.net>,
        <devicetree@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: [PATCH 2/3] hwmon: Add convience macro to define simple static sensors
Date:   Wed, 20 Mar 2019 14:58:17 +0000
Message-ID: <20190320145818.30644-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190320145818.30644-1-ckeepax@opensource.cirrus.com>
References: <20190320145818.30644-1-ckeepax@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=968 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1903200113
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

It takes a fair amount of boiler plate code to add new sensors, add a
macro that can be used to specify simple static sensors.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/linux/hwmon.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
index 99e0c1b0b5fb3..7a8cc06a0d61d 100644
--- a/include/linux/hwmon.h
+++ b/include/linux/hwmon.h
@@ -365,6 +365,14 @@ struct hwmon_channel_info {
 	const u32 *config;
 };
 
+#define HWMON_CHANNEL_INFO(stype, ...)	\
+	(&(struct hwmon_channel_info) {	\
+		.type = hwmon_##stype,	\
+		.config = (u32 []) {	\
+			__VA_ARGS__, 0	\
+		}			\
+	})
+
 /**
  * Chip configuration
  * @ops:	Pointer to hwmon operations.
-- 
2.11.0

