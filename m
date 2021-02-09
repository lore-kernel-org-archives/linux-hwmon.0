Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B225C433DB
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Feb 2021 17:14:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE5DF64EC0
	for <linux-hwmon@archiver.kernel.org>; Tue,  9 Feb 2021 17:14:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232953AbhBIROR (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 9 Feb 2021 12:14:17 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:12858 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232997AbhBIROO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 9 Feb 2021 12:14:14 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 119HAYUP005892;
        Tue, 9 Feb 2021 12:13:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/XjKWzsQqfbJl8PcN+aOqqErUWenqwF3OxLK8RJuQ0g=;
 b=ST6hg3boLxMXyP+ealQ+Zu+3dgkuTkcr5X3zShHqwrOMhT2VbP9hCY9VAHpnFRPdINkW
 hR9bbMLkzwvU3DirI7V3lR9ARfUI77XeItZg6/gFsSazrCrux+PLOrO5aZDOkIdXZZLI
 njrOyu0pC7hgdkW1nbodHJsNHcJkpXaja70lxSE8w+HCVbAxFG0rux9USlObM7ca2M6X
 r24wLC3CdkxOBXSYuXsS3wmuvwpSS0WSaFTemxJqIJWnnSM3+e2GoSPgWOZDHkgir//s
 imSMjtyI3STqvUPXAii+o0zruV/sjKSXcVoPF5UrjhK4EKTdLXuieHNwBdZBbYv2htx/ qQ== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
        by mx0a-001b2d01.pphosted.com with ESMTP id 36kw5vba6t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 Feb 2021 12:13:04 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
        by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 119GwJGI001461;
        Tue, 9 Feb 2021 17:12:58 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
        by ppma02dal.us.ibm.com with ESMTP id 36hjr9x34d-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 09 Feb 2021 17:12:58 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com [9.57.199.110])
        by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 119HCv7O35914082
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 9 Feb 2021 17:12:57 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6EB6AAE062;
        Tue,  9 Feb 2021 17:12:57 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4FF3EAE05C;
        Tue,  9 Feb 2021 17:12:56 +0000 (GMT)
Received: from v0005c16.aus.stglabs.ibm.com (unknown [9.163.58.95])
        by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
        Tue,  9 Feb 2021 17:12:56 +0000 (GMT)
From:   Eddie James <eajames@linux.ibm.com>
To:     linux-hwmon@vger.kernel.org
Cc:     linux-fsi@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        jk@ozlabs.org, joel@jms.id.au, alistair@popple.id.au,
        jdelvare@suse.com, linux@roeck-us.net,
        Eddie James <eajames@linux.ibm.com>
Subject: [PATCH 2/4] fsi: occ: Log error for checksum failure
Date:   Tue,  9 Feb 2021 11:12:33 -0600
Message-Id: <20210209171235.20624-3-eajames@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210209171235.20624-1-eajames@linux.ibm.com>
References: <20210209171235.20624-1-eajames@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.737
 definitions=2021-02-09_05:2021-02-09,2021-02-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 phishscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102090083
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Log an error if the response checksum doesn't match the
calculated checksum.

Signed-off-by: Eddie James <eajames@linux.ibm.com>
---
 drivers/fsi/fsi-occ.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/fsi/fsi-occ.c b/drivers/fsi/fsi-occ.c
index cb05b6dacc9d..524460995465 100644
--- a/drivers/fsi/fsi-occ.c
+++ b/drivers/fsi/fsi-occ.c
@@ -223,7 +223,8 @@ static const struct file_operations occ_fops = {
 	.release = occ_release,
 };
 
-static int occ_verify_checksum(struct occ_response *resp, u16 data_length)
+static int occ_verify_checksum(struct occ *occ, struct occ_response *resp,
+			       u16 data_length)
 {
 	/* Fetch the two bytes after the data for the checksum. */
 	u16 checksum_resp = get_unaligned_be16(&resp->data[data_length]);
@@ -238,8 +239,11 @@ static int occ_verify_checksum(struct occ_response *resp, u16 data_length)
 	for (i = 0; i < data_length; ++i)
 		checksum += resp->data[i];
 
-	if (checksum != checksum_resp)
+	if (checksum != checksum_resp) {
+		dev_err(occ->dev, "Bad checksum: %04x!=%04x\n", checksum,
+			checksum_resp);
 		return -EBADMSG;
+	}
 
 	return 0;
 }
@@ -533,7 +537,7 @@ int fsi_occ_submit(struct device *dev, const void *request, size_t req_len,
 	}
 
 	*resp_len = resp_data_length + 7;
-	rc = occ_verify_checksum(resp, resp_data_length);
+	rc = occ_verify_checksum(occ, resp, resp_data_length);
 
  done:
 	mutex_unlock(&occ->occ_lock);
-- 
2.27.0

