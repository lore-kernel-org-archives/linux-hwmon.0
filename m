Return-Path: <SRS0=7FvC=D5=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ECE5C4363A
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Oct 2020 07:08:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03421222E9
	for <linux-hwmon@archiver.kernel.org>; Thu, 22 Oct 2020 07:08:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Z4wVTtsP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505121AbgJVHIu (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 22 Oct 2020 03:08:50 -0400
Received: from aserp2130.oracle.com ([141.146.126.79]:59882 "EHLO
        aserp2130.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505120AbgJVHIu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Oct 2020 03:08:50 -0400
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
        by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09M6n0hG131210;
        Thu, 22 Oct 2020 07:08:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : mime-version : content-type; s=corp-2020-01-29;
 bh=8n5vlAtX37x347X0jG0ppw6eCz7rq6geXfy1ORIKtZQ=;
 b=Z4wVTtsPrxA3kyP9dp+vPMsKMbHRJm//LKbO0FWGOmhblTSVCGv81nwIRHlm5PCNGErm
 4IXR2OFEdaYIkwr5o9uYV+fD9wUhcyZVMoStQmIxkON4/nAvsuiG3G2xdE0vlR7qRBvZ
 m2Sn6km1dlgz1liwioP6qx2H7548sdvFe/q+RSyyQOCS6C71r+1D2xdSptc0kO20lWBg
 TPO0aG60DrvKPh+nGJRaPzoF/dYM8V5GHYko8QBFSBDlLomyUkc0ycLXQn94BrQwwumW
 OSJK773bz18KW7kKITv8GtmLVW45VbSIhJjtvDn2sT5891taBkjhGC6jWW7HV0UG9fCZ kA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by aserp2130.oracle.com with ESMTP id 347p4b4arh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 22 Oct 2020 07:08:33 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 09M6p22D100154;
        Thu, 22 Oct 2020 07:08:32 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 348ahyew2f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 22 Oct 2020 07:08:32 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 09M78UG6012245;
        Thu, 22 Oct 2020 07:08:30 GMT
Received: from mwanda (/41.57.98.10)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Thu, 22 Oct 2020 00:08:30 -0700
Date:   Thu, 22 Oct 2020 10:08:24 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Ugur Usug <Ugur.Usug@maximintegrated.com>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] hwmon: (pmbus/max20730) use scnprintf() instead of snprintf()
Message-ID: <20201022070824.GC2817762@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9781 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 bulkscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010220044
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9781 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 priorityscore=1501
 clxscore=1011 malwarescore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2010220044
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The snprintf() function returns the number of characters which would
have been printed if there were enough space, but the scnprintf()
returns the number of characters which were actually printed.  If the
buffer is not large enough, then using snprintf() would result in a
read overflow and an information leak.

Fixes: 8910c0bd533d ("hwmon: (pmbus/max20730) add device monitoring via debugfs")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hwmon/pmbus/max20730.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/pmbus/max20730.c b/drivers/hwmon/pmbus/max20730.c
index 57923d72490c..be83b98411c7 100644
--- a/drivers/hwmon/pmbus/max20730.c
+++ b/drivers/hwmon/pmbus/max20730.c
@@ -122,8 +122,8 @@ static ssize_t max20730_debugfs_read(struct file *file, char __user *buf,
 	switch (idx) {
 	case MAX20730_DEBUGFS_VOUT_MIN:
 		ret = VOLT_FROM_REG(data->mfr_voutmin * 10000);
-		len = snprintf(tbuf, DEBUG_FS_DATA_MAX, "%d.%d\n",
-			       ret / 10000, ret % 10000);
+		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX, "%d.%d\n",
+				ret / 10000, ret % 10000);
 		break;
 	case MAX20730_DEBUGFS_FREQUENCY:
 		val = (data->mfr_devset1 & MAX20730_MFR_DEVSET1_FSW_MASK)
@@ -141,7 +141,7 @@ static ssize_t max20730_debugfs_read(struct file *file, char __user *buf,
 			ret = 800;
 		else
 			ret = 900;
-		len = snprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
+		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
 		break;
 	case MAX20730_DEBUGFS_PG_DELAY:
 		val = (data->mfr_devset1 & MAX20730_MFR_DEVSET1_TSTAT_MASK)
@@ -223,7 +223,7 @@ static ssize_t max20730_debugfs_read(struct file *file, char __user *buf,
 	case MAX20730_DEBUGFS_OC_PROTECT_MODE:
 		ret = (data->mfr_devset2 & MAX20730_MFR_DEVSET2_OCPM_MASK)
 			>> MAX20730_MFR_DEVSET2_OCPM_BIT_POS;
-		len = snprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
+		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
 		break;
 	case MAX20730_DEBUGFS_SS_TIMING:
 		val = (data->mfr_devset2 & MAX20730_MFR_DEVSET2_SS_MASK)
@@ -241,32 +241,32 @@ static ssize_t max20730_debugfs_read(struct file *file, char __user *buf,
 	case MAX20730_DEBUGFS_IMAX:
 		ret = (data->mfr_devset2 & MAX20730_MFR_DEVSET2_IMAX_MASK)
 			>> MAX20730_MFR_DEVSET2_IMAX_BIT_POS;
-		len = snprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
+		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
 		break;
 	case MAX20730_DEBUGFS_OPERATION:
 		ret = i2c_smbus_read_byte_data(psu->client, PMBUS_OPERATION);
 		if (ret < 0)
 			return ret;
-		len = snprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
+		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
 		break;
 	case MAX20730_DEBUGFS_ON_OFF_CONFIG:
 		ret = i2c_smbus_read_byte_data(psu->client, PMBUS_ON_OFF_CONFIG);
 		if (ret < 0)
 			return ret;
-		len = snprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
+		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
 		break;
 	case MAX20730_DEBUGFS_SMBALERT_MASK:
 		ret = i2c_smbus_read_word_data(psu->client,
 					       PMBUS_SMB_ALERT_MASK);
 		if (ret < 0)
 			return ret;
-		len = snprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
+		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
 		break;
 	case MAX20730_DEBUGFS_VOUT_MODE:
 		ret = i2c_smbus_read_byte_data(psu->client, PMBUS_VOUT_MODE);
 		if (ret < 0)
 			return ret;
-		len = snprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
+		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX, "%d\n", ret);
 		break;
 	case MAX20730_DEBUGFS_VOUT_COMMAND:
 		ret = i2c_smbus_read_word_data(psu->client, PMBUS_VOUT_COMMAND);
@@ -274,8 +274,8 @@ static ssize_t max20730_debugfs_read(struct file *file, char __user *buf,
 			return ret;
 
 		ret = VOLT_FROM_REG(ret * 10000);
-		len = snprintf(tbuf, DEBUG_FS_DATA_MAX,
-			       "%d.%d\n", ret / 10000, ret % 10000);
+		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX,
+				"%d.%d\n", ret / 10000, ret % 10000);
 		break;
 	case MAX20730_DEBUGFS_VOUT_MAX:
 		ret = i2c_smbus_read_word_data(psu->client, PMBUS_VOUT_MAX);
@@ -283,8 +283,8 @@ static ssize_t max20730_debugfs_read(struct file *file, char __user *buf,
 			return ret;
 
 		ret = VOLT_FROM_REG(ret * 10000);
-		len = snprintf(tbuf, DEBUG_FS_DATA_MAX,
-			       "%d.%d\n", ret / 10000, ret % 10000);
+		len = scnprintf(tbuf, DEBUG_FS_DATA_MAX,
+				"%d.%d\n", ret / 10000, ret % 10000);
 		break;
 	default:
 		len = strlcpy(tbuf, "Invalid\n", DEBUG_FS_DATA_MAX);
-- 
2.28.0

