Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BECBC433EF
	for <linux-hwmon@archiver.kernel.org>; Mon,  6 Jun 2022 18:55:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbiFFSzP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 6 Jun 2022 14:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231546AbiFFSzO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Jun 2022 14:55:14 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B6A32E4CB1
        for <linux-hwmon@vger.kernel.org>; Mon,  6 Jun 2022 11:55:13 -0700 (PDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 256ILRFa026462;
        Mon, 6 Jun 2022 18:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=m10ox5ajJMnNFo36NZzIOGYMMsBrRrpTZ2oTsWEuCOg=;
 b=YttzTHcSAIkVbWWge7K6AMvCdhBCYl3SRYgTTrXiTF/hjDh4PImVZ/fD7EMktL26jQMv
 jzFYL6TS1UjO/wKAyrHueYGDiQ16BalpMAxRxcwyAM7IgF+HKSyiAGQLmsxEeAznd+n8
 juVn8bkCx9i2m5GiZ0XOR+liKARaBkvVdLayYWsn8WQW3c/q7/guu+lYUWFjwWeM6B8c
 znPP9ghaXwvaZZEOK5ynW4HSgcgswV4usBlsyCFYbhLrUhik31GaBwFa0qpY6SZ46tMB
 sEmRbErV9eIWT/4FqN9BKUv2SHW9Dt9F20gTwzPLNdRERuYw1JNwqG4bKVDniZ+9NcZ+ SA== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ghpserk2j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 06 Jun 2022 18:55:01 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
        by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 256IoZ3F016732;
        Mon, 6 Jun 2022 18:55:00 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
        by ppma01dal.us.ibm.com with ESMTP id 3gfy19u8rr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 06 Jun 2022 18:55:00 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
        by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 256IsxS632964944
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 6 Jun 2022 18:54:59 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 7C72EAC05B;
        Mon,  6 Jun 2022 18:54:59 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 1EEF2AC059;
        Mon,  6 Jun 2022 18:54:59 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.160.184.8])
        by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
        Mon,  6 Jun 2022 18:54:59 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux@roeck-us.net, Eddie James <eajames@linux.ibm.com>
Subject: [PATCH] hwmon: (occ) Lock mutex in shutdown to prevent race with occ_active
Date:   Mon,  6 Jun 2022 13:54:55 -0500
Message-Id: <20220606185455.21126-1-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fIKW0z0nPcE9u-SRvjMbFOzgbjqgLDQv
X-Proofpoint-ORIG-GUID: fIKW0z0nPcE9u-SRvjMbFOzgbjqgLDQv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-06_05,2022-06-03_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206060076
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Unbinding the driver or removing the parent device at the same time
as using the OCC active sysfs file can cause the driver to unregister
the hwmon device twice. Prevent this by locking the occ mutex in the
shutdown function.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/hwmon/occ/common.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index d78f4bebc718..ea070b91e5b9 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -1228,10 +1228,15 @@ EXPORT_SYMBOL_GPL(occ_setup);
 
 void occ_shutdown(struct occ *occ)
 {
+	mutex_lock(&occ->lock);
+
 	occ_shutdown_sysfs(occ);
 
 	if (occ->hwmon)
 		hwmon_device_unregister(occ->hwmon);
+	occ->hwmon = NULL;
+
+	mutex_unlock(&occ->lock);
 }
 EXPORT_SYMBOL_GPL(occ_shutdown);
 
-- 
2.31.1

