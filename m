Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 473C3C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Jan 2022 11:56:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343884AbiAUL4V (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 Jan 2022 06:56:21 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:31110 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344535AbiAUL4U (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Jan 2022 06:56:20 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20L7H9qI001093;
        Fri, 21 Jan 2022 11:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=3KLLwO7EEs9jz3sSgP20/smHuk9PoOhrvhv8AfR5LHE=;
 b=X6Uri0D0LS3ctPB9aAnSdATGh1MGTNOvYYmM0qTy13WX/0+ggfpGacjY60jifUs8jnIw
 q0yMD/uehZH2KfVQF0iOJaxIqVFFo/yhIZ4QXLTzLYHVuTNqpzpcROpn+spPUC/s27aa
 jR3ScUlZ6WzJWfvD0ucVbe1DZphGO7QmwzEh41pGDD6DDAJcWxbIY8MslVAT3Simxm34
 pG+SnFBMJihxCs7ChejVnEZD7bhTyKUly6zj3Q0d/l1elCH4KLW8KhtN3TXSYDKEswOi
 59kzhozuWYhcF+uU1569QQQagGkveLQ5rwatyocVPOdpyawu5noYfwf1mgryzt52QoLo 9Q== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3dqhy9s40v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 21 Jan 2022 11:55:57 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20LBoXhK059917;
        Fri, 21 Jan 2022 11:55:56 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2040.outbound.protection.outlook.com [104.47.51.40])
        by aserp3020.oracle.com with ESMTP id 3dqj0sxu5y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 21 Jan 2022 11:55:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rz+OGNlgJzbYGmG6bVk5l9/FcW2lrakS4XSmy04/OwIhbFfF3LlO4GJg4v0j+sHXUiaOk3DUHiJcuM83GUxzjT0lvpH25Mu2LHK2kq/yJgNV9OQJPA55jRWjGunTkUuvUsiRbT6cR9DA/fe3/9itB4FpHv7Gb9AfyPud+m8Wz1qeOEvHnLo3Lr18Yg4ECxYlLjVkSy8fJpXHKWAHq/xbx1m6QTqDrBqAesk5DBXghP4OJq63MoohxmWsLYwfr5fxNwIrr6OfBtaM9fubS1OtRla71QvM0qzAnTe/X/ffGi0HnuOIZk/sM9tsqmL3pXLtM2ocVTd3BPVpnAKD/wvM0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3KLLwO7EEs9jz3sSgP20/smHuk9PoOhrvhv8AfR5LHE=;
 b=eVSaO4wUNFHk4ez5p/tJpMcs7CoChlq4wFJS8PKwDSWcY4NEq1Q0kpsXqtC0hFUlpLjLmAJCv1eoSAy0LW1eOj+yvzuwvBkoniyb4Wbv9d1Dtrq8hBxcB35wzylyWGKLIVQ0oGu5DGbRwQZR192pNJ3hNUj4u0pbZnkQ8G5L6RoL82cqT5S2bG4Lz3KDnLWg+ayvwyiJpwxisM8t4hBsH88pKsvYd6old1DLEVdeVvF7YriQPU2xDpkqyXuROshzAWonkmAX5HW2T3CiBzN15v3dpk92YKHTIjEzwbaDKqr/WkyntL3BdAAcwPKOTQoNQt8V6Pe1BYYJclrVmRwjxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3KLLwO7EEs9jz3sSgP20/smHuk9PoOhrvhv8AfR5LHE=;
 b=XdQiqdOcss/N6YclMnTwTTJOMnwSj0H4iMnms9CCo6KGibAyKKJ+/hwt//VhQWdhQx5MK7Z7dR5KtXUcfAuN/JYaeaVlT/SYdggq/y7TRuwHHmpYro6kzKG1n9Q1TNYgBLNrXBLHP4QlLhiuEQfVAQIZBHcuVltFH4CBHsWZe9k=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by DM8PR10MB5414.namprd10.prod.outlook.com
 (2603:10b6:8:32::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Fri, 21 Jan
 2022 11:55:54 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96%6]) with mapi id 15.20.4909.012; Fri, 21 Jan 2022
 11:55:54 +0000
Date:   Fri, 21 Jan 2022 14:55:43 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH v2] hwmon: (adt7470) Prevent divide by zero in
 adt7470_fan_write()
Message-ID: <20220121115543.GA25292@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0098.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::13) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0b1cfc56-d59c-4708-44a1-08d9dcd4fa8e
X-MS-TrafficTypeDiagnostic: DM8PR10MB5414:EE_
X-Microsoft-Antispam-PRVS: <DM8PR10MB541481B8ADFA5123556BCF1A8E5B9@DM8PR10MB5414.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EeaNuB5XoOkJuxMWq950gYlxiDhLjcJkJOI+GJV3P1BtF6K6kU0+cTBsciFmYjMiKGk/njjTJIdAv/7tf+ImBgQ62OYvcsH7Pljs8SazzC/DeufyPVbEhvgCyrKZzCdv08jANsjyA/HfgOVpC86QBUNWxnQssTgttMduRJgMR/HD6e11A5PHd6s75Vshz1R017IrOVxH9uSBxEaOcaaG5MCmZJLT/R0k9ICz1p0CkLnRru880+AT9wIQSTDSw+/zxi/jPGfbTuJH3B+2TNuu2y/jAl2nHz4IP/ef9NPxPuZi6uJjIzR4q1538kMxuJYvJMwk/cBFRdxxuGFnCUQqpplp290jO4YBTiPfM434tcMUrtX1Uer7/506APKXbc1+1XDz/6QK4YEwLrkTMXjvuV1GKB96pFCYoTTsBZKyx5oGhzuBeC9A0qrhz8n5lTN/MC7GEPNbh7pO0vs+iF35dVXn01Bj2Oe1R0E1Pbs1FZP8JQ2j37M0/C75P5SktK5DTKTP4y/OO6Lvkz1GWQilG4VRPPQrnmUW3cW3upns8gekry0QcMcLiLVy0Gs2cQbVlApXP2I6Bwol0IUe6l4lYzLUv397iYtlDYMtTxVWT+lYQNv2ATHd6la/lrwwFz+4fnaJ+gXMphV8TsDszrjgbTtRsGF3drc2xkbKiY+eUGsZ216vImK4DskAKdsaM1WeyIbbw9vECTm+ISfIN1TeJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(316002)(38350700002)(6506007)(38100700002)(9686003)(86362001)(66946007)(110136005)(66476007)(52116002)(8676002)(186003)(4326008)(26005)(2906002)(33716001)(6512007)(66556008)(508600001)(5660300002)(1076003)(6666004)(54906003)(33656002)(6486002)(44832011)(4744005)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZjqJc9RNA/2kAFX22BbXYx/iEVlpQS9ajqRkdQfCbZKdLka3vqqQ8AiJZ+mU?=
 =?us-ascii?Q?48TjUW6caxZrADFX1bfABhS9y/gB3VDg6EtUug54pm+qciUVX/uIpFIVObiH?=
 =?us-ascii?Q?CS0SebGTMCGi3Hnha5SRRLr7YigEhlrad/jlgHFAFyT30dm9DfXdAFPwozWh?=
 =?us-ascii?Q?1YMYicaxtaEVkt5GX825ZEdwhDI26aQHwrGcY5gUx0B3h4gcY9Bsuw3ZOpbl?=
 =?us-ascii?Q?b1urYjZpPKWaP2V6F0CaRIDgJFvs5MYh7GaI9xmLXiTVgftTRsVCmAS5k8Kj?=
 =?us-ascii?Q?BLvr29enxZziarbYSRUM2SfEG0K47FM39uOYNgjod+cadqrBorTNlKVTXc6F?=
 =?us-ascii?Q?k/3DequJIneSCMOECVBPEQAdgVRnN/zZhUi2fWGoWJwIVXuVRHzsSpCHy8xJ?=
 =?us-ascii?Q?ur2gJ3321LTCpGHXBwWybpAEwAUtswC5u//IbBcfp+NysZIGPJg+2OO1bsD6?=
 =?us-ascii?Q?yFzC7l8uWh+qzg/y/UnmEq5W6e1NNBWsTD4250UY1PkSQ95/t04S4hMq5Sir?=
 =?us-ascii?Q?uUtTiav55Qgy3Xi4kVb2WmUvegAF6+Zzr/HB237gWO1KjiwXzZ+OTJ0JhrJR?=
 =?us-ascii?Q?dMic1T6XZ+8TYMcFhupsrRop/veg06nyj67cBuBUjLT7gXK+QqONwRLddHS0?=
 =?us-ascii?Q?5HXqG5BwYxlVMTaIFlXIYFbY3trt3vPj8v182wu86A3ahXMXzKj0R9jzuFZA?=
 =?us-ascii?Q?D/cPS0jXt5shfGHB87phR4ISVaer+N270ZAoOLLeflmi3uNlIZ+IEBabItAf?=
 =?us-ascii?Q?qgz4bbpXwDA6bSRsiJ+hUCKDcDAhiIlznol7AWYZ4NhKt6CsXX1AuvPTL/SI?=
 =?us-ascii?Q?L9N7BAmZYsBvkP279O5hU9vR7YarvWflxrKahsm5bO99DwGuFEkz6RhuHqmZ?=
 =?us-ascii?Q?OOH8npbB1kQ98wsx6J0l7uO7It11hvHZ2o8AyziVabItXD5U35hObY6XzULJ?=
 =?us-ascii?Q?XZP2vA5TDzsJIgpBSOcLSSobQjdLgeObG/KIzlhlMmpHxMzNldzRvuOJnXQJ?=
 =?us-ascii?Q?STE5xXqDhi/BRVswFNmHudr6t+SQQ5C0TYHy7XUTsCRRjvF5mlWdYFMPBA3x?=
 =?us-ascii?Q?RqKm4AX1rKZEe/n09FMqouhUAvfA4fnvwZhFpDp3YFbt8s5wjfts6hVcJEyB?=
 =?us-ascii?Q?xU5R+yVEfXe83RCRzUiJF1CwAF+3H8YUrKUZmYqC+ccgQzErA9Ky05jcXMbm?=
 =?us-ascii?Q?CXLk4wdZgJg97WGlzaioz9e5Za4TrA5sK6Z3cOCgy0xaqmA00qCSkvZedRRB?=
 =?us-ascii?Q?5/BHyOiPeNGxGyEWMAD/vnNUwDILS5R+IeWsrWptUcMVxV/vhYcUpkANf3jc?=
 =?us-ascii?Q?Iynj5Bn1GFFZHuPikwTCUT8hJZyop2Nl5i9rLIftiMlrbPkK1WsiBFurOgiw?=
 =?us-ascii?Q?Z581uwnDTJhPgSh0gnEUDidPjtPYfXiAl5cr46PuSmzNMO/YaHGiNtXjBPIf?=
 =?us-ascii?Q?ZLn+JDriOYOASAC9b4Sev5FxkhLJnaj0EWu6cG/+ktBkDXDKiEoK94k9RrYC?=
 =?us-ascii?Q?L2hNV9wMChUTF5VNd+HGMgZnvdBr+kXIvxwrEF4GD/+wbH6zX2n/wK+0CrT6?=
 =?us-ascii?Q?L70/JGUPAGWuDjRnjt/Ag5DwoMyWCs2xAP3rFQdJUGg0QqEpNXKcHT9Jk4Fx?=
 =?us-ascii?Q?fI7ORl3pdt9tPEzxvTsTtQ+q3IWCfoIQhjInSHElWbLT4apiN9y5joqBMn9q?=
 =?us-ascii?Q?Zq8ajd2IqdU/ddtLswsyg5eRasI=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1cfc56-d59c-4708-44a1-08d9dcd4fa8e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 11:55:54.5222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /Ocmjhq75Pd9Gh8ElPiqmRp9VV6W7pl7R07oJCUNLFqfxd3jRVZh5BvOJCbWiFpKOIerttE9EQZcqe7bHIJRIFXhsVlNDxyUkUGHn6ATMtA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR10MB5414
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10233 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 spamscore=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201210080
X-Proofpoint-GUID: MHNxzZRCLU-sYzgjWW706oWYRIL41lBm
X-Proofpoint-ORIG-GUID: MHNxzZRCLU-sYzgjWW706oWYRIL41lBm
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

The "val" variable is controlled by the user and comes from
hwmon_attr_store().  The FAN_RPM_TO_PERIOD() macro divides by "val"
so a zero will crash the system.  Check for that and return -EINVAL.
Negatives are also invalid so return -EINVAL for those too.

Fixes: fc958a61ff6d ("hwmon: (adt7470) Convert to devm_hwmon_device_register_with_info API")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/hwmon/adt7470.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
index d519aca4a9d6..fb6d14d213a1 100644
--- a/drivers/hwmon/adt7470.c
+++ b/drivers/hwmon/adt7470.c
@@ -662,6 +662,9 @@ static int adt7470_fan_write(struct device *dev, u32 attr, int channel, long val
 	struct adt7470_data *data = dev_get_drvdata(dev);
 	int err;
 
+	if (val <= 0)
+		return -EINVAL;
+
 	val = FAN_RPM_TO_PERIOD(val);
 	val = clamp_val(val, 1, 65534);
 
-- 
2.20.1

