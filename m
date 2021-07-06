Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE7BC07E96
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Jul 2021 13:02:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB23661C33
	for <linux-hwmon@archiver.kernel.org>; Tue,  6 Jul 2021 13:02:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232331AbhGFNEr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 6 Jul 2021 09:04:47 -0400
Received: from mx0b-00154904.pphosted.com ([148.163.137.20]:27050 "EHLO
        mx0b-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232073AbhGFNEq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 6 Jul 2021 09:04:46 -0400
Received: from pps.filterd (m0170394.ppops.net [127.0.0.1])
        by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 166CgIvq020314;
        Tue, 6 Jul 2021 09:01:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=smtpout1; bh=hkUAoI5zKPZlHzJpHvL8p7oh7uteBTn7IgNQU8QDOTc=;
 b=u8VynfPhUy1qbCbD261g0nrbIYTDFkwcVoKujzvHiWXpOM8D7bTxRxZAFoHcQlvZcvHy
 lGagbO/OkCRtJL3UaeFdz+LWHaeMLupbCFCgE39XGj9O2vXgJBJ4huGaZykT1IGpLdq0
 6Vc6wVQENsSWUrzq8tuqd7pK8I1/5Z9MNSc/ZTlOAUPAMkUAYqtXzE74t5S4fCCrROlY
 4mFPBnGMC9M1oQJK/OodCzIQFBCH9DYFYbaG0B+t+l4sKsfMqj96Ql98gD/tZo9wpd52
 pRl+0K8WGcBdPoT6FWGgi4Mu4muqn0g9eZIFDsHS8iOCA2CpRS7dabhcPb+GDMhygZi0 9g== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0b-00154904.pphosted.com with ESMTP id 39m5bscdt0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 06 Jul 2021 09:01:54 -0400
Received: from pps.filterd (m0144103.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 166D1rI4061266;
        Tue, 6 Jul 2021 09:01:53 -0400
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2170.outbound.protection.outlook.com [104.47.56.170])
        by mx0b-00154901.pphosted.com with ESMTP id 39mjwsccbc-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 06 Jul 2021 09:01:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HnxsNxwBDsSN7hO+xTB0pUzkAob7NHP4tJ0rFrbVzJVOoMXNe9uwAFMXAnWg7obajyE67RY+sB+9kauiaL3c5V988VJiQwPzdYjM7ZWZ9mzdU950e+bCLyOea5phEEBk18WDJJJR1M7oRjD4eKyFZRogiSsMCHrlU7/jLmwOASsm8K0zd9ZFMPPq8+D3VMc36HiXInfY5+Fp/BNsXEKxQKfirfO0bmwenuPMCTPVQTUAfM8jEU91hoTy1GWfyvTu25q7whjWRR232jcqaBPqw7o69rEmg3RYeKpX531sNdgWL4/Pg95jOqoYO1qxC7TsAW/NP4vLMU16EwaNCyBgXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkUAoI5zKPZlHzJpHvL8p7oh7uteBTn7IgNQU8QDOTc=;
 b=BsnAhGnOd9EG8t+tc0vltutt1FwXB1yvyS/czhkRVEghKeF79WhY2MbF6/rm0tw6TGVFU04RRqlJdN/WS7re5M0bK+XYklJhU01p2RP09Br3bgLH0tjmLHPV0IVzStZoaor1Q3VB9PlQI+3gME5SpGjj12ZWKPJFbHrLYPJSpbyXU/+8GxBWQL12cQ0Dc2gxVq42FvMTJXLeuKuFaQecV95ukF+jo6o7FeGIydFzwshqvozwJuzhfQLDmEw6Ux2nYOLEaMU7mmG9XQmNWzAU3pBcxW0ma+R1Nxc4e2zxjKzzUCi/AUG8VhzXt4jANIcblqGAi3dxvrrHz/0F5RDgOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from MW2PR1901MB2028.namprd19.prod.outlook.com (2603:10b6:302:8::11)
 by MW2PR1901MB2140.namprd19.prod.outlook.com (2603:10b6:302:b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.33; Tue, 6 Jul
 2021 13:01:43 +0000
Received: from MW2PR1901MB2028.namprd19.prod.outlook.com
 ([fe80::fdcd:16d2:8903:2372]) by MW2PR1901MB2028.namprd19.prod.outlook.com
 ([fe80::fdcd:16d2:8903:2372%6]) with mapi id 15.20.4308.020; Tue, 6 Jul 2021
 13:01:43 +0000
From:   "Balac, Arun Saravanan" <ArunSaravanan.Balach@Dell.com>
To:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "jdelvare@suse.com" <jdelvare@suse.com>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: [PATCH 0/5] hwmon: Add driver for MAX6620 Fan controller
Thread-Topic: [PATCH 0/5] hwmon: Add driver for MAX6620 Fan controller
Thread-Index: AddyZLj95yBihWm1SmSbEomGCD5YsQ==
Date:   Tue, 6 Jul 2021 13:01:42 +0000
Message-ID: <MW2PR1901MB20287B190088EC2608094AF2A61B9@MW2PR1901MB2028.namprd19.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Arun_Saravanan_Balac@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-07-06T13:01:40.3553411Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=6572fafe-b8bd-4192-80fa-4e1042fca5c2;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=Dell.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e433dfbd-3c78-4216-86bb-08d9407e33ea
x-ms-traffictypediagnostic: MW2PR1901MB2140:
x-microsoft-antispam-prvs: <MW2PR1901MB214081426584A9EA0B563E1FA61B9@MW2PR1901MB2140.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:345;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mk8iw4vnMe9G565temMmkhsTE1vBSfj9itRXbzJrxLSn/epHy797K2mImYOiCIx3kfFEXsrbcE7ZEChpN1Kdm4+Rnj5javHBUQ8qCnnqMy56HDt3gYx3od3KgEbx/mOgd/bKIg9jOWz9euOYdQ+qI/plkYDv+0M4x+D8YIAbjdYZaoaxjxgXBDVCh+P/XNY2OclT411/K5u4MdKS1k5XNP4lLVrOVcICH4TBsAu8OZECpg3UOAyoXD+kBti+Y84OcbVm6cYeC0/FeSOIpjC46Z9mRKoMXVC75vgn25EuMRNTLdyv2ImeABgsm9Pww1DcAIcruFv9iocrvmdFrIptogwH6uRjBJx1KAUaXEVsWUSmu24/ML3EW1Dfq4jkeIwYSbW4FX5v62R3GWz08USdrdPzb0/uj0kB/OHMdGLBIgNZvl12e4a017yhi4Ydu+fTSIzC+e4QCnVMtmbCJYKrLWyJK25yBHdCK4Ib/JyHVtq2B1Ii3uGJrXV31wxcpeeGWl6NZEKwD2IiZMrZzXXBNnTAfOiEktFrr0EMGnAQeuHx/SBIiU3dQOsh5e9uaShHVEeUFUD9x6qXjv+ibnusYkf7MI8jg04y7CdhaqUj0HtJAh3HE/ZmaEAvWzDhTqIXRKpdQQeEPf5LVH3O5pnZRA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR1901MB2028.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(396003)(366004)(346002)(9686003)(7696005)(4744005)(6506007)(66476007)(110136005)(8676002)(4326008)(2906002)(86362001)(122000001)(55016002)(52536014)(66946007)(55236004)(64756008)(8936002)(71200400001)(316002)(38100700002)(186003)(5660300002)(66556008)(76116006)(83380400001)(478600001)(786003)(26005)(66446008)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?CVKrXaO2T9ol4PzFyZ3zqSjaVxzw+QXKiXmd1YYa7jAiIzvbc9iSx8VvCQAy?=
 =?us-ascii?Q?YEo0YvXgAAPqS8P9/4meMwH8kg/leVO5gWCDapiWT0S+kpuqf7FN8wdTviRT?=
 =?us-ascii?Q?FqnHXIoTDgGERu06zg+Jhcrls2gRwcnm8NDsT/9xRlA44asIKS2jAvhfswyz?=
 =?us-ascii?Q?8Pu/TpEkLQL3hiCH2byAb0JhBYbTXJ55mQqwv4oOCgcnf7TqBpwfCtabil4I?=
 =?us-ascii?Q?G9x3zMQBlhRsPfCuAYdPcORLY7Ve55ZIB+6Q5/UGwmhlr3SlXlDFSprKFoUu?=
 =?us-ascii?Q?CiK1g4xbgi/pYSWWr15zfiG5f3hqIlGMB1IJXz3UujczmPhTAFnPQEcDw6uZ?=
 =?us-ascii?Q?SfieumDF4yPO2pB6lrLGBBDgx1B46s/rOKKGuZbT2HTgXv8FMk9oD0eSWe4t?=
 =?us-ascii?Q?7BJshE39ZTI6raWU7gMvq9Qoy6xhiq2+yV8ZamBVv+THc0NBhtatvj+0euLI?=
 =?us-ascii?Q?x61knby2N6gem0kSxoRwTpH8vRiGHEImgX2bsldTo1c6kRpQNGW/U31g/cf0?=
 =?us-ascii?Q?teSZlUTABnodZgIXmKxrU5r5+nBzToKmVJf0IMo8XPhKGNj9ELkCiCDzMW6C?=
 =?us-ascii?Q?VT8KMG/xNHvPWyNOml2at8BOziA+yLbWemT6y4IOXM1+p7f4NHIt/4G2/yBi?=
 =?us-ascii?Q?7RRI8SA33bi8KuZZre/xismJLG9pVIoyZ8ugew5daRtvgHkNrFjaNtKcGuUo?=
 =?us-ascii?Q?v/+U/Y/kbBct9JTZE9ux0pybibphYl0iYgwBDAcmsiAcEbeHJE10UBPKvhQF?=
 =?us-ascii?Q?0YF8oAvymd9YEY+hEOfK/38OI2PFRoM8xlTlNgVcHCpo+M6ZMDJpuIIZ7eWA?=
 =?us-ascii?Q?/OuVtM921Vr/JO/sum44FLxFKFfcfWPVnKxemJuWp5qSKIZtXj+qc0qb+7GP?=
 =?us-ascii?Q?P1U0Dj9SrYDPoMtvl07zREVxDbSagdo3BxM8JrXyNiAnUDZHHQhSv9CtZQTy?=
 =?us-ascii?Q?3rRqglc07JsF8fZo3ErpbATrHIgLanM6XyVB74tluM2i4d4UZABtbthEBPFi?=
 =?us-ascii?Q?MkYMgqUu/fytNwpPunnYNNdv7jDBEMjsr5d0GTFrc0NGKLSmndLsV/LJQ8jK?=
 =?us-ascii?Q?kq64D8u6kDgYnK9x8iLin1N1VK3s89eDqMqEHdm6mToNOeYeai9nO+MBBeVY?=
 =?us-ascii?Q?YJwlx62ccTbVsQgO5EH4fipruXzBDny1Kpnf3U9wS57BQSnY7Dhvk0+7d8Jy?=
 =?us-ascii?Q?6Gi36ywBFuznjlGxUqoJsajdDaT298w9E0pzH+O05TF+wbPlekn0AkT76p0M?=
 =?us-ascii?Q?3LJUHAAhAXCATVG7gCpmovnqHoWh0DKX2EnGJFOob/aO5+6KTQAjZ14UzdwJ?=
 =?us-ascii?Q?tToUfbsKbeInLkmk7y/hr0LF?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR1901MB2028.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e433dfbd-3c78-4216-86bb-08d9407e33ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2021 13:01:42.9571
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x9oqaWiaUllVvUfY9FCcLFFDHLp8l9jBAxmf4Nwn5QvW5yj5mVbB9Ci2e3KVY8QkTTfASD2z0rKg3DJIXmyNdfug96AfbtAfbatJ/9KZxh0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR1901MB2140
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-06_06:2021-07-02,2021-07-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 clxscore=1011 mlxscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060062
X-Proofpoint-GUID: vPzUK93ryJmdkiUGVP7AfsxoHUTo9by8
X-Proofpoint-ORIG-GUID: vPzUK93ryJmdkiUGVP7AfsxoHUTo9by8
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 mlxscore=0 spamscore=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060062
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Arun Saravanan Balachandran <Arun_Saravanan_Balac@dell.com>

Add driver for MAX6620 Fan controller

Arun Saravanan Balachandran (2):
  Add attributes in MAX6620 driver to retrieve fan fault status
  Update MAX6620 driver as per linux code guidelines

Cumulus Networks (2):
  Driver for MAX6620 Fan sensor
  MAX6620 fix rpm calculation accuracy
=20
Shuotian Cheng (1):
  Update MAX6620 driver to support newer kernel version

 drivers/hwmon/Kconfig   |  10 +
 drivers/hwmon/Makefile  |   1 +
 drivers/hwmon/max6620.c | 625 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 636 insertions(+)
 create mode 100644 drivers/hwmon/max6620.c


base-commit: 303392fd5c160822bf778270b28ec5ea50cab2b4
--=20
2.32.0

