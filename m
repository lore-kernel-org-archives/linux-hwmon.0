Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 803D6C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed,  8 Jun 2022 01:18:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381883AbiFHBSY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 7 Jun 2022 21:18:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1840680AbiFHAFr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 7 Jun 2022 20:05:47 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C977328ED5
        for <linux-hwmon@vger.kernel.org>; Tue,  7 Jun 2022 13:54:52 -0700 (PDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 257KT1E5023323;
        Tue, 7 Jun 2022 20:54:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=qKvA+8XBhKmvodGb3aR75OBmpzgBoKaY8E+X5Bt7rmo=;
 b=L/3xtujBtcBVMIGYAbCsrOyOptBq8cSwKZveqOoI5UpGJJ+ey1iZGzLHCDnaXv1LBzEf
 N6XmmAoww0ifsKKThr+o+D7Q0gHbucLu6KNa9I/TnSRdVjlhCek/uoodpXjMs2645a/l
 fXpyl7ph+xKZlajxGBShTIqKbPTuyPsLz7+EySi4Oxz/eLJME/BKAfd09GFOBcbIDsVH
 VyRAl0Xh0lwPvmYjDe+xC5AWpLxKJbhmdrsfjmHDUnvy0MEXUSoLA5kUccTZr2xvWYoB
 zEl/F3bPIt4yGuSAfpaFfXyQB1w8VHDml5gMSGCmjRRRse0EGNzhkVKoVPS8OFGgaCb0 lA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gjdrhrc4v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 07 Jun 2022 20:54:09 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
        by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 257KqI85016221;
        Tue, 7 Jun 2022 20:54:08 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
        by ppma03wdc.us.ibm.com with ESMTP id 3gfy19ps74-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 07 Jun 2022 20:54:08 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
        by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 257Ks71h20251020
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 7 Jun 2022 20:54:07 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id B654CC6059;
        Tue,  7 Jun 2022 20:54:07 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id AA9C7C6063;
        Tue,  7 Jun 2022 20:54:07 +0000 (GMT)
Received: from gfwr529.rchland.ibm.com (unknown [9.10.239.129])
        by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
        Tue,  7 Jun 2022 20:54:07 +0000 (GMT)
Received: by gfwr529.rchland.ibm.com (Postfix, from userid 527496)
        id 7324812021E; Tue,  7 Jun 2022 15:54:07 -0500 (CDT)
From:   Jim Wright <wrightj@linux.ibm.com>
To:     linux@roeck-us.net, linux-hwmon@vger.kernel.org, joel@jms.id.au,
        openbmc@lists.ozlabs.org
Cc:     Jim Wright <wrightj@linux.ibm.com>
Subject: [PATCH] hwmon: (ucd9000) Add voltage monitor types
Date:   Tue,  7 Jun 2022 15:53:06 -0500
Message-Id: <20220607205306.145636-1-wrightj@linux.ibm.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aqVZXY6k2ChB7uBtk8mlQLdrUMTZmYOx
X-Proofpoint-ORIG-GUID: aqVZXY6k2ChB7uBtk8mlQLdrUMTZmYOx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-07_09,2022-06-07_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 impostorscore=0 clxscore=1011 malwarescore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206070085
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The UCD90240 and UCD90320 devices support monitor types "Input Voltage",
"Voltage With AVS", and "Input Voltage With AVS", add support to driver
to recognize these types as voltage monitors.

Signed-off-by: Jim Wright <wrightj@linux.ibm.com>
---
 drivers/hwmon/pmbus/ucd9000.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/hwmon/pmbus/ucd9000.c b/drivers/hwmon/pmbus/ucd9000.c
index 75fc770c9e40..28cc214d4d6b 100644
--- a/drivers/hwmon/pmbus/ucd9000.c
+++ b/drivers/hwmon/pmbus/ucd9000.c
@@ -45,6 +45,9 @@ enum chips { ucd9000, ucd90120, ucd90124, ucd90160, ucd90320, ucd9090,
 #define UCD9000_MON_TEMPERATURE	2
 #define UCD9000_MON_CURRENT	3
 #define UCD9000_MON_VOLTAGE_HW	4
+#define UCD9000_MON_INPUT_VOLTAGE	5
+#define UCD9000_MON_VOLTAGE_AVS	6
+#define UCD9000_MON_INPUT_VOLTAGE_AVS	7
 
 #define UCD9000_NUM_FAN		4
 
@@ -566,6 +569,9 @@ static int ucd9000_probe(struct i2c_client *client)
 		switch (UCD9000_MON_TYPE(block_buffer[i])) {
 		case UCD9000_MON_VOLTAGE:
 		case UCD9000_MON_VOLTAGE_HW:
+		case UCD9000_MON_INPUT_VOLTAGE:
+		case UCD9000_MON_VOLTAGE_AVS:
+		case UCD9000_MON_INPUT_VOLTAGE_AVS:
 			info->func[page] |= PMBUS_HAVE_VOUT
 			  | PMBUS_HAVE_STATUS_VOUT;
 			break;
-- 
2.32.0

