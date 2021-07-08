Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FADC07E9C
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Jul 2021 11:58:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A3DA36141D
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Jul 2021 11:58:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231777AbhGHMB3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 8 Jul 2021 08:01:29 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:9422 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231773AbhGHMB3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 8 Jul 2021 08:01:29 -0400
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 168BteFm005563;
        Thu, 8 Jul 2021 07:58:33 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com with ESMTP id 39mehm2qjk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 08 Jul 2021 07:58:33 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 168BwW31042537
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 8 Jul 2021 07:58:32 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.858.5; Thu, 8 Jul 2021
 07:58:31 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.858.5 via Frontend
 Transport; Thu, 8 Jul 2021 07:58:31 -0400
Received: from nsa.ad.analog.com ([10.44.3.58])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 168BwPtp020146;
        Thu, 8 Jul 2021 07:58:30 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Subject: [RFC PATCH 2/6] hwmon: axi-fan-control: add tacho devicetree properties
Date:   Thu, 8 Jul 2021 14:01:07 +0200
Message-ID: <20210708120111.519444-3-nuno.sa@analog.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210708120111.519444-1-nuno.sa@analog.com>
References: <20210708120111.519444-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: PFuYHh4RUs0bRZz2B4KFb2YwN0rTkcX5
X-Proofpoint-GUID: PFuYHh4RUs0bRZz2B4KFb2YwN0rTkcX5
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-08_06:2021-07-08,2021-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107080067
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This core is capable to run without any user interaction and when it
does, it uses some predefined values in order to evaluate the tacho
signal from the FAN. These values depend on the attached FAN, so that
the core now exposes registers to change them accordingly. The values
are:

 * adi,tacho-25-us: Expected tacho signal when the PWM is 25%;
 * adi,tacho-50-us: Expected tacho signal when the PWM is 50%;
 * adi,tacho-75-us: Expected tacho signal when the PWM is 75%;
 * adi,tacho-100-us: Expected tacho signal when the PWM is 100%.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/hwmon/axi-fan-control.c | 34 +++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-control.c
index 901d1588234d..aa5a922f684d 100644
--- a/drivers/hwmon/axi-fan-control.c
+++ b/drivers/hwmon/axi-fan-control.c
@@ -23,6 +23,14 @@
 #define ADI_REG_PWM_PERIOD	0x00c0
 #define ADI_REG_TACH_MEASUR	0x00c4
 #define ADI_REG_TEMPERATURE	0x00c8
+#define ADI_REG_TACH_25		0x0140
+#define ADI_REG_TACH_50		0x0144
+#define ADI_REG_TACH_75		0x0148
+#define ADI_REG_TACH_100	0x014c
+#define ADI_REG_TACH_25_TOL	0x0150
+#define ADI_REG_TACH_50_TOL	0x0154
+#define ADI_REG_TACH_75_TOL	0x0158
+#define ADI_REG_TACH_100_TOL	0x015c
 
 #define ADI_REG_IRQ_MASK	0x0040
 #define ADI_REG_IRQ_PENDING	0x0044
@@ -328,6 +336,7 @@ static int axi_fan_control_init(struct axi_fan_control_data *ctl,
 				const struct device_node *np)
 {
 	int ret;
+	u32 tacho_val;
 
 	/* get fan pulses per revolution */
 	ret = of_property_read_u32(np, "pulses-per-revolution", &ctl->ppr);
@@ -337,6 +346,31 @@ static int axi_fan_control_init(struct axi_fan_control_data *ctl,
 	/* 1, 2 and 4 are the typical and accepted values */
 	if (ctl->ppr != 1 && ctl->ppr != 2 && ctl->ppr != 4)
 		return -EINVAL;
+
+	if (!of_property_read_u32(np, "adi,tacho-25-us", &tacho_val)) {
+		tacho_val = DIV_ROUND_CLOSEST_ULL((u64)tacho_val * ctl->clk_rate, 1000000);
+		axi_iowrite(tacho_val, ADI_REG_TACH_25, ctl);
+		axi_iowrite(DIV_ROUND_CLOSEST(tacho_val * 25, 100), ADI_REG_TACH_25_TOL, ctl);
+	}
+
+	if (!of_property_read_u32(np, "adi,tacho-50-us", &tacho_val)) {
+		tacho_val = DIV_ROUND_CLOSEST_ULL((u64)tacho_val * ctl->clk_rate, 1000000);
+		axi_iowrite(tacho_val, ADI_REG_TACH_50, ctl);
+		axi_iowrite(DIV_ROUND_CLOSEST(tacho_val * 25, 100), ADI_REG_TACH_50_TOL, ctl);
+	}
+
+	if (!of_property_read_u32(np, "adi,tacho-75-us", &tacho_val)) {
+		tacho_val = DIV_ROUND_CLOSEST_ULL((u64)tacho_val * ctl->clk_rate, 1000000);
+		axi_iowrite(tacho_val, ADI_REG_TACH_75, ctl);
+		axi_iowrite(DIV_ROUND_CLOSEST(tacho_val * 25, 100), ADI_REG_TACH_75_TOL, ctl);
+	}
+
+	if (!of_property_read_u32(np, "adi,tacho-100-us", &tacho_val)) {
+		tacho_val = DIV_ROUND_CLOSEST_ULL((u64)tacho_val * ctl->clk_rate, 1000000);
+		axi_iowrite(tacho_val, ADI_REG_TACH_100, ctl);
+		axi_iowrite(DIV_ROUND_CLOSEST(tacho_val * 25, 100), ADI_REG_TACH_100_TOL, ctl);
+	}
+
 	/*
 	 * Enable all IRQs
 	 */
-- 
2.32.0

