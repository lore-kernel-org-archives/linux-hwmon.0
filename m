Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9189BC433F5
	for <linux-hwmon@archiver.kernel.org>; Sat,  5 Feb 2022 09:20:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236403AbiBEJUt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 5 Feb 2022 04:20:49 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:13520 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230226AbiBEJUs (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 5 Feb 2022 04:20:48 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2158hlxL027523;
        Sat, 5 Feb 2022 09:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=gcyHw5v0QRRgpd1dOrEbimOl7aAofG6e+hi7uFvMpXI=;
 b=dhZNgHnCUClvs5KylZEvdtVqInlj1dGSFyiJ8MMmHFeUtyFg3uSVKdlCD6JSBt4cbNhp
 LnQMSgaB8bG7o4AbmJlLcK0Dm8Pxd5cwYXUNRkQHqrF8FMorD7o9mHLbGGWPF0f6T+A1
 siCFioZtrRT4R12uqkSRLOxzT/AaAqD1NzQehqp3283yFAKxgYLLiASA+lSam6fynJDN
 lAm//8za9QDZhUZhY9hf70OtsHQwbAfwh/Z0GCFzT3Ibd6vKXnFNhbF1MS0NVhbjhfBH
 va7uItk7zpLD3pwB+c/VLdUnt70WAigOhqebOxkiMOdDvI/HNP3DHbw7w8ir0OntpUPY Hw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by mx0b-00069f02.pphosted.com with ESMTP id 3e1h4b0hp0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 05 Feb 2022 09:20:32 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 2159Bb8R185401;
        Sat, 5 Feb 2022 09:20:31 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
        by userp3030.oracle.com with ESMTP id 3e1ebtmpba-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 05 Feb 2022 09:20:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RCmN/RYxtKgEL0/bh+pMW8Xy0Q3IA+cQ7ch/avt/oIp7ohsoo2sb8TxDn1vKHRK3Q3BM529X7JSYCBrSe9ArqwTO6gBMZYwUPFHWA1rQXhYfdhlX4KLPjszs0/xEMN5L1+sopCJkYwzxLh2iBZDS4d8tAR9JdGka/8SQebN50i0RAChFF0RVFjbEM62XRnYH7q+vaFlNaxYg1yF0zEHv/f6qmTQT3EHO7i0RJopTR55DQtDXgMQ+xZqCZi3ijPVv1iOyFv4fq4eAZU/yrHnf5EKZNzSddZDJSYDssPhAKXAlyDRrQuNYhnfXLBCZLbpV539sXDPVliV7eGWEsT6weA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gcyHw5v0QRRgpd1dOrEbimOl7aAofG6e+hi7uFvMpXI=;
 b=gKeC4zazW2CCY7gb+d5czTuV2m+c0J7XSa7yWg8zL7gGrxGnhhhGQVHlEoWtugXi+45EKffdNoujVGOC1VXWYAiR10zM8AMW8ulg6g372+oI/1/7MYE4fH0LZAcAfuTrj40qIZzIwj82ei2m/eV0BRI8KMTv4SOzhQKVSsrr796caBOCTbaYfoH8i/UGhFg7hVK38pFOqo0jNrZLE5pPLj340Sj4S8SooPGM+n6z8czVp7Iq2Z0SbkAmFQNABIoa8uM751bF2t482UJ30RGUgGp5BK6nzgMIiKhcG4X6lbHd9p4f9m3Ot8VIMOinQ142mtcnds9t5fLm8rW0lZ/XBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gcyHw5v0QRRgpd1dOrEbimOl7aAofG6e+hi7uFvMpXI=;
 b=BmwtGvI2Px6kI9MdsxHlg3voGnAAizaSeOWa+Ynvsb7uuW1JMDMsD5VUrNQdVklLi2wSNplRPT79vbfGnU4d8uIffTxQ6I2FPuZN5v/u4b3IVP4IVM0SLLmHn/9mBmtYE+MQeQCmfHxNkWdMS71pyL8ypNFg+Hdz9FPpmlV5CYk=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by SA2PR10MB4459.namprd10.prod.outlook.com
 (2603:10b6:806:11f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Sat, 5 Feb
 2022 09:20:28 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8%5]) with mapi id 15.20.4951.017; Sat, 5 Feb 2022
 09:20:28 +0000
Date:   Sat, 5 Feb 2022 12:20:15 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Eugene Shalygin <eugene.shalygin@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] hwmon: (asus-ec-sensors) fix a typo in asus_ec_probe()
Message-ID: <20220205092015.GA612@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0124.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::21) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 07841176-bbcd-4c3f-41b7-08d9e888bfe5
X-MS-TrafficTypeDiagnostic: SA2PR10MB4459:EE_
X-Microsoft-Antispam-PRVS: <SA2PR10MB445926D0CF5C27E3B4FA43BA8E2A9@SA2PR10MB4459.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZFz9YaspPkOO4Ea9MUNXj3bZrphLFYz+nluMP4zT5HFuUCLKt1yKvd+D5ZvXsGGkXUCvwsq3EdYURF2lRQwjH6OfsouQSezFG6Z8+UiQDqH9c8+argFnua7xDekMU+0twSQTqNedaDM/gZk8a8Zi/dc93VnOD03zKLMpgRocPullfXTfdD3W3BglnZYLnt25S2VxOu6c+vVpUy87WX7r6pRIY4mzlOE3olvqJGtaLkhJCnj85KinpwA561zz9MHImp9kPXxaSDrHkT6IcW1SiQ0pZh5BkSAd58f3rJU71gZULg5og0QV14MFHtxH9wgB+pyCkK7p6cIpMHF9OQBM6B4C0ZyNRTQXrkYBgzjmVnSywiU+NI+22HV9p2bqtmlfyoF0RRz5IVAIKH2ba8uMZ422NcUxlWEwXuAPlnmLyLfPuQPxVL0pvTe98c4f54LDgRx6gUbuQOJDYO3j2CZ172WQH6tZbof2U5deLAdgzQwl9tGdkf0iZalQQNJ7iU/U3DSdcXIHja/0a4NvGR44+R+Xvmd6sRdCjktcYaOGXDPmXRZhdR96J2R6FicaqRomUmET42pMgyqFyf/FRGpfdTWmOsJteC0a9uchB+jGmNkfjIgCsDXhP8mZB4PuTD6LvcA1JgIZ869eCNX57Z58vX15kD8a0aocCGoKlykuTed5zL3Nt1PQ6ydhCwTyfI1TFuHhi8Q1XlfVFg+I+bQUbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(33716001)(8936002)(4326008)(4744005)(8676002)(66946007)(66556008)(66476007)(316002)(54906003)(6916009)(508600001)(33656002)(9686003)(6512007)(44832011)(5660300002)(52116002)(2906002)(6506007)(6666004)(6486002)(38100700002)(86362001)(38350700002)(26005)(186003)(1076003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7Qr+9cRpTK/qDIDHMivsXo6vc7HO0Q+ML4k5F3TTvOL8LNH8XbDuBQiUuy/S?=
 =?us-ascii?Q?5/7k61S2Q2fIWERC28u4M3LApzf1I/vNiQJWj2MBSXb1p/ZFN0fxbt4oPjCP?=
 =?us-ascii?Q?qgOqX9VJPJPhBNZE2GC/xgZ9U2gZ2kdJT646PYOybm4ct7+T5dtgLg071DdQ?=
 =?us-ascii?Q?3fNMlk6FHILRi9sXTtSIWQftHf2Fhj6o9T6zVoT4AJ85Op8icmf8qSIONRbH?=
 =?us-ascii?Q?O3VvjAHTfFtvKMprWK1G9IFctzbalDH/9ESH2eM06B5Yu4YCY4XH6Bd4hQaG?=
 =?us-ascii?Q?/O7noO+NvJUqqflgr0QKyDmI+NpwvgocupgDOnsWmuRIGwli3u/LhkEL4vgR?=
 =?us-ascii?Q?1GekzuoM19YFL5hr2uS2F4OxZMkxkrD9olbksoAjLqfoxnJmXT4bKKylCNbJ?=
 =?us-ascii?Q?TB/Aenhh7/Ud3o62B82b7fsc1vWAAVIyYUwFMuUMUbjm7oizzDFRMHJuYuRR?=
 =?us-ascii?Q?Gf+yOLkRwWQmO10Ok18nkq75g0tA1Ujnli/TdogeUxeHaHkADs0k55xMqfrm?=
 =?us-ascii?Q?S+bqU2hpFocaVGnrN7X5ukbb34l0gIOrrjmF1iQxWCFPbl+YK2vocrTJo/L1?=
 =?us-ascii?Q?QdBozrWkfhIWytOjV2s7VsZEZxceH1DJxQm8JsjcrEJZVQ/eOPXu7iBWouti?=
 =?us-ascii?Q?DxYim3UoYDOtnf+o110gmTdajBMnoiC0iW54BjuYedcoD/RXsPC2A+qwSgTv?=
 =?us-ascii?Q?sKrNc0EnlYqwtLOGIJa0P+ve234WfR8KXkrpHpn5NsqjHjTaHjDn8ytHx5av?=
 =?us-ascii?Q?It1nochIysyDfRXRvEVflWWMWzh7dEOQey/2MkvQ7uwFlJxWI8iVHbsarcPj?=
 =?us-ascii?Q?UISa7aCHkV+zYHyGkM77P6ZaCf1f8+39KRMKKUgW2q4kJo3W7rW52UiKwi4i?=
 =?us-ascii?Q?9chtnu9Z/J9qwo4J4cmJglY9h+dmRHTA0SYc/R5GwIp+EuKLEon5ggD5lYJc?=
 =?us-ascii?Q?5FxNGN6hsd5nEuCfijU26WebzcB8SKIXmaHpkM22raYJA/HfTlYoPt4tQtvI?=
 =?us-ascii?Q?anUgTbfuwPsYvfHp/43ylQmVsH7fBWf61lGAbfI02wL7e7XAN4KsH3XhSyvt?=
 =?us-ascii?Q?dcOFnBe3dvpaGlHbm1egNKy8w7FM+S+4Hmt8iI6UofnwJMKrmonJTozLTHYl?=
 =?us-ascii?Q?uaLdtHVPQpkgJS1hmTpRI/x2mrYrIY2G8y3rLPuJRiXSOmnnHpD9DqSfHyr0?=
 =?us-ascii?Q?Kb11lYLf7UwmVSWiMVh+OMcHtZw4e7K/jB3AQcQ7XQyQniJgFzkAyVQJmi6L?=
 =?us-ascii?Q?mjkSlAkpvJlSlBL24h/7QR9ldBK0OpwxQqaNHIxBsYsZsi4T/wMEM3aLdsIG?=
 =?us-ascii?Q?JnY/do3TOe0tckF/aHjT3UoqYzrbaXwUISS0gK6tz9h7qVjoWhP1HpQOoSB6?=
 =?us-ascii?Q?t85hfY4JpJHZFg7GGf8UxJbdgTjRvqagpE/6+G/aGWyV278ZJvMWz0bpjCkj?=
 =?us-ascii?Q?rX5DBsa4fY89A0NKCj5gHc23mfnXlSF9F5XXSlTjKNjF7B9/Q93a4BlV3Kwt?=
 =?us-ascii?Q?8HuCqES7yS7SXO0iw30hNzu57O2eWHPUoU9zkh3HvuWGMp3PzDmh+R9ralRr?=
 =?us-ascii?Q?+XcN/PnstOU7JaDIL4OJOa81n9hR8sxtCw1BxBY7rB90aYNq2vMjQM8R3Vbh?=
 =?us-ascii?Q?jdxTp0Lo7LLtEEBtS+Nm1FH2r2gc8/YiWWf6/fxdf6/YcGNuLnw1tYI7IEkI?=
 =?us-ascii?Q?DyVYnw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07841176-bbcd-4c3f-41b7-08d9e888bfe5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2022 09:20:28.5585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kBXivJGkWHmf08IzrFN7CJa5jMSV9jXmTQpPVLgdc3d6RXTOD03fBzy3JW9QmaCOXDuTyehSs7wctihYX9RpnUsh/h1xbG7ZUvbJw0vWm3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4459
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10248 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202050062
X-Proofpoint-GUID: mSFF52Dlpu-N1OPMGI8_RH0SUXmWFlV9
X-Proofpoint-ORIG-GUID: mSFF52Dlpu-N1OPMGI8_RH0SUXmWFlV9
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

There is no such struct as "asus_ec_sensors", it was supposed to be
"ec_sensors_data".  This typo does not affect either build or runtime.

Fixes: c4b1687d6897 ("hwmon: (asus-ec-sensors) add driver for ASUS EC")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hwmon/asus-ec-sensors.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 7285334c7d80..cb266ba30c97 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -653,7 +653,7 @@ static int __init configure_sensor_setup(struct device *dev)
 
 static int __init asus_ec_probe(struct platform_device *pdev)
 {
-	struct asus_ec_sensors *state;
+	struct ec_sensors_data *state;
 	int status = 0;
 
 	state = devm_kzalloc(&pdev->dev, sizeof(struct ec_sensors_data),
-- 
2.20.1

