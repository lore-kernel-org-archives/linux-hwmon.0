Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76E6CC4338F
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Aug 2021 11:46:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54B4E60EB2
	for <linux-hwmon@archiver.kernel.org>; Wed, 11 Aug 2021 11:46:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237457AbhHKLql (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 11 Aug 2021 07:46:41 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:38964 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237399AbhHKLqk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 11 Aug 2021 07:46:40 -0400
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 17BBebju004144;
        Wed, 11 Aug 2021 07:46:02 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com with ESMTP id 3abjesmrm3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 11 Aug 2021 07:46:02 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 17BBk1bZ000427
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 11 Aug 2021 07:46:01 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.858.5;
 Wed, 11 Aug 2021 07:46:00 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.858.5;
 Wed, 11 Aug 2021 07:46:00 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.858.5 via Frontend
 Transport; Wed, 11 Aug 2021 07:46:00 -0400
Received: from nsa.sphairon.box ([10.44.3.58])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 17BBjwfN021634;
        Wed, 11 Aug 2021 07:45:59 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <linux-hwmon@vger.kernel.org>
CC:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Subject: [PATCH 0/3] AXI FAN new features and improvements
Date:   Wed, 11 Aug 2021 13:48:50 +0200
Message-ID: <20210811114853.159298-1-nuno.sa@analog.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-ORIG-GUID: AwIW5faPO4gT6dCORqDBMsX9stDRpNPi
X-Proofpoint-GUID: AwIW5faPO4gT6dCORqDBMsX9stDRpNPi
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-11_04:2021-08-11,2021-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1011
 mlxlogscore=495 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108110077
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This is the result of the RFC [1] previously sent. The main differences
from the RFC are:

* Dropped the tacho evaluation stuff as that will be done differently
(the core will just expose a minimum fan speed below which faults are
asserted).
* Converted half of the auto points to hysteresis points as suggested by
Guenter.

[1]: https://www.spinics.net/lists/linux-hwmon/msg12015.html

Nuno Sá (3):
  hwmon: axi-fan-control: make sure the clock is enabled
  hwmon: axi-fan-control: handle irqs in natural order
  hwmon: axi-fan-control: support temperature vs pwm points

 drivers/hwmon/axi-fan-control.c | 117 +++++++++++++++++++++++++++-----
 1 file changed, 101 insertions(+), 16 deletions(-)

-- 
2.32.0

