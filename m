Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B97D6C07E96
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Jul 2021 11:58:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C14D61184
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Jul 2021 11:58:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231727AbhGHMBa (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 8 Jul 2021 08:01:30 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:10406 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231773AbhGHMBa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 8 Jul 2021 08:01:30 -0400
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 168Bt1MC004631;
        Thu, 8 Jul 2021 07:58:34 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com with ESMTP id 39mehm2qjq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 08 Jul 2021 07:58:34 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 168BwXHT042541
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 8 Jul 2021 07:58:33 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.858.5;
 Thu, 8 Jul 2021 07:58:32 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.858.5;
 Thu, 8 Jul 2021 07:58:32 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.858.5 via Frontend
 Transport; Thu, 8 Jul 2021 07:58:32 -0400
Received: from nsa.ad.analog.com ([10.44.3.58])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 168BwPtq020146;
        Thu, 8 Jul 2021 07:58:31 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        "Jean Delvare" <jdelvare@suse.com>
Subject: [RFC PATCH 3/6] dt-bindings: axi-fan-control: add tacho properties
Date:   Thu, 8 Jul 2021 14:01:08 +0200
Message-ID: <20210708120111.519444-4-nuno.sa@analog.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210708120111.519444-1-nuno.sa@analog.com>
References: <20210708120111.519444-1-nuno.sa@analog.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: S_mhcHxlVRcYbj-GjLgdEdIiurr222r-
X-Proofpoint-GUID: S_mhcHxlVRcYbj-GjLgdEdIiurr222r-
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-08_06:2021-07-08,2021-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 mlxlogscore=983 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107080067
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add the bindings for the tacho signal evaluation parameters which depend
on the FAN being used.

Signed-off-by: Nuno Sá <nuno.sa@analog.com>
---
 .../bindings/hwmon/adi,axi-fan-control.yaml          | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/adi,axi-fan-control.yaml b/Documentation/devicetree/bindings/hwmon/adi,axi-fan-control.yaml
index 6747b870f297..0481eb34d9f1 100644
--- a/Documentation/devicetree/bindings/hwmon/adi,axi-fan-control.yaml
+++ b/Documentation/devicetree/bindings/hwmon/adi,axi-fan-control.yaml
@@ -37,6 +37,18 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum: [1, 2, 4]
 
+  adi,tacho-25-us:
+    description: Expected tacho signal when the PWM is at 25%.
+
+  adi,tacho-50-us:
+    description: Expected tacho signal when the PWM is at 50%.
+
+  adi,tacho-75-us:
+    description: Expected tacho signal when the PWM is at 75%.
+
+  adi,tacho-100-us:
+    description: Expected tacho signal when the PWM is at 100%.
+
 required:
   - compatible
   - reg
-- 
2.32.0

