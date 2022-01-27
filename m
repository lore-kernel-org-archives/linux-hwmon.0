Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF954C433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 27 Jan 2022 08:52:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234370AbiA0Iwv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 27 Jan 2022 03:52:51 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:48688 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233625AbiA0Iwu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Jan 2022 03:52:50 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20R6f2xS013145;
        Thu, 27 Jan 2022 08:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=ICKBLImwFhji5DQQF0bG9q6kutAgMoqliByt/x97xSU=;
 b=SXom/fnKCnzUWnKDoOSKNhgQF/ztvtOGdrRiZUQKrBDmvCL90x8hWbFahydK4QGkG0F3
 AXd8sukCMrLrjA4j7D+Z0bljsBasJOaGoCW2P5rk63EN8LHlEQcXOZZMLR7X7Wv5rXNl
 82wN0BYYa+rRd+J9CSHq42alAtVCjNVOhq0M/ZntUadr2uCjk9fTyI08f6tVs26j5Z4n
 t81SNb5lrNWrQ3wzQBXkfqTb6qPmWnlKx0RhGXJyCj7rlxPsC1RX5g4t1oy+IGHIKaS+
 cbGO9mKUT0IGycZ7sqdIT7egnE43WkoXpZRFP/SJMRHv2s5n2+EiC/gtnr8bM74ijnZ/ iw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3dsvmjh4ev-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 Jan 2022 08:52:39 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 20R8p3HR087117;
        Thu, 27 Jan 2022 08:52:38 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
        by aserp3020.oracle.com with ESMTP id 3dtax9y6pq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 27 Jan 2022 08:52:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bHlNSFB2Z9TOECAlghXxOxC98qp7Ri8u7deBfZa6VzDPOB1bvef+yMfNfbOzvYRU5gaXHEyfHTTMD491zz9UvqIyTVYmsfcAf8lD4KVrkwbS6UvapiAXe7PFClW8vEiln6C5Y7TANQPoM1PxT6Q32oQzJNsaK+PxZfzHkiN8J627+rXk9WafB1B10DC2CFa/LR03JIikp7LERcDMPjw6VOPf5vIhtALQdJaFS1JcvAEJ17bjztt7CuLSv1LO1IQ9soOGOCwbcfgDnj+Qj6DvZhdqnCxNOowT2mzmCaYta+pd9gVVeqyXgqPkJW0BTWVOSy18e1Fd98zDqN3RlwDYyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICKBLImwFhji5DQQF0bG9q6kutAgMoqliByt/x97xSU=;
 b=CE/2PKXKFADF1DoTzOuNIM1P7cmvwr+pOkHnkebjPdFxnIjqdHHLXH9ihOA/lZGtBI3LhY9ki1yUpOZiYVP1JsjKVJujGdM9hNATGh7VHN57Ho4he5my3mihovn3hxXCO1CsLgTAAZb+donP/p7mPOXBEQqnHI/ZMdfH++4MTcFkgstZhxMUDX7AKqTwfr1JDPEsOD255l8wZafoK4StQKiO/Oi7BvIvz1AjROOhXL5MEkrjMHN574SCqEEGSWRFaLf/RO1e/QcGns1Lkm3NxroYtQlTW5pKgt6LIfZRyKv8spu/z7od+rhdT33PgTqXdbuReGJUDQwwQFUsQRrWTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ICKBLImwFhji5DQQF0bG9q6kutAgMoqliByt/x97xSU=;
 b=pVkaLU9v2yH1/BnRtwMDoxiMV1gBTPBuKgTwDX4vL40H7PISADYa7Hw3zwhTGb8WQj9ghsV4mY1R/dP1t71YBUXnXNoKhIw6bg72DUr9f9P7/sJq8z/Uyl66i83IT6mfraAolaTox/qCru5r+vA4r9gUoa+TW5htgVEMBENcq48=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BY5PR10MB3889.namprd10.prod.outlook.com
 (2603:10b6:a03:1b1::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.12; Thu, 27 Jan
 2022 08:52:35 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::c13b:5812:a403:6d96%6]) with mapi id 15.20.4909.019; Thu, 27 Jan 2022
 08:52:35 +0000
Date:   Thu, 27 Jan 2022 11:52:18 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     linux@roeck-us.net
Cc:     linux-hwmon@vger.kernel.org
Subject: [bug report] hwmon: (lm83) Convert to use with_info API
Message-ID: <20220127085218.GE25644@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: JNAP275CA0018.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4c::23)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f85a8491-a83f-4f36-e4d0-08d9e1725d3c
X-MS-TrafficTypeDiagnostic: BY5PR10MB3889:EE_
X-Microsoft-Antispam-PRVS: <BY5PR10MB3889A338D81D76CB7FB23BD28E219@BY5PR10MB3889.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4dPJ9sr0+u08ycC+7fbK64ubN/JOHjocBv2UFiujXwA5WZN8vYFFjzxt/SU5QgHupLeE2/zvFofbT1CYnNEZENJ8Srh+NdzfBWuO6i4H1Am6KsL7clMzGuyMpWqz0liQdQbQpqwbp0yoVSrvEfhes8p6WgbjpSwfv16UMc4CTy+WK79ibHa9ah1Ds8w77/yD++3boIRmNqCBbOnhrH82Hhda1548XOnbQ6todPsGLt/s1KsfQZJR8zyus0mMbugRQK7pZvP+YLDck+8rGuMAb86oE/h3HbBPy+/hCAooWWw466l51K8HwLfbeR3POqNKU8fC+EnehEDUOPmrDqZHj4aklGqbjqN1kUrM4Es5/5FV0lq8JYuDTmDlFHbSQN9wZ1ykBGeLuvLxMGMPzPdscaCMsNvwWOjzN2dAbN3PYnDcVUnd6p6vTAijSR0bOKPfHViKzk4MS9MTiPrR1+BPQKUxJGwU8drw3Pf0sJ8b6QHUeqkFMzqeSfkCqqVLdPHxNFJJFI+n8LR2QFlENQtYU6baQ/lWDs/NPCaHc6kd7nuLwVHfEcwq9n5CfW+fBaQTD/3V5G3e6uUfTU+ReReQHypDdqPcJh4oobleXN2+AGIY/hFJSIcHwHqTJj3onEhnSiAn/HOVdt18r7BEKz6+ophrGGjzFbioCKUrw7u+egdwCYDemIbUEjRJeVoChbC7WYEbDYnI3hn5PIldAT5CAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(366004)(4326008)(6666004)(38350700002)(8676002)(52116002)(44832011)(508600001)(6486002)(6916009)(5660300002)(66946007)(38100700002)(186003)(33716001)(2906002)(316002)(6506007)(33656002)(8936002)(86362001)(1076003)(6512007)(66476007)(9686003)(66556008)(83380400001)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RBt/I3Ugu/ODsw28989gMY6X8VpQgqe4x0LZgvuTa2pk58Qmq3LyK9VeX9Ib?=
 =?us-ascii?Q?2cBzGEyBb/soEEKWv0LPA40h2xF8ckVVuYOzF06y15kyy4j7lu6P1MBzcYEX?=
 =?us-ascii?Q?LfKFd+BNcifXpi9QEWLw6ydLi8Ol9IR9VcZyXfl/u+Xp6IsSUUcGej+EAUBA?=
 =?us-ascii?Q?CNB7gN5Iu2WfC8WnI88KTbtttlvDm/VtkDgOFMR12uSE96wdsJambGI59vJ/?=
 =?us-ascii?Q?q4TIXD5dhzZx23OA4OEwt64V8oiPCQ7lM0AgGqyQz65YzOEFczDW/5/5U/8p?=
 =?us-ascii?Q?tH6aOd/5vBGnzta2LbHqT2xmjdGuqJ4zVK+m4kK6rVpR6vRLtvpDxErP2FGh?=
 =?us-ascii?Q?R4Y3igCpUFpeK3I6o5bNOwl4Ek+CTRpWidg6uf+3FOQ7nDa0cwfy0ePVOCkq?=
 =?us-ascii?Q?kNWPE7W7ZsxfEjyd/JdcARZ//3bTisFS7WCeXYr1nY6T3iqp7ojfzQNKwHJP?=
 =?us-ascii?Q?6vkhQlsg2oFII7U8OGXEmmmfEAWyHS16B4Vn5O2fUJ4MDJnz3rMjS8tledIF?=
 =?us-ascii?Q?CzytoneJROYgcKU2qYRbT2jeCh2j48ib9524Wo4l3NiUfRMCYjSq4RFAUywG?=
 =?us-ascii?Q?8H6I0PKqqG5SeNWhQ8P4rMDL6h8cgC28W3+0ztZi4D7/BVuPTy20j9+yGEVp?=
 =?us-ascii?Q?2UyuzWkXws22FCl3y7LKJq5dOfKPNQ77vyUuLql9ULhpwc1nPSVrATntJhBk?=
 =?us-ascii?Q?PWXTioJjPctphUJUttgC6m81hblLUpZ5VGH8OKoZnxTw87WdLcvIYIIPmKAM?=
 =?us-ascii?Q?bNBFs9eLydWs9StUnFNHUzCJ+qr3yh2fPEPMbYqMTfdHp2GOPZn0j/90oz1v?=
 =?us-ascii?Q?dZUBSLcACd2t66O3I5iuzgaQ6JdA896iUjozFIab7v0+w8KdfxQkiMycUX5G?=
 =?us-ascii?Q?pxqZsexQyDWdKxtHjPZnJoKrclPQ2yfszCvhvLhauDDTPDvAznNvmhpHo2be?=
 =?us-ascii?Q?ACXzLddQQ5nDKrqg1mbZeQnuP+i5Q2SZmFUAxguFeyAaAh3GjwYCJ6jZwsVn?=
 =?us-ascii?Q?NrYO8rRWwYZUD6BJfhJiLGiDbQi5kuUtVloKN/7Fa4Fm6aMzKT7pj3N490b7?=
 =?us-ascii?Q?99k5ZhsrOiqquQCazxvDZ7d+ZsKvD0lY+dJ/90XdfmusXAvhUgPOFxu032kw?=
 =?us-ascii?Q?H8UZFaysCyvMuuFfIVaqhQ5kfMjDnS7tzXfgRPk853EQhQBpCSAUgXqEAM9o?=
 =?us-ascii?Q?eTOdoVP3g/JPqslTPtmvNEHTnfGzJ4HJ+i7p5p46BXaUPXMCn9CtBYIv71er?=
 =?us-ascii?Q?1ymWE1o8YJ0a2KvAOi61TeWeH2x7C89r07NZky4DIL6xLrxOk3miHh/LutXx?=
 =?us-ascii?Q?HJNRYwBml0VGkqyHOGt2Uo7A1h/qLw57rlNra8w6RlVrGfgTq+6G4eqVx2BQ?=
 =?us-ascii?Q?blObjZSmMLGDXw6nuGrFcrVYJAt9Q0odLVHavHa256yjmPgjr5NlMaCiuncL?=
 =?us-ascii?Q?dVT51/lQ2zWvOMX6cugDeweu2WZ8uoh/O/n5i4skGY+zsAFT/L54hE9AsTRR?=
 =?us-ascii?Q?uvrTd9+S1yk3PiSUMrnIrjNdPBECt7wKWHl1yvzPP7tc9C2//j/y7F6Ux3Ze?=
 =?us-ascii?Q?rdiglg2BW2QLxfIWJ9Sc7ZR8S34M5aT0+4M/2/1xY4Ge34uCYg+qjiBlEjZb?=
 =?us-ascii?Q?jeLYRP1Y12ld7gNtc1KHga6gkqMfEGIuKS5zGPtzqhbOKi/AlcXJtyouG4zi?=
 =?us-ascii?Q?zGdM1yIWi4UbyqN0s5GIctlgH+A=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f85a8491-a83f-4f36-e4d0-08d9e1725d3c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 08:52:35.7522
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iUZ/ogLT/RbX+T3lFPVbR3l0BQrN91iUAaxovqDQFsKUs4skm2uQOVWQgfYduBDlL9QzT0/+R4GFpxKBZimBl5hsKTfgIrI/E8D+E5RpOvk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB3889
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10239 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201270052
X-Proofpoint-GUID: o9nAnqS0scBKn0tleYjPLBmWIfeZPpeR
X-Proofpoint-ORIG-GUID: o9nAnqS0scBKn0tleYjPLBmWIfeZPpeR
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello Guenter Roeck,

The patch 1c8467e8e8b2: "hwmon: (lm83) Convert to use with_info API"
from Dec 22, 2021, leads to the following Smatch static checker
warning:

	drivers/hwmon/lm83.c:337 lm83_is_visible()
	warn: signedness bug returning '(-19)'

drivers/hwmon/lm83.c
    300 static umode_t lm83_is_visible(const void *_data, enum hwmon_sensor_types type,
    301                                u32 attr, int channel)
    302 {
    303         const struct lm83_data *data = _data;
    304 
    305         /*
    306          * LM82 only supports a single external channel, modeled as channel 2.
    307          */
    308         if (data->type == lm82 && (channel == 1 || channel == 3))
    309                 return 0;
    310 
    311         switch (type) {
    312         case hwmon_chip:
    313                 if (attr == hwmon_chip_alarms)
    314                         return 0444;
    315                 break;
    316         case hwmon_temp:
    317                 switch (attr) {
    318                 case hwmon_temp_input:
    319                 case hwmon_temp_max_alarm:
    320                 case hwmon_temp_crit_alarm:
    321                         return 0444;
    322                 case hwmon_temp_fault:
    323                         if (channel)
    324                                 return 0444;
    325                         break;
    326                 case hwmon_temp_max:
    327                         return 0644;
    328                 case hwmon_temp_crit:
    329                         if (channel == 2)
    330                                 return 0644;
    331                         return 0444;
    332                 default:
    333                         break;
    334                 }
    335                 break;
    336         default:
--> 337                 return -ENODEV;

return 0;?

    338         }
    339         return 0;
    340 }

regards,
dan carpenter
