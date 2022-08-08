Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A53C00140
	for <linux-hwmon@archiver.kernel.org>; Mon,  8 Aug 2022 08:10:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234640AbiHHIKK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 8 Aug 2022 04:10:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234589AbiHHIKJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 8 Aug 2022 04:10:09 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F2E8643E
        for <linux-hwmon@vger.kernel.org>; Mon,  8 Aug 2022 01:10:08 -0700 (PDT)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2787Ya3P028423;
        Mon, 8 Aug 2022 04:09:53 -0400
Received: from nwd2mta4.analog.com ([137.71.173.58])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3hsn77301p-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 08 Aug 2022 04:09:52 -0400
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
        by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 27889pMK064961
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 8 Aug 2022 04:09:51 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.14; Mon, 8 Aug 2022
 04:09:50 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.986.14 via Frontend
 Transport; Mon, 8 Aug 2022 04:09:50 -0400
Received: from euswvd-wpr-708.reddog.microsoft.com ([10.140.226.204])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 27889fqU014843;
        Mon, 8 Aug 2022 04:09:43 -0400
From:   Ibrahim Tilki <Ibrahim.Tilki@analog.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>
CC:     Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
        <linux-hwmon@vger.kernel.org>
Subject: [PATCH v3 0/2] hwmon: Add max31760 fan speed controller
Date:   Mon, 8 Aug 2022 08:09:29 +0000
Message-ID: <20220808080931.104-1-Ibrahim.Tilki@analog.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: bft-Dr0bDRDTJ_vAQTQZbFRq3xUKDYgZ
X-Proofpoint-GUID: bft-Dr0bDRDTJ_vAQTQZbFRq3xUKDYgZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-08_05,2022-08-05_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 mlxscore=0
 mlxlogscore=755 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208080041
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

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

Ibrahim Tilki (2):
  drivers: hwmon: Add max31760 fan speed controller driver
  docs: hwmon: add max31760 documentation

 Documentation/hwmon/max31760.rst |  65 ++++
 drivers/hwmon/Kconfig            |  10 +
 drivers/hwmon/Makefile           |   1 +
 drivers/hwmon/max31760.c         | 599 +++++++++++++++++++++++++++++++
 4 files changed, 675 insertions(+)
 create mode 100644 Documentation/hwmon/max31760.rst
 create mode 100644 drivers/hwmon/max31760.c

-- 
2.36.1

