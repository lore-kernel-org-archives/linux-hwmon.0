Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5BDEC433F5
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Mar 2022 13:53:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbiCHNyy (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 8 Mar 2022 08:54:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347204AbiCHNyx (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 8 Mar 2022 08:54:53 -0500
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4921749C8F
        for <linux-hwmon@vger.kernel.org>; Tue,  8 Mar 2022 05:53:57 -0800 (PST)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 228DGUrA014142;
        Tue, 8 Mar 2022 08:53:42 -0500
Received: from nwd2mta4.analog.com ([137.71.173.58])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3em5n8ef69-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 08 Mar 2022 08:53:42 -0500
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
        by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 228Drfg8046760
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 8 Mar 2022 08:53:41 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Tue, 8 Mar 2022
 08:53:40 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Tue, 8 Mar 2022 08:53:40 -0500
Received: from nsa.ad.analog.com ([10.44.3.51])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 228DrXAT032109;
        Tue, 8 Mar 2022 08:53:35 -0500
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <linux-hwmon@vger.kernel.org>
CC:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Subject: [PATCH] hwmon: axi-fan-control: use hwmon_notify_event
Date:   Tue, 8 Mar 2022 14:54:08 +0100
Message-ID: <20220308135408.440744-1-nuno.sa@analog.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: ypV7-WTkJc-aYyqlcSQfyO2lyQY89jKd
X-Proofpoint-ORIG-GUID: ypV7-WTkJc-aYyqlcSQfyO2lyQY89jKd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-08_03,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=709 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203080074
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Instead of directly accessing kobj directly from the driver, use the
hwmon notify API.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 drivers/hwmon/axi-fan-control.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-control.c
index d2092c17d993..96c4a5c45291 100644
--- a/drivers/hwmon/axi-fan-control.c
+++ b/drivers/hwmon/axi-fan-control.c
@@ -339,7 +339,8 @@ static irqreturn_t axi_fan_control_irq_handler(int irq, void *data)
 			ctl->update_tacho_params = true;
 		} else {
 			ctl->hw_pwm_req = false;
-			sysfs_notify(&ctl->hdev->kobj, NULL, "pwm1");
+			hwmon_notify_event(ctl->hdev, hwmon_pwm,
+					   hwmon_pwm_input, 0);
 		}
 	}
 
-- 
2.35.1

