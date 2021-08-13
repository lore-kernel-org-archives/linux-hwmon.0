Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C169BC4338F
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Aug 2021 04:43:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 997A2610A5
	for <linux-hwmon@archiver.kernel.org>; Fri, 13 Aug 2021 04:43:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235385AbhHMEnh (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 13 Aug 2021 00:43:37 -0400
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:9190 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235170AbhHMEng (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 13 Aug 2021 00:43:36 -0400
Received: from pps.filterd (m0170392.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 17D4g9Q3004933;
        Fri, 13 Aug 2021 00:42:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=smtpout1;
 bh=pf50ws9YoEPg84wa7paHIa1f5xsSM5Vgroz3lv/k1Cw=;
 b=ekD1YpRQWgbEPG8KmrancAlZrMdwPq90gNFpefwwo3WTl9djwkwBWIZfYTWr0srvAvya
 5VYg08iTcv2ceC2sw0E6SvS3Veg0J6exgy0m2+Mj60cuzYQnZ3Y0tCXWKrzHsDqZLklJ
 ANgte2ozY6uSqzz7c63Vwek9JsvpRCP/VC4NKjiFs+8mdo2WrbdSRLGsDFRFDR12ZIGh
 8W+3QtZRoLdUnlyBBwjuahj3hgIQyoaJz16hKbt1nqEz4FhHmxZXA/Vz4iQpCyoVm6Iy
 73OITlFaIwfFqTAhb7NFU6IXVQXjMlI7KgeIu0nPQwGO+iMjLfbUh4pOgWmEOieuV8BL vQ== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0a-00154904.pphosted.com with ESMTP id 3adc27gvkk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 13 Aug 2021 00:42:54 -0400
Received: from pps.filterd (m0089483.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 17D4e5kB068123;
        Fri, 13 Aug 2021 00:42:53 -0400
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
        by mx0b-00154901.pphosted.com with ESMTP id 3acyfd03kk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 13 Aug 2021 00:42:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HddzQjC49mmVXf+laWkZ4YXt7Jk6dD/N0mhFrjxfJ+Eux9d7UENQpofnRL2uW11iYzcHDjuKATlv006Pz7QVLSl9/CbK0J0BcPkzejb0LQdpmUIYZxBDVc+iu8aKHkW22KIvUsWPAmdRlrQpPpHnj53v0DdHV4aZS1EY6APhWXF60hkQfGqb8LGAf+JXfj7W73R/k5nMDXuDaunkXr8MrX/OjYOWQisx14qX/SSSFWy4P10dhKN0osH1nqUwfN4H3brxUPWLi0mvaohjhpDCFOwfREK6wn1H8JjjK67y9huBdsLjnbWPS94yTEc13XJ5At6+lWmnPgDdjeTwa1YsIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pf50ws9YoEPg84wa7paHIa1f5xsSM5Vgroz3lv/k1Cw=;
 b=Vd3DDeP4h1meAkNNTPackyGVRqfkr+YQEO154G0jITwXvyfUlA5/2etY5j/5fVU8Eg8pNWh2uHt0fzLfTbld2JCMUbi8e7iIHucS248jZyZOPAj9jaFbyN0ymaUqYqP+yrIBvQq2i0jvkrLuBitS3qpIGqB4cLvlHbDn4L3HCkNwTnX34BJBo46I92Q0GTejOuGC5qYRF93FbyXPyAPDKeIHfUnXR9vtrwEy6ePbVCO7+vd9gEsmINh6IpyaWuIibuxyOY/NkIeQInjfFrslKU+zyK/CUtzE4wV/kao806+F2FmoJLFe7ARXCtQNVWYt/zcCtt1lhzUcT+eTn5vWGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=dell.com; dmarc=pass action=none header.from=dell.com;
 dkim=pass header.d=dell.com; arc=none
Received: from MW2PR1901MB2028.namprd19.prod.outlook.com (52.132.148.11) by
 MWHPR19MB1022.namprd19.prod.outlook.com (10.173.126.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16; Fri, 13 Aug 2021 04:42:50 +0000
Received: from MW2PR1901MB2028.namprd19.prod.outlook.com
 ([fe80::bc11:39fd:5a90:870b]) by MW2PR1901MB2028.namprd19.prod.outlook.com
 ([fe80::bc11:39fd:5a90:870b%7]) with mapi id 15.20.4394.020; Fri, 13 Aug 2021
 04:42:50 +0000
From:   "Balac, Arun Saravanan" <ArunSaravanan.Balach@Dell.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [PATCH] hwmon: Add Maxim MAX6620 hardware monitoring driver
Thread-Topic: [PATCH] hwmon: Add Maxim MAX6620 hardware monitoring driver
Thread-Index: AdeDt+t1X3U8Hvu4THqeATjI4c8YHQAEP0mAAu5FbSAAAa3jAAAdJbSQ
Date:   Fri, 13 Aug 2021 04:42:50 +0000
Message-ID: <MW2PR1901MB20284CABEAB6E96F9023EEFBA6FA9@MW2PR1901MB2028.namprd19.prod.outlook.com>
References: <MW2PR1901MB20282D7F75F763C7FF997CAAA6EA9@MW2PR1901MB2028.namprd19.prod.outlook.com>
 <96555dd8-4664-1d26-2fe4-e7bbc0e85176@roeck-us.net>
 <MW2PR1901MB202895544397746BEA056097A6F99@MW2PR1901MB2028.namprd19.prod.outlook.com>
 <20210812144536.GB837928@roeck-us.net>
In-Reply-To: <20210812144536.GB837928@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Enabled=True;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SiteId=945c199a-83a2-4e80-9f8c-5a91be5752dd;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Owner=Arun_Saravanan_Balac@Dell.com;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_SetDate=2021-08-13T04:42:46.0333637Z;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Name=External Public;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Application=Microsoft Azure
 Information Protection;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_ActionId=61198103-58bf-4696-a40f-02ddead900b6;
 MSIP_Label_17cb76b2-10b8-4fe1-93d4-2202842406cd_Extended_MSFT_Method=Manual
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=Dell.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d888e205-c35a-44f8-275b-08d95e14ce66
x-ms-traffictypediagnostic: MWHPR19MB1022:
x-microsoft-antispam-prvs: <MWHPR19MB10229C1A26EA1EE6EBC0E319A6FA9@MWHPR19MB1022.namprd19.prod.outlook.com>
x-exotenant: 2khUwGVqB6N9v58KS13ncyUmMJd8q4
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ljXD8DoAZid04zwO1wpP72+WJedAuPYsFiYXbD+sUKWn67zfBi5Pgj6VeVI8kjYXwhhFISdceZBEpzkMcSANMNrNdKfZfZd4xjAtZItr5/sPfZjdFZzvtPyzTobecIsndHXeuoleFn9dDcI8IuNHJDRGUWEr9bMQ4VwTeCZOwyVmpEf61WaWOHqtMDkpLfQhuB114d80OLSXYMBME/VhP5VlbBdJ7h8jSzzJzyZjDQerF0TShXMIi5Gmk8CRX5Ih68XnskHm1lbVlGvdgCwQdzW0mklCVrH146AW5LVXPMlUbgrHkxjThufo5Z+5NlLUEORZ7omXBfWVIzUJjloSiAjRPa196jVxifxSCocbw/ukqihuvfwNlePc9ZHejgeimEXIdp+DshFZzYS7+96ppk4YgTqH7U+ik5tuiQZtdFI0/GYDxQa91VxXU9VAvDfpACKO9H8IcSru4dLWMRAQn+ShEX5f5kK7t+pTVJGDM8DaWF4Pe4aUCXH9bBcsvLEZw9+lV3O6bfRUSC1tB4SEVD72o1WbeO1LJ2akbMWefCnR/CTNinln/WSKnUz1JbXXUEiTX549Ss1iL91My4k9JX2IBVTTXTwFnCgv2sFtZS7snjc1ZFCHrA19TI+f47pDIoeQWR+9xTI5cWKRGgCLZx42q2jPyJjyC4rO/GSFJuD/EfZ6Ix55uhl/Q095JwNPOx4h5nWlCUtdn5tjQEd3TpYHce10flhYDblTg/lCiOWitThyTE1gZtL4I2UCbs5anRtsIdgPRqCPuHwdXulA6tsW2iCadwQgAWlzuhNo1hU=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR1901MB2028.namprd19.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(136003)(366004)(39860400002)(8936002)(478600001)(316002)(6916009)(5660300002)(2906002)(38100700002)(54906003)(7696005)(52536014)(122000001)(53546011)(26005)(6506007)(8676002)(33656002)(786003)(9686003)(76116006)(186003)(966005)(83380400001)(30864003)(55016002)(66556008)(66476007)(66446008)(4326008)(64756008)(71200400001)(66946007)(38070700005)(86362001)(559001)(579004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YrJrsjVzt2XwBnz7NfgfrHuh/snoVn5FqV0CTNg/yN22uXK01xgDCyMzwGW3?=
 =?us-ascii?Q?J4KJIzJYdxUZ9/B6ynUpsJyygiMzZKbMdg2zM7W53PtO7xNJSaV1j0oiC1wT?=
 =?us-ascii?Q?BEWkKndrp2xWiEVVTY3Lsfv8IhTVH72HbqrZ8TZwCu8HrlBNStMRBrYwUbTo?=
 =?us-ascii?Q?X2TEne9c31XvXITovcErfufIwBFslmfK8pMCa6Dbf5jgGJ8bf4wKwirINEc3?=
 =?us-ascii?Q?wCYZshsqMMG+4j6ilMiCkkGfeYimqkfQOtLAFDNQ02vXL2tiik8ec4/A1mwX?=
 =?us-ascii?Q?JD99N+M3Qa+LTllSaO8R17iYDfJCBWIetb8o1CtcBBNuwvGEHamwx5KzlCGZ?=
 =?us-ascii?Q?AAJPpSU8Rnh7dOvBFLztcmndd27dNZ7NNBPQEQfpFNmRFQ/GKT/Bnkzsu3Ag?=
 =?us-ascii?Q?vkftBR3RMW8n1q8MMkAaSIIb/UmhWur9X/FBkHB8R0ElXomdgj8ag3k+ajxV?=
 =?us-ascii?Q?Ykw8h+a1IiOzWLZ2+rzRhMIs16+Na4/Ilfm/Dl31DwERQwMStWC3honH2iZn?=
 =?us-ascii?Q?oozBZm9ZdaK3c6Hpl2LaxxLFpaYbrlWVsuV6nMswYbNa36Z7Qff1i6sI0+0I?=
 =?us-ascii?Q?QHxDOfzmV0nHYWBpMxcUF6cwSCSVIftyAnN7kiDxSCiVeN6jNZRIx6XKjb32?=
 =?us-ascii?Q?JkZmQhamZQOmzd4xlUvwu5AJAN5SkOYazOpnyQtg7H15K4jEqZ/NdPPxUm1/?=
 =?us-ascii?Q?5C6qFKkyoe0uhQ2ac8eYdaUHs7We72/Y3fSXAloNYbYFdUVU9aGHjNEf0NCM?=
 =?us-ascii?Q?p5w9freciSbAAJz4tY3zU7tbkusOUt91ilpjK1YINPJWHUE/CSEhrWi/VWVu?=
 =?us-ascii?Q?i/ApkJGpsjvutlb27ZzqrgXjQ3frE7hYpo9MejU4o7b8fFcHyFNv7wSkqGIp?=
 =?us-ascii?Q?y0+0Iy8kamNCZwhepoDnREV4euH/pZm09iOw/3SXfedmfToSyFzpzfK7Gzi5?=
 =?us-ascii?Q?kpWJPl7UUoQRz9EINt/efbCHxx7Ayo7q3pAlYyh8Wnves5bg7tt80PWo7Z3B?=
 =?us-ascii?Q?DxAYNHG8lH1DJLs/ZNosLBpEjx74v0l/9lZO/hM1va6vh36h6DCylpSPfh4m?=
 =?us-ascii?Q?fq27PBUwLscgfOjl0hxMdVebqc6JDH9uDdQdU6L4M0uE9MX43ryD65f0vICp?=
 =?us-ascii?Q?G5vkZnBKN1AiW5fJVuFEm33kR4WEi2AcMQc6p0vCskgSw8/KlkfoPDwUNipY?=
 =?us-ascii?Q?DmhyhWqW9RphooLJcVWgcLM9aLcZ9sWLDnTIeyrAK7/mmiCtgQ0iRcH2Fb/W?=
 =?us-ascii?Q?Hs66xImiuCahcMM/vGAG17uxk6ml7y1T+L2qQhEtG2QoQboVG9axHHg2rJGL?=
 =?us-ascii?Q?NH8OwZQGimvl0eZW8qlHgE5h?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Dell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR1901MB2028.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d888e205-c35a-44f8-275b-08d95e14ce66
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Aug 2021 04:42:50.3564
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 945c199a-83a2-4e80-9f8c-5a91be5752dd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NpL6HG+IQm3nwxzs/PlQoWeUmh1Ov5/zZqYVUS/l2Z7OCUm6hqw8ykZ/9L8km22GUylSrEelU2/aNUiWpHP3ZnLgg+eYuglvZWcQgWl4Ws8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR19MB1022
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-08-13_01:2021-08-12,2021-08-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108130028
X-Proofpoint-GUID: zMMUof8RanCcCUlHR8FgzYTRiZoRhxNt
X-Proofpoint-ORIG-GUID: zMMUof8RanCcCUlHR8FgzYTRiZoRhxNt
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108130028
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Thank you for the details.

As suggested, have versioned and submitted the updated patch separately alo=
ng with the change log for review.=20

Regards,
Arun Saravanan

-----Original Message-----
From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
Sent: Thursday, August 12, 2021 8:16 PM
To: Balac, Arun Saravanan
Cc: jdelvare@suse.com; linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: Add Maxim MAX6620 hardware monitoring driver


[EXTERNAL EMAIL]=20

On Thu, Aug 12, 2021 at 02:11:58PM +0000, Balac, Arun Saravanan wrote:
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

Updated patches must be sent as new patch and be versioned, not as reply
to a previous version. Also,

<Formletter> =20
Change log goes here. If it is missing, I won't know what changed.
That means I will have to dig out older patch versions to compare.
That costs time and would hold up both this patch as well as all other
patches which I still have to review.

For this reason, I will not review patches without change log.
</Formletter>

Guenter

>  Documentation/hwmon/max6620.rst |  46 +++
>  drivers/hwmon/Kconfig           |  10 +
>  drivers/hwmon/Makefile          |   1 +
>  drivers/hwmon/max6620.c         | 510 ++++++++++++++++++++++++++++++++
>  4 files changed, 567 insertions(+)
>  create mode 100644 Documentation/hwmon/max6620.rst
>  create mode 100644 drivers/hwmon/max6620.c
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
n/ds/MAX6620.pdf__;!!LpKI!yvnJNNxy30vWyMVuJ11QlMK86iBKRvlY7jHoLh9pERUOIN1bd=
4Yp6IUzBjBjhn4IHlJS2w$ [pdfserv[.]maxim-ic[.]com]
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
> index 000000000000..1b709f0fcb7f
> --- /dev/null
> +++ b/drivers/hwmon/max6620.c
> @@ -0,0 +1,510 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Hardware monitoring driver for Maxim MAX6620
> + *
> + * (C) 2012 by L. Grunenberg <contact@lgrunenberg.de>
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
MAX6620.pdf__;!!LpKI!yvnJNNxy30vWyMVuJ11QlMK86iBKRvlY7jHoLh9pERUOIN1bd4Yp6I=
UzBjBjhn4IHlJS2w$ [pdfserv[.]maxim-ic[.]com]
> + *
> + */
> +
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
> +	return 1 << ((val & 0xE0) >> 5);
> +}
> +
> +static int max6620_update_device(struct device *dev)
> +{
> +	struct max6620_data *data =3D dev_get_drvdata(dev);
> +	struct i2c_client *client =3D data->client;
> +	int i, reg, regval1, regval2;
> +	int ret =3D 0;
> +
> +	mutex_lock(&data->update_lock);
> +
> +	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
> +		for (i =3D 0; i < 4; i++) {
> +			reg =3D i2c_smbus_read_byte_data(client, config_reg[i]);
> +			if (reg < 0) {
> +				ret =3D reg;
> +				goto error;
> +			}
> +			data->fancfg[i] =3D reg;
> +
> +			reg =3D i2c_smbus_read_byte_data(client, dyn_reg[i]);
> +			if (reg < 0) {
> +				ret =3D reg;
> +				goto error;
> +			}
> +			data->fandyn[i] =3D reg;
> +
> +			regval1 =3D i2c_smbus_read_byte_data(client, tach_reg[i]);
> +			if (regval1 < 0) {
> +				ret =3D regval1;
> +				goto error;
> +			}
> +			regval2 =3D i2c_smbus_read_byte_data(client, tach_reg[i] + 1);
> +			if (regval2 < 0) {
> +				ret =3D regval2;
> +				goto error;
> +			}
> +			data->tach[i] =3D ((regval1 << 3) & 0x7f8) | ((regval2 >> 5) & 0x7);
> +
> +			regval1 =3D i2c_smbus_read_byte_data(client, target_reg[i]);
> +			if (regval1 < 0) {
> +				ret =3D regval1;
> +				goto error;
> +			}
> +			regval2 =3D i2c_smbus_read_byte_data(client, target_reg[i] + 1);
> +			if (regval2 < 0) {
> +				ret =3D regval2;
> +				goto error;
> +			}
> +			data->target[i] =3D ((regval1 << 3) & 0x7f8) | ((regval2 >> 5) & 0x7)=
;
> +		}
> +
> +		/*
> +		 * Alarms are cleared on read in case the condition that
> +		 * caused the alarm is removed. Keep the value latched here
> +		 * for providing the register through different alarm files.
> +		 */
> +		reg =3D i2c_smbus_read_byte_data(client, MAX6620_REG_FAULT);
> +		if (reg < 0) {
> +			ret =3D reg;
> +			goto error;
> +		}
> +		data->fault |=3D (reg >> 4) & (reg & 0x0F);
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
> +	u8 div;
> +	u8 val1;
> +	u8 val2;
> +
> +	ret =3D max6620_update_device(dev);
> +	if (ret < 0)
> +		return ret;
> +	data =3D dev_get_drvdata(dev);
> +	client =3D data->client;
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
> +				data->fault &=3D ~(BIT(channel));
> +				mutex_unlock(&data->update_lock);
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
> +				*val =3D (60 * div * MAX6620_CLOCK_FREQ) / (data->tach[channel]
> +									  * MAX6620_PULSE_PER_REV);
> +			}
> +			break;
> +		case hwmon_fan_target:
> +			if (data->target[channel] =3D=3D 0) {
> +				*val =3D 0;
> +			} else {
> +				div =3D max6620_fan_div_from_reg(data->fandyn[channel]);
> +				*val =3D (60 * div * MAX6620_CLOCK_FREQ) / (data->target[channel]
> +									  * MAX6620_PULSE_PER_REV);
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
> +			tach =3D (60 * div * MAX6620_CLOCK_FREQ) / (val * MAX6620_PULSE_PER_R=
EV);
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
> +			data->fault &=3D ~(BIT(channel));
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
>=20
> base-commit: ff1176468d368232b684f75e82563369208bc371
> --=20
> 2.32.0
>=20
> Please find above the updated patch.
>=20
> Thanks,
> Arun Saravanan
> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Wednesday, July 28, 2021 9:25 PM
> To: Balac, Arun Saravanan; jdelvare@suse.com
> Cc: linux-hwmon@vger.kernel.org
> Subject: Re: [PATCH] hwmon: Add Maxim MAX6620 hardware monitoring driver
>=20
>=20
> [EXTERNAL EMAIL]=20
>=20
> On 7/28/21 7:11 AM, Balac, Arun Saravanan wrote:
> > From: Arun Saravanan Balachandran <Arun_Saravanan_Balac@dell.com>
> >=20
> > Add hardware monitoring driver for Maxim MAX6620 Fan controller
> >=20
> > Originally-from: L. Grunenberg <contact@lgrunenberg.de>
> > Originally-from: Cumulus Networks <support@cumulusnetworks.com>
> > Originally-from: Shuotian Cheng <shuche@microsoft.com>
> > Signed-off-by: Arun Saravanan Balachandran <Arun_Saravanan_Balac@dell.c=
om>
> > ---
> >   drivers/hwmon/Kconfig   |  10 +
> >   drivers/hwmon/Makefile  |   1 +
> >   drivers/hwmon/max6620.c | 464 +++++++++++++++++++++++++++++++++++++++=
+
>=20
> Documentation missing.
>=20
> >   3 files changed, 475 insertions(+)
> >   create mode 100644 drivers/hwmon/max6620.c
> >=20
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index e3675377bc5d..7bb2fbd72db4 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -1022,6 +1022,16 @@ config SENSORS_MAX31730
> >   	  This driver can also be built as a module. If so, the module
> >   	  will be called max31730.
> >  =20
> > +config SENSORS_MAX6620
> > +	tristate "Maxim MAX6620 sensor chip"
> > +	depends on I2C
> > +	help
> > +	  If you say yes here you get support for the MAX6620
> > +	  sensor chips.
>=20
> This is not a sensor, it is a fan controller.
>=20
> > +
> > +	  This driver can also be built as a module. If so, the module
> > +	  will be called max6620.
> > +
> >   config SENSORS_MAX6621
> >   	tristate "Maxim MAX6621 sensor chip"
> >   	depends on I2C
> > diff --git a/drivers/hwmon/Makefile b/drivers/hwmon/Makefile
> > index d712c61c1f5e..9e50ff903931 100644
> > --- a/drivers/hwmon/Makefile
> > +++ b/drivers/hwmon/Makefile
> > @@ -135,6 +135,7 @@ obj-$(CONFIG_SENSORS_MAX1668)	+=3D max1668.o
> >   obj-$(CONFIG_SENSORS_MAX197)	+=3D max197.o
> >   obj-$(CONFIG_SENSORS_MAX31722)	+=3D max31722.o
> >   obj-$(CONFIG_SENSORS_MAX31730)	+=3D max31730.o
> > +obj-$(CONFIG_SENSORS_MAX6620)	+=3D max6620.o
> >   obj-$(CONFIG_SENSORS_MAX6621)	+=3D max6621.o
> >   obj-$(CONFIG_SENSORS_MAX6639)	+=3D max6639.o
> >   obj-$(CONFIG_SENSORS_MAX6642)	+=3D max6642.o
> > diff --git a/drivers/hwmon/max6620.c b/drivers/hwmon/max6620.c
> > new file mode 100644
> > index 000000000000..05f6fdc80343
> > --- /dev/null
> > +++ b/drivers/hwmon/max6620.c
> > @@ -0,0 +1,464 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +/*
> > + * max6620.c - Linux Kernel module for hardware monitoring.
>=20
> Pointless.
>=20
> > + *
> > + * (C) 2012 by L. Grunenberg <contact@lgrunenberg.de>
> > + *
> > + * based on code written by :
> > + * 2007 by Hans J. Koch <hjk@hansjkoch.de>
> > + * John Morris <john.morris@spirentcom.com>
> > + * Copyright (c) 2003 Spirent Communications
> > + * and Claus Gindhart <claus.gindhart@kontron.com>
> > + *
> > + * This module has only been tested with the MAX6620 chip.
> > + *
> > + * The datasheet was last seen at:
> > + *
> > + *        https://urldefense.com/v3/__http://pdfserv.maxim-ic.com/en/d=
s/MAX6620.pdf__;!!LpKI!1VdQjyy5Q-_FrmWBxhCaB4bhmElQ75SkuBrVm_q99Rjt5Ejt_AMj=
K94gP2c_gd_tRYx1Ow$ [pdfserv[.]maxim-ic[.]com]
> > + *
> > + */
> > +
> > +#include <linux/module.h>
> > +#include <linux/init.h>
> > +#include <linux/slab.h>
> > +#include <linux/jiffies.h>
> > +#include <linux/i2c.h>
> > +#include <linux/hwmon.h>
> > +#include <linux/hwmon-sysfs.h>
>=20
> Not needed.
>=20
> > +#include <linux/err.h>
>=20
> Alphabetic include file order, please.
>=20
> > +
> > +
> > +/*
> > + * MAX 6620 registers
> > + */
> > +
> > +#define MAX6620_REG_CONFIG	0x00
> > +#define MAX6620_REG_FAULT	0x01
> > +#define MAX6620_REG_CONF_FAN0	0x02
> > +#define MAX6620_REG_CONF_FAN1	0x03
> > +#define MAX6620_REG_CONF_FAN2	0x04
> > +#define MAX6620_REG_CONF_FAN3	0x05
> > +#define MAX6620_REG_DYN_FAN0	0x06
> > +#define MAX6620_REG_DYN_FAN1	0x07
> > +#define MAX6620_REG_DYN_FAN2	0x08
> > +#define MAX6620_REG_DYN_FAN3	0x09
> > +#define MAX6620_REG_TACH0	0x10
> > +#define MAX6620_REG_TACH1	0x12
> > +#define MAX6620_REG_TACH2	0x14
> > +#define MAX6620_REG_TACH3	0x16
> > +#define MAX6620_REG_VOLT0	0x18
> > +#define MAX6620_REG_VOLT1	0x1A
> > +#define MAX6620_REG_VOLT2	0x1C
> > +#define MAX6620_REG_VOLT3	0x1E
> > +#define MAX6620_REG_TAR0	0x20
> > +#define MAX6620_REG_TAR1	0x22
> > +#define MAX6620_REG_TAR2	0x24
> > +#define MAX6620_REG_TAR3	0x26
> > +#define MAX6620_REG_DAC0	0x28
> > +#define MAX6620_REG_DAC1	0x2A
> > +#define MAX6620_REG_DAC2	0x2C
> > +#define MAX6620_REG_DAC3	0x2E
> > +
> > +/*
> > + * Config register bits
> > + */
> > +
> > +#define MAX6620_CFG_RUN		0x80
> > +#define MAX6620_CFG_POR		0x40
> > +#define MAX6620_CFG_TIMEOUT	0x20
> > +#define MAX6620_CFG_FULLFAN	0x10
> > +#define MAX6620_CFG_OSC		0x08
> > +#define MAX6620_CFG_WD_MASK	0x06
> > +#define MAX6620_CFG_WD_2	0x02
> > +#define MAX6620_CFG_WD_6	0x04
> > +#define MAX6620_CFG_WD10	0x06
> > +#define MAX6620_CFG_WD		0x01
>=20
> Please use BIT().
>=20
>=20
> > +
> > +
> > +/*
> > + * Failure status register bits
> > + */
> > +
> > +#define MAX6620_FAIL_TACH0	0x10
> > +#define MAX6620_FAIL_TACH1	0x20
> > +#define MAX6620_FAIL_TACH2	0x40
> > +#define MAX6620_FAIL_TACH3	0x80
> > +#define MAX6620_FAIL_MASK0	0x01
> > +#define MAX6620_FAIL_MASK1	0x02
> > +#define MAX6620_FAIL_MASK2	0x04
> > +#define MAX6620_FAIL_MASK3	0x08
> > +
> > +
> > +/* Minimum and maximum values of the FAN-RPM */
> > +#define FAN_RPM_MIN 240
> > +#define FAN_RPM_MAX 30000
>=20
> #define<space>DEFINE<tab>value
>=20
> > +
> > +/*
> > + * Insmod parameters
> > + */
> > +
> > +
> > +/* clock: The clock frequency of the chip the driver should assume */
> > +static int clock =3D 8192;
> > +static u32 np =3D 2;
>=20
> 'clock' is always 8192. np is the number of pulses per revolution,
> and always 2. Please use defines for both.
>=20
> > +
> > +module_param(clock, int, 0444);
> > +
> > +static const u8 config_reg[] =3D {
> > +	MAX6620_REG_CONF_FAN0,
> > +	MAX6620_REG_CONF_FAN1,
> > +	MAX6620_REG_CONF_FAN2,
> > +	MAX6620_REG_CONF_FAN3,
> > +};
> > +
> > +static const u8 dyn_reg[] =3D {
> > +	MAX6620_REG_DYN_FAN0,
> > +	MAX6620_REG_DYN_FAN1,
> > +	MAX6620_REG_DYN_FAN2,
> > +	MAX6620_REG_DYN_FAN3,
> > +};
> > +
> > +static const u8 tach_reg[] =3D {
> > +	MAX6620_REG_TACH0,
> > +	MAX6620_REG_TACH1,
> > +	MAX6620_REG_TACH2,
> > +	MAX6620_REG_TACH3,
> > +};
> > +
> > +static const u8 target_reg[] =3D {
> > +	MAX6620_REG_TAR0,
> > +	MAX6620_REG_TAR1,
> > +	MAX6620_REG_TAR2,
> > +	MAX6620_REG_TAR3,
> > +};
> > +
> > +/*
> > + * Client data (each client gets its own)
> > + */
> > +
> > +struct max6620_data {
> > +	struct i2c_client *client;
> > +	struct mutex update_lock;
> > +	char valid; /* zero until following fields are valid */
>=20
> bool. However, I would strongly suggest to drop caching
> except for the fault register.
>=20
> > +	unsigned long last_updated; /* in jiffies */
> > +
> > +	/* register values */
> > +	u8 config;
> > +	u8 fancfg[4];
> > +	u8 fandyn[4];
> > +	u8 fault;
> > +	u16 tach[4];
> > +	u16 target[4];
> > +};
> > +
> > +static u8 max6620_fan_div_from_reg(u8 val)
> > +{
> > +	return 1 << ((val & 0xE0) >> 5);
> > +}
> > +
> > +static struct max6620_data *max6620_update_device(struct device *dev)
> > +{
> > +	struct max6620_data *data =3D dev_get_drvdata(dev);
> > +	struct i2c_client *client =3D data->client;
> > +	int i;
> > +	u8 fault_reg, regval1, regval2;
> > +
> > +	mutex_lock(&data->update_lock);
> > +
> > +	if (time_after(jiffies, data->last_updated + HZ) || !data->valid) {
> > +
> > +		for (i =3D 0; i < 4; i++) {
> > +			data->fancfg[i] =3D i2c_smbus_read_byte_data(client, config_reg[i])=
;
> > +			data->fandyn[i] =3D i2c_smbus_read_byte_data(client, dyn_reg[i]);
> > +			regval1 =3D i2c_smbus_read_byte_data(client, tach_reg[i]);
> > +			regval2 =3D i2c_smbus_read_byte_data(client, tach_reg[i] + 1);
> > +			data->tach[i] =3D ((regval1 << 3) & 0x7f8) | ((regval2 >> 5) & 0x7)=
;
> > +			regval1 =3D i2c_smbus_read_byte_data(client, target_reg[i]);
> > +			regval2 =3D i2c_smbus_read_byte_data(client, target_reg[i] + 1);
> > +			data->target[i] =3D ((regval1 << 3) & 0x7f8) | ((regval2 >> 5) & 0x=
7);
> > +		}
> > +
> > +
> > +		/*
> > +		 * Alarms are cleared on read in case the condition that
> > +		 * caused the alarm is removed. Keep the value latched here
> > +		 * for providing the register through different alarm files.
> > +		 */
> > +		fault_reg =3D i2c_smbus_read_byte_data(client, MAX6620_REG_FAULT);
> > +		data->fault |=3D (fault_reg >> 4) & (fault_reg & 0x0F);
> > +
> > +		data->last_updated =3D jiffies;
> > +		data->valid =3D 1;
> > +	}
> > +
> > +	mutex_unlock(&data->update_lock);
> > +
> > +	return data;
> > +}
> > +
> > +static umode_t
> > +max6620_is_visible(const void *data, enum hwmon_sensor_types type, u32=
 attr,
> > +		   int channel)
> > +{
> > +	switch (type) {
> > +	case hwmon_fan:
> > +		switch (attr) {
> > +		case hwmon_fan_alarm:
> > +		case hwmon_fan_input:
> > +			return 0444;
> > +		case hwmon_fan_div:
> > +		case hwmon_fan_target:
> > +			return 0644;
> > +		default:
> > +			break;
> > +		}
> > +
> > +	default:
> > +		break;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int
> > +max6620_read(struct device *dev, enum hwmon_sensor_types type, u32 att=
r,
> > +	     int channel, long *val)
> > +{
> > +	struct max6620_data *data =3D max6620_update_device(dev);
> > +	int alarm =3D 0;
> > +	u8 div;
> > +
> > +	switch (type) {
> > +	case hwmon_fan:
> > +		switch (attr) {
> > +		case hwmon_fan_alarm:
> > +			mutex_lock(&data->update_lock);
> > +			if (data->fault & (1 << channel))
> > +				alarm =3D 1;
> > +
> > +			mutex_unlock(&data->update_lock);
>=20
> Locking is pointless here.
> 			*val =3D !!(data->fault & BIT(channel));
> does the same.
>=20
> This code does not clear alarms after reading the attribute,
> or re-enable alarms. Clearing faults by relying on a write
> to fan_target is not appropriate. Alarms should be cleared
> and re-armed after reading an alarm attribute.
>=20
> > +			*val =3D alarm;
> > +
> > +			break;
> > +		case hwmon_fan_div:
> > +			*val =3D max6620_fan_div_from_reg(data->fandyn[channel]);
> > +			break;
> > +		case hwmon_fan_input:
> > +			if (data->tach[channel] =3D=3D 0)
> > +				*val =3D 0;
> > +			else {
>=20
> if and else branch both need to use { }.
>=20
> Please run checkpatch --strict and fix what it reports.
>=20
> > +				div =3D max6620_fan_div_from_reg(data->fandyn[channel]);
> > +				*val =3D (60 * div * clock)/(data->tach[channel] * np);
> > +			}
> > +			break;
> > +		case hwmon_fan_target:
> > +			if (data->target[channel] =3D=3D 0)
> > +				*val =3D 0;
> > +			else {
> > +				div =3D max6620_fan_div_from_reg(data->fandyn[channel]);
> > +				*val =3D (60 * div * clock)/(data->target[channel] * np);
> > +			}
> > +			break;
> > +		default:
> > +			return -EOPNOTSUPP;
> > +		}
> > +		break;
> > +
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int
> > +max6620_write(struct device *dev, enum hwmon_sensor_types type, u32 at=
tr,
> > +	      int channel, long val)
> > +{
> > +	struct max6620_data *data =3D dev_get_drvdata(dev);
> > +	struct i2c_client *client =3D data->client;
> > +	u8 div;
> > +	u16 tach;
> > +	u8 val1;
> > +	u8 val2;
> > +
> > +	switch (type) {
> > +	case hwmon_fan:
> > +		switch (attr) {
> > +		case hwmon_fan_div:
> > +			mutex_lock(&data->update_lock);
>=20
> The lock is pointless here. Move it after the switch statement to
> simplify the code.
>=20
> > +			switch (val) {
> > +			case 1:
> > +				div =3D 0;
> > +				break;
> > +			case 2:
> > +				div =3D 1;
> > +				break;
> > +			case 4:
> > +				div =3D 2;
> > +				break;
> > +			case 8:
> > +				div =3D 3;
> > +				break;
> > +			case 16:
> > +				div =3D 4;
> > +				break;
> > +			case 32:
> > +				div =3D 5;
> > +				break;
> > +			default:
> > +				mutex_unlock(&data->update_lock);
> > +				return -EINVAL;
> > +			}
> > +			data->fandyn[channel] &=3D 0x1F;
> > +			data->fandyn[channel] |=3D div << 5;
> > +			i2c_smbus_write_byte_data(client, dyn_reg[channel],
> > +						  data->fandyn[channel]);
>=20
> Please do not ignore errors (everywhere).
>=20
> > +			mutex_unlock(&data->update_lock);
> > +
> > +			break;
> > +		case hwmon_fan_target:
> > +			val =3D clamp_val(val, FAN_RPM_MIN, FAN_RPM_MAX);
> > +			mutex_lock(&data->update_lock);
> > +
> > +			div =3D max6620_fan_div_from_reg(data->fandyn[channel]);
> > +			tach =3D (60 * div * clock)/(val * np);
> > +			val1 =3D (tach >> 3) & 0xff;
> > +			val2 =3D (tach << 5) & 0xe0;
> > +			i2c_smbus_write_byte_data(client, target_reg[channel], val1);
> > +			i2c_smbus_write_byte_data(client, target_reg[channel] + 1, val2);
> > +
> > +			/* Setting TACH count re-enables fan fault detection */
> > +			data->fault &=3D ~(1 << channel);
>=20
> Maybe, but expecting the user to write to this register to re-arm alarms
> is not appropriate.
>=20
> > +
> > +			mutex_unlock(&data->update_lock);
> > +
> > +			break;
> > +		default:
> > +			return -EOPNOTSUPP;
> > +		}
> > +		break;
> > +
> > +	default:
> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const u32 max6620_fan_config[] =3D {
> > +	HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
> > +	HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
> > +	HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
> > +	HWMON_F_INPUT | HWMON_F_DIV | HWMON_F_TARGET | HWMON_F_ALARM,
> > +	0
> > +};
> > +
> > +static const struct hwmon_channel_info max6620_fan =3D {
> > +	.type =3D hwmon_fan,
> > +	.config =3D max6620_fan_config,
> > +};
> > +
> > +static const struct hwmon_channel_info *max6620_info[] =3D {
> > +	&max6620_fan,
> > +	NULL
> > +};
>=20
> Please use the HWMON_CHANNEL_INFO() macro.
>=20
> > +
> > +static const struct hwmon_ops max6620_hwmon_ops =3D {
> > +	.read =3D max6620_read,
> > +	.write =3D max6620_write,
> > +	.is_visible =3D max6620_is_visible,
> > +};
> > +
> > +static const struct hwmon_chip_info max6620_chip_info =3D {
> > +	.ops =3D &max6620_hwmon_ops,
> > +	.info =3D max6620_info,
> > +};
> > +
> > +static int max6620_init_client(struct i2c_client *client)
> > +{
> > +	struct max6620_data *data =3D i2c_get_clientdata(client);
> > +	int config;
> > +	int err =3D -EIO;
> > +	int i;
> > +
> > +	config =3D i2c_smbus_read_byte_data(client, MAX6620_REG_CONFIG);
> > +
> Unnecessary empty line
>=20
> > +	if (config < 0) {
> > +		dev_err(&client->dev, "Error reading config, aborting.\n");
> > +		return err;
>=20
> Please do not overwrite error codes. This should return config.
>=20
> > +	}
> > +
> > +	/*
> > +	 * Set bit 4, disable other fans from going full speed on a fail
> > +	 * failure.
> > +	 */
> > +	if (i2c_smbus_write_byte_data(client, MAX6620_REG_CONFIG, config | 0x=
10)) {
> > +		dev_err(&client->dev, "Config write error, aborting.\n");
> > +		return err;
>=20
> Please return the error code from i2c_smbus_write_byte_data().
>=20
> > +	}
> > +
> > +	data->config =3D config;
>=20
> data->config is not used anywhere.
>=20
> > +	for (i =3D 0; i < 4; i++) {
> > +		data->fancfg[i] =3D i2c_smbus_read_byte_data(client, config_reg[i]);
> > +		/* Enable RPM mode */
> > +		data->fancfg[i] |=3D 0xa8;
> > +		i2c_smbus_write_byte_data(client, config_reg[i], data->fancfg[i]);
> > +		data->fandyn[i] =3D i2c_smbus_read_byte_data(client, dyn_reg[i]);
> > +		/* 2 counts (001) and Rate change 100 (0.125 secs) */
> > +		data->fandyn[i] =3D 0x30;
> > +		i2c_smbus_write_byte_data(client, dyn_reg[i], data->fandyn[i]);
>=20
> Again, please do not ignore error codes. Also, this mostly duplicates
> max6620_update_device().
>=20
> > +	}
> > +	return 0;
> > +}
> > +
> > +static int max6620_probe(struct i2c_client *client)
> > +{
> > +	struct device *dev =3D &client->dev;
> > +	struct max6620_data *data;
> > +	struct device *hwmon_dev;
> > +	int err;
> > +
> > +	data =3D devm_kzalloc(dev, sizeof(struct max6620_data), GFP_KERNEL);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	i2c_set_clientdata(client, data);
>=20
> The only reason for this is to use it in max6620_init_client().
> Just pass 'data' to that function instead.
>=20
> > +	data->client =3D client;
> > +	mutex_init(&data->update_lock);
> > +
> > +	/*
> > +	 * Initialize the max6620 chip
> > +	 */
>=20
> Pointless comment.
>=20
> > +	err =3D max6620_init_client(client);
> > +	if (err)
> > +		return err;
> > +
> > +	hwmon_dev =3D devm_hwmon_device_register_with_info(dev, client->name,
> > +							 data,
> > +							 &max6620_chip_info,
> > +							 NULL);
> > +
> > +	return PTR_ERR_OR_ZERO(hwmon_dev);
> > +}
> > +
> > +static const struct i2c_device_id max6620_id[] =3D {
> > +	{ "max6620", 0 },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(i2c, max6620_id);
> > +
> > +static struct i2c_driver max6620_driver =3D {
> > +	.class		=3D I2C_CLASS_HWMON,
> > +	.driver =3D {
> > +		.name	=3D "max6620",
> > +	},
> > +	.probe_new	=3D max6620_probe,
> > +	.id_table	=3D max6620_id,
> > +};
> > +
> > +module_i2c_driver(max6620_driver);
> > +
> > +MODULE_AUTHOR("Lucas Grunenberg");
> > +MODULE_DESCRIPTION("MAX6620 sensor driver");
> > +MODULE_LICENSE("GPL");
> >=20
> > base-commit: ff1176468d368232b684f75e82563369208bc371
> >=20
>=20
