Return-Path: <SRS0=YVCu=4B=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E23C2BA83
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 Feb 2020 16:38:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 732F624650
	for <linux-hwmon@archiver.kernel.org>; Thu, 13 Feb 2020 16:38:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=analog.onmicrosoft.com header.i=@analog.onmicrosoft.com header.b="cO3YJr1m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727695AbgBMQiw (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 13 Feb 2020 11:38:52 -0500
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:6660 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728572AbgBMQiv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 Feb 2020 11:38:51 -0500
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 01DGOs0N031480;
        Thu, 13 Feb 2020 11:38:28 -0500
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2108.outbound.protection.outlook.com [104.47.55.108])
        by mx0a-00128a01.pphosted.com with ESMTP id 2y1tyqk10t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 13 Feb 2020 11:38:28 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Olo2Tww7t11EvUMcca2vVsn6EkxJssyPUretzEcUaRsF8PNHtTnQUl0dVNRSdZFgwS/aV8AUpLsr+C+q4inD0L0vCw8fhlTKreRPuHo01TvMlioR/u1igUvn6EFRVgMAywJp2NAzS8VHIBQloQX4lK8VD1B1m5ZaT+TiNOXjxy0lIcdK0YeQRr2OMFvxVL0DoDuGhKUO4+gTtjgUd2iyY1YiHsoNiApxLRzQP/oT3KrCIKvfNdDCO+jnqQ39cED5NsH8weLuhHqicw9Mo/VVHxurvvHVeCHKeSuF4Pik6Iq0WKZVwFGApCoNdGKfy5uavvdkgFvwJISMNVxcwLMocw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TmD9Sp1X4FMwStS3EVvBZ3+7ShgNDRdazbsSH4U9l3E=;
 b=ih/auUmemagpTEdao+TlmETfVuWM0+Q3WCpn9PbzM+681mWH1fAxCRdHvviKmn87pazR2L0YluAbJ6DhXVnisyBPUBGaloVrzn2BsBKSG+vnOGrZdDKS9P1v6CpwK2oCrjA43REjF7HYhSAvtfZHMRazzLJYKzsRN9RJTTQlM05SjTWIVs8SMJcwmJqRG3zxQqx6tUKo7Tj/ebNop2P2YMFwp27tseForAEfff05NnM7Re1mGwg1NrJPa8EGB5U/Jea5WPxLJXxsAEJxtBd+Qs/adJ5rfZgAwAjUxDBSCOEoLEd8Ba4c+7ZVmS71a8quOWlCpRd9jY10oNj+0c+/fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TmD9Sp1X4FMwStS3EVvBZ3+7ShgNDRdazbsSH4U9l3E=;
 b=cO3YJr1mtnKou0OIeJnXl7eC6m6jLpH38Ac1FEl9yVx+2Vcte75+WDyLBcRdsHTOnMS29odEqjsBZLV2LrySITDWF7gqqiMlCi4/WS5O+3b6Yka/ILbMM1TWBBmWAga6y76ihY6f3JX3bdRCHbKvipXsCcsenXPNJBxt+WooVkA=
Received: from SN6PR03MB4032.namprd03.prod.outlook.com (52.135.113.74) by
 SN6SPR01MB16.namprd03.prod.outlook.com (52.135.79.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2707.23; Thu, 13 Feb 2020 16:38:27 +0000
Received: from SN6PR03MB4032.namprd03.prod.outlook.com
 ([fe80::1de8:80b3:fe48:b06]) by SN6PR03MB4032.namprd03.prod.outlook.com
 ([fe80::1de8:80b3:fe48:b06%5]) with mapi id 15.20.2729.025; Thu, 13 Feb 2020
 16:38:26 +0000
From:   "Jones, Michael-A1" <Michael-A1.Jones@analog.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [PATCH] docs: hmon: ltc2978.rst: fix a broken table
Thread-Topic: [PATCH] docs: hmon: ltc2978.rst: fix a broken table
Thread-Index: AQHV4oj+UTt2pWg7pkWpoMVGGVTIjagZTvCAgAAD6XA=
Date:   Thu, 13 Feb 2020 16:38:26 +0000
Message-ID: <SN6PR03MB40322F27BA88395ADD0BD5B8F61A0@SN6PR03MB4032.namprd03.prod.outlook.com>
References: <9188836b1ec6744d3d936df8fbfe08f25422879e.1581610553.git.mchehab+huawei@kernel.org>
 <20200213162403.GB16294@roeck-us.net>
In-Reply-To: <20200213162403.GB16294@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbWpvbmVzMlxh?=
 =?us-ascii?Q?cHBkYXRhXHJvYW1pbmdcMDlkODQ5YjYtMzJkMy00YTQwLTg1ZWUtNmI4NGJh?=
 =?us-ascii?Q?MjllMzViXG1zZ3NcbXNnLTQwMzU2MWVhLTRlN2YtMTFlYS1iYTg0LTQ0MWNh?=
 =?us-ascii?Q?OGUxZjg1MFxhbWUtdGVzdFw0MDM1NjFlYy00ZTdmLTExZWEtYmE4NC00NDFj?=
 =?us-ascii?Q?YThlMWY4NTBib2R5LnR4dCIgc3o9IjEyMTQiIHQ9IjEzMjI2MDg1NTA0NDgy?=
 =?us-ascii?Q?NTc3MSIgaD0id01DNU9LOEt3SUdSRjlJVjNXOVRPcWdKT29RPSIgaWQ9IiIg?=
 =?us-ascii?Q?Ymw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBS3dCQUFD?=
 =?us-ascii?Q?cjRxSUNqT0xWQWFxUmdjOUFwK2hocXBHQnowQ242R0VDQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUhBQUFBQThBUUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQVFBQkFBQUFnODliQmdBQUFBQUFBQUFBQUFBQUFKNEFBQUJoQUdRQWFR?=
 =?us-ascii?Q?QmZBSE1BWlFCakFIVUFjZ0JsQUY4QWNBQnlBRzhBYWdCbEFHTUFkQUJ6QUY4?=
 =?us-ascii?Q?QWRBQnBBR1VBY2dBeEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?RUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHRUFaQUJwQUY4QWN3QmxBR01BZFFC?=
 =?us-ascii?Q?eUFHVUFYd0J3QUhJQWJ3QnFBR1VBWXdCMEFITUFYd0IwQUdrQVpRQnlBRElB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFDQUFB?=
 =?us-ascii?Q?QUFBQT0iLz48L21ldGE+?=
x-dg-rorf: true
x-originating-ip: [65.157.77.67]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3255e24e-bd0a-4dc4-540d-08d7b0a32687
x-ms-traffictypediagnostic: SN6SPR01MB16:
x-microsoft-antispam-prvs: <SN6SPR01MB16204CFDFD9A213CDD47B9F61A0@SN6SPR01MB16.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3044;
x-forefront-prvs: 031257FE13
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(39860400002)(366004)(136003)(346002)(396003)(376002)(189003)(199004)(478600001)(6506007)(53546011)(2906002)(316002)(81156014)(81166006)(8936002)(71200400001)(8676002)(76116006)(66946007)(66556008)(66446008)(64756008)(66476007)(55016002)(7696005)(9686003)(86362001)(5660300002)(4744005)(186003)(26005)(4326008)(52536014)(54906003)(110136005)(33656002);DIR:OUT;SFP:1101;SCL:1;SRVR:SN6SPR01MB16;H:SN6PR03MB4032.namprd03.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: analog.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: tMS0CHvAnBeKd/a6g1tgigcBM4MBgXh+1paYaIh/u/TpxBAQpZOpJeiBD8ScBDW0q8i6CONQ+F6SuF5o/74EpBkTO2NUaaRtSFq7WSLk0hUa0ZAZPX8NqwU0NPkHIpsj6HlNTLvY89RklarEHy3oJdcoNPwmLZ0rhOJ+cxHO/jqH/0YKIr4w7FJM7IRDgRCDqTDVnXsv7zumHHJK28UAJwhbb8Jh03SM75wQDMPvqWaYiQeZmfJdAQa8XQRZWAdnocDsMkdLFQhG2JCKcvxXZ3kMJUvRN2isPeHP4KyID3WZEaBMeUmb8Nd0pgHHv7M0su5n5BJ6BcVSgMKFSie0UXeIa96Xx2nD9btBliKqqzYJNdXckM5lJmosUvpZqAHk+JB3RbQu4WvwMmZQFFGgpsv7XDdgjCgGZat56dIPw5H6Jg+2NqT/pQ96a+K0axWj
x-ms-exchange-antispam-messagedata: pZR5/bJQLLV1goEFHZJQF2oM7XNJ0rE8R9gN8qRES111ob0x542MQeOkTUAD6mcoO1MWvJ0TAMh3DkY/82lzk94LbCWmhscb4kO6iX2sLqlymd2kZXT/QAwhugKnrOH3EVMUolDshMRyrM7tiexIUA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3255e24e-bd0a-4dc4-540d-08d7b0a32687
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Feb 2020 16:38:26.6346
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JLIQio9N6anXPYIO7/ydwmLd69pAKlFcia+OvHxoZpgtXzX/iPQGhS5COPxrp7XDvi1wRjVQw56ZgN3Uk2QhAS7jJX10MCYJd09zWkgqswk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6SPR01MB16
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.572
 definitions=2020-02-13_05:2020-02-12,2020-02-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 bulkscore=0 impostorscore=0 clxscore=1011
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002130122
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



-----Original Message-----
From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
Sent: Thursday, February 13, 2020 9:24 AM
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>; Jonathan Corbet <co=
rbet@lwn.net>; Jean Delvare <jdelvare@suse.com>; Jones, Michael-A1 <Michael=
-A1.Jones@analog.com>; linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] docs: hmon: ltc2978.rst: fix a broken table

[External]

On Thu, Feb 13, 2020 at 05:15:55PM +0100, Mauro Carvalho Chehab wrote:
> /devel/v4l/docs/Documentation/hwmon/ltc2978.rst:320: WARNING: Malformed t=
able.
> Text in column margin in table line 80.
>=20
> Cc: Mike Jones <michael-a1.jones@analog.com>
> Fixes: 6d36d475215a ("hwmon: (pmbus/ltc2978) add support for more parts."=
)
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Sorry, I may have messed that up when trying to fix lines exceeding=20
80 columns in that file. The problem is already fixed in -next.

MJ: I would like to know what tool produced the warning so I can run it nex=
t time before submission.

Guenter
