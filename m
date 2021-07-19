Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05EC9C12002
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Jul 2021 07:28:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB3CE611AF
	for <linux-hwmon@archiver.kernel.org>; Mon, 19 Jul 2021 07:27:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234853AbhGSHa6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 19 Jul 2021 03:30:58 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:9930 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233759AbhGSHax (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Jul 2021 03:30:53 -0400
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 16J7AbIU011565;
        Mon, 19 Jul 2021 03:27:35 -0400
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam07lp2049.outbound.protection.outlook.com [104.47.51.49])
        by mx0a-00128a01.pphosted.com with ESMTP id 39uv48nh48-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 19 Jul 2021 03:27:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KoREGVjDcNOc6kBBTjqq8Mqmp5vlY4Qh44mD61pLexcUqj9KcjDadLwNUq+5FBu+UWjog5LSXJDrTACLAQ5I1P0+J/RCfb4CRowm+jeauhZec6oAPE0wKLh4VOQDptZKDoOjrTIKuzw4VljhqWwqRyGobE/GR/3GZYfFBZf+zhMNOseiX2JWY89c8e8tMKl+jHKXHMsinGLYlVKSO8o5Oo0MnHj5J61gcGqRyiuLaaO7QGmymrMTI2IveFtgsZlz87k8gWaazm1WLY3Uz3XrxToUtjufGRErtcTdD9zboe/HbOoo088mZLwY+cDoaMHj2fSbs4Zm/KSI7R1+DUo4OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldsjBd3fhfCPhqOL2CfAgNTYeZKC8iXcXjpy3vZ2b20=;
 b=PHv3Tk1oOgzDRt1AWEUNgXKOTn9V4oz2kIF2ajDIebtIVyAdtM2ZEhxM+8AeVHyEzKZIWN0OFtQduVGfx4b9DnP7oZ09PZSmqmpTqS3HutK9IlDF6e98fRIAhUKMDS2tJ6iNz8aV+E9Ym71Fv2FmTVauwxnOLyOGVXtGCe4WYaMh8r8T4myaS4ThdLEJxx7dQiXAkOQQvGakMF+bRiDvBeCGrXk+S+pIJpL69ZInwhBAlX/S6C/3lxnya0A8Ky+ltaC6yYBX6HC67PDtpnyVThUH4cp7KJlXO8E4r2+FhmQeIFVYgaXyBDnw4+YN5bHO6WtqChZb38u46NMeS/KM7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ldsjBd3fhfCPhqOL2CfAgNTYeZKC8iXcXjpy3vZ2b20=;
 b=U+VF4JyxvIV+RvlZ7eojMCMRJxkl2BEHmn7zmf6MicjNGzDMhbvv3CO7TF9G2nN3R8BXuQeoPX2bNNuc1bebY3XGeQS9yxI2DMRHvWslyzI/r6sONkeBsHKAqQ/x47ikxWR6VtslVqxmtrjklcaEwNa5CdNuHi4NjM36tuMHKg0=
Received: from PH0PR03MB6366.namprd03.prod.outlook.com (2603:10b6:510:ab::22)
 by PH0PR03MB6366.namprd03.prod.outlook.com (2603:10b6:510:ab::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.25; Mon, 19 Jul
 2021 07:27:32 +0000
Received: from PH0PR03MB6366.namprd03.prod.outlook.com
 ([fe80::54ff:7b16:5fc7:38ca]) by PH0PR03MB6366.namprd03.prod.outlook.com
 ([fe80::54ff:7b16:5fc7:38ca%4]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 07:27:32 +0000
From:   "Sa, Nuno" <Nuno.Sa@analog.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>
Subject: RE: [RFC PATCH 1/6] hwmon: axi-fan-control: make sure the clock is
 enabled
Thread-Topic: [RFC PATCH 1/6] hwmon: axi-fan-control: make sure the clock is
 enabled
Thread-Index: AQHXc/CeSQLv+vZQ/EKPPxmp1qbub6tHeXSAgAJ81rA=
Date:   Mon, 19 Jul 2021 07:27:32 +0000
Message-ID: <PH0PR03MB6366F9E904C0D43F11231D9C99E19@PH0PR03MB6366.namprd03.prod.outlook.com>
References: <20210708120111.519444-1-nuno.sa@analog.com>
 <20210708120111.519444-2-nuno.sa@analog.com>
 <20210717172459.GA416538@roeck-us.net>
In-Reply-To: <20210717172459.GA416538@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?iso-8859-1?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcbnNhXGFwcG?=
 =?iso-8859-1?Q?RhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?iso-8859-1?Q?OWUzNWJcbXNnc1xtc2ctYzY2Y2ZkZGUtZTg2Mi0xMWViLThiNzUtZTRiOT?=
 =?iso-8859-1?Q?dhN2NjNzEwXGFtZS10ZXN0XGM2NmNmZGUwLWU4NjItMTFlYi04Yjc1LWU0?=
 =?iso-8859-1?Q?Yjk3YTdjYzcxMGJvZHkudHh0IiBzej0iMTA2MSIgdD0iMTMyNzExNTMyNT?=
 =?iso-8859-1?Q?A4NDI1NDEyIiBoPSIwSEtOVXpTMFg3QmJySU1DVno3YjErT2U5Wjg9IiBp?=
 =?iso-8859-1?Q?ZD0iIiBibD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQU?=
 =?iso-8859-1?Q?FJWURBQURFTE1PSWIzelhBUXlCSGROelNxVjdESUVkMDNOS3BYc0ZBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBSEFBQUFBV0F3QUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBRUFBUUFCQUFBQUJPWUdjZ0FBQUFBQUFBQUFBQUFBQUo0?=
 =?iso-8859-1?Q?QUFBQmhBR1FBYVFCZkFITUFaUUJqQUhVQWNnQmxBRjhBY0FCeUFHOEFhZ0?=
 =?iso-8859-1?Q?JsQUdNQWRBQnpBRjhBWmdCaEFHd0Fjd0JsQUY4QVpnQnZBSE1BYVFCMEFH?=
 =?iso-8859-1?Q?a0FkZ0JsQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdFQV?=
 =?iso-8859-1?Q?pBQnBBRjhBY3dCbEFHTUFkUUJ5QUdVQVh3QndBSElBYndCcUFHVUFZd0Iw?=
 =?iso-8859-1?Q?QUhNQVh3QjBBR2tBWlFCeUFERUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBUUFBQUFBQUFBQUNBQUFBQUFDZUFBQUFZUUJrQUdrQVh3?=
 =?iso-8859-1?Q?QnpBR1VBWXdCMUFISUFaUUJmQUhBQWNnQnZBR29BWlFCakFIUUFjd0JmQU?=
 =?iso-8859-1?Q?hRQWFRQmxBSElBTWdBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCaEFISUFhUUJoQUY4QVpBQn?=
 =?iso-8859-1?Q?BBR01BZEFCcEFHOEFiZ0JoQUhJQWVRQmZBSFFBYVFCbEFISUFNUUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUVBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBZ0FBQUFBQW5nQUFBR0VBY2dCcEFHRUFYd0JrQUdrQVl3QjBB?=
 =?iso-8859-1?Q?R2tBYndCdUFHRUFjZ0I1QUY4QWRBQnBBR1VBY2dBeUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?iso-8859-1?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQU?=
 =?iso-8859-1?Q?FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFB?=
 =?iso-8859-1?Q?Q0FBQUFBQUE9Ii8+PC9tZXRhPg=3D=3D?=
x-dg-rorf: true
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=analog.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b08775b-64c0-426d-33a8-08d94a86ac73
x-ms-traffictypediagnostic: PH0PR03MB6366:
x-microsoft-antispam-prvs: <PH0PR03MB63666BA692FD758A9536A60999E19@PH0PR03MB6366.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LkFtQZtLEYps8RXnFtI483PvcVY9LUhlHiJwzJujES8z7Qr7KSsuY4ZCc+HO1oQZCWiLOdnCnYOlraYTGa83tcXuipiU46WcmF+l9eordRJ5P0TGd4cpJ9uApT8NSEpiLtzcifFhyKWRd1qhYIm26miGOtAxTv08gjs8BT+3FaAFToNvCzDOz7m9w3tm6jhSfkbr7YcmqtHSPWJ7++nDIGzOa7+vjbhsNQzBKp4Jt4c/p0tGaR4uLHO071wHi02klyC+e0slc4AnYu7dQus50A3Nx7sJyHQ9roNYCf+mdEId7ASIaEs6I3BlRZt9tCrJg05XYxLfUJmeZENDlUPRKokDFsRF7XnqObWOzBYmqI3GLn3gs/5JFgJbh8sOGBfsmSrEhxIqRyfO6x7Qar2zyC4em2m34m+PJ/rDoJ6YSIBpIG9GsnRBatjNqWbUW+ogWJneZ6B8fcOuJGNd0KONTSvj/EBawSUBfMlA+1Hpax9zz3jwKTfkJneJX/hP2UDw7qiRdD0QPN2d62qXKJAsyGkW2og6YVgyAczEMJDs2iKUk+KtNUWc6G5cxliPlmew+ISUrpZuiarcl0LTld+aS4uXF7ZkgtJ30TqDzBcd218GujY2QKK4nIRkrAOdQb5/3hBTLay9bcjrdviubl7cpVRgSO56vih7I96F6pY7zLRCwA1tGaw09uR+OcGNJWCMBtH7ub/fObn6T9gdgpVDlg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6366.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(8936002)(64756008)(122000001)(38100700002)(66446008)(6506007)(33656002)(52536014)(53546011)(55016002)(83380400001)(66556008)(9686003)(76116006)(66476007)(66946007)(71200400001)(86362001)(478600001)(6916009)(2906002)(4326008)(7696005)(54906003)(26005)(4744005)(5660300002)(186003)(8676002)(316002)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Mw8UttP5hzNQdR82DGpPxkppsHI/Up6wxc6BSUwZnv34c/ibtm1U/wGsT4?=
 =?iso-8859-1?Q?NC8YmQwruFvd2I5DAj3BpITxRsQfP+ugiFxMNNRoZhscwfG6lgR2UFEqFE?=
 =?iso-8859-1?Q?ukOz3hlC3fdAx3fJIxmUC00s3GdUgpLxdVOPgERhp25rN32n8solTqCAhJ?=
 =?iso-8859-1?Q?fLKJpZ86/c+SSc9Buhk4NWohwdFkZqzu6sGqp9r/7gngL3ZES/gOI2kcxA?=
 =?iso-8859-1?Q?YrrMqEt95iZyYwH2uGFhxwZYE6KTdmyNq9aIj7jKhgodqzEMIKmUmUsUaa?=
 =?iso-8859-1?Q?gzWxHDXwg2RJrVUIdNSEeXSrF9C0Y08ghx4/s6ZdPo4qIjhspDwQUXVvIl?=
 =?iso-8859-1?Q?jD9Y0y72t2Y6Hwv6SSOg3gghTTtqIfHgMITfW+UqkJ0c+03+x+Pt7Jx1Kw?=
 =?iso-8859-1?Q?iEexw0kuOsERnZ9nhxrJGtAritjKji/y8X0UYYCTeumQz5NpbvUBBfCKnN?=
 =?iso-8859-1?Q?tWRmnxaxhFwBCJFF02ODxq7TVp/EFS4xSBOvpdSLMLjs4qCdaa6pNpoM2q?=
 =?iso-8859-1?Q?XC48WYyuxEsFRUhJujDyV4Vi8oW9vvOPOHfIV3PJ/FKmWR00F3YaeBAeEm?=
 =?iso-8859-1?Q?Bu+w5B0hobJgB2yoXTD6SRtUvy1FoGlfr0I3sGvfi1n+vgFuIP1GVRScz6?=
 =?iso-8859-1?Q?1ApqZQglpY8rT4/Lp/dIQf3X3N4kgYHcjWdV2mosfjw4YfJ2ASi63DzuYF?=
 =?iso-8859-1?Q?nMBECxDadrU9/SI9rrCVl8ykeMHVMEL1x3+KH2QqTdsGJ++A/pLiR8fiGr?=
 =?iso-8859-1?Q?mjFi0ucj1sEuwFty2R1PvORqIaI6NXn2GMA3ICp2ciN9mDF2xZMrRG4hTW?=
 =?iso-8859-1?Q?LLdbU2ZcouycbvwTlY7ymKnFelr7UtHtrx1JCQALLtK63fAV73YZO39pAs?=
 =?iso-8859-1?Q?KeNHfhci6BYLmXSO9+xLLuqM+YWFOxd/3DGK0qGxNtk1RjQZP3MA1fxT0d?=
 =?iso-8859-1?Q?WZwFvvyO5/3I4Y7hubtKZ3IOLrQffCdSnH5adfbV7KQtfJYi92l2aWIsud?=
 =?iso-8859-1?Q?4aZkG0R4+6mhf2wuuz0S7kvXdlaXcOBjDomVGW1QuL0w5sA+V8Khl/tEPc?=
 =?iso-8859-1?Q?NIE+HHNO1hvak9noT6XcUT3NdBhuGrnO90xB3IrclK8T02nVz1l9Ptqmx9?=
 =?iso-8859-1?Q?ItvEzwodxQJS44r6jMr1/BPVEfhH0iD8Zi0pSZ+cK7DUHsIFgmLQl7cS7q?=
 =?iso-8859-1?Q?3IenW9ucLU3zj4q8pExJ6oMush+E3it96gn1XNuNCltbDQmU1a5rxRVa7a?=
 =?iso-8859-1?Q?gw0hKZTav+cWpnDh+UNnZMcacqzYNKirEkbIM6issv4y9Ngtng9p/Ouax2?=
 =?iso-8859-1?Q?NX2vS6EFBcbr/MF3PohvwaESlhfEloFC2olZn8M+jRTmypL9EdLCzSIDrN?=
 =?iso-8859-1?Q?i1oGefNowr?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6366.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b08775b-64c0-426d-33a8-08d94a86ac73
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jul 2021 07:27:32.8063
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vhhv2Gg5aE3y5EGsBYT4ptYr+hSdZTtYjTg+FFAk6Kv1dy54YiOkWPv4oaY8AwBXMZmykAfqBtQY0yMDr1MBnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6366
X-Proofpoint-GUID: G3EtWiN3GLgceL0jL-UmRywbpwHlETNp
X-Proofpoint-ORIG-GUID: G3EtWiN3GLgceL0jL-UmRywbpwHlETNp
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-07-19_02:2021-07-16,2021-07-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 bulkscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2107190041
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter
> Roeck
> Sent: Saturday, July 17, 2021 7:25 PM
> To: Sa, Nuno <Nuno.Sa@analog.com>
> Cc: linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org; Rob
> Herring <robh+dt@kernel.org>; Jean Delvare <jdelvare@suse.com>
> Subject: Re: [RFC PATCH 1/6] hwmon: axi-fan-control: make sure the
> clock is enabled
>=20
>=20
> On Thu, Jul 08, 2021 at 02:01:06PM +0200, Nuno S=E1 wrote:
> > The core will only work if it's clock is enabled. This patch is a
> > minor enhancement to make sure that's the case.
> >
> > Signed-off-by: Nuno S=E1 <nuno.sa@analog.com>
>=20
> Can I apply this patch as well as patches 4/6 and 5/6 as-is, or
> do they depend on patches 2/6 and 3/6 ?
>=20
> Thanks,
> Guenter

I think patch 5/6 only makes sense with patch 2/6. If we do not set
the tacho evaluation parameters, clearing the fan fault irq has no effect..=
.

- Nuno S=E1
