Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998C8ECAAD1
	for <linux-hwmon@archiver.kernel.org>; Thu,  1 Sep 2022 13:06:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233994AbiIANGv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 1 Sep 2022 09:06:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233999AbiIANGb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Sep 2022 09:06:31 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3541C92F7E
        for <linux-hwmon@vger.kernel.org>; Thu,  1 Sep 2022 06:00:49 -0700 (PDT)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2819MuYM015367;
        Thu, 1 Sep 2022 08:59:33 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3japt62bgy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 01 Sep 2022 08:59:33 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 281CxWwS035901
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 1 Sep 2022 08:59:32 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Thu, 1 Sep 2022
 08:59:31 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Thu, 1 Sep 2022 08:59:31 -0400
Received: from IST-LT-39247.mshome.net ([10.158.19.28])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 281CxFxI012333;
        Thu, 1 Sep 2022 08:59:19 -0400
From:   Ibrahim Tilki <Ibrahim.Tilki@analog.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>
CC:     Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
        <linux-hwmon@vger.kernel.org>
Subject: [PATCH v5 0/4] hwmon: Add max31760 fan speed controller
Date:   Thu, 1 Sep 2022 15:59:02 +0300
Message-ID: <20220901125906.929-1-Ibrahim.Tilki@analog.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: D5HXpmQKEUtD_f1dDej9ximmCTvvTGim
X-Proofpoint-ORIG-GUID: D5HXpmQKEUtD_f1dDej9ximmCTvvTGim
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_08,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 mlxlogscore=866 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0
 lowpriorityscore=0 mlxscore=0 phishscore=0 impostorscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209010059
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

chages in v5:
  - add dt-bindings documentation
  - add maintainer

changes in v4:
  - use sysfs_emit instead of sprintf
  - use kstrtou8 for pwm
  - use closest match for pwm1_auto_point_temp_hyst

changes in v3:
  - add regmap cache
  - remove pwm1_auto_point[1-48]_{temp,temp_hyst} attributes
  - add pwm1_auto_point_temp_hyst attribute

changes in v2:
  - remove pulse_per_rev variable in tach_to_rpm
  - remove temperature max_hyst and crit_hyst
  - strict value checking for fan_enable and pwm_enable
  - do not clamp pwm value for Look-up table
  - add sysfs_attr_init call
  - add documentation

Ibrahim Tilki (4):
  drivers: hwmon: Add max31760 fan speed controller driver
  docs: hwmon: add max31760 documentation
  dt-bindings: hwmon: Add bindings for max31760
  MAINTAINERS: Add maintainer for hwmon/max31760

 .../bindings/hwmon/adi,max31760.yaml          |  44 ++
 Documentation/hwmon/max31760.rst              |  67 ++
 MAINTAINERS                                   |   9 +
 drivers/hwmon/Kconfig                         |  12 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/max31760.c                      | 594 ++++++++++++++++++
 6 files changed, 727 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/adi,max31760.yaml
 create mode 100644 Documentation/hwmon/max31760.rst
 create mode 100644 drivers/hwmon/max31760.c

-- 
2.36.1

