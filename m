Return-Path: <SRS0=ZzD2=R7=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FFEFC43381
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 Mar 2019 13:11:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 046D621773
	for <linux-hwmon@archiver.kernel.org>; Thu, 28 Mar 2019 13:11:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbfC1NK7 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 28 Mar 2019 09:10:59 -0400
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:56788 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726196AbfC1NK7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 28 Mar 2019 09:10:59 -0400
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x2SD8k67018615;
        Thu, 28 Mar 2019 08:09:39 -0500
Authentication-Results: ppops.net;
        spf=none smtp.mailfrom=ckeepax@opensource.cirrus.com
Received: from mail4.cirrus.com ([87.246.98.35])
        by mx0b-001ae601.pphosted.com with ESMTP id 2rdh7k29bp-1;
        Thu, 28 Mar 2019 08:09:39 -0500
Received: from EX17.ad.cirrus.com (unknown [172.20.9.81])
        by mail4.cirrus.com (Postfix) with ESMTP id 74064611C8B2;
        Thu, 28 Mar 2019 08:10:50 -0500 (CDT)
Received: from imbe.wolfsonmicro.main (198.61.95.81) by EX17.ad.cirrus.com
 (172.20.9.81) with Microsoft SMTP Server id 14.3.408.0; Thu, 28 Mar 2019
 13:09:38 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
        by imbe.wolfsonmicro.main (8.14.4/8.14.4) with ESMTP id x2SD9b32022330; Thu,
 28 Mar 2019 13:09:37 GMT
From:   Charles Keepax <ckeepax@opensource.cirrus.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>
CC:     <linux-hwmon@vger.kernel.org>, <corbet@lwn.net>,
        <devicetree@vger.kernel.org>, <patches@opensource.cirrus.com>
Subject: [PATCH v4 1/2] hwmon: lochnagar: Add device tree binding document
Date:   Thu, 28 Mar 2019 13:09:36 +0000
Message-ID: <20190328130937.3756-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1903280092
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Lochnagar is an evaluation and development board for Cirrus
Logic Smart CODEC and Amp devices. It allows the connection of
most Cirrus Logic devices on mini-cards, as well as allowing
connection of various application processor systems to provide a
full evaluation platform. This driver supports the board
controller chip on the Lochnagar board.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

No changes since v3.

Thanks,
Charles

 .../devicetree/bindings/hwmon/cirrus,lochnagar.txt | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/cirrus,lochnagar.txt

diff --git a/Documentation/devicetree/bindings/hwmon/cirrus,lochnagar.txt b/Documentation/devicetree/bindings/hwmon/cirrus,lochnagar.txt
new file mode 100644
index 0000000000000..ffb79ccf51ee3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/cirrus,lochnagar.txt
@@ -0,0 +1,26 @@
+Cirrus Logic Lochnagar Audio Development Board
+
+Lochnagar is an evaluation and development board for Cirrus Logic
+Smart CODEC and Amp devices. It allows the connection of most Cirrus
+Logic devices on mini-cards, as well as allowing connection of
+various application processor systems to provide a full evaluation
+platform.  Audio system topology, clocking and power can all be
+controlled through the Lochnagar, allowing the device under test
+to be used in a variety of possible use cases.
+
+This binding document describes the binding for the hardware monitor
+portion of the driver.
+
+This binding must be part of the Lochnagar MFD binding:
+  [4] ../mfd/cirrus,lochnagar.txt
+
+Required properties:
+
+  - compatible : One of the following strings:
+                 "cirrus,lochnagar2-hwmon"
+
+Example:
+
+lochnagar-hwmon {
+	compatible = "cirrus,lochnagar2-hwmon";
+};
-- 
2.11.0

