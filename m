Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CDD5C433FE
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 Oct 2021 08:37:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 642AA60D43
	for <linux-hwmon@archiver.kernel.org>; Wed, 13 Oct 2021 08:37:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbhJMIjo (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 13 Oct 2021 04:39:44 -0400
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32]:52158 "EHLO
        mx0a-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229644AbhJMIjn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 13 Oct 2021 04:39:43 -0400
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19D8NSd7013091;
        Wed, 13 Oct 2021 08:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : in-reply-to : mime-version;
 s=corp-2021-07-09; bh=Dwq3qFzfAQUq5lr88O/ocbIJdJByoMF7DRZ9sCaJOk0=;
 b=icw5qa9Dch07O9KFs5ihzFo1Ns+FSLjtZ72TvT/mgIiVVVKGuje7d1Q+1elD2ZCT3joI
 tK6GIpBbYrS+ZticvGkFfA19prRqmUSqH6ciFSfH1KpnMiWRhJrQvDIgYWpbVEhAyTHE
 4PQRIwfUXwPYa5RB2G+1A5t+KueaLCPPGNuwwdRUReJxl5RzDgoKYVS5A6iNpPJqh/E0
 bH4HNF6eXoncrR6nQtDKYSmqXxGlFO0uDR6XekzkSuQA+UYY54pHqsnKoXlPCknCqBkI
 7mkZA2RZ+wEHrbGrOcj5fXGl3/CM63j/4S1HBaH6Oa32HWwOIAb60uTZYKzfU8hv99GK LQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
        by mx0b-00069f02.pphosted.com with ESMTP id 3bnkbmtck7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 13 Oct 2021 08:37:15 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
        by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19D8YnaK164898;
        Wed, 13 Oct 2021 08:37:12 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2046.outbound.protection.outlook.com [104.47.57.46])
        by aserp3020.oracle.com with ESMTP id 3bmae0dm5v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 13 Oct 2021 08:37:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h0d9tBkypDVJ3gWcQ3pSicynkMueZscryHOwKt033X8kYaUMc8LAzt0S91hhZvEL4qYPZ8WjArRAPWuHKKtCjdUD6GMpTzK7QJO9SVQ0WHrTpr3qYx8Jrh3SHADsaSzXf2yhx81Ap8ZyBEAoi4Thj1uYaZaGvsafUii1cQHSb0i2RcVuVNc6M3xrGS0WIWbmOZiSkZal+A3MTEPe4Prv0BNJ0xudt2gTXUNOarDgvffcbG4S34nrtoJiW4gOHzngQoR2gxt/orPIE4m5RzS+UHRxqJZsoo4nQ+azghSZjOI8CqD+sg+knHiYa5eG5Xl/xohN5g12hJau14WVbUThTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dwq3qFzfAQUq5lr88O/ocbIJdJByoMF7DRZ9sCaJOk0=;
 b=TTPxv3s3fmUR9U+O9BtC3lZmPde+GLIhbrVkYZ1IMgjJjs6sb7UEjkTicSMMs6Ow4gIzDfBeFW/9r4l5N9U2l0yXYOeeObNM4+qDGB1Mzcd5M/v1Fo7fZvsUodYb2UerNO8pIgmTXnf8QIwdNRVq6knVvRwFlLDZA4fH+7AafjxtaqB5lcu/UOhXWKv1jNye0+/Z8QEx0Nj/SGvq3uNLwc7YhdOz6AsnURSSKTpTgBs4wP9BPz31nhLTIAY7KiTJn+j1sJVOJHvCcFFdVpPjKt1873iWqM20FWX/P5Ib0DId8LTCjZpLxp1lCa3XYL4Wwq2iQDmpEeM8AssROXUDgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dwq3qFzfAQUq5lr88O/ocbIJdJByoMF7DRZ9sCaJOk0=;
 b=mU21oU3eIkUkprZT3kCqb+sUv/4Y0OAv1EcG3rOK/ZKIJPULnVweUhK5ansFuhXrdR9J5xAh/uQL5gL8jFS0+qf6q6uq/sLUgdUr6K9z8eL5FFOVK5gDyIeL2RyIh91N+HPlBBHWjYCMBwu80Zn+Wj2MO1/9eXX0IMffkJQGLnI=
Authentication-Results: lists.01.org; dkim=none (message not signed)
 header.d=none;lists.01.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2319.namprd10.prod.outlook.com
 (2603:10b6:301:34::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Wed, 13 Oct
 2021 08:37:11 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4587.027; Wed, 13 Oct 2021
 08:37:10 +0000
Date:   Wed, 13 Oct 2021 11:36:52 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     kbuild@lists.01.org,
        Krzysztof Adamski <krzysztof.adamski@nokia.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>
Cc:     lkp@intel.com, kbuild-all@lists.01.org,
        Rob Herring <robh+dt@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v4 06/10] hwmon: (tmp421) really disable channels
Message-ID: <202110130654.0li2Ip34-lkp@intel.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eaee0947c813b04b77ee8364724d1a406dccc33b.1634029538.git.krzysztof.adamski@nokia.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JN2P275CA0017.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::29)
 To MWHPR1001MB2365.namprd10.prod.outlook.com (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (62.8.83.99) by JN2P275CA0017.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:3::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend Transport; Wed, 13 Oct 2021 08:37:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e2f5d90-cad1-4c48-1844-08d98e24a5ee
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2319:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2319B10E19E94B015FAED6388EB79@MWHPR1001MB2319.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vEjA40E+mWAEVHDefzldTMmUsBO+60yhCYbj6F0kWDOi27WLGHUKwJNX/c0eNBBD01sst9EowTBhVKCNaW8JvTpi1iAJ8dK4A+osN10dz08ihTV9tm6XuDCyKhAxA+tzryepmdqqTjIacBZN2Z3I3zRTkY9YFP5wxeh01TUvyss7Ld2DJXRP36Wgfoyaoe/rYsntSumQ6eDXeRrXJKKJIrNNjN0V+yr39kTHDJnhpcyv2LAqcZhIGgIL+xPhrvZDyK+Pg07fDf8TaLgn0Sl3wAzLP+ZdhhEtkXJDl+sBF67Y9PyN+dPsrzRrXQW7kv0vtZWfx7CNGuBcRvmTCaqnyH1WhTaSsDEyQvqDcltofHmGXHf9SYncR69iY0ndBezmm8ZmjLys+PWx/tGw+W6yzlFvyhK6v4Lvu6B3LrpCIk+aXhBdS90eyv/Y+LdfXqoSzrrUbgXbP5L2PBPPsr7SB/1ZokzxxFHnca+POXKRk3pSr9/Z/kubKHNykbTKViRrsWUp1CB3mkGwO1QP5LIKdcPOB6YmPwsfJGSyMJG7XQ4O7Q1JevDoGPI1PjtJxWRKvrNWlyxeYp3FbK8m4m2hV86XnD8U4XZOwSo1372e2lLlsDOdKNLo6nVvITxRufVMnBUqtzCZoTP6QHw8hdns4UV51mveE+WD8w1UAJdY+FnKKAlgfqWTvw9IERXd5Ob7vbwd/Tpx0mxXaI4GoEERvl/VOTFaq7hkn/54/stY5BBms8zqkAQ11NU2sFwsdYVURETBK/0VsPY9M45epU1svO7cbEM00GZsQPZ4U2kQ78yPuGfGFnQzBCsAev4dcLWQ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(110136005)(66946007)(5660300002)(186003)(8676002)(508600001)(66556008)(956004)(9686003)(66476007)(6486002)(6496006)(4326008)(8936002)(38350700002)(52116002)(44832011)(38100700002)(86362001)(4001150100001)(6666004)(1076003)(36756003)(83380400001)(26005)(966005)(2906002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?H0Q3SsIMbRJVePcsjASS050zOBn+w6pOEtQBznyXo7WoQh1s2an6GObxijGr?=
 =?us-ascii?Q?0jl2fiNBYJ2lKatJTJP6eo/d+PYrTPvGbeNR5vzLOsKeUFq5JPxA8usYEdU6?=
 =?us-ascii?Q?1jPOto9BgWFj43O7ZemhLjcTW/ffVGDtjSVKfKAzWs2e/034zWuGKo7kI8hU?=
 =?us-ascii?Q?bMGmGPy4j0oPSM2pwGLN7Mn+0YD5W30CrU2nAli03FX0+ZsjQFItpCGE1E30?=
 =?us-ascii?Q?OjeGnPd9nKUacTUG55CeLQIQwOtgraQVSUqdlnWbyP7Y9n8sJ3qrzv9qyaT6?=
 =?us-ascii?Q?dgvVRds/ZfxTpSnyMN1OmOaG60Zig29uQE6pJmSLleAXCQmtYY2sdXWnrQVX?=
 =?us-ascii?Q?zg6Eu9h04Vqo/TQq28tyBkaWGYQ2CKSpoDcROUkTm3lV92LGYrIJDxxUflFw?=
 =?us-ascii?Q?nINqqBUMyWHlG8QJqqwfT+18t8Vf1YreBw0OsgG2kESDRRve6lX05h8cKQ/k?=
 =?us-ascii?Q?p725HAaS7hilgqHGChmK7XcXTW069y56BG2Mif97tUhuKg6yUI54BqVbJF6m?=
 =?us-ascii?Q?NhFFoBX71qIj5KiIXVrIaI6zc2kBPDUL/LdlV9dwRxRzIYD00+XCSi4HpyyU?=
 =?us-ascii?Q?20keXYLhNhQg2azep/nCMLiQn3S6necvhTr3Oh7RqpNllRauXG/MRnaeGRUL?=
 =?us-ascii?Q?yYKHpezbsYxSM+rhDNpP90mRypmh+wDYm7t7LTZaz1cozw0Yprk9PSIkABqq?=
 =?us-ascii?Q?nUfvmGGbr8nwgTNlmpJBEzW2/BSeAAfXOPEn1ngcUuaZplkQuH4HrAvj0DCm?=
 =?us-ascii?Q?h4MGskOiiqp9yHOl85Sw6DWzirx5GXI/eV5i8zF2Cw37zdQmROiwzHvOcoYU?=
 =?us-ascii?Q?AGXI9oTfG4+zua0n7bbBNlR2Y7mTsNuHqQJYQIUBKhtAF9tOag1ba5Mdr4DA?=
 =?us-ascii?Q?86mwRrDK9MsjHoqhINDuf2KJkvEAMqdvJLgtjDdrDXq2xUvPTyt7AzicdVu1?=
 =?us-ascii?Q?uUfkZcLRTMxJnsmvKnmfwwBM6Z9Gdf0pSl/yCL6+05cggp/E3/qETawfa6P4?=
 =?us-ascii?Q?dhoG3VUYaPGdepk9KX4IFhkWsofOqqtZ5OujIdvztLE5uyw/+wXWSa59PhqG?=
 =?us-ascii?Q?0zPTJJUH6GkR7WMiQ8RKR7HrwYetg3FAO8EWc3AOKhPYBUdKCDCQAV8D6APC?=
 =?us-ascii?Q?eKWBzLLXZCnJiO5lmckYi3pm3YczmW2c8rfSlT5tYClSg3UloqGd+COZnsJa?=
 =?us-ascii?Q?jiutpaCSKsqBxHeGS+jmEY4633O0okDf6oc8RjWWAuwrdhrddlJhwvHioVdf?=
 =?us-ascii?Q?d83q/B/Z+pK75caWkv8k0WzYjIJ13SCS83203eXD+hLESFCh592Q3Rx6PWSb?=
 =?us-ascii?Q?+aMEFWNYZlIHs1AoNlctfFv5?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e2f5d90-cad1-4c48-1844-08d98e24a5ee
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 08:37:10.9263
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TKNjpZmH9gUl8oC4/BVDmmcuRFQc0vYdKuTSx2fGxe5EOQbz9l2uK6Vdk72J42mjY5iC53Uc2xrXZHWHSCzobAbGftgjWemmR+mfs1esBms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2319
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10135 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110130058
X-Proofpoint-ORIG-GUID: 94ZmiLOaPycHjcZTFWYKKXIPoFUcGE1H
X-Proofpoint-GUID: 94ZmiLOaPycHjcZTFWYKKXIPoFUcGE1H
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Krzysztof,

url:    https://github.com/0day-ci/linux/commits/Krzysztof-Adamski/Add-per-channel-properies-support-in-tmp421/20211012-173142
base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
config: i386-randconfig-m031-20211012 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/hwmon/tmp421.c:178 tmp421_enable_channels() error: uninitialized symbol 'err'.

vim +/err +178 drivers/hwmon/tmp421.c

4a0f8262fe071b Krzysztof Adamski 2021-10-12  168  static int tmp421_enable_channels(struct tmp421_data *data)
4a0f8262fe071b Krzysztof Adamski 2021-10-12  169  {
4a0f8262fe071b Krzysztof Adamski 2021-10-12  170  	int err;
4a0f8262fe071b Krzysztof Adamski 2021-10-12  171  	struct i2c_client *client = data->client;
4a0f8262fe071b Krzysztof Adamski 2021-10-12  172  	struct device *dev = &client->dev;
4a0f8262fe071b Krzysztof Adamski 2021-10-12  173  	int cfg = i2c_smbus_read_byte_data(client, TMP421_CONFIG_REG_2);
4a0f8262fe071b Krzysztof Adamski 2021-10-12  174  	int i;
4a0f8262fe071b Krzysztof Adamski 2021-10-12  175  
4a0f8262fe071b Krzysztof Adamski 2021-10-12  176  	if (cfg < 0) {
4a0f8262fe071b Krzysztof Adamski 2021-10-12  177  		dev_err(dev, "error reading register, can't disable channels\n");
4a0f8262fe071b Krzysztof Adamski 2021-10-12 @178  		return err;

"return cfg;"

4a0f8262fe071b Krzysztof Adamski 2021-10-12  179  	}
4a0f8262fe071b Krzysztof Adamski 2021-10-12  180  
4a0f8262fe071b Krzysztof Adamski 2021-10-12  181  	cfg &= ~TMP421_CONFIG_REG_REN_MASK;
4a0f8262fe071b Krzysztof Adamski 2021-10-12  182  	for (i = 0; i < data->channels; i++)
4a0f8262fe071b Krzysztof Adamski 2021-10-12  183  		if (data->channel[i].enabled)
4a0f8262fe071b Krzysztof Adamski 2021-10-12  184  			cfg |= TMP421_CONFIG_REG_REN(i);
4a0f8262fe071b Krzysztof Adamski 2021-10-12  185  
4a0f8262fe071b Krzysztof Adamski 2021-10-12  186  	err = i2c_smbus_write_byte_data(client, TMP421_CONFIG_REG_2, cfg);
4a0f8262fe071b Krzysztof Adamski 2021-10-12  187  	if (err < 0)
4a0f8262fe071b Krzysztof Adamski 2021-10-12  188  		dev_err(dev, "error writing register, can't disable channels\n");
4a0f8262fe071b Krzysztof Adamski 2021-10-12  189  
4a0f8262fe071b Krzysztof Adamski 2021-10-12  190  	return err;
4a0f8262fe071b Krzysztof Adamski 2021-10-12  191  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

