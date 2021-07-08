Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD6B2C07E96
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Jul 2021 11:59:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A08866141D
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Jul 2021 11:59:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231811AbhGHMB7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 8 Jul 2021 08:01:59 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:40542 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231802AbhGHMB5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 8 Jul 2021 08:01:57 -0400
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 168BtxcA008114;
        Thu, 8 Jul 2021 07:58:35 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com with ESMTP id 39nub31awe-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 08 Jul 2021 07:58:35 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 168BwYHV042545
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 8 Jul 2021 07:58:34 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.858.5; Thu, 8 Jul 2021
 07:58:33 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.858.5 via Frontend Transport;
 Thu, 8 Jul 2021 07:58:33 -0400
Received: from nsa.ad.analog.com ([10.44.3.58])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 168BwPtr020146;
        Thu, 8 Jul 2021 07:58:32 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Subject: [RFC PATCH 4/6] hwmon: axi-fan-control: handle irqs in natural order
Date:   Thu, 8 Jul 2021 14:01:09 +0200
Message-ID: <20210708120111.519444-5-nuno.sa@analog.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210708120111.519444-1-nuno.sa@analog.com>
References: <20210708120111.519444-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: nkpMBqpEh5EU8BYZKgn7NunHrr5zNG3w
X-Proofpoint-ORIG-GUID: nkpMBqpEh5EU8BYZKgn7NunHrr5zNG3w
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-08_06:2021-07-08,2021-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 malwarescore=0 mlxlogscore=813 suspectscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107080067
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The core will now start out of reset at boot as soon as clocking is
available. Hence, by the time we unmask the interrupts we already might
have some of them set. Thus, it's important to handle them in the
natural order the core generates them. Otherwise, we could process
'ADI_IRQ_SRC_PWM_CHANGED' before 'ADI_IRQ_SRC_TEMP_INCREASE' and
erroneously set 'update_tacho_params' to true.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/hwmon/axi-fan-control.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-control.c
index aa5a922f684d..d4b62d54375b 100644
--- a/drivers/hwmon/axi-fan-control.c
+++ b/drivers/hwmon/axi-fan-control.c
@@ -291,18 +291,9 @@ static irqreturn_t axi_fan_control_irq_handler(int irq, void *data)
 	u32 irq_pending = axi_ioread(ADI_REG_IRQ_PENDING, ctl);
 	u32 clear_mask;
 
-	if (irq_pending & ADI_IRQ_SRC_NEW_MEASUR) {
-		if (ctl->update_tacho_params) {
-			u32 new_tach = axi_ioread(ADI_REG_TACH_MEASUR, ctl);
-
-			/* get 25% tolerance */
-			u32 tach_tol = DIV_ROUND_CLOSEST(new_tach * 25, 100);
-			/* set new tacho parameters */
-			axi_iowrite(new_tach, ADI_REG_TACH_PERIOD, ctl);
-			axi_iowrite(tach_tol, ADI_REG_TACH_TOLERANCE, ctl);
-			ctl->update_tacho_params = false;
-		}
-	}
+	if (irq_pending & ADI_IRQ_SRC_TEMP_INCREASE)
+		/* hardware requested a new pwm */
+		ctl->hw_pwm_req = true;
 
 	if (irq_pending & ADI_IRQ_SRC_PWM_CHANGED) {
 		/*
@@ -318,9 +309,18 @@ static irqreturn_t axi_fan_control_irq_handler(int irq, void *data)
 		}
 	}
 
-	if (irq_pending & ADI_IRQ_SRC_TEMP_INCREASE)
-		/* hardware requested a new pwm */
-		ctl->hw_pwm_req = true;
+	if (irq_pending & ADI_IRQ_SRC_NEW_MEASUR) {
+		if (ctl->update_tacho_params) {
+			u32 new_tach = axi_ioread(ADI_REG_TACH_MEASUR, ctl);
+			/* get 25% tolerance */
+			u32 tach_tol = DIV_ROUND_CLOSEST(new_tach * 25, 100);
+
+			/* set new tacho parameters */
+			axi_iowrite(new_tach, ADI_REG_TACH_PERIOD, ctl);
+			axi_iowrite(tach_tol, ADI_REG_TACH_TOLERANCE, ctl);
+			ctl->update_tacho_params = false;
+		}
+	}
 
 	if (irq_pending & ADI_IRQ_SRC_TACH_ERR)
 		ctl->fan_fault = 1;
-- 
2.32.0

