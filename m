Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 920C0ECAAD3
	for <linux-hwmon@archiver.kernel.org>; Wed,  7 Sep 2022 10:23:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230415AbiIGKXT (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 7 Sep 2022 06:23:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230403AbiIGKXA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Sep 2022 06:23:00 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40705BBA7B
        for <linux-hwmon@vger.kernel.org>; Wed,  7 Sep 2022 03:20:34 -0700 (PDT)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2878fnA8011095;
        Wed, 7 Sep 2022 06:20:17 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3jc0s7480b-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 07 Sep 2022 06:20:17 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 287AKFuL065313
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 7 Sep 2022 06:20:15 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Wed, 7 Sep 2022
 06:20:14 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Wed, 7 Sep 2022 06:20:14 -0400
Received: from ibrahim-vm.ad.analog.com (IST-LT-39247.ad.analog.com [10.25.16.132])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 287AJl25009387;
        Wed, 7 Sep 2022 06:20:07 -0400
From:   Ibrahim Tilki <Ibrahim.Tilki@analog.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>
CC:     Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
        <linux-hwmon@vger.kernel.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v6 4/4] MAINTAINERS: Add maintainer for hwmon/max31760
Date:   Wed, 7 Sep 2022 13:19:08 +0300
Message-ID: <20220907101908.184819-5-Ibrahim.Tilki@analog.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220907101908.184819-1-Ibrahim.Tilki@analog.com>
References: <20220907101908.184819-1-Ibrahim.Tilki@analog.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: iDqjPzGYSOr4rDfUoM_sEnPjX1k_ubo6
X-Proofpoint-ORIG-GUID: iDqjPzGYSOr4rDfUoM_sEnPjX1k_ubo6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-07_06,2022-09-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0 mlxscore=0
 spamscore=0 mlxlogscore=750 suspectscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209070040
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Add maintainer for hwmon/max31760 driver

Signed-off-by: Ibrahim Tilki <Ibrahim.Tilki@analog.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d30f26e07..76c7d6606 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1334,6 +1334,15 @@ F:	drivers/iio/amplifiers/hmc425a.c
 F:	drivers/staging/iio/*/ad*
 X:	drivers/iio/*/adjd*
 
+ANALOG DEVICES INC MAX31760 DRIVER
+M:	Ibrahim Tilki <Ibrahim.Tilki@analog.com>
+S:	Maintained
+W:	http://wiki.analog.com/
+W:	https://ez.analog.com/linux-software-drivers
+F:	Documentation/devicetree/bindings/hwmon/adi,max31760.yaml
+F:	Documentation/hwmon/max31760.rst
+F:	drivers/hwmon/max31760.c
+
 ANALOGBITS PLL LIBRARIES
 M:	Paul Walmsley <paul.walmsley@sifive.com>
 S:	Supported
-- 
2.36.1

