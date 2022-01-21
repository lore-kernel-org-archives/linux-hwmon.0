Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBD2C433EF
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Jan 2022 05:39:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378541AbiAUFj5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 Jan 2022 00:39:57 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:14844 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1378544AbiAUFj4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Jan 2022 00:39:56 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20L04Gxj016444;
        Fri, 21 Jan 2022 05:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=VzjZBWspxiVnShMgUgBgz1PmWRKdx1vOyLJ6HUAoNKA=;
 b=vDrHtblZyFkdtOs/WJBeZAmS4U6L1J0tZR46VjyjI1uZL9SP1J3L0GKi8G65jRC7iYIp
 DYPsP0TqVBGafaxZIoZDBbuMENj8UYrki/+dBHvws/5Jy6bMcuym7A2PU+vvbYC1eVYI
 VAz7AGLps9wDGdTYZA0g3XTrUeuJ1xWz/J3V5Ym1zdl2XJrvfT3YnpROXX6+cboB0lk5
 BDXNKufmqVazBznHEc51RN25GsASD0Mjftn9ddXiKrBusLvBIvvaowEd4GJYFeoXnkGA
 UfCd6aWoBMPPlnYOO2kYiRFJrVN8WYq+6LjJUROVidDYH8YkqBlF53SLmrn5mduYvUFS xg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3dqhydrcw4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 21 Jan 2022 05:39:32 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20L5L2j1033935;
        Fri, 21 Jan 2022 05:39:32 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
        by aserp3030.oracle.com with ESMTP id 3dqj05hhpn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 21 Jan 2022 05:39:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GRqd7+z6vyzygm8xBFzym3Ii9IlnxicKioyVG9M8k0C3VzaPQ8wJMqh0dzcCUHfhEgLANu5HgJ5YFu0hhSUzfyeR2Fc7aG79xqsSc6y3bpnfxL38rpYk4qUwbIVD+1BsglUnQTDDttL6vVzmHNcPaxaLPSUDXDFYRaDszXV8+hj4awmwVI6G4kIBK2zX/mewkp7Y9x5sAR1yoV0I544JAtq82qrXr+L8O5uC8i50j39bAzJXLISB0f8FlgBKxGfNQ3R3m7zL59ScaAxaqucDmU9y8HQ7nIYWzM4kbR5bmaqAb4LSpFCBcu8QsQvdhso+7f9C+SwxgON6Os7U/ZBNxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VzjZBWspxiVnShMgUgBgz1PmWRKdx1vOyLJ6HUAoNKA=;
 b=XO/Bm7W5bUgo1aqDnd5MV9XJJ4v/nZpcwD5Kg/wYODIbHygZU0jKTn+EmcOQt2fDmkd/iFRo2HrvIZ9B45W7p7ExOxL3VXYZ408dxugS2nNtEjaGOG8BEI/LXUG8qOpu2a3E7IHLEv1KYmuZvA7WiQF1dwnXTznH8GyhDgRHXa9N/8BNk+2qzdFmdVQLIZz0ZTivx1qqJwZwbKifurtmLMEWPVrTDfCB/2RZoBa9wRzaeX06ak5c5cq0oKWLfqTDmQVktDj1CNDXHm1XLbPQoKNAzoyY7v7egh4YFcPwjNuKVboB+aObN38BVz04LRdNNAs9rOLB7KU1lgQK7ho8sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VzjZBWspxiVnShMgUgBgz1PmWRKdx1vOyLJ6HUAoNKA=;
 b=uehHO/SaxJNazgmopFbt/SBF/vuOyOPzGck9nXohvPVtux/tMR5qkAlt6YB+WNxCnRWY0xKSw0oK2plOYY45dkIc20rRx3vOTJyS9YkGEa1WTomE0sfR6REJ3o+LeMfZ417joNcqGG645G3rlVuzdq7g4n6zRlnGcYAtq87oiwQ=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM6PR10MB4332.namprd10.prod.outlook.com
 (2603:10b6:5:220::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Fri, 21 Jan
 2022 05:39:29 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96%6]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 05:39:29 +0000
Date:   Fri, 21 Jan 2022 08:39:17 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] hwmon: (adt7470) Prevent divide by zero in
 adt7470_fan_write()
Message-ID: <20220121053917.GB27293@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0067.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::18) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d239a45-45dd-4e7b-8a81-08d9dca064e7
X-MS-TrafficTypeDiagnostic: DM6PR10MB4332:EE_
X-Microsoft-Antispam-PRVS: <DM6PR10MB433236C85907BA238975B2A78E5B9@DM6PR10MB4332.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qtWwXk762WFXaIlX8afk0nGOfA0eLQZ3mcSI78Wbf+6+U3TZWe8BZp4GGTs/bTqT/8bmAi+HDIMd4csrNKYEqK8qrv48K2bU+3Js9uSQs32rfEXdyOOKE9TBSA9rLvHtL6fErlI7t6+VRCzvoDR7W/+G/KMe4WmhOTSuQcITokfqqaOV3PQtWidE972DaU+YpRiQah9sZJSr2p2oiLFW0q1jivn7od5WdgGHsboNS/5JuIno7lwffio/4kKi4WbpwQLK/AUa6RTyAnlQ5km1s1qxIBPJQpRmq2IHtoG2ZE1nf6lOqVpLUtszLUoTAY07gjizRw/TC5h/NmsOvCn1/fcpKWGXAo0Rgj9I3sBPbMfEt6wdSb6eNTUFBcMqGiDv4FYzM6MzlEqI5JivO/lUCzRze6LipGxw9eJHkKa5vDNF68N2/3vKCRjtFWIu1fLffOm8M+HIHfqBN5eBxJi7mkbvA+0SJy7auT4YD/PTUx+at+ktBxSGZGUPbyuGk2L2Bg669McqYwEcYTFJOg0msquYFcDjmPmWRAzlzP2debiRCKo6iyAma2gfcFE1xt6UV6e4TOkSQ5OVkRidIkKnEj6NGhJItTKuo/QT6Ht1zKYS0jT2fXYB/PvK4UkxlT+CuY6S9XFc8DQv0gybGCbU2BbdMjcJpZ1qmVHwxT+hM+4BdT9xN1PShEH7p+CuWgSb4bt8JDLZNB3RzjAw3Pg8Ig==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(4744005)(26005)(52116002)(66946007)(8936002)(66556008)(66476007)(6486002)(86362001)(38100700002)(186003)(44832011)(33716001)(5660300002)(6666004)(6512007)(1076003)(2906002)(6506007)(33656002)(508600001)(110136005)(38350700002)(8676002)(316002)(9686003)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+aeMkDpOncKOEhq/ZP/zQdraUB8VKjfXpnIIJpVRtgKGNQHAVHWECWnML43A?=
 =?us-ascii?Q?E61S9ucQY5ThV7gbXMXJInIq/fr0L0eidaF4aaa3U6IpKw2K1lQfjrQraWxT?=
 =?us-ascii?Q?QVI7Eb6wrDajhQ3EWQhXdSCsKp4wN+ajQo855PF2QqQSh7bjpzSscxXYznnR?=
 =?us-ascii?Q?AwN28SfAxsqaamecHxs/VtBRFjRNcnP/YNnQjzOEZBJdQu6CV8pNOw15afOm?=
 =?us-ascii?Q?37/gnUzvnIkEVrQNIGGPYoXQnMnv7Dvo2OPhr6GJ50utEEo/Lmhcp03jXkvr?=
 =?us-ascii?Q?kEupere6RidSOeOpDWQNHycAnPDPYSiIOK7A2SBqTqGP1f4LmrkL1FAVDY2t?=
 =?us-ascii?Q?Yk3gXIWrye68Sdh2fmXeed8BlVrAbPRgsQFX7CEtyWiN0WPeVSkBb2nwPja7?=
 =?us-ascii?Q?nV+Y/CV78JjVe3tbA9uHxkhiRLFKYqw5ZAXddkj/X9ntem18W/Kqb2ix/KgN?=
 =?us-ascii?Q?SylWiP4bxuR3ryH8j4PBrp5fJYcngciyoSIsuj6wCKqr2h4e6w8JlzPCivMq?=
 =?us-ascii?Q?4xuxUdBktOfsfJ6punWkrrP92UHoQTiRW9ocF2bz4QVaXDLyM6R8reQKXy80?=
 =?us-ascii?Q?jTOZchMb/LItjpgwJim4621waYt0ZA1tTCNzI8QAScyn+pbKHrnWE04jIVak?=
 =?us-ascii?Q?KObH+Z/SiCFNJgMZ4Gaj0cC5ugHwzLXzpOtXD+7+erLWO/u0nQKjR2TpJE8C?=
 =?us-ascii?Q?BFInx3XuPPU8Bt+vpLsqWGQsKchgUXbePhgaC6wC/dDzgS0OBbo5OrqvOKjj?=
 =?us-ascii?Q?AKMo7azZBU0fA5cKyBV1PxYkkGZM8wJKo2hPkBlCIA1H2prIBH2rjSkgNNDV?=
 =?us-ascii?Q?6JF4mVK0FuRHOfQi+s4eHXI2n5xTMdBZ/5XrAhoEDhDc1WpETFHU1wbKXAEl?=
 =?us-ascii?Q?foK3VJWXMhyi+Ne5QinBm7Wf/rGEbzauMEbw2LrsS0nXEFtibxP5xJdNKOU3?=
 =?us-ascii?Q?Chh1LBb9iMqJSYtCR7ZbCc1rnjnvxzJLmLLcZjDsSrG+1gLFwE4YkFXpaUlV?=
 =?us-ascii?Q?8LShmF+qdUyZqM5a9qyAWCEAzpYCL+fyQl0BayfEOHfALFuL607mBZMV1moH?=
 =?us-ascii?Q?W3LYiU1mxohjGyqGanOYU89HDZeoSujyBxJ5owhL09KmNvyUYHmjA+sIj/ZG?=
 =?us-ascii?Q?51ydpN6NsNAcLomWwtE6HhLKzZJoraICWD+allm9YiBYa89bY7yRgzaHx0tV?=
 =?us-ascii?Q?6TTPHOGESl/Mm0GNpgyOsigRnzg9tzR99tLgIlNyf3qjfZ+WyOsjVoCjsSuN?=
 =?us-ascii?Q?RtdCAnRY6RaZzHHVVydmXM5x9eXC4UM/5tt/1UylgqHsrua1n83hgheuxYdm?=
 =?us-ascii?Q?nm4P2vysgsmFCvEoDLNhmo1wOmt4c5hegnztAbIgq8AHAwdEMPFKJ928JH58?=
 =?us-ascii?Q?J7YvT/wTlaiiHSbNKvlRoLvWLQc6QSJp/IXbngVHi5NnVJIj10zMGXp/RT1a?=
 =?us-ascii?Q?No7S/DQNVweK4g3uczDZOx3CbCuFNHyRcwlFhwwYAJdJatH/qBKM1j3D3+ZJ?=
 =?us-ascii?Q?oFfrHaSO9nu4QXocl1EOTokQ1/JQHPpuGGdpF3Aff/RVXsCKK3xnMgNPGu6Z?=
 =?us-ascii?Q?1ozBmaMRn0BFr4OqVJIUBtUcPqsv1tSeVd+TaRKIZLk00XwzwCTsvsLyxuuk?=
 =?us-ascii?Q?lIbYx1OEDSsg+znf4Gkl9QZRyezNeossUlfm1ai2yu+6QajFKkLPLAbB+QKM?=
 =?us-ascii?Q?p4S15P+YkYQPbnM7Q4v34kthp8U=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d239a45-45dd-4e7b-8a81-08d9dca064e7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 05:39:29.6659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 99WR4fkISJDISIWCUS0ewpRXz+HqtxZYGcGmSXT7Vj7GleAsLe9+h1NiQVh/tB3RQcGwaYSNPT03Q0P1zwCGO8vzIDN6bNpjyDhROoTqaSU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4332
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10233 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201210038
X-Proofpoint-GUID: a55kARJTLxCXxpaED9yy5pXDzq0pSoc4
X-Proofpoint-ORIG-GUID: a55kARJTLxCXxpaED9yy5pXDzq0pSoc4
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The "val" variable is controlled by the user and comes from
hwmon_attr_store().  The FAN_RPM_TO_PERIOD() macro divides by "val"
so a zero will crash the system.  Check for that and return -EINVAL.

Fixes: fc958a61ff6d ("hwmon: (adt7470) Convert to devm_hwmon_device_register_with_info API")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hwmon/adt7470.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index d519aca4a9d6..cd474584dc0b 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -662,6 +662,9 @@ static int adt7470_fan_write(struct device *dev, u32 attr, int channel, long val
 	struct adt7470_data *data = dev_get_drvdata(dev);
 	int err;
 
+	if (!val)
+		return -EINVAL;
+
 	val = FAN_RPM_TO_PERIOD(val);
 	val = clamp_val(val, 1, 65534);
 
-- 
2.20.1

