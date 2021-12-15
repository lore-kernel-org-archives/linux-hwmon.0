Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F9AC433F5
	for <linux-hwmon@archiver.kernel.org>; Wed, 15 Dec 2021 11:41:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234041AbhLOLlU (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 15 Dec 2021 06:41:20 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:22500 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230037AbhLOLlU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 15 Dec 2021 06:41:20 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFBStlg005935;
        Wed, 15 Dec 2021 11:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=cFXM/APk1ZRStFhrKMFS3cSoXSYRtpgs9arfrZpPuTc=;
 b=gFPnbFRSLzodGSdewrElShim+TcrgdVebyvNGIoUj1JTplaRBsjwYZRz6jPeUO/JIFKz
 9KpHUBCQUKLzBTuypJ5GdkKtIijej9eQty+NsmDvMzYwpzSkSttbQyRramqN2UbZOyMg
 1lmussHET1GN5VETPnhST0X5BK3HK83D48Np8vpqwCANhcMWWOCry1ofxbxatPOCM611
 RdGM/vUe8QRFYJAQilUGTnA+lJW3+xY3mooYyNvRpOOsG7IUqGrnQTYBDmArEJJU7wrt
 eGrSZR9bHkVIWvtmPu/GzojxJqS7l7+09JY1JereUscJU9nblAXye3+gyN6f84v73gsp WA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3cx56u67pf-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 Dec 2021 11:41:04 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFBeMhu169378;
        Wed, 15 Dec 2021 11:41:02 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
        by userp3030.oracle.com with ESMTP id 3cvh401xnh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 15 Dec 2021 11:41:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WB4CyKq8vTqX4KAW/SdZOTJZe4SLyA9V4OJgYdysgCIsVen05ZfXqXIoa3SLWR8tHrcL8Sf75c8RgGFOd/E9+CAlDkl3TyjYRTbrS8k0cV+ihnpBORCvlx10/zSSOrgpAEhapgRl/qJ+tsnkFg1j1iuDdb7CGMte0foqko5onPJHEMEz+kJgd64Xr6m/YvApWiKS7B2/jI3Dv8EKGqVpbYnHogCkFp66WO4rGNtH4C3BecSe83ALylU34e5MYvavwJz9muP5eGUw5gXjUAASS/gjwrTH6kImqPFMW6AwjQZ1DVNVXFz64hxR/hA6dzwvp4uepQzL2OQuvJkfX8gUfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cFXM/APk1ZRStFhrKMFS3cSoXSYRtpgs9arfrZpPuTc=;
 b=bpExkQOgYs+syXZ9NZEZ98kBSWuW580cCr4RzTukeSTqEFl379IGl4tawHWRNDWCx9FyykHdzkydYAXtvuqCJhRtI4UH5N0gEOW9EGa6fiQZnT/IXS3wvFowSJ5DFKsAVSgSnWY0UBBOjpBclWq+NOVKSj/mKVV/22kIgrvR/GwjnKSEhcisYw1t7J19zVGdDozjf67xKxIfDpA3LecB+bJkVdJEBa8SiLSU7ooT6WOeG6H8IPWXkiisIAdLzMYakNbYTA+JEiPX6qUqmZeOtIkptfrRCvd17Nb0TwxBSJRTL/uQS9OB9CuBqFyZWZuZn++zwaujgghJE6JEb4yMqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cFXM/APk1ZRStFhrKMFS3cSoXSYRtpgs9arfrZpPuTc=;
 b=BRWR0m89Oizr5vY79WgJVzHcFfcv9TAB1lybLPL/k04f8KLvopwtKZtQ6bTaRH+3tK+vJT/CwbG9VbhV553NdJVyvrhWAx9fMmmvSkvyobUAhtWg5S9L4Np6+uirE5ld/NxKs+MgwKjLGowEwrakELUFHLf8F9Q/7t6sKjWPYbk=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2366.namprd10.prod.outlook.com
 (2603:10b6:301:33::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Wed, 15 Dec
 2021 11:41:00 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4801.014; Wed, 15 Dec 2021
 11:41:00 +0000
Date:   Wed, 15 Dec 2021 14:40:50 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] hwmon: (nct6775) delete some new lines
Message-ID: <20211215114050.GB14967@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: AM6P194CA0072.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:84::49) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 303e9670-80a7-40b2-de8e-08d9bfbfc41f
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2366:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2366F92A3589DBE4B68E50B88E769@MWHPR1001MB2366.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1079;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xLucfnxA6f6MDzQx/aaUDxp14hj7JFFDMOScWIbQwo7zigbiKsxRzVjEcDaXdwmxdqjZmE1a+ThYeunJ0ErGXr+VP7kl2zX8n5wnN86GF6b0Zspmi2CW4rqFYuh9mZePFdkHWV8qwrCSL+sHyxpRfj6QfLJvuOcN3RqjE/YAa2oINEECvMjpsLzqapTtaSzgPnkp9Lr8CYYJn8fD71jc8tmQaACmXNQ5yM569ELlKkk+BEXuXddnzFsn14RK3ys6V1+m9qnIECxuYbNxL4yYfME8wQhe5aLtVmToUfdCF++g7okjYfa8s0eVu5JSv2EE/TMcV7ZTp0AJ7cOccqMP7+uCG70Mu4/JglTBzJBfiPXdwNgnwqmITp6MkTg1wo3vleQRJ+xpnm0A2UEPx/Yj39tGC3nINLC7lImVAdl7HVAjWeV9wMq3Ccd3dOe9zz863Bo4zNzTuq1lSxMZiRwAam4TL/WCA8SczB8lGnBqiCWXQOAcjBZmgxbD3QpO2tsOv0MStNulTFwqnhSlEUovaQAWN4j7E+Dl42qQOzcrRy4u7oOnTyxkEHmQzQchyVfGdtmGMsOp8oX9vCHYYMsh/LBLjRM3SbTsmbBAS94IrE++WCP/ZBQZAh63jnx1eNSaWbeycBP1INzg/uxRDRKcUTWEi8eAvefCVXwRDKmQOs3omc3t3aaidXyrR8OUMwgot+X0si95xCLDM5L6iyl0zw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(66556008)(66476007)(66946007)(1076003)(8936002)(2906002)(6916009)(508600001)(5660300002)(33656002)(4744005)(83380400001)(316002)(38350700002)(38100700002)(86362001)(6506007)(9686003)(33716001)(44832011)(8676002)(6512007)(6486002)(186003)(52116002)(6666004)(26005)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vEL6VbHg/+3QOMIZnbUFkAjSzvK/9uVlxpAmkjIlaehiLK/MU5bQGAREmgW+?=
 =?us-ascii?Q?dA3VduEkUzZaas3ZmJ5BcRhre+Iy9JBC5d3PQSF3uyzuHZPfUYRF8a6hbNJN?=
 =?us-ascii?Q?c/WhDfh315dsWbyChe53/Jj7/Ohebw+PnB8/9iggqFRTZ4p4nrllal3GgnSh?=
 =?us-ascii?Q?WVjG/vAlYMgjyqVwDMctQFAgd2uX/o9vkvknJGB9LdgFl7d0+W1Fs+ZtzA9q?=
 =?us-ascii?Q?6ZiQ4KdGJR6ST2ThxYicSc/eQTnjHYlDawdDu2Bt/yG83q8a0qIEqyIrLd3a?=
 =?us-ascii?Q?C0VW0LFBSJSzNKyHEDFwoFGioMlSQfGdJeHNSkjryJXWPwMO/mRLGXvex8dk?=
 =?us-ascii?Q?L/jb/sdkF3Bp3aifWTfUa8JG0Ky3XDxJVIEWYQrGX3OmqVkxw94sq6cLW8xn?=
 =?us-ascii?Q?k+yxK2gW+1gooD53mh35oLz9T9lJ3+RxZMudbma+I1Zz7+HGla3544oY08T7?=
 =?us-ascii?Q?w42Z/rVAQGA6Phf5EpQiTihcGXMTNtptWMBLmnWx6fSpTfArXRb/JForELX2?=
 =?us-ascii?Q?UxuscAPc/pICogedmYYhX63ZjylDceVAALwKIc5sxGWrA9OMqtCo/ADHshZI?=
 =?us-ascii?Q?6jQavqwgmuHQChmNmXvF9hlzjQvaLjVAJLb816Zi3yXNNsgjttpNQ2JrYILW?=
 =?us-ascii?Q?STzEerSUOBkn6sbgWt+6ji8fuMZTVhmw6EH09BD9j1jkFv1Ref0OFsKUB1NJ?=
 =?us-ascii?Q?tBtsgNLCOc7kMubFSCHRvcrN021F6NlvAiOIXAvXN40czEPfkqGMvYl3EghZ?=
 =?us-ascii?Q?nYDczQ9LkcrluY1a3rL5gGCedbJTQ/X+NWqGejViks+P+tSWGszEwafL+cv1?=
 =?us-ascii?Q?+QNIGl4U5Rp37gPGCVBKan5MYE7uav5twN3zpUl9QgAv/T8UWnsntoeuNCXJ?=
 =?us-ascii?Q?VRzHVvXPR7tzfO1W8oj19VxBq9DqGS4lA21RgYmCvgYD6uDTFfSjOmHnUjAZ?=
 =?us-ascii?Q?IHJtZsENMDRMUfhpTLn3qnfWVZQ9GTuYHwyx19wQ/8p020axlU8vwlr1I6ug?=
 =?us-ascii?Q?A0ndoOkuEr/EaKF6NpgXmyIg+g7YNqdqch4nsYd+3jEChmz1Z3q5zFDMrPNj?=
 =?us-ascii?Q?LrCiZ3NXFWEVCXA8TiVL5gRIORikte1mXUbjwNeOLTigP0bZM2CwI24TXB4J?=
 =?us-ascii?Q?kk7Fzh5E5YDx596TU0iW2Gdnxlkz/fzztqEELMlZkO4Qb3tQ5l0rm2aktg9y?=
 =?us-ascii?Q?av22z18d4sPVlT+sRK3evQfBwO1zlmV700AAmk8pMV/eQfkHMVReu1HkiabA?=
 =?us-ascii?Q?Nzqm00G4yTfa5ZE9IYUj+E5sN9M39iHjh/+urGesl9f9s0E+nDYnEL3Zq/Ae?=
 =?us-ascii?Q?tNVUht1twmHqwNrtmJ/ks1v34UD1AKtcAMUHrzRxAAf8Yh7ctLQvQfKQTVfv?=
 =?us-ascii?Q?v0/UQ8ctJf/Ffue7HKu9naL2/K/IQAOLeP9dYCA9trZf6J9jYAewaDj1EH+F?=
 =?us-ascii?Q?3tjpsMLDZ3nygA6UelizSAfL+PETNFMQpYoYw1kPrWeMuRGzlqivcC2HcErI?=
 =?us-ascii?Q?KYS5cwLzNWOIA9LERH7Qteh4pMQ+z4gshjhuXCWdlxFNERA2NLLdyX95zsL/?=
 =?us-ascii?Q?ncCv+VCfCVqepBcKX4xDd3N8bbbq2LZxnZXLX57reAn3ai1P/qImQ94fZsRX?=
 =?us-ascii?Q?p6LvL37d4wPds/KVA/HRcDAytvgeJvzj8funJ8cbwXN4BMj8Kjae15mrPwSP?=
 =?us-ascii?Q?nLe9sNsDQTYkHG/hk9GYdnvCljQ=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 303e9670-80a7-40b2-de8e-08d9bfbfc41f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 11:41:00.2395
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +BiffecmId7mf1Q6DSXbGNmsCaYWRcGlMErv57UJ5pxUSyjnK0CStdDLib/0zhq4laxg1YZjVkUcTOmJSO4j3DgWgGDhgMFkVCe73mmO5uo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2366
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112150065
X-Proofpoint-ORIG-GUID: ZjFlGVeG-R-WOlsHmkilFrobocGLM8Pp
X-Proofpoint-GUID: ZjFlGVeG-R-WOlsHmkilFrobocGLM8Pp
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

This code can fit on one line.  No need to break it up.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hwmon/nct6775.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/hwmon/nct6775.c b/drivers/hwmon/nct6775.c
index 57ce8633a725..2c5057fa3b71 100644
--- a/drivers/hwmon/nct6775.c
+++ b/drivers/hwmon/nct6775.c
@@ -3154,10 +3154,8 @@ store_speed_tolerance(struct device *dev, struct device_attribute *attr,
 	if (err < 0)
 		return err;
 
-	high = fan_from_reg16(data->target_speed[nr],
-			      data->fan_div[nr]) + val;
-	low = fan_from_reg16(data->target_speed[nr],
-			     data->fan_div[nr]) - val;
+	high = fan_from_reg16(data->target_speed[nr], data->fan_div[nr]) + val;
+	low = fan_from_reg16(data->target_speed[nr], data->fan_div[nr]) - val;
 	if (low <= 0)
 		low = 1;
 	if (high < low)
-- 
2.20.1

