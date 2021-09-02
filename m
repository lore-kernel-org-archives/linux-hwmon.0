Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61207C432BE
	for <linux-hwmon@archiver.kernel.org>; Thu,  2 Sep 2021 12:59:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48905610CE
	for <linux-hwmon@archiver.kernel.org>; Thu,  2 Sep 2021 12:59:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344917AbhIBNAq (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 2 Sep 2021 09:00:46 -0400
Received: from mx0b-00154904.pphosted.com ([148.163.137.20]:1682 "EHLO
        mx0b-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344891AbhIBNAp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 2 Sep 2021 09:00:45 -0400
Received: from pps.filterd (m0170397.ppops.net [127.0.0.1])
        by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 182CvRMw019158;
        Thu, 2 Sep 2021 08:59:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=74ToM/T+PRGQD20j+USoQpJna/ILsbJNKpvrUFOGILc=;
 b=tzEooUsbxqQtbxv6dnYUBFjx9n8HL6Xmassd7+fV7a/JkewIIYGgVqCMwTKdaYv50KLQ
 jjbgesg1Ijga3mYboOJr8T+z3CNV/9Sl02xZzFAiY0d9QrX9DAcpW7YrToaSZyrf1/fs
 Al4cdz//pEOoRnpHfG28ioSKZpkScDr/t9h7EHvmrjAVwfq/uFAbHtzxq06y/YJcncgn
 1eZahfbXHSYGiDrbfmrEXmHr0+Lvm4TcSPFyCNsqWJCH/7qCbc8s+7eFAVJIX20ujoVr
 DGrb01WvBjUdL7AZ7vFENaeGED5zQYpUHZ2Wm7NSTYAERFsHNJ96A+casaAsa7f1WoFJ jQ== 
Received: from mx0b-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
        by mx0b-00154904.pphosted.com with ESMTP id 3atdy3kf3y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 02 Sep 2021 08:59:32 -0400
Received: from pps.filterd (m0090350.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 182CtHnv177188;
        Thu, 2 Sep 2021 08:59:31 -0400
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
        by mx0b-00154901.pphosted.com with ESMTP id 3ate0vnvmh-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 02 Sep 2021 08:59:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LkM583m75Qde1T5zXhH09hFRdAdb04GPiZh8yfjGKdpKUollQGqgFLt4Xpu3Pm0P1witu1xAnKsoRb+dlma5YLn3Bts0X6DBkZcvJw4o7L8nKPJTTS55UCgq0QeWFPhPXeJteXuhFiYDusx1i8kJDRZIMJ7DbpeaTfR6ipWb3dRtb2DGecHGxOg3uGCCiKuVm+D505fVBVqZZ/EnRwTq7MNQqMo9DBgQogAcWQ5IaXY/ocpP052ORQVJhy7rtYvlRPs9GVz/rGHmEAlf4dxBlrisjN2OksBcKkBHyKAs+l21rk1bgL4KJC7BCDcd0epmDeUJhyEt2wIMf0xqfJ/FzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=74ToM/T+PRGQD20j+USoQpJna/ILsbJNKpvrUFOGILc=;
 b=SJitJoncTZ2moVFXUPmyzArL0Nz23b60j8bOUHfO2DFTYnaGabZA0+bb2Cs4B12cxVAvWAYjrVqkdVDqx9h8sd0YoTEGBysEpvheJSbLYFv3c315yXbFesLUq2WE7CHTFc+JRk07lQOG5hdtFivB7Xt2bJVYX1wvQNHsPsJvlF3MFdQA5WWRY4TOTzxumH5Jlr8HY4rqeM8vuvOGc1jYALz4SqLvPY25Jml6Kio7k1bCtiW2z4gUxRgfse79roAVASIBQylBH+Lqy4Ag/v0JXDf0I0oZK2ZmGkIfDAqmww0qdpOhkPR0RYax2RH1bPsaRdgt4nC9AHV0pomxT3YpDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from MW2PR1901MB2028.namprd19.prod.outlook.com (2603:10b6:302:8::11)
 by MWHPR19MB1214.namprd19.prod.outlook.com (2603:10b6:320:2e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Thu, 2 Sep
 2021 12:59:28 +0000
Received: from MW2PR1901MB2028.namprd19.prod.outlook.com
 ([fe80::bc11:39fd:5a90:870b]) by MW2PR1901MB2028.namprd19.prod.outlook.com
 ([fe80::bc11:39fd:5a90:870b%7]) with mapi id 15.20.4415.024; Thu, 2 Sep 2021
 12:59:28 +0000
From:   "Balac, Arun Saravanan" <ArunSaravanan.Balach@Dell.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [PATCH v3] hwmon: Add Maxim MAX6620 hardware monitoring driver
Thread-Topic: [PATCH v3] hwmon: Add Maxim MAX6620 hardware monitoring driver
Thread-Index: AdeY3kJIh4XizBMVQGetadGVqiEmMQATBv8AAbPOL1A=
Date:   Thu, 2 Sep 2021 12:59:28 +0000
Message-ID: <MW2PR1901MB202860B0CFCEF7D6B2C719B7A6CE9@MW2PR1901MB2028.namprd19.prod.outlook.com>
References: <MW2PR1901MB20282C7BCF058732B6357661A6C59@MW2PR1901MB2028.namprd19.prod.outlook.com>
 <20210824205528.GA3417735@roeck-us.net>
In-Reply-To: <20210824205528.GA3417735@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Arun_Saravanan_Balac@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-09-02T12:59:26.2458286Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=bbaa715c-1d3b-48c3-be58-681272d90194;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=Dell.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e83e22a7-aba6-445d-dfb0-08d96e117f9e
x-ms-traffictypediagnostic: MWHPR19MB1214:
x-microsoft-antispam-prvs: <MWHPR19MB121405B211705960CA6B5124A6CE9@MWHPR19MB1214.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r3XGI7aHgoO/k4TReScmGFVpRPmWqdcy3cGW2Ee7eo6ux7Qs3zEQriFSnmfvqbkiaLQdAYcC6IQtrS/WmdI5q2E7UZZ61TbYlwEnkEu0azQxKpRjja8mYONwalUPpmzGM51KOfC48tub82+T1lODsP6Tmrb36Dk2277U08vdFn1vk3HnQ3lGEg8z5b4AN8vJhKS5gzVTkdxqGvr/igymzM/0JKLXUw3qvmP9nb/LnJAbuANjOIbIOqrY26heGTWQVlvdFdIP1V2qzvW1/9/ZPHFtc7M7hizpodSBuPYlN40pWA1/ButerUWsMZxrrExv3f9ZFPfLGte3dUOfqDZ+G2PBpyOxWvLxsZApS1iFmdixtD3vza0F3qXpV0Y0reszwhA8bNFIXAb3jx4QILzZwfWY0yg4fylQHYg9xhNC7e+DfxBDwyhTDol1/SNnRLIdSw1Sy00BeVQUQzHIOBWJ4MLG8HoKaWyAcAl0FUUIFCg1wmuPnK2ioRbt/5cFfDacKbb7WlUVbAoNpuj4e1nYLyTFDja8xhSJJqDZuMCqqZEAHK12lIo1W1B5Izzh0PkWk5caB2ebkTlN4KaQ7V3qdaSRycTxIi6Neym6Shnf7CwoIGOb+3iYV1+svyUlgrH8b2ntr2+18qzaqFx+ZbequAPpuPVlEcmRn65toAVEIKgqrNHwNEvG3/hq5hXvrg4l1Jg2jf2B4MLIejk8DQ76IXIYOwWTTkPmKsRnnq5zrhwTqgvbg1YxDRR72vVEZvFR1PRtKIjtglbtyF7LfXUhwDcJvFS0hcqv6Nby4tbAGXA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR1901MB2028.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(366004)(396003)(346002)(52536014)(54906003)(33656002)(4326008)(7696005)(71200400001)(5660300002)(86362001)(2906002)(6506007)(53546011)(966005)(76116006)(38100700002)(9686003)(55016002)(186003)(83380400001)(26005)(66946007)(38070700005)(66446008)(64756008)(66556008)(6916009)(122000001)(66476007)(478600001)(8936002)(8676002)(30864003)(316002)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?RCQtoLBE7Duoj0PzRbdmYtSBFUVi086jyCj78XHVS24qHqHcu5449X9T+gcm?=
 =?us-ascii?Q?Cn+rXM8jLVdmrU9pmrU0VYYCiTItHtcEbwQUtGhw1VahsUBBSE4xrQeb2pNW?=
 =?us-ascii?Q?I0LJXE6/BbxdkeOZTxuVcyDF0+fWfGPk0q1oLF7Ym+jOEsHbHOfd1Lc2A0qv?=
 =?us-ascii?Q?gsjVODLkpOyKT8PieAJlNyVRphCtLm/j3tjPPgmimoPSPCXAomx7uqNDYYT+?=
 =?us-ascii?Q?+mcU/xE2g9M8N81HMRuiN66KUI+Jvg+yXfpOYWR5ZCtWNnKTg+FCqBsa/F/b?=
 =?us-ascii?Q?VXkxghJWGGHiexBDIoc5h+uPRvU1J19/h6jWdcgXYsgFmSX0hgelsMp8Kwjr?=
 =?us-ascii?Q?Xy7gb8T0dpuOEqIB+mh6SsWPsd3B1xKEwujN/XH+io81d+ma1OgsNAB+uslX?=
 =?us-ascii?Q?DWC3dgaPDts5Ms2GZw7FQ6HUAeAaaCVTMNz+wYY28kgpSq6PXosBNkIFtZOC?=
 =?us-ascii?Q?h2LefrAIvXpcbgyFFl63DukrxSRy7eJMkaCB6tXocLWsbkkwOBFfINCZctDU?=
 =?us-ascii?Q?Et6crz29U8hbdIvUuFB746g48yz5pefhSIn4mXp1+h4IJCLbrx6JqJ4CT2BS?=
 =?us-ascii?Q?sXcdwRTK2aAZOjRIr44MwF+td7bWjc0Yc2sR3/TMBM8UsTCR3h0oTQvwH47K?=
 =?us-ascii?Q?VcYiS8g9jnnqygMCpTt2yPEilckRFgJuyiAvHL2bnou2UGhGpRc5QY+CFb/J?=
 =?us-ascii?Q?2SW8xTzXSuEL/08G8F8NSUGdI8pa6hCBUQVF2frRpojzqACCsMVFkBnfhXqB?=
 =?us-ascii?Q?lm9SvBop7sATCg60a+2bkimg24dEi+M341OCD/HmAkERnqH7zpgjM51uxyle?=
 =?us-ascii?Q?kezu9YGjCN4L9iFmYtE0RoVp0omlWmR/DpoltxcIuILgc5NcY1Pceijzmwew?=
 =?us-ascii?Q?gqy8KO6pNVH2Y+QC0lDyoFJB2JQZDw1pB7wmHfdqyzJysPhgma/x9X0gMKT4?=
 =?us-ascii?Q?YcFgiXxyKwf4H2oNz+R4+aRxQZm+MQUCbNPm4uq/xw7DlpePb5S4MwkHaHi6?=
 =?us-ascii?Q?z8PMTjpM+fMUdZDyj2tcbPTy2R2kK58pTHOrfyvR5YaPVMFMRk9rmKS8IMq0?=
 =?us-ascii?Q?d1RY1fOpECa36Sr+9wJyZoT4ChmDnIMK2HZkF/BydKE75i1lDYIBdy8vfZlv?=
 =?us-ascii?Q?dAISt9qHp3wsrD4OkIz0Lh6Cn8sn6iEIp7tWHmSh5kV+CKtDNvapKLWGGCO9?=
 =?us-ascii?Q?SvOyOJ7Skqfa9I1f7gsPgFMvp4f+xKI4YqXal8u1eZqBo2NfBK8nPSk2+rHq?=
 =?us-ascii?Q?nEZ+c9QgUFlj288onglTqm2U7Ho9fdcsQht3pDItUMiaH6vfU3zZPPdf/Ntm?=
 =?us-ascii?Q?ggsSbpNLu58DCEVasEMHAG3r?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR1901MB2028.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e83e22a7-aba6-445d-dfb0-08d96e117f9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Sep 2021 12:59:28.3773
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VPrxnAN9IQaX+ZmxT8RzrXknNxv5frzd7YhOwC/Hsu8ndYZ3h04nN+WJjWW3c9+Z54B7o0x5viUxf9mC7Wpyuj8iagDz7ZLPXDY+JM1zv8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR19MB1214
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-09-02_04:2021-09-02,2021-09-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109020079
X-Proofpoint-GUID: DUleyJLsklmAdi74tmeg-TRjDa8vOkW_
X-Proofpoint-ORIG-GUID: DUleyJLsklmAdi74tmeg-TRjDa8vOkW_
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109020079
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Thanks for the review comments. Will resolve them and send the updated vers=
ion for review.

>> +++ b/drivers/hwmon/max6620.c
>> @@ -0,0 +1,507 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Hardware monitoring driver for Maxim MAX6620
>> + *
>> + * (C) 2012 by L. Grunenberg <contact@lgrunenberg.de>
>
>Is this intentional, or was it supposed to be 2021 ?
>
>> + *

The copyright statement was the one present in initial version from the abo=
ve author and has not been modified.
Request you to let me know if it has to be changed to 2021.


Regards,
Arun Saravanan

-----Original Message-----
From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
Sent: Wednesday, August 25, 2021 2:25 AM
To: Balac, Arun Saravanan
Cc: jdelvare@suse.com; linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: Add Maxim MAX6620 hardware monitoring driver


[EXTERNAL EMAIL]=20

On Tue, Aug 24, 2021 at 11:59:26AM +0000, Balac, Arun Saravanan wrote:
> From: Arun Saravanan Balachandran <Arun_Saravanan_Balac@dell.com>
>=20
> Add hardware monitoring driver for Maxim MAX6620 Fan controller
>=20
> Originally-from: L. Grunenberg <contact@lgrunenberg.de>
> Originally-from: Cumulus Networks <support@cumulusnetworks.com>
> Originally-from: Shuotian Cheng <shuche@microsoft.com>
> Signed-off-by: Arun Saravanan Balachandran <Arun_Saravanan_Balac@dell.com=
>
> ---
>=20
> <Formletter>=20
> Changelog:
> - Include '<linux/bits.h>'.
> - Use BIT() macro in 'max6620_fan_div_from_reg'.
> - Define functions 'max6620_fan_rpm_to_tach' , 'max6620_fan_tach_to_rpm'
>    for RPM to tach conversion and vice versa.
> - Drop 'reg' variable and use only variable 'ret' for validation and use =
of value
>    returned by i2c_smbus_read_byte_data in 'max6620_update_device'.
> - Remove unnecessary enclosing parentheses.
> </Formletter>
>=20

<Formletter> and </Formletter> were intended to show that the text in betwe=
en
was auto-generated, not supposed to be includes in the actual change log.

>  Documentation/hwmon/max6620.rst |  46 +++

Needs to be added to Documentation/hwmon/index.rst

>  drivers/hwmon/Kconfig           |  10 +
>  drivers/hwmon/Makefile          |   1 +
>  drivers/hwmon/max6620.c         | 507 ++++++++++++++++++++++++++++++++
>  4 files changed, 564 insertions(+)
>  create mode 100644 Documentation/hwmon/max6620.rst
>  create mode 100644 drivers/hwmon/max6620.c
>=20
>=20
> base-commit: ff1176468d368232b684f75e82563369208bc371
>=20
> diff --git a/Documentation/hwmon/max6620.rst b/Documentation/hwmon/max662=
0.rst
> new file mode 100644
> index 000000000000..84c1c44d3de4
> --- /dev/null
> +++ b/Documentation/hwmon/max6620.rst
> @@ -0,0 +1,46 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +Kernel driver max6620
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Supported chips:
> +
> +    Maxim MAX6620
> +
> +    Prefix: 'max6620'
> +
> +    Addresses scanned: none
> +
> +    Datasheet: https://urldefense.com/v3/__http://pdfserv.maxim-ic.com/e=
n/ds/MAX6620.pdf__;!!LpKI!2F_9PYXKGKcU2EVLtM4q-fFP1VkDADkUBkRoeet8KfrP1t3jV=
COVDCdzlkNKQYKmHwK5UQ$ [pdfserv[.]maxim-ic[.]com]
> +
> +Authors:
> +    - L\. Grunenberg <contact@lgrunenberg.de>
> +    - Cumulus Networks <support@cumulusnetworks.com>
> +    - Shuotian Cheng <shuche@microsoft.com>
> +    - Arun Saravanan Balachandran <Arun_Saravanan_Balac@dell.com>
> +
> +Description
> +-----------
> +
> +This driver implements support for Maxim MAX6620 fan controller.
> +
> +The driver configures the fan controller in RPM mode. To give the readin=
gs more
> +range or accuracy, the desired value can be set by a programmable regist=
er
> +(1, 2, 4, 8, 16 or 32). Set higher values for larger speeds.
> +
> +The driver provides the following sensor access in sysfs:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +fan[1-4]_alarm   ro      Fan alarm.
> +fan[1-4]_div     rw      Sets the nominal RPM range of the fan. Valid va=
lues
> +                         are 1, 2, 4, 8, 16 and 32.
> +fan[1-4]_input   ro      Fan speed in RPM.
> +fan[1-4]_target  rw      Desired fan speed in RPM.
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
> +
> +Usage notes
> +-----------
> +
> +This driver does not auto-detect devices. You will have to instantiate t=
he
> +devices explicitly. Please see Documentation/i2c/instantiating-devices.r=
st for
> +details.
> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index e3675377bc5d..74811fbaa266 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1022,6 +1022,16 @@ config SENSORS_MAX31730
>  	  This driver can also be built as a module. If so, the module
>  	  will be called max31730.
> =20
> +config SENSORS_MAX6620
> +	tristate "Maxim MAX6620 fan controller"
> +	depends on I2C
> +	help
> +	  If you say yes here you get support for the MAX6620
> +	  fan controller.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called max6620.
> +
>  config SENSORS_MAX6621
>  	tristate "Maxim MAX6621 sensor chip"
>  	depends on I2C
> diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> index d712c61c1f5e..9e50ff903931 100644
> --- a/drivers/hwmon/Makefile
> +++ b/drivers/hwmon/Makefile
> @@ -135,6 +135,7 @@ obj-$(CONFIG_SENSORS_MAX1668)	+=3D max1668.o
>  obj-$(CONFIG_SENSORS_MAX197)	+=3D max197.o
>  obj-$(CONFIG_SENSORS_MAX31722)	+=3D max31722.o
>  obj-$(CONFIG_SENSORS_MAX31730)	+=3D max31730.o
> +obj-$(CONFIG_SENSORS_MAX6620)	+=3D max6620.o
>  obj-$(CONFIG_SENSORS_MAX6621)	+=3D max6621.o
>  obj-$(CONFIG_SENSORS_MAX6639)	+=3D max6639.o
>  obj-$(CONFIG_SENSORS_MAX6642)	+=3D max6642.o
> diff --git a/drivers/hwmon/max6620.c b/drivers/hwmon/max6620.c
> new file mode 100644
> index 000000000000..af2301ac9513
> --- /dev/null
> +++ b/drivers/hwmon/max6620.c
> @@ -0,0 +1,507 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for Maxim MAX6620
> + *
> + * (C) 2012 by L. Grunenberg <contact@lgrunenberg.de>

Is this intentional, or was it supposed to be 2021 ?

> + *
> + * based on code written by :
> + * 2007 by Hans J. Koch <hjk@hansjkoch.de>
> + * John Morris <john.morris@spirentcom.com>
> + * Copyright (c) 2003 Spirent Communications
> + * and Claus Gindhart <claus.gindhart@kontron.com>
> + *
> + * This module has only been tested with the MAX6620 chip.
> + *
> + * The datasheet was last seen at:
> + *
> + *        https://urldefense.com/v3/__http://pdfserv.maxim-ic.com/en/ds/=
MAX6620.pdf__;!!LpKI!2F_9PYXKGKcU2EVLtM4q-fFP1VkDADkUBkRoeet8KfrP1t3jVCOVDC=
dzlkNKQYKmHwK5UQ$ [pdfserv[.]maxim-ic[.]com]
> + *
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/jiffies.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +
> +/*
> + * MAX 6620 registers
> + */
> +
> +#define MAX6620_REG_CONFIG	0x00
> +#define MAX6620_REG_FAULT	0x01
> +#define MAX6620_REG_CONF_FAN0	0x02
> +#define MAX6620_REG_CONF_FAN1	0x03
> +#define MAX6620_REG_CONF_FAN2	0x04
> +#define MAX6620_REG_CONF_FAN3	0x05
> +#define MAX6620_REG_DYN_FAN0	0x06
> +#define MAX6620_REG_DYN_FAN1	0x07
> +#define MAX6620_REG_DYN_FAN2	0x08
> +#define MAX6620_REG_DYN_FAN3	0x09
> +#define MAX6620_REG_TACH0	0x10
> +#define MAX6620_REG_TACH1	0x12
> +#define MAX6620_REG_TACH2	0x14
> +#define MAX6620_REG_TACH3	0x16
> +#define MAX6620_REG_VOLT0	0x18
> +#define MAX6620_REG_VOLT1	0x1A
> +#define MAX6620_REG_VOLT2	0x1C
> +#define MAX6620_REG_VOLT3	0x1E
> +#define MAX6620_REG_TAR0	0x20
> +#define MAX6620_REG_TAR1	0x22
> +#define MAX6620_REG_TAR2	0x24
> +#define MAX6620_REG_TAR3	0x26
> +#define MAX6620_REG_DAC0	0x28
> +#define MAX6620_REG_DAC1	0x2A
> +#define MAX6620_REG_DAC2	0x2C
> +#define MAX6620_REG_DAC3	0x2E
> +
> +/*
> + * Config register bits
> + */
> +
> +#define MAX6620_CFG_RUN		BIT(7)
> +#define MAX6620_CFG_POR		BIT(6)
> +#define MAX6620_CFG_TIMEOUT	BIT(5)
> +#define MAX6620_CFG_FULLFAN	BIT(4)
> +#define MAX6620_CFG_OSC		BIT(3)
> +#define MAX6620_CFG_WD_MASK	(BIT(2) | BIT(1))
> +#define MAX6620_CFG_WD_2	BIT(1)
> +#define MAX6620_CFG_WD_6	BIT(2)
> +#define MAX6620_CFG_WD10	(BIT(2) | BIT(1))
> +#define MAX6620_CFG_WD		BIT(0)
> +
> +/*
> + * Failure status register bits
> + */
> +
> +#define MAX6620_FAIL_TACH0	BIT(4)
> +#define MAX6620_FAIL_TACH1	BIT(5)
> +#define MAX6620_FAIL_TACH2	BIT(6)
> +#define MAX6620_FAIL_TACH3	BIT(7)
> +#define MAX6620_FAIL_MASK0	BIT(0)
> +#define MAX6620_FAIL_MASK1	BIT(1)
> +#define MAX6620_FAIL_MASK2	BIT(2)
> +#define MAX6620_FAIL_MASK3	BIT(3)
> +
> +#define MAX6620_CLOCK_FREQ	8192 /* Clock frequency in Hz */
> +#define MAX6620_PULSE_PER_REV	2 /* Tachometer pulses per revolution */
> +
> +/* Minimum and maximum values of the FAN-RPM */
> +#define FAN_RPM_MIN	240
> +#define FAN_RPM_MAX	30000
> +
> +static const u8 config_reg[] =3D {
> +	MAX6620_REG_CONF_FAN0,
> +	MAX6620_REG_CONF_FAN1,
> +	MAX6620_REG_CONF_FAN2,
> +	MAX6620_REG_CONF_FAN3,
> +};
> +
> +static const u8 dyn_reg[] =3D {
> +	MAX6620_REG_DYN_FAN0,
> +	MAX6620_REG_DYN_FAN1,
> +	MAX6620_REG_DYN_FAN2,
> +	MAX6620_REG_DYN_FAN3,
> +};
> +
> +static const u8 tach_reg[] =3D {
> +	MAX6620_REG_TACH0,
> +	MAX6620_REG_TACH1,
> +	MAX6620_REG_TACH2,
> +	MAX6620_REG_TACH3,
> +};
> +
> +static const u8 target_reg[] =3D {
> +	MAX6620_REG_TAR0,
> +	MAX6620_REG_TAR1,
> +	MAX6620_REG_TAR2,
> +	MAX6620_REG_TAR3,
> +};
> +
> +/*
> + * Client data (each client gets its own)
> + */
> +
> +struct max6620_data {
> +	struct i2c_client *client;
> +	struct mutex update_lock;
> +	bool valid; /* false until following fields are valid */
> +	unsigned long last_updated; /* in jiffies */
> +
> +	/* register values */
> +	u8 fancfg[4];
> +	u8 fandyn[4];
> +	u8 fault;
> +	u16 tach[4];
> +	u16 target[4];
> +};
> +
> +static u8 max6620_fan_div_from_reg(u8 val)
> +{
> +	return BIT((val & 0xE0) >> 5);
> +}
> +
> +static u16 max6620_fan_rpm_to_tach(u8 div, int rpm)
> +{
> +	return (60 * div * MAX6620_CLOCK_FREQ) / (rpm * MAX6620_PULSE_PER_REV);
> +}
> +
> +static int max6620_fan_tach_to_rpm(u8 div, u16 tach)
> +{
> +	return (60 * div * MAX6620_CLOCK_FREQ) / (tach * MAX6620_PULSE_PER_REV)=
;
> +}
> +
> +static int max6620_update_device(struct device *dev)
> +{
> +	struct max6620_data *data =3D dev_get_drvdata(dev);
> +	struct i2c_client *client =3D data->client;
> +	int i;
> +	int ret =3D 0;
> +
> +	mutex_lock(&data->update_lock);
> +
> +	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
> +		for (i =3D 0; i < 4; i++) {
> +			ret =3D i2c_smbus_read_byte_data(client, config_reg[i]);
> +			if (ret < 0)
> +				goto error;
> +			data->fancfg[i] =3D ret;
> +
> +			ret =3D i2c_smbus_read_byte_data(client, dyn_reg[i]);
> +			if (ret < 0)
> +				goto error;
> +			data->fandyn[i] =3D ret;
> +
> +			ret =3D i2c_smbus_read_byte_data(client, tach_reg[i]);
> +			if (ret < 0)
> +				goto error;
> +			data->tach[i] =3D (ret << 3) & 0x7f8;
> +			ret =3D i2c_smbus_read_byte_data(client, tach_reg[i] + 1);
> +			if (ret < 0)
> +				goto error;
> +			data->tach[i] |=3D (ret >> 5) & 0x7;
> +
> +			ret =3D i2c_smbus_read_byte_data(client, target_reg[i]);
> +			if (ret < 0)
> +				goto error;
> +			data->target[i] =3D (ret << 3) & 0x7f8;
> +			ret =3D i2c_smbus_read_byte_data(client, target_reg[i] + 1);
> +			if (ret < 0)
> +				goto error;
> +			data->target[i] |=3D (ret >> 5) & 0x7;
> +		}
> +
> +		/*
> +		 * Alarms are cleared on read in case the condition that
> +		 * caused the alarm is removed. Keep the value latched here
> +		 * for providing the register through different alarm files.
> +		 */
> +		ret =3D i2c_smbus_read_byte_data(client, MAX6620_REG_FAULT);
> +		if (ret < 0)
> +			goto error;
> +		data->fault |=3D (ret >> 4) & (ret & 0x0F);
> +
> +		data->last_updated =3D jiffies;
> +		data->valid =3D true;
> +	}
> +
> +error:
> +	mutex_unlock(&data->update_lock);
> +	return ret;
> +}
> +
> +static umode_t
> +max6620_is_visible(const void *data, enum hwmon_sensor_types type, u32 a=
ttr,
> +		   int channel)
> +{
> +	switch (type) {
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_alarm:
> +		case hwmon_fan_input:
> +			return 0444;
> +		case hwmon_fan_div:
> +		case hwmon_fan_target:
> +			return 0644;
> +		default:
> +			break;
> +		}
> +
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +max6620_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> +	     int channel, long *val)
> +{
> +	struct max6620_data *data;
> +	struct i2c_client *client;
> +	int ret =3D 0;

Unnecessary initialization.

> +	u8 div;
> +	u8 val1;
> +	u8 val2;
> +
> +	ret =3D max6620_update_device(dev);
> +	if (ret < 0)
> +		return ret;
> +	data =3D dev_get_drvdata(dev);
> +	client =3D data->client;

It might be easier to assign those above, with the variable declaration,
but that is just a suggestion.

> +
> +	switch (type) {
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_alarm:
> +			*val =3D !!(data->fault & BIT(channel));
> +
> +			/* Setting TACH count to re-enable fan fault detection */
> +			if (*val =3D=3D 1) {
> +				val1 =3D (data->target[channel] >> 3) & 0xff;
> +				val2 =3D (data->target[channel] << 5) & 0xe0;
> +				ret =3D i2c_smbus_write_byte_data(client,
> +								target_reg[channel], val1);
> +				if (ret < 0)
> +					return ret;
> +				ret =3D i2c_smbus_write_byte_data(client,
> +								target_reg[channel] + 1, val2);
> +				if (ret < 0)
> +					return ret;
> +
> +				mutex_lock(&data->update_lock);
> +				data->fault &=3D ~BIT(channel);
> +				mutex_unlock(&data->update_lock);

The lock needs to be extended across the write operations above and the
assignment to *val. Otherwise multiple read operations in parallel could
create random return values.

> +			}
> +
> +			break;
> +		case hwmon_fan_div:
> +			*val =3D max6620_fan_div_from_reg(data->fandyn[channel]);
> +			break;
> +		case hwmon_fan_input:
> +			if (data->tach[channel] =3D=3D 0) {
> +				*val =3D 0;
> +			} else {
> +				div =3D max6620_fan_div_from_reg(data->fandyn[channel]);
> +				*val =3D max6620_fan_tach_to_rpm(div, data->tach[channel]);
> +			}
> +			break;
> +		case hwmon_fan_target:
> +			if (data->target[channel] =3D=3D 0) {
> +				*val =3D 0;
> +			} else {
> +				div =3D max6620_fan_div_from_reg(data->fandyn[channel]);
> +				*val =3D max6620_fan_tach_to_rpm(div, data->target[channel]);
> +			}
> +			break;
> +		default:
> +			return -EOPNOTSUPP;
> +		}
> +		break;
> +
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +
> +	return 0;
> +}
> +
> +static int
> +max6620_write(struct device *dev, enum hwmon_sensor_types type, u32 attr=
,
> +	      int channel, long val)
> +{
> +	struct max6620_data *data;
> +	struct i2c_client *client;
> +	int ret =3D 0;

Unnecessary initialization.

> +	u8 div;
> +	u16 tach;
> +	u8 val1;
> +	u8 val2;
> +
> +	ret =3D max6620_update_device(dev);
> +	if (ret < 0)
> +		return ret;
> +	data =3D dev_get_drvdata(dev);
> +	client =3D data->client;

As above.

> +	mutex_lock(&data->update_lock);
> +
> +	switch (type) {
> +	case hwmon_fan:
> +		switch (attr) {
> +		case hwmon_fan_div:
> +			switch (val) {
> +			case 1:
> +				div =3D 0;
> +				break;
> +			case 2:
> +				div =3D 1;
> +				break;
> +			case 4:
> +				div =3D 2;
> +				break;
> +			case 8:
> +				div =3D 3;
> +				break;
> +			case 16:
> +				div =3D 4;
> +				break;
> +			case 32:
> +				div =3D 5;
> +				break;
> +			default:
> +				ret =3D -EINVAL;
> +				goto error;
> +			}
> +			data->fandyn[channel] &=3D 0x1F;
> +			data->fandyn[channel] |=3D div << 5;
> +			ret =3D i2c_smbus_write_byte_data(client, dyn_reg[channel],
> +							data->fandyn[channel]);
> +			break;
> +		case hwmon_fan_target:
> +			val =3D clamp_val(val, FAN_RPM_MIN, FAN_RPM_MAX);
> +			div =3D max6620_fan_div_from_reg(data->fandyn[channel]);
> +			tach =3D max6620_fan_rpm_to_tach(div, val);
> +			val1 =3D (tach >> 3) & 0xff;
> +			val2 =3D (tach << 5) & 0xe0;
> +			ret =3D i2c_smbus_write_byte_data(client, target_reg[channel], val1);
> +			if (ret < 0)
> +				break;
> +			ret =3D i2c_smbus_write_byte_data(client, target_reg[channel] + 1, va=
l2);
> +			if (ret < 0)
> +				break;
> +
> +			/* Setting TACH count re-enables fan fault detection */
> +			data->fault &=3D ~BIT(channel);
> +
> +			break;
> +		default:
> +			ret =3D -EOPNOTSUPP;
> +			break;
> +		}
> +		break;
> +
> +	default:
> +		ret =3D -EOPNOTSUPP;
> +		break;
> +	}
> +
> +error:
> +	mutex_unlock(&data->update_lock);
> +	return ret;
> +}
> +
> +static const struct hwmon_channel_info *max6620_info[] =3D {
> +	HWMON_CHANNEL_INFO(fan,
> +			   HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
> +			   HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
> +			   HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
> +			   HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM),
> +	NULL
> +};
> +
> +static const struct hwmon_ops max6620_hwmon_ops =3D {
> +	.read =3D max6620_read,
> +	.write =3D max6620_write,
> +	.is_visible =3D max6620_is_visible,
> +};
> +
> +static const struct hwmon_chip_info max6620_chip_info =3D {
> +	.ops =3D &max6620_hwmon_ops,
> +	.info =3D max6620_info,
> +};
> +
> +static int max6620_init_client(struct max6620_data *data)
> +{
> +	struct i2c_client *client =3D data->client;
> +	int config;
> +	int err;
> +	int i;
> +	int reg;
> +
> +	config =3D i2c_smbus_read_byte_data(client, MAX6620_REG_CONFIG);
> +	if (config < 0) {
> +		dev_err(&client->dev, "Error reading config, aborting.\n");
> +		return config;
> +	}
> +
> +	/*
> +	 * Set bit 4, disable other fans from going full speed on a fail
> +	 * failure.
> +	 */
> +	err =3D i2c_smbus_write_byte_data(client, MAX6620_REG_CONFIG, config | =
0x10);
> +	if (err < 0) {
> +		dev_err(&client->dev, "Config write error, aborting.\n");
> +		return err;
> +	}
> +
> +	for (i =3D 0; i < 4; i++) {
> +		reg =3D i2c_smbus_read_byte_data(client, config_reg[i]);
> +		if (reg < 0)
> +			return reg;
> +		data->fancfg[i] =3D reg;
> +
> +		/* Enable RPM mode */
> +		data->fancfg[i] |=3D 0xa8;
> +		err =3D i2c_smbus_write_byte_data(client, config_reg[i], data->fancfg[=
i]);
> +		if (err < 0)
> +			return err;
> +
> +		/* 2 counts (001) and Rate change 100 (0.125 secs) */
> +		data->fandyn[i] =3D 0x30;
> +		err =3D i2c_smbus_write_byte_data(client, dyn_reg[i], data->fandyn[i])=
;
> +		if (err < 0)
> +			return err;
> +	}
> +	return 0;
> +}
> +
> +static int max6620_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct max6620_data *data;
> +	struct device *hwmon_dev;
> +	int err;
> +
> +	data =3D devm_kzalloc(dev, sizeof(struct max6620_data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->client =3D client;
> +	mutex_init(&data->update_lock);
> +
> +	err =3D max6620_init_client(data);
> +	if (err)
> +		return err;
> +
> +	hwmon_dev =3D devm_hwmon_device_register_with_info(dev, client->name,
> +							 data,
> +							 &max6620_chip_info,
> +							 NULL);
> +
> +	return PTR_ERR_OR_ZERO(hwmon_dev);
> +}
> +
> +static const struct i2c_device_id max6620_id[] =3D {
> +	{ "max6620", 0 },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(i2c, max6620_id);
> +
> +static struct i2c_driver max6620_driver =3D {
> +	.class		=3D I2C_CLASS_HWMON,
> +	.driver =3D {
> +		.name	=3D "max6620",
> +	},
> +	.probe_new	=3D max6620_probe,
> +	.id_table	=3D max6620_id,
> +};
> +
> +module_i2c_driver(max6620_driver);
> +
> +MODULE_AUTHOR("Lucas Grunenberg");
> +MODULE_DESCRIPTION("MAX6620 sensor driver");
> +MODULE_LICENSE("GPL");
