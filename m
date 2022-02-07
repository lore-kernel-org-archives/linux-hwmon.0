Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D270C4332F
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Feb 2022 07:24:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232943AbiBGHXO (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 7 Feb 2022 02:23:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240569AbiBGHLb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 7 Feb 2022 02:11:31 -0500
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 844FDC043186;
        Sun,  6 Feb 2022 23:11:30 -0800 (PST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2175jO8x007408;
        Mon, 7 Feb 2022 07:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=YqA3/sh+nO/tq2TPtFu6KJZQSujYSuG7fb96tvSzGD0=;
 b=p1yAacLWJ43zP+NX9w7O6xYtm0mFfoSpNbwBDhvUC2OipQA3bPZJch1s36xlckhvosT4
 ehKZGRdb52zQayTZ5daKQXGffttkCBreN5p83L0/fkx3Hi7PTGHh9t/xlvWZD308dqVI
 FS88TIcMeo5ov57UCwUaGxVlpqqj7OtuR17lXqY/O3oR3E9m1Rcza8nlqPRm3NOE6y0P
 PuAKxG+Ck3qSJrr6E4/EidpOQP0ItCfDYC42ZIIxBvpB3EfG9q0wV2i3ShSISuI83ZAk
 7/tCjTslx+PCHNlX9BzDrgqM5eDMJw32nKsZAWEKaNVhkOLM+iPNdEvVWYwN2VPjwmRV DA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
        by mx0b-00069f02.pphosted.com with ESMTP id 3e1gusw35t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Feb 2022 07:11:13 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
        by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 21771oK0176256;
        Mon, 7 Feb 2022 07:11:12 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
        by userp3020.oracle.com with ESMTP id 3e1jpn0d2v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 07 Feb 2022 07:11:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k65Aj3NbnNH6YO4cbfhw3bFdjM9NyCl627ZAaoNHVlPujJtBCBmQ1ohxgSYel0n+BSrrGhlF2bCQjkmE14W394uDzRTSIYRW6tfxvPEuglNVOGRI+7eAnIPpKtmcsXnbApBEBWQa3NyrlMdIdGKlGY5asVUQmnbZsiz75gfnDcl8+jExEsPOdTpag7OhiVsyJqCX7+EetyhwX5ld9wzfVVpJdYi47Zx3OaUDzi/BOwFlV5sjnkZokzkcjADiMlIVnXCF16eT1gHPe8lCdYv2eK8BTUj43pVOHT7OFUfDmy5snkEiykUTJVsIKT2agTyTRsd6ARPoEsvAZOCRFlQ14A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YqA3/sh+nO/tq2TPtFu6KJZQSujYSuG7fb96tvSzGD0=;
 b=LrOeKtbzwscgVSsJCJGRymUDs6bIbstL/OeqiwXvyAedXwve5ACLyw0HtIMCIKsujlpNYnbJNp49DWPO6qF4FE2I8XX9yMbfUWRW2cM8VeQ2Etf9dPirOfk3Uvzdo/eFEwe1TK4ynfUujCNUmRkIm96pt42wCV8c6WcDYzXLXvpe459e5Kxl+mxgJyuNC80jP/1Cr4Y4+lyHjf3peo2HhLgG4qbK8xjrdyARP0o4J3+yE4hAT30QLldrA2FMuaScOhWYFL8JzTwlYT71eqEOb5khgDU9svI/A5Ww4VxkNC/TvklgPbMpCS2VPfSDkESA0ryrRv5NVkmw1X0EWKjB2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YqA3/sh+nO/tq2TPtFu6KJZQSujYSuG7fb96tvSzGD0=;
 b=LAUGUzWXiSHmAFZ/o0cT7rzQxM5ehrS1vrKpQWzyZtX/0d0ny1naXOZjZtLvJndsXKMRwDo8DbyvCaGqfuqWbqENfqGXUurD04Krk8wprZQJXX4HTyJII22pBWqH8aCvnm8nMFwGZToIfxu2zXooA+Tb7VElqa/Wa+xirXLVsBs=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BLAPR10MB4852.namprd10.prod.outlook.com
 (2603:10b6:208:30f::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Mon, 7 Feb
 2022 07:11:09 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8%5]) with mapi id 15.20.4951.018; Mon, 7 Feb 2022
 07:11:09 +0000
Date:   Mon, 7 Feb 2022 10:10:50 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Eugene Shalygin <eugene.shalygin@gmail.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) fix a typo in asus_ec_probe()
Message-ID: <20220207071050.GN1978@kadam>
References: <20220205092015.GA612@kili>
 <CAB95QAS8LxMeWGFqZ3MGHBBxxBafz3w9L1GxxdP16XjZKLVAuw@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB95QAS8LxMeWGFqZ3MGHBBxxBafz3w9L1GxxdP16XjZKLVAuw@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0033.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:2::21)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2aa1fbba-8475-475c-51e9-08d9ea0903f7
X-MS-TrafficTypeDiagnostic: BLAPR10MB4852:EE_
X-Microsoft-Antispam-PRVS: <BLAPR10MB4852341B9E6FAA031C6A7A588E2C9@BLAPR10MB4852.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vWHztuG7a7meIcDmKmFnyla5SN54LfuUnNqGLTVZ6fLr9NFOVgBnoct3LhcjKj+dedVFI6MHZJk/kAUR51kdwl32C35HFMCCNUzch+wPIuqmXL/NtjO4JthLjBYSrKRhGV5vnQhw2fqAMl773WWUtftVhOi2xjY/uXtCVd5Dahve2gPbpnJjVoOWKnATxDzaYxv6KpCDQbqDhySmVX6kITk2Yso/T5RvaBP9C2DYKcGx1EXfnVXX4wZUpe2/5jEbLEQDbDOT35vc2QgCJlSTN0FIiZCaVsZcpytixbarGwv0ZR/6wp+PL+eorsyptDXp130XqgGl9nw4pBEZwmeugtxflw9vg/uc7iwROSKC+lgEZ5QcK0RwFcxbSn/FIFyTbTpy5CHZlLsWySOPbdSenxjI7mwpHoujl0PPd8kloRIE1CHD9Z6jqpYpyX+NxWrqAA4vytJqcyqRcOw0iLOKPH5D2risY+jjv6fyUfBPFnegdEIqaz6XdZ22oV07uMo9aRkQAqNRSaGE40GNsy+E4/5j5YipRxQhkF9NcX89GzKglKqLaLwwda24JnsrKJe5bkjS2sPluNot5Dk7BibYw8eDJH8wLIwdO0ApSbXS7pVVq6gOxKw4hz+Dgcljwk9cIbGA5wjUs3rXWYVhddAf0EiOnylrNT+nuOhrZ6yR+Px6OHtWA/EIrt6E0R6wUU//Nx62AAtvhPL4s19pgx/W4g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(6916009)(6512007)(33716001)(54906003)(5660300002)(44832011)(9686003)(186003)(26005)(1076003)(83380400001)(316002)(2906002)(52116002)(66476007)(66556008)(8676002)(66946007)(8936002)(6486002)(508600001)(6506007)(6666004)(33656002)(38100700002)(4326008)(38350700002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VbWsDpdpIxTVGknDLMk73w/aZfeyaTsyCoq1h9CuwGn7KYlcgy56wClSzCKl?=
 =?us-ascii?Q?Im4ukSva+RqMFmQcA4UafNgnR1GM+L1K4tkisESFzEvNAmKfqNSfbUxnZTL+?=
 =?us-ascii?Q?r0aGlBvcEFF0BEzBJCKSGx2VB3dN1bSVaudo65SYbzMRrEt0Lnp31G6BdhAD?=
 =?us-ascii?Q?y+UYIPSyBAZVagv1Vi37p+QMlmvAY/sjASFGdIvgBsK04juX3Pf79pOekPam?=
 =?us-ascii?Q?IDASNQoErbR7u77bX+NSqQtjHfW5iefyWBlpuBGveFOFo1ieyub6RV8zPB+Y?=
 =?us-ascii?Q?Qag2N4cvd+sIb9NVtsPLW5xL7RFkKSQ/GWmzuMK2eIfeRVdu7umiMxGy4fwj?=
 =?us-ascii?Q?bhhK0ouYZF/+wXlTcuXO9JBxUXoXVtLz6WSc0SN16EciwFfonaGWni/3nu6R?=
 =?us-ascii?Q?2nVcdPZXg13NN80VgV34LcvxMMj86YI+3ECVdiy45zPWrXmKhyGWgp/pY09F?=
 =?us-ascii?Q?kAXXsWLPLWLuQumKx5TL+C2pYM6juOSCqUBbk5HYeY/kpSGPb3/nZTQd5e1m?=
 =?us-ascii?Q?1YL5p0p9JTVXfLUMBIWnFkXT1sizIfZ+Cp82w1JNicbGMSgiplWwaRDRHRtl?=
 =?us-ascii?Q?0lt3RcZ93JUGJJbyi+KrFQ3tubrb/NRLSnrW/7Kr6DwNzDvBTJSeNHG3sBK5?=
 =?us-ascii?Q?G2/hidG2SA/FNN419CddeDl1z0OWRXAkUDmRbFpey+OUp+74FNPxTtZgMl3X?=
 =?us-ascii?Q?XhT67aaiVRCDdZSyACt8NKaeqVOy5U5/+Hr49uh0TzMVE2AU3Ce15OD+dE2D?=
 =?us-ascii?Q?EiJ0LymwtCtmYRqLCzPXSs8tu2oO/88LbqTX486WlUHUjWxC+Y6oteA4Kd4x?=
 =?us-ascii?Q?HK6tRhVl/7eucbN1nhfiDpr1HjRDia6a2AHz3Pc9R1gMgvyQ10shvhmKEyY+?=
 =?us-ascii?Q?xXG8svSLKmo/2GPYhR5v5/e3Z2FENz9mIZKbmzFbUUzi7PFCi+J5Nw343wAI?=
 =?us-ascii?Q?ubZY11KtrmdRFRZEm41MrYa3scI1cy9IKHgYZlBDNKd93pHdTB9Nox8bVbLd?=
 =?us-ascii?Q?QL3DHzPyEzLohGqUE44M374APmwDgPie/yzRT84lj1d+1p/gAmDtHJZohtLc?=
 =?us-ascii?Q?CQwoBjOysy4bITAR2o8suGZyPcOLQG9j3+csIzy1FwZmtAMrcb5WL8LE1Sow?=
 =?us-ascii?Q?jkOZ4ycAyEJ+V87neEtfxM0apTaY7r6gqqKPG69FlVwNwcctJR/IHUYMyl8O?=
 =?us-ascii?Q?sM8lZE/gQj4pAh1vL2dIZffpunOcRwEW1J0qOidbddsNjA3rSM2St9sg3WU2?=
 =?us-ascii?Q?D/xEKWDO7C5Wqn+NwRy4edyg9/4PHa3Fy5SplnqL5qH/AhYwkdM30v6vQq3A?=
 =?us-ascii?Q?4ua/637PeoOCVYOIQnAX4E78vbwASbUKdVeW4sSyvDHLH5EjkXr5IzsyVTY+?=
 =?us-ascii?Q?z1xrWTnDj5GVLkYMVje2FSkoR/X9ufhwjOJTLSAqRniRdh6ZpHoGuhP1UagY?=
 =?us-ascii?Q?jJfnWebYMfkp9kEtozoQj/1/8VgAaiKIhOoFb96nJoXhsT2HwDfXg2WU+n09?=
 =?us-ascii?Q?29xaHxl6Sj9f/YEPdjSRNY3fi779aiuxpn8HurTeUT7KO62iXt3adgXryOgA?=
 =?us-ascii?Q?+CQfx9/6cyw/I7S411uA6Vpa+oh4zDzQGqcj621KnR+jPJy6B0djpKDc4Ub8?=
 =?us-ascii?Q?HMRLUVWt1A2QEEP+aKjVNeYtu8pyPOtS6XShUs8n1cZqrBlSEv6Ci2hfnc85?=
 =?us-ascii?Q?7MKfXQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aa1fbba-8475-475c-51e9-08d9ea0903f7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2022 07:11:09.6936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /MFbGxWSHFtXyeOGIFgbMdoMgVRzrfBdheuc3yokU+z0gg7SIfarKkin8sdTd48d87CJOMXkuiPK2lsts7s+8nI+v/00VIZN1xbIUq1P4Do=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4852
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10250 signatures=673430
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202070046
X-Proofpoint-ORIG-GUID: PB7dVtTgYBmLQ1vsT1Z-H8M_3uBykQcq
X-Proofpoint-GUID: PB7dVtTgYBmLQ1vsT1Z-H8M_3uBykQcq
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Feb 05, 2022 at 10:59:10AM +0100, Eugene Shalygin wrote:
> On Sat, 5 Feb 2022 at 10:20, Dan Carpenter <dan.carpenter@oracle.com> wrote:
> >
> > There is no such struct as "asus_ec_sensors", it was supposed to be
> > "ec_sensors_data".  This typo does not affect either build or runtime.
> 
> Thank you for the fix! Perhaps you could also replace the sizeof
> argument below with *state to make the compiler check the declaration
> type?

No one likes resending patches especially for style issues that they
didn't introduce.

The sizeof() is how I noticed this, because I look at it whenever
someone allocates a different size or different type struct from
expected.  I did want to change it, but it wasn't necessary and I
couldn't find a compelling excuse to override the original author's
style choices.  ;)

The kind of bugs where someone allocates the wrong size seldom reach
real users.  Normally they would show up in your testing.  KASan is very
good at detecting them.  And we have a bunch of static analysis around
this issue as well.  It would be interesting to do a proper study on
this to look at bugs which only changed a sizeof() and see the time
since the Fixes tag.

regards,
dan carpenter
