Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16801C07E96
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Jul 2021 11:59:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB7AE6146B
	for <linux-hwmon@archiver.kernel.org>; Thu,  8 Jul 2021 11:59:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231928AbhGHMC1 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 8 Jul 2021 08:02:27 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:6988 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231472AbhGHMC1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 8 Jul 2021 08:02:27 -0400
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 168BtqDD007919;
        Thu, 8 Jul 2021 07:58:31 -0400
Received: from nwd2mta3.analog.com ([137.71.173.56])
        by mx0a-00128a01.pphosted.com with ESMTP id 39nub31aw5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 08 Jul 2021 07:58:30 -0400
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
        by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 168BwT89042529
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 8 Jul 2021 07:58:29 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.858.5; Thu, 8 Jul 2021
 07:58:28 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.858.5 via Frontend
 Transport; Thu, 8 Jul 2021 07:58:28 -0400
Received: from nsa.ad.analog.com ([10.44.3.58])
        by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 168BwPtn020146;
        Thu, 8 Jul 2021 07:58:25 -0400
From:   =?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>
To:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>
CC:     Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Subject: [RFC PATCH 0/6] AXI FAN new features and improvements
Date:   Thu, 8 Jul 2021 14:01:05 +0200
Message-ID: <20210708120111.519444-1-nuno.sa@analog.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: IPi07hQf3AZuYEI9cMgLdjmp_wUqlYEh
X-Proofpoint-ORIG-GUID: IPi07hQf3AZuYEI9cMgLdjmp_wUqlYEh
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-08_06:2021-07-08,2021-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 spamscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 mlxscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107080067
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This series adds some new features to the axi-fan-control driver. On top
of that, the HW had some changes (basically it now starts automatically
out of reset) so that the driver needed some minor refactoring. The
reason I'm sending this as RFC, is mainly because of the last patch
("hwmon: axi-fan-control: support temperature vs pwm points"). The core
has some predefined values which define a temperature vs pwm curve [1].
It also exposes registers so that users can change it according to their
needs. As I could not find standard attributes in the subsystem, I'm
proposing some "raw" sysfs files. Looking at [2], the pwm_auto_point
stuff looked to be what I want. Obviously I might be wrong :). If this
is accepted, I will add a proper sysfs DOC file describing the new files
(being lazy in the RFC).

For patch 5 ("hwmon: axi-fan-control: clear the fan fault irq at startup"),
it's also arguable if we really need it. The main reason I have it is
because of some userland apps that might take some drastic measures by
just reading 1 fan_fault alarm. Obviously, we can argue that the problem
is in the app and not in the driver. Though it's such a minimal change
that I decided to include it (I'm more than fine in dropping the patch).

[1]: https://wiki.analog.com/resources/fpga/docs/axi_fan_control
[2]: https://www.kernel.org/doc/Documentation/hwmon/sysfs-interface

Nuno Sá (6):
  hwmon: axi-fan-control: make sure the clock is enabled
  hwmon: axi-fan-control: add tacho devicetree properties
  dt-bindings: axi-fan-control: add tacho properties
  hwmon: axi-fan-control: handle irqs in natural order
  hwmon: axi-fan-control: clear the fan fault irq at startup
  hwmon: axi-fan-control: support temperature vs pwm points

 .../bindings/hwmon/adi,axi-fan-control.yaml   |  12 ++
 drivers/hwmon/axi-fan-control.c               | 160 ++++++++++++++++--
 2 files changed, 156 insertions(+), 16 deletions(-)

-- 
2.32.0

