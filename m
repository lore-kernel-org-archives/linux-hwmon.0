Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF609C4338F
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Aug 2021 11:46:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B84FF6024A
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Aug 2021 11:46:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237432AbhHKLqn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 Aug 2021 07:46:43 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:41522 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237409AbhHKLqm (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Aug 2021 07:46:42 -0400
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 17BBeV81004099;
        Wed, 11 Aug 2021 07:46:04 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com with ESMTP id 3abjesmrm5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 11 Aug 2021 07:46:04 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 17BBk3T5000435
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 Aug 2021 07:46:03 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.858.5; Wed, 11 Aug 2021
 07:46:02 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.858.5 via Frontend Transport;
 Wed, 11 Aug 2021 07:46:02 -0400
Received: from nsa.sphairon.box ([10.44.3.58])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 17BBjwfP021634;
        Wed, 11 Aug 2021 07:46:01 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <linux-hwmon@vger.kernel.org>
CC:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Subject: [PATCH 2/3] hwmon: axi-fan-control: handle irqs in natural order
Date:   Wed, 11 Aug 2021 13:48:52 +0200
Message-ID: <20210811114853.159298-3-nuno.sa@analog.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210811114853.159298-1-nuno.sa@analog.com>
References: <20210811114853.159298-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: RhduGZCZar5ZmGD6EFhVvwWL459pYdBB
X-Proofpoint-GUID: RhduGZCZar5ZmGD6EFhVvwWL459pYdBB
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-11_04:2021-08-11,2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015
 mlxlogscore=733 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108110077
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
index 901d1588234d..c898ad121dc7 100644
--- a/drivers/hwmon/axi-fan-control.c
+++ b/drivers/hwmon/axi-fan-control.c
@@ -283,18 +283,9 @@ static irqreturn_t axi_fan_control_irq_handler(int irq, void *data)
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
@@ -310,9 +301,18 @@ static irqreturn_t axi_fan_control_irq_handler(int irq, void *data)
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

