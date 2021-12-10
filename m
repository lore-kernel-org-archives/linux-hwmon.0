Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36A12C433F5
	for <linux-hwmon@archiver.kernel.org>; Fri, 10 Dec 2021 11:43:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240715AbhLJLrY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 10 Dec 2021 06:47:24 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:65076 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240667AbhLJLrY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 10 Dec 2021 06:47:24 -0500
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BAB7KGK025227;
        Fri, 10 Dec 2021 11:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=rtsmA+s84TtGmFqX3lwY3qcJ3wOS1Ki/ydlFP1pD6B0=;
 b=mae0Jv0y1LoMotjs0kRfEI5ZR+TY0Eq7RsqHuAl65gUpuxWj4Ij+b/jt/4NZtwpDqW7S
 4nObPfd4c0cJ0s3pylwwHA49pIGuSfirpfN9rIgh3WZT9WqxYBDe2pmN10rGstpmEFnY
 g4JsZvElKMOF6zVHz0vvvfiqQQtVOJTKDkfoxtEEHhTCgAuozmo4fvvibisTGUN1Lp3b
 iqM65IKmHE1TihYhFP0li//GkC6IgVmN07DXTo+yyESyR/sbPXgTvzWCzu/iTpPVMNYF
 Yz0iCKZFQ7EykI/8XBsnaR1Ej/Ns2tQUcGOHq+8nczwK0YlT4cHmf/dcJUkoHF0zhuAb RQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ctua7nguj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 10 Dec 2021 11:43:28 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BABaG8K161987;
        Fri, 10 Dec 2021 11:43:27 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2049.outbound.protection.outlook.com [104.47.66.49])
        by aserp3020.oracle.com with ESMTP id 3cr0596nb3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 10 Dec 2021 11:43:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3vIlwDD/zHmT+bbEN3P2Qr4gaQhIS9Y6sjMcZ3scRLmQ46rtpdPPTwqPARQqXjxnQnINpu92PBOLLzdgTRM/wfhpffgHxbLfpLc1IwEAKpyguNbYohEUxD+tGT0bwbz3zu7LPYUmq1tnMmQVaswRVHWvu6UWMKO7zkAilka4XqaD9orhsJhNG7N3sIt7IdFSu0B30vegIP5GGCLZVL6c2LYXT+cTzGZnOWVnkpPXEhCMtCOLLrgUac5HayEeV8Mwnt1eaYnLVByJQQmOoevQ3lNsI1P42MlTfQICe5O1PGnUO9K0cARQA52UXpNiCTaWYpsBVSfkYx0czQGwOPgug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtsmA+s84TtGmFqX3lwY3qcJ3wOS1Ki/ydlFP1pD6B0=;
 b=HsI+qGy5EkfgqA3Ta9RfUnObrZxgnTLDiFFTlViGNHeaMTde1m34ok/8zoFLBKpXjq8QxkzvkEEkAvlXz9uf1r8WGrsiCh0isbgbD4XQ7NDJnBdNmUeDLkrAIgoc8gQmZlUYaE5oafnAZYo2JhN7B3HQcRNWTnkrioK7w/QJk9lMLhTTxHnonYB7rUpPjXSeqlRMv2lNfIoK/mcL8wq5DbKkhLAxSIY0X1oio/ZV5JhaAdABKZlT82ohxigtW96kDjxYxlI+E0WB03gWRqVDgb1Tp+DvFjNI1xZQqNPk+9/PoE4IhfPL0vh+ujuGVG7esrmhYVlx0rVZyuFDq0B3Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtsmA+s84TtGmFqX3lwY3qcJ3wOS1Ki/ydlFP1pD6B0=;
 b=Cj6iRuJgERgBaqB+Nd35fAw73Y/FapSs+AaB+sA7AXgIba0pL3IqoLm6ZGSCHtoVGARS++go/8DQ/vIpjxGDJkKqxwc5I+8VVJWp1k31XzZaOSOcInK1upJttAZhFPOn88NRSUyfdQu6IGCgBHMmUlZlpoAp7cpAXftric5dqik=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4499.namprd10.prod.outlook.com
 (2603:10b6:303:6d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.14; Fri, 10 Dec
 2021 11:43:25 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4755.026; Fri, 10 Dec 2021
 11:43:25 +0000
Date:   Fri, 10 Dec 2021 14:43:04 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org, Sam Protsenko <semen.protsenko@linaro.org>
Cc:     lkp@intel.com, kbuild-all@lists.01.org,
        linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [groeck-staging:watchdog-next 12/32]
 drivers/watchdog/s3c2410_wdt.c:663 s3c2410wdt_probe() warn: passing zero to
 'PTR_ERR'
Message-ID: <202112091052.ZSHK1XkV-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0060.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::14)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by JNAP275CA0060.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4f::14) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21 via Frontend Transport; Fri, 10 Dec 2021 11:43:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 75a5eff5-7969-4407-5d77-08d9bbd2463e
X-MS-TrafficTypeDiagnostic: CO1PR10MB4499:EE_
X-Microsoft-Antispam-PRVS: <CO1PR10MB4499AF2AEBB199AF3B4970BD8E719@CO1PR10MB4499.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2150;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: en4JJM2pp6d9vrEYKtcQZhi5E8gNpL+DYaKSzNEGgFPIzcons/aeU1yPqCxBJVUvPHziPXRlz4SDX7yeIWTRb/c6UyzaRjS2hcRmOZZYj4jtPTXsdw83RZzFOT/S8MIkCYK40c4m0IFPP84KXFWtzpzRndY9RjIul51XwZTietTEPwVbls1o5cHwwtgsscu4TQfv4uuqLrNzdtNE7LJPjFXzumiHIgZjvItxC3ZMWnb63M4b7721qyhok5kXXTlFuFtZh+pnwOEn/wsuONThUqCXSm0Q3IUkV/CpUuOKDHoDgJlGeMrBxNHCmiLAEVJrJ51DSkAr71Pt91EbntrjUVasbsQzvPQd8bOn6zFlCyY3Fxi65cyir5vmIoaTDw0U/rlOBSTu9lqFhvODp5AHJ904o5KvPXmxnnR6APNy/aw2J9qkYUPWD14UcAlN5XebnVaS6HYueZor0GSpk1X7kag/9RzgMm6unoELyWfBQWaDWrp89CXeFyuK58IlP7KpmJBJjfbyDNksGR64CjT4uSxS1LWI4D4q0TK2LGzkO1uohWnXKn3FTrYmoSVhaxiDoW2OgPEnMy8y6zfdjkci6/K2PQt6B6IyhhdcVlb6VJ2ei2Taqg+rLPFPd5csdaJckaiLtfEDT3f0R8Io6D5KQr6Cuy2vFzWXsVGPfw/+xxaO9s+zBkdaBn1sXexQF2ibtvN+aIj2/mkrxfjfQ6VpI+HGOYZLSEQ2ihahl1MPHlYroZ6Sv94UpAwr7guX5vlTiY4VbpyNYIJTR8N/yddn9cQlfzoRNKS8F61EjORrmPFu3LGh6ahs3ReD2uq/A+Souz9d8j1ieJ4wgZD9qws0Jw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(54906003)(1076003)(4326008)(6916009)(316002)(52116002)(44832011)(6496006)(8676002)(8936002)(66946007)(66476007)(966005)(186003)(38350700002)(9686003)(66556008)(38100700002)(5660300002)(26005)(6486002)(2906002)(4001150100001)(36756003)(86362001)(6666004)(508600001)(956004)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JgQ/bMqj/ElYpxcN0vZu47DJ1NmSN1yFcfWJRSdk9Y5O3iQuhL/t3FHIthZ4?=
 =?us-ascii?Q?RMkBvLKuz+yMrDV75TmAyelK2tCWS+RItFLP/k2Z6BrNkcyhOar8XL79bbqm?=
 =?us-ascii?Q?eZEfgiGzmNCs2w3GESK4sJtZ5cLihY0dCdF+QGPVS4bLCn0453Xt7EX48Hhl?=
 =?us-ascii?Q?o5OaIWQQJYT2HHmywPiXHbix7e6BVN23pHsHzCZu9+qzdYU/9QQA06slFR1k?=
 =?us-ascii?Q?y9y0XV0NoKIbGMaqWsFhErfc5ceyZ+sgDv3WrI99gYa9K5zjbi7YScztYRd1?=
 =?us-ascii?Q?yDKg1Bt/xvqBb+bc1RWQ28HFESiCD+zNEDJOOCmg2D360Fi7CEMmXjXPHlc+?=
 =?us-ascii?Q?8vgBVcUkiAHj0qPFHpcIMnUkGW3PTd/aY60WQyZjmcTWK5jfyHde/GxoCEha?=
 =?us-ascii?Q?8KqGDW9YwS+j3+Rm5FH2txeQqwKZ7Jov11myCxEUo72fMy8LV1P8CHbJX6sQ?=
 =?us-ascii?Q?OzDbGrBONL1FHAQ/Qj+Jlqbsb8nSw+BZtBCUvTOlAxl4rSt+SkAL1yLKpQnh?=
 =?us-ascii?Q?cyr8rP7NWVJgaqhKjfl7llRfzLQ2X/twPmv+CggEps1HkLyQ8N1WHjgF6aV6?=
 =?us-ascii?Q?yb5OMcxqgyMTJT073u2XFX77Jxr2U9yLB1Nzwjcz9NwIcKI759mXQ2+P9POD?=
 =?us-ascii?Q?bEsnjkwcgGIfJKWYOwIvr2Me7yArmBht58/uHaNygG1JIV9aN1m1teCmwLvN?=
 =?us-ascii?Q?rEKKxg98ClIVTWJzohw3mr/cMVjhwAGgatav2Yiq84TWYKXYocFSGdAT13ss?=
 =?us-ascii?Q?2IGCHxVJWWoe9F/YtWFiUH2VrRD10kBVBPNTpU3NZKGxA13Y+Zr/EnktY6l0?=
 =?us-ascii?Q?aplP8w/aIJRHmittpfppjICHQBGb0M/55khkhh7h4rUKJooS7qm3uHBb0NS3?=
 =?us-ascii?Q?g0Ab8ZzCAN+nE2l7BpY11vR3r8D4s4gv+kPjORLg3liLpdSGYPRrVzJuZsOL?=
 =?us-ascii?Q?lCFjjn8fpLuOxuLTK86nU3QmpD9YZ5kwWwPBYNJl9sDnkbAvv3b6VISFJclR?=
 =?us-ascii?Q?8epRujEtwYghJpLiI4O0oa91z9HvpyUN6ZbCeQ7Yaz/bGd1K0ExQLy/d2jlA?=
 =?us-ascii?Q?eUnlNxakhEM9yiUwlVZQDt6yfjfg/usM1kbUqW54inJoCAqvEbjjei7Vm6rY?=
 =?us-ascii?Q?/yPxr8LNldPedN4mSsFPXLFtn6JbGqVQN6mgvjLsp7rjwAJUQC3M+whhxlVr?=
 =?us-ascii?Q?dj1gfRg73GQuvMYp3d7eBAmHKacD5EdxgkaVxV7xfrNSJdgnH2vP5C5TiyxY?=
 =?us-ascii?Q?SlT8M9RzFyoFoNAfeAvLjrpVqdlXht96PJunI/oJ5mFVOkKHJvEjQjfpotcq?=
 =?us-ascii?Q?WbxHIvlk9a55J0qCvcW7Ql+aqQbZScRPrs70e+hsEx/upbBwSa6bkRxQOgIr?=
 =?us-ascii?Q?vs0QR/i0Im9uTs0QmFXL6QD/kr9teuGsso5SmYeHbqO2SdjvKSTzztTuLy4t?=
 =?us-ascii?Q?p7gsOQLh2kFvbRuoffhV9XHuAYALij+ky7pPshIcz/RGCLw7QX/gYmMjZQFs?=
 =?us-ascii?Q?mVjXGFE65F1WKA+fUC+/aFLbnZvNCzxSPVIpj1T+5QkdqOwPeet7+VjJItnA?=
 =?us-ascii?Q?X7x5BP4IsJ6IqjVlpsfKCxt3qo6FkLhhOA4cYGYYpGc5eMWV7wvPtzjYAkaj?=
 =?us-ascii?Q?SJ0sHy3tef4Fgyo2bRHpJDt+RF/IaNNAh1AXZPhx10cUVStVGwdTUMpWMLta?=
 =?us-ascii?Q?09XbXx2dd+jDlck3yoLBo0w9muM=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75a5eff5-7969-4407-5d77-08d9bbd2463e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 11:43:24.9881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8JPS3X52zyD8Oan9NQfcBDM6xPOYGiKnXscAEqZuWZEfMkhRd08RPeUtHKcvvDO9qpO3OxaYsn+BeV15cnsEtKWhmvbliQPtH6pUNhgJo4Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4499
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10193 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112100064
X-Proofpoint-ORIG-GUID: i8ytYZA2a6VHfIcrtjbOfs0d2MgBEFHN
X-Proofpoint-GUID: i8ytYZA2a6VHfIcrtjbOfs0d2MgBEFHN
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git watchdog-next
head:   59a29872ed5c746bba5898ed8e77c3e33d3aa9b6
commit: 5c0145c7f9262dfd7085239eca95b15967c539fe [12/32] watchdog: s3c2410: Support separate source clock
config: nios2-randconfig-m031-20211202 (https://download.01.org/0day-ci/archive/20211209/202112091052.ZSHK1XkV-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/watchdog/s3c2410_wdt.c:663 s3c2410wdt_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +663 drivers/watchdog/s3c2410_wdt.c

2d991a164a6185 drivers/watchdog/s3c2410_wdt.c      Bill Pemberton           2012-11-19  601  static int s3c2410wdt_probe(struct platform_device *pdev)
^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds           2005-04-16  602  {
08497f22b15aff drivers/watchdog/s3c2410_wdt.c      Krzysztof Kozlowski      2017-03-13  603  	struct device *dev = &pdev->dev;
af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-08-27  604  	struct s3c2410_wdt *wdt;
af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-08-27  605  	struct resource *wdt_irq;
46b814d6e00c1a drivers/char/watchdog/s3c2410_wdt.c Ben Dooks                2007-06-14  606  	unsigned int wtcon;
^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds           2005-04-16  607  	int ret;
^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds           2005-04-16  608  
af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-08-27  609  	wdt = devm_kzalloc(dev, sizeof(*wdt), GFP_KERNEL);
af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-08-27  610  	if (!wdt)
af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-08-27  611  		return -ENOMEM;
af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-08-27  612  
08497f22b15aff drivers/watchdog/s3c2410_wdt.c      Krzysztof Kozlowski      2017-03-13  613  	wdt->dev = dev;
af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-08-27  614  	spin_lock_init(&wdt->lock);
af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-08-27  615  	wdt->wdt_device = s3c2410_wdd;
^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds           2005-04-16  616  
e3a60ead2c9b81 drivers/watchdog/s3c2410_wdt.c      Krzysztof Kozlowski      2017-02-24  617  	wdt->drv_data = s3c2410_get_wdt_drv_data(pdev);
cffc9a60ebac3b drivers/watchdog/s3c2410_wdt.c      Doug Anderson            2013-12-06  618  	if (wdt->drv_data->quirks & QUIRKS_HAVE_PMUREG) {
4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-12-06  619  		wdt->pmureg = syscon_regmap_lookup_by_phandle(dev->of_node,
4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-12-06  620  						"samsung,syscon-phandle");
4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-12-06  621  		if (IS_ERR(wdt->pmureg)) {
4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-12-06  622  			dev_err(dev, "syscon regmap lookup failed.\n");
4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-12-06  623  			return PTR_ERR(wdt->pmureg);
4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-12-06  624  		}
4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-12-06  625  	}
4f1f653a68d67c drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-12-06  626  
78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham             2012-01-13  627  	wdt_irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham             2012-01-13  628  	if (wdt_irq == NULL) {
78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham             2012-01-13  629  		dev_err(dev, "no irq resource specified\n");
78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham             2012-01-13  630  		ret = -ENOENT;
78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham             2012-01-13  631  		goto err;
78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham             2012-01-13  632  	}
78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham             2012-01-13  633  
78d3e00bb0bcfb drivers/watchdog/s3c2410_wdt.c      MyungJoo Ham             2012-01-13  634  	/* get the memory region for the watchdog timer */
0f0a6a285ec0c7 drivers/watchdog/s3c2410_wdt.c      Guenter Roeck            2019-04-02  635  	wdt->reg_base = devm_platform_ioremap_resource(pdev, 0);
af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-08-27  636  	if (IS_ERR(wdt->reg_base)) {
af4ea6312cebd7 drivers/watchdog/s3c2410_wdt.c      Leela Krishna Amudala    2013-08-27  637  		ret = PTR_ERR(wdt->reg_base);
04ecc7dc8ee625 drivers/watchdog/s3c2410_wdt.c      Jingoo Han               2013-01-10  638  		goto err;
^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds           2005-04-16  639  	}
^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds           2005-04-16  640  
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  641  	wdt->bus_clk = devm_clk_get(dev, "watchdog");
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  642  	if (IS_ERR(wdt->bus_clk)) {
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  643  		dev_err(dev, "failed to find bus clock\n");
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  644  		ret = PTR_ERR(wdt->bus_clk);
04ecc7dc8ee625 drivers/watchdog/s3c2410_wdt.c      Jingoo Han               2013-01-10  645  		goto err;
^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds           2005-04-16  646  	}
^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds           2005-04-16  647  
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  648  	ret = clk_prepare_enable(wdt->bus_clk);
01b6af91593629 drivers/watchdog/s3c2410_wdt.c      Sachin Kamat             2014-03-04  649  	if (ret < 0) {
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  650  		dev_err(dev, "failed to enable bus clock\n");
01b6af91593629 drivers/watchdog/s3c2410_wdt.c      Sachin Kamat             2014-03-04  651  		return ret;
01b6af91593629 drivers/watchdog/s3c2410_wdt.c      Sachin Kamat             2014-03-04  652  	}
^1da177e4c3f41 drivers/char/watchdog/s3c2410_wdt.c Linus Torvalds           2005-04-16  653  
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  654  	/*
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  655  	 * "watchdog_src" clock is optional; if it's not present -- just skip it
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  656  	 * and use "watchdog" clock as both bus and source clock.

That's not the right way to understand "optional".

5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  657  	 */
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  658  	wdt->src_clk = devm_clk_get(dev, "watchdog_src");
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  659  	if (!IS_ERR(wdt->src_clk)) {
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  660  		ret = clk_prepare_enable(wdt->src_clk);
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  661  		if (ret < 0) {
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  662  			dev_err(dev, "failed to enable source clock\n");
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07 @663  			ret = PTR_ERR(wdt->src_clk);

Delete this assignment.  "ret" is already the correct error code.

5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  664  			goto err_bus_clk;
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  665  		}
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  666  	} else {
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  667  		wdt->src_clk = NULL;
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  668  	}

"Optional" doesn't mean the kernel can ignore errors.  It means it's up
to the user.  If the user doesn't want an optional feature, then
devm_clk_get() will return NULL.  Otherwise errors need to be reported
to the user.  Imagine if this code returns -EPROBE_DEFER for example.
In other words the way to implement this is:

	wdt->src_clk = devm_clk_get(dev, "watchdog_src");
	if (IS_ERR(wdt->src_clk)) {
		dev_err(dev, "failed to get watchdog clock\n");
		ret = PTR_ERR(wdt->src_clk);
		goto err_bus_clk;
	}

	ret = clk_prepare_enable(wdt->src_clk);
	if (ret) {
		dev_err(dev, "failed to enable source clock\n");
		goto err_bus_clk;
	}

Maybe there is an argument for continuing if PTR_ERR(wdt->src_clk) == -EINVAL,
but I don't know the code well enough to say for sure?  Normally, when
the kernel has an error then we should just return the error code and
let the user fix their system or disable the feature.

regards,
dan carpenter

5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  669  
882dec1ff125e9 drivers/watchdog/s3c2410_wdt.c      Javier Martinez Canillas 2016-03-01  670  	wdt->wdt_device.min_timeout = 1;
5c0145c7f9262d drivers/watchdog/s3c2410_wdt.c      Sam Protsenko            2021-11-07  671  	wdt->wdt_device.max_timeout = s3c2410wdt_max_timeout(wdt);
882dec1ff125e9 drivers/watchdog/s3c2410_wdt.c      Javier Martinez Canillas 2016-03-01  672  

