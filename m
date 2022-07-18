Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD3D8C43334
	for <linux-hwmon@archiver.kernel.org>; Mon, 18 Jul 2022 13:01:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233162AbiGRNBf (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 18 Jul 2022 09:01:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230179AbiGRNBb (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Jul 2022 09:01:31 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7C4D959D
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Jul 2022 06:01:30 -0700 (PDT)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26IB3xAR024725;
        Mon, 18 Jul 2022 13:01:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2022-7-12;
 bh=TOM5p33+jtHpyU/9L36H1n6O2xFe1wot6vn9kW3uktE=;
 b=Bz8/ZJC+jmyyds8UKGvrehG6fgaZLxgfFxp9YAvBcCEHHXx1d7XR+embTjhhBIuBo4vz
 1//4hQTRFk3DnjOr3Bdq0VV9/XL75/1bID8MsgExiQ0LLQogHt1cCIywreLWkwK1aET3
 uNPEcCgSVNlHDQhVDsvQXW8J7s8nfVZ2DkeM6oXQga9uRR+PZ6305Nx7JuMkftwi9fqH
 pD+A5XAmKv1l5t6TPWb3bsqMlNn02U9N3w015UzPlpmTknxVVCncmblXLdPfIXJtV/P/
 vYGbAKJU6vA7Op/E0E6QxJjioXbB9NFdkqiC10jGNvKO9Cp7+GZbLKVk3yDF92UUcmWO lA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3hbm42b6vn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 18 Jul 2022 13:01:08 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 26IB55tG002105;
        Mon, 18 Jul 2022 13:01:08 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3hc1hqyqk4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 18 Jul 2022 13:01:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E7LJ63eGHuSVtoOlUP0IMiM0TKey4I4HV/fFgGCvtdQQZY/QgzPT5bejIhmGSFVyAiuKzuTzb0IkMD0VAY8MyQpX8N0FOw013USYbjFEsIen3vTdKyxKf4TpCbnmUaQl7k2RgLKfw/rk1bIvC/nd+/xo93hTgVcWDB1fCJxwxAuL4tOaNPDZAUVNBsdDfrfDvT5o84O18JvgMI7yb4nhFgTgyw51NaM0vlio/KY98za0zsfNX/2ip5KbFmdC/s/BoVMdpzeA7kE/hWBmP90py6nNDzX7yKgYcHeia/QwIme+0+HlerXJrJAOYL2p8kMJSdr8ORWHn3JA/LU6iRhoLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TOM5p33+jtHpyU/9L36H1n6O2xFe1wot6vn9kW3uktE=;
 b=BYtIkfSY1ABLxUsIkfGeFj/zYJr7vkdivLMkrc64EJf5TPzFoC/IXN680/kDeaz8B9TLOKu+nHRBknkNH2qQt38YQ3rtAUmefho1fs0bZe2BePKhdOslWm6qrnl0RKmHs/uezvb0CUrQgIfFN9vYJ6L9cABX+guNaaGyfgL/z3NhStiaufkAsNE/7UzT1DQVNzJHADdMkrOsoF++UlkGexD+pd8GnJOOELH5pQJg/cgRKAS+5GmvKwx3JUt1gpP3kH1bZbdVHsoXFleTWrRaJK8DeIyce6iyjylqc2BZTPejat0FhCBs8WI6IQAFObc6UMkRLd28la8LX911/JSZxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TOM5p33+jtHpyU/9L36H1n6O2xFe1wot6vn9kW3uktE=;
 b=nLuczj8LmhnpFYb6wMtkVeBHmCNpbAyY+bz6mqtAzBmvadqa27OjwiSZtOFrYkXkCmVXCcy2m0RY9h2Lp2YllRKMAzx7mddmh86lT39rElaKUjV+17NdIf9ZbRDGY0/JBgjOiJKgtfpucfk5RbuHeD1FFwekEUh6X6EN2Ib9uqA=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BYAPR10MB3061.namprd10.prod.outlook.com
 (2603:10b6:a03:83::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.23; Mon, 18 Jul
 2022 13:01:05 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5020:9b82:5917:40b%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 13:01:05 +0000
Date:   Mon, 18 Jul 2022 16:00:55 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     rmk+kernel@arm.linux.org.uk
Cc:     linux-hwmon@vger.kernel.org
Subject: [bug report] sfp: add SFP module support
Message-ID: <YtVZh357cANVAxey@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: ZR0P278CA0029.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::16) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 908e41e9-d977-4733-a0b3-08da68bd9292
X-MS-TrafficTypeDiagnostic: BYAPR10MB3061:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wA6qdaYfosxs2mgSMELLU9PAeo1nOnjAmFJ5jp7lCtmD5crPAYwfUqgwBSirplY/3+NnrKPi4cKbJGiChkU1XhsB8Z20WFg0jTkCbUAs5g7TEbnbymWirGWfKweBOa8YJfpiIuTyWWqT6wIgXyHZy5Q3TpIDHOIJTr2SJPYprfSqDSPvb/vMb4HbqKG0cdYgchPkG11PGh+HZYHkaD6VkRUKxXVZicTeJHATavfpJdf/jKO9UNogGB4XaNE1AqSI+nxbvonIbWbNWVtPjDniflHOE2o9gdVrluSKH+x9CRbE51jamKilmTwgca2dtOigP9Sf0CXXjaqYQxhscVXU1G0Wkcb0iFcMrqTp7VMeudeH4TslfKO6SBpvH/6rBVUEHTq89kQHOq5SD8Uhu4IeV6kGOz86qQugJNL5eX8YuVmwjH473/V2JUV0Wr7Y5QkcFHT+BtF6H+vj6LfPmjPzJek68VNjT46DOA9RzYRYLf+wmJimtJAyeYFHD9bb0iPX8AsY147O2XypTDaof8PhxbP4h2egS5fQPujV1ZWOzKPjc5fAO6j5iXmmt7PAM7iyEqDTfSM2uCntbLywiEn3HkbEOv56GFnHryw+1CKHJfsNZICtoSZLacLfkevigPflAqeF+bLWePqkGxQM5FD7xjmooNnBsb5jak9ivCZsu8/bQrPgMHNC8K8M5MxkS82ykBXVdiSNG5K5mgngp55Db1W6g+YEbVxy2DUXSafrAdU9yYp6JZGfllWoWZfQeMhVQj5PRTqs6JBeSc+Z6n/0/LkKXJJD3jjSHYu+vEE1zJFNuJxtlLVjxt0/CLiHSgRJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(7916004)(136003)(396003)(346002)(366004)(39860400002)(376002)(83380400001)(186003)(4326008)(8936002)(66476007)(5660300002)(66946007)(44832011)(2906002)(6666004)(9686003)(86362001)(33716001)(52116002)(26005)(6506007)(8676002)(6512007)(478600001)(41300700001)(6486002)(38350700002)(38100700002)(316002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s+NLj5qwEOUngq5ajXE9bgmxkUhBiMD52Yy8EuUSdJ6LbkXyPyvrgySJLBrV?=
 =?us-ascii?Q?vFjSTHTiBsU9Md84bYuAa7FmvG9InmGaJCOx9/r/Rm7FT8hUXXuTuuWfRjXV?=
 =?us-ascii?Q?R+Y9ckA9W2SkS5vgZMZ9XkBDpIU8obyaCG0Q3vG9gNXF/9UILfh6MdCEXzs1?=
 =?us-ascii?Q?BiF6thX0XxHn4c7tI8lVikOLxun24UMLmSmjT01XwdWaonfQZbOoSCB4lXUi?=
 =?us-ascii?Q?6pDmKo205MSJVr8IuP+9mmpXwim23b3t5eMM1tt4Mn10QhHoPJtRaETXvHof?=
 =?us-ascii?Q?u/46fxzvPGs88/DsO76wODuUQu4xyRjEk1/O/b1nlx/zYu3LFn413MyCQWLa?=
 =?us-ascii?Q?ABYUWcYitgrw/p11/TDpRfJN8Dk0uCy+LihrwTLMg2YuGlnwr8cwL+sjKCjn?=
 =?us-ascii?Q?CRMdpy+0OlyxxUg1QeA7BkJKrATlCfWYxYbQteiovQ3FCbawIHxFFf0e3Fgk?=
 =?us-ascii?Q?AR0EJFjUgOO4KjXOqExpWRC1ztJB+sgpwxXJBqtc0tZoaG6o6+Adr8Zlk3Ok?=
 =?us-ascii?Q?4SMRgqmVHCYKwo5mKQ4GPy5CB+ir3HGO9wOfmSKfgUfu+utdumGt42UN1+wM?=
 =?us-ascii?Q?kp0MdSV12KKo3HbNl3+teQef2Gr2bGY0RxusKqMGI6beEp7d4H04v3WImtp2?=
 =?us-ascii?Q?Ln/9uX5rKnuMhwzF27Ee1diz8rnhywLXtY6Cmqf/khuykYRmovyeXKQ/TXm2?=
 =?us-ascii?Q?cinr8zhd1ajVgA5NvQLQ2IOkcVFk73xGVqSg3kgOkDECVbbtAkBmfbaxgUDG?=
 =?us-ascii?Q?ANNu+r4nEXQk5ipArq9JxcnDvL+evlzHf70P1KcYpKMG9w+vdav8NVXpJG4S?=
 =?us-ascii?Q?E8E7Edhcb4UCiX3fNZTYCfvr4Zg4sRH34qnvsQRpPPoL1AU7/tgJfIMP8bGq?=
 =?us-ascii?Q?gaTTgnyW+zMpqsa9q01hukm4NGEYz2h+C5wD2nEQAlghK/nHxmrylMbNRyjx?=
 =?us-ascii?Q?eLCqcMH2dsZ70vNuwT4EGt8IF3YHVzemjD0sVZZJA686hqoR3PQJW7KRLGWx?=
 =?us-ascii?Q?Z1KtOBXlicOm+lzSWMnixRbSGMkAGrYeGYLzHL/Q1/yWubpJOR+6DIoltkC7?=
 =?us-ascii?Q?5udF+quOA1swUEXxIjm2504NhJt4VBrHr7sVIH3pZXcTADfw2V9YE2Q7r9I/?=
 =?us-ascii?Q?rtzMolyzrisobfoN5u5T1bcb5ol27YdppFZgpvAJTycNrjkIA7XHP8oF/B2R?=
 =?us-ascii?Q?K7PCTzwPWvArelIMKo2WNa33TRfFxYSS2Bywvn0YfKP33cO70McR2nPbihvW?=
 =?us-ascii?Q?U8NpJgEa2fczcJF7tjc+ec0UFQQji9xlOuRpx0hbnX9Wuimgd4EL+2fEhZeC?=
 =?us-ascii?Q?SiVQHyC8gACttTD9sL955rew+cghpUfIp0dhVKu07j9EgTENqFVdmKlJT3Lc?=
 =?us-ascii?Q?ncbiq29kzNAmDGMRX6KTg457kGRytiV7br0kuyBmbArI/YclddVJdsY7Ofjw?=
 =?us-ascii?Q?3cIVgn8Lp5E4rm/K/k0bfaABMmOKgaT3VDveqYmUIaBrMTInvRe3Vmz76hfg?=
 =?us-ascii?Q?fd5fx8RSg5LdZM0+shbIrOS5aN2iAtmV+EIQcqPAU6+2AlMceEfo6Z17bn+W?=
 =?us-ascii?Q?Ov5oDwQS5CVd2vb80uHx7tL51JA2vNjOy+IZdmc/FIfDOADKBNUjzf6pzb+U?=
 =?us-ascii?Q?Tw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 908e41e9-d977-4733-a0b3-08da68bd9292
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 13:01:05.5723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R7hK2dzqBVcwFT902REku3U1fl4vlYaypO9vpCNmNtitHRpEHforhHDUv89yYnAFUwjFph857pZTZO6fDC9GUj44q/RvxzObuxKu+B4H5JI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3061
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-18_12,2022-07-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 malwarescore=0
 mlxscore=0 phishscore=0 mlxlogscore=801 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207180056
X-Proofpoint-ORIG-GUID: b5SZ0fwGe-fAhMOol1TqV-ysEm4fN8Z9
X-Proofpoint-GUID: b5SZ0fwGe-fAhMOol1TqV-ysEm4fN8Z9
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Russell,

The patch 73970055450e: "sfp: add SFP module support" from Jul 25,
2017, leads to the following Smatch static checker warnings:

drivers/net/phy/sfp.c:474 sfp_soft_get_state() warn: passing zero to 'ERR_PTR'
drivers/net/phy/sfp.c:1710 sfp_sm_mod_hpower() warn: passing zero to 'ERR_PTR'
drivers/net/phy/sfp.c:1728 sfp_sm_mod_hpower() warn: passing zero to 'ERR_PTR'
drivers/net/phy/sfp.c:1781 sfp_cotsworks_fixup_check() warn: passing zero to 'ERR_PTR'
drivers/net/phy/sfp.c:1794 sfp_cotsworks_fixup_check() warn: passing zero to 'ERR_PTR'
drivers/net/phy/sfp.c:1827 sfp_sm_mod_probe() warn: passing zero to 'ERR_PTR'
drivers/net/phy/sfp.c:1854 sfp_sm_mod_probe() warn: passing zero to 'ERR_PTR'
drivers/net/phy/sfp.c:1903 sfp_sm_mod_probe() warn: passing zero to 'ERR_PTR'

drivers/net/phy/sfp.c
    1767 static int sfp_cotsworks_fixup_check(struct sfp *sfp, struct sfp_eeprom_id *id)
    1768 {
    1769         u8 check;
    1770         int err;
    1771 
    1772         if (id->base.phys_id != SFF8024_ID_SFF_8472 ||
    1773             id->base.phys_ext_id != SFP_PHYS_EXT_ID_SFP ||
    1774             id->base.connector != SFF8024_CONNECTOR_LC) {
    1775                 dev_warn(sfp->dev, "Rewriting fiber module EEPROM with corrected values\n");
    1776                 id->base.phys_id = SFF8024_ID_SFF_8472;
    1777                 id->base.phys_ext_id = SFP_PHYS_EXT_ID_SFP;
    1778                 id->base.connector = SFF8024_CONNECTOR_LC;
    1779                 err = sfp_write(sfp, false, SFP_PHYS_ID, &id->base, 3);
    1780                 if (err != 3) {
    1781                         dev_err(sfp->dev,
    1782                                 "Failed to rewrite module EEPROM: %pe\n",
    1783                                 ERR_PTR(err));

The sfp_i2c_read/write() functions return negatives for errors, zero for
partial read/writes and len (3 in this case) for success.  If we have
to bail out at this point, the I feel we should return a negative error
code instead of success.

    1784                         return err;
    1785                 }
    1786 
    1787                 /* Cotsworks modules have been found to require a delay between write operations. */
    1788                 mdelay(50);
    1789 
    1790                 /* Update base structure checksum */
    1791                 check = sfp_check(&id->base, sizeof(id->base) - 1);
    1792                 err = sfp_write(sfp, false, SFP_CC_BASE, &check, 1);
    1793                 if (err != 1) {
--> 1794                         dev_err(sfp->dev,
    1795                                 "Failed to update base structure checksum in fiber module EEPROM: %pe\n",
    1796                                 ERR_PTR(err));
    1797                         return err;
    1798                 }
    1799         }
    1800         return 0;
    1801 }

regards,
dan carpenter
