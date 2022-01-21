Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 012E7C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 21 Jan 2022 07:38:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239876AbiAUHid (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 21 Jan 2022 02:38:33 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:2864 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1349219AbiAUHid (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Jan 2022 02:38:33 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20L7USoB019552;
        Fri, 21 Jan 2022 07:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=TtU0s44tSJoBBJ5ykbCOmFceUg7huS/p3pNcPw6J6Ro=;
 b=FAx5ger/x6n9B5DlU11mWqPGpMBP9ehrArClxkP09nG6aST5kMufwDWJP6BUCfWaQ0cM
 BkY6NVP6JZx0MFT8SBAvjGZWgq7J5VsNs2dZVYgKKQD+AKcUFSlOAdd73EoWzJRfzqRU
 WZ1wKqv9+dbphSEYmbjXjBViL39SZyWKN+cerlV0K+o+aBTAGPpSQusekH/UJSXM6UHq
 /0jvhSPuxqm1Or887uqaTemTWqD4EYhPF9+/rXcLQj2Sh8uCmEGtzknBQCodPo/uLx3Y
 n5SdwY0pfDGOpDSvoOngbfyO0PdeM1GKRU02SKG8T4nN2gjUYGx3eiFp3Rw1+vwS5uN9 Iw== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3dqhyb8k28-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 21 Jan 2022 07:38:12 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20L7F1eT194181;
        Fri, 21 Jan 2022 07:38:11 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2046.outbound.protection.outlook.com [104.47.73.46])
        by aserp3030.oracle.com with ESMTP id 3dqj05pdbd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 21 Jan 2022 07:38:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VeqcYbQRNe6GQ4PiE+zGkCKvTBrFH2lXy5asvwz+Ko9+lqvw4cZVP/WVskGIBmaZ4NymXIaoBeI5i/HS8mTnfRT5RiKX9oOJXp7Mhf5a1KxV8Hj9MPk/9v1BEXv1lrJJ31TDaQaDXvwydbFcbB+wJQdA4FW6+fkJJNQwIw9haDRwqovfgFRHoY2y71BhvrupFL/RAoyNyVW5dUQdiYG6DppSgvxTDTFSUq5QuS01y8mpBbTww6aR9qIdCEHdGjilPmbc1IM9GO+ke4SNxUkp5Q2K7sf2jIXAAtR7salJvbXkJhFTF3KhJ0h4O0aOHuH+v4TAHgtLmCjrqiasO+jGzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TtU0s44tSJoBBJ5ykbCOmFceUg7huS/p3pNcPw6J6Ro=;
 b=fvRhNKCNlmmJyPJ8PuLL623eY/8E0duij/iKKzhatW+OLTGQ+Hkl5RHtWX9Cg+ijOu7V7gJnGxoC4dQq+sVfcKca0UYrjErKes5P86rfC8kd57y//TPTUG3alsw7vueDaOzC34TSatzwTb7Od13ZWZjebgKSkc09C3Y8j0UB0dVM6tUFiUdaEZOR7qPnkgfcwCv2H5ZrD/KX17BrW9yu/WY5TeAS++FDdDFUT02ExIce3w/NtMQMSPprZXcdlF3Wzdi+Sf+TfF4PVsGMaGZArJeTs8eWr++gMwIcRmdmuwoxW7/7kNu1DB9lrxWNqMSsV9NDU4OvgstUvDn4FFhlkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TtU0s44tSJoBBJ5ykbCOmFceUg7huS/p3pNcPw6J6Ro=;
 b=LWGujmX9FVd5AXgOZgWf5oh9RqM27nry+j6Nndm+V4qNNzVkIP15e2Q3Ho4D3QLfsm/OgRq3dW40aE/FCbmiw5zOllUb0a2zhyswCTcH0I85ofgH5IVhnV5OYbhrrUP0wX5TY75lkDtNvHLFZ16r3jMrAMV75v+1DZ8LLiatl84=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN0PR10MB5014.namprd10.prod.outlook.com
 (2603:10b6:408:115::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Fri, 21 Jan
 2022 07:38:09 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96%6]) with mapi id 15.20.4909.008; Fri, 21 Jan 2022
 07:38:09 +0000
Date:   Fri, 21 Jan 2022 10:37:52 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] hwmon: (adt7470) Prevent divide by zero in
 adt7470_fan_write()
Message-ID: <20220121073752.GE1978@kadam>
References: <20220121053917.GB27293@kili>
 <4ef54638-1b51-2507-1e45-ff9050c3711e@roeck-us.net>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ef54638-1b51-2507-1e45-ff9050c3711e@roeck-us.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNXP275CA0045.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:18::33)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4e32a5ba-d3fd-44c4-282b-08d9dcb0f89e
X-MS-TrafficTypeDiagnostic: BN0PR10MB5014:EE_
X-Microsoft-Antispam-PRVS: <BN0PR10MB50144CE7DE6B7E735E7283258E5B9@BN0PR10MB5014.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7oQckS04durHHIWNCeDvHaPq4XtFw7bPt8t25R03dykKX/+t3wiIt+4Yy37cmSEFk7H6p1gZcgC2y2osGjtXOOsttglPlVsGc6SPv5xy/NVP40g1OTO7+1mErqevKY5NrQ4qF3d2qAcijZBlCaHkNOqxg08m+XqsliZ/+vZ0WSFfG1nQPCw9Fn/xEQzPAlMZElou4Itcm1iGMrDoOiCRiCC/lXSqInBQnsux3i/gPJaGFmJ407DHwn7KMo1IscfwECXhpeMRLEeGbHC2pt3E2jZucro1oI/BTH0Vnqk1ed53R6V/+theDqoljiEWnRcVW2bQu14nNwObouB9bwDe6kwinAvvJZzDhYQcnOpUzPWyerz/p7I6wxMlXvwg6D/+6ZhiGiKzn1lMP1PvE4qaw4Kjt5O4l+PiJqiYKBfaoRdMUsTCYSdH9wJGaXjc7UGEXZDgVJJXO9f2PDLnAUIHgI6dNshhQpxPD/qTUg1/bjb09HUMirwq9BSRmxnFZB9g6/mNbwzd2je2zVKvfvlnNCYMxRpkgVcuCwduQpuqeOzadWF2FCW7dG4UyTdOC2RUdVl7uX2Q5vwksGgX06NhauehLFOY8TMYv3s9d2XFSZNuJR3MtkKSz3ErXedAcHl3uBHjq5AuGE7ZioV500p/lFYKD3NGhpTAQFHqjILoK5M50yqJAQYVz2v34OH7IoWXf2yLBX7SfdFs4iC9aH4s3w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(6486002)(44832011)(33656002)(53546011)(6506007)(8936002)(86362001)(6916009)(6666004)(66946007)(26005)(186003)(508600001)(316002)(54906003)(6512007)(9686003)(8676002)(83380400001)(4326008)(5660300002)(52116002)(2906002)(38100700002)(1076003)(38350700002)(33716001)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tZRBkO7E3S8+j5EP2Jcw/x7w++6Kj36sa0p7La+l5+0g8uHADeDSs5kWzYeS?=
 =?us-ascii?Q?WbFIYvRhOtLj45T5lOsXkmYC2xXQ6K9MrOXcbPT/Zi6vWYQDpoJ+wjIGzeCL?=
 =?us-ascii?Q?5Sh8/3oN5lYqQX/buvZRPxXdBMwNuvRjCnlUzWR0soVZ86hC9uXxI5PZybTN?=
 =?us-ascii?Q?JIqS7ynUoFvAsNkDolruXvnGJLRNtd0kGnkitN8m6ULq7ftZ1/DtO2wwemd+?=
 =?us-ascii?Q?BSwsRjY5TfEsK7QUYxUAURYhcmGir+kRUE1a/29mD2wKLzHZKUTvqBROINMU?=
 =?us-ascii?Q?p6nRrGfhBwYpT+k8pZaVEboZY7qMYsTpJWnNeYAWtnPbakNp91vFuriAjqyy?=
 =?us-ascii?Q?auOy7f2xXgHZAYGl+UHAZ6Klv4iGw5i4G3aKKBFrJYEmWp9cus7YuFGSU9Nb?=
 =?us-ascii?Q?DNrxzmSGUzkdK6Ek5ZM4ndzTvvQjqMNj9D2eJuObnt+UloAwOk+o+dWjP/Rm?=
 =?us-ascii?Q?ELXLGwWA+AsaGrRZbNveRSxOfVOjvf7HJDWrpWAssqJwYK70/ifDMTYipmvr?=
 =?us-ascii?Q?GdC1zckyVxLFGQOKLhXaOC5CTngcN53HA1i2b1oPbd5bguRG7nXXKady7dQt?=
 =?us-ascii?Q?L530qlQvt4CgGKHJesCeCuM5PXbaE9KePBe9ML9aRacDTjDF8yZ1QtIM6lxG?=
 =?us-ascii?Q?QC59xPUveeGqmGcritpuDtdnq0K7pCWPCBW8EUHZmkkHpR1n5XdWbIhZtlD6?=
 =?us-ascii?Q?FxWJOv7rClo3c8u8V66qLdsByLcfF3AypFeGJwikUaSZc5sZzhjTm3af5j+L?=
 =?us-ascii?Q?6HOcbCFVxkPDA8vDkCpj8OgvlXWpx3rxyDN1lZXB1p304GmaSAemKjBEofd3?=
 =?us-ascii?Q?Cf9LLlLf3fUm2CKJyDY586dE1F5UXFDXDrZ0brN9eik3VKjYyxicqqzCsRXV?=
 =?us-ascii?Q?kCuUB7t8+7s/bO6/Z3XV37qLJj2CM72/Zb+1uHj2ZUdMKBaeBr6+w5uIACWS?=
 =?us-ascii?Q?weMPy03/9Ag1EGJklGW0P33kb92ZRcU9gBRBzMaEhevBKlz7hxJkboQam53w?=
 =?us-ascii?Q?YpJFe6C76fACHYygzkwCq7Mefw5lJkthlyKQzG4lKLgv4CwDcM7iFwJk1eTz?=
 =?us-ascii?Q?SuyET8Mo63MfzdjC/dQTH0RwmKsURWxlJETj6XOIY4D1Ey2SkKfwKrAlSm+e?=
 =?us-ascii?Q?MOKsoJX97Mrur9Nq3lcpPNo6R2kccJu7I7oawqYQ/sr9LvyJFc/jmd8AKA/x?=
 =?us-ascii?Q?t042ZrnIkmHmX02lw5TcT/6zt1r3uFdOsJ0usEEiIb1GEOsodxZuXDW4RxEl?=
 =?us-ascii?Q?8hDAF3ueWYZoOJYror/S7sxvhBLOslkiOXcHTG2f9l8sPTB5a9xJG5kwxXkQ?=
 =?us-ascii?Q?tWNygaLIdI6lXUC/ya9kV4ofFVbaqvKRncQ7a49fPIHP/pJGyGWPy8DVaktf?=
 =?us-ascii?Q?Jph6mfGOqnUb+llIy0rjo+3M9p308Vpuqtjseai1MJPNsjONX1dNr0ylAqFI?=
 =?us-ascii?Q?+jPOH5GyXk8f7YiUXBaPTh6rRx2Z1wuLSTYy0vyhVyWVBu7tM8tGZAjkp5UT?=
 =?us-ascii?Q?PEW15IW98bVbNMxqc/xOFbqVAZAHBaViJtRWGjCuwhsuxf1JwswZWHVu+uis?=
 =?us-ascii?Q?MzAcnAR6ypx//hFQK27whPNSwRWV8Sc2lvsuMMxDrw4aqIzW6hy9QJzaDlmY?=
 =?us-ascii?Q?WuBKoAsC+f4k5wHYniIjpakiJAwTraa91dU7n0NNsIF2J7zLp2IwqoUFpWVP?=
 =?us-ascii?Q?9U/XgA=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e32a5ba-d3fd-44c4-282b-08d9dcb0f89e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 07:38:09.5761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q5DMp5CcSLVasIArPHmxxRfNPC3P+LTVxCn0tt4bfHn0WQwh7g2HBBc657/H9/k5k0bY6wlAAGJGBntgBdPDa6Bce+gG0SedMLH36qo5a80=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5014
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10233 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201210047
X-Proofpoint-ORIG-GUID: tl6fnR64zkf8hw042Te0ohagYP7i-N2-
X-Proofpoint-GUID: tl6fnR64zkf8hw042Te0ohagYP7i-N2-
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thu, Jan 20, 2022 at 10:10:45PM -0800, Guenter Roeck wrote:
> On 1/20/22 9:39 PM, Dan Carpenter wrote:
> > The "val" variable is controlled by the user and comes from
> > hwmon_attr_store().  The FAN_RPM_TO_PERIOD() macro divides by "val"
> > so a zero will crash the system.  Check for that and return -EINVAL.
> > 
> > Fixes: fc958a61ff6d ("hwmon: (adt7470) Convert to devm_hwmon_device_register_with_info API")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> >   drivers/hwmon/adt7470.c | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> > index d519aca4a9d6..cd474584dc0b 100644
> > --- a/drivers/hwmon/adt7470.c
> > +++ b/drivers/hwmon/adt7470.c
> > @@ -662,6 +662,9 @@ static int adt7470_fan_write(struct device *dev, u32 attr, int channel, long val
> >   	struct adt7470_data *data = dev_get_drvdata(dev);
> >   	int err;
> > +	if (!val)
> > +		return -EINVAL;
> > +
> 
> Technically that restores old (pre-fc958a61ff6d) behavior, but it is still bad:
> Userspace can provide a value of -1 (or any other negative number), and it will
> translate to 5400000 RPM. So it should either be
> 
> 	if (val <= 0)
> 		return -EINVAL;
> 
> or
> 	if (val <= 0)
> 		val = 1;

There is a clamp() which does already turn invalid values into something
valid.

	val = FAN_RPM_TO_PERIOD(val);
	val = clamp_val(val, 1, 65534);

But I will make the <= 0 return -EINVAL change and resend.

regards,
dan carpenter

