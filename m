Return-Path: <SRS0=PqkE=75=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED01AC433DF
	for <linux-hwmon@archiver.kernel.org>; Tue, 16 Jun 2020 14:46:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C8778208B8
	for <linux-hwmon@archiver.kernel.org>; Tue, 16 Jun 2020 14:46:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="fvY9HV+z"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728553AbgFPOqk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 16 Jun 2020 10:46:40 -0400
Received: from mail-bn8nam12on2077.outbound.protection.outlook.com ([40.107.237.77]:59041
        "EHLO NAM12-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726341AbgFPOqh (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 16 Jun 2020 10:46:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MjjkJysAnNl6CHeKidsaXDPMojTkBKBW41td54LvHFjp+mxZhaHOMpfbDWvfDGL4bCTp0Zyq+UKZ7GQL2JOSyXxnrGiPUECh00HHkvNUEnp7biArx0BxIzpptcdnrYOh7scZSONaJ7chVcDaFbRRkJnCY2VOzFJF5IXLLecbEHkZBdBye3ktFgFWifdri+b7T0bKwLnSVHocSzY00wUJcD1NPAs7bNnT3HOGrOkqkciOOfVsR5ylN05IJcN8plAMoZp0KyupgwsItCOYIwb4oB60mK/V/OtRZLyJz9wYdyvovKHoqtl91cx+mtGV+Zo4kAx5f/l3P8Bdn/Io6cA6eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzhu8arb24PuyX1ODD1B/geXdOkMfbA7lVgplG3Gx/w=;
 b=QhIQe+Ki+TO9Zr1iM2+5FeNkCRKEBtEYaelHek99lF5B6cDzggpEdnX5Us38IgFRp9c/6oY5YeQTXNXEKMnB5L4z+WXGX3cFf7pUcWJGReJpbiMS63xCwKlFD8vnzJo5BCrb5SWmM2v03oiF84xu6PcNPLwB3nw0GdcDM/UQ3OB/M3ubjJiUz6DSb1S7l2hVdvOH2aAdKNxA9eTVoN0CFMzpyQ8atgFq5KBxIWoN2cB5fAwXecTB0sfuqaX8TAZ7hu7DxfUn7h6ixAm+klqRtKPoxZt174y1Qb73FRicUFEgZWb7CVY6F3pzUSiztOQHfgrwtMjTAY1KyDbd+YBqhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zzhu8arb24PuyX1ODD1B/geXdOkMfbA7lVgplG3Gx/w=;
 b=fvY9HV+zsW1fWsTHLmWz7QFhZ8fQbtFQBAIjcy/TnjtYb+0V5bY17aVnfTXy8O7dJ4lWcnyxrMivJRvoR6ia3KjkJ/v4VoJiUrWPo0/L5Bg4zTnT8PzVNiguZbt8h1+xIC3NvEUo71x3bQQWW7DptsmDoz9rGeVGKxdts5YPwtM=
Received: from MW2PR12MB2569.namprd12.prod.outlook.com (2603:10b6:907:11::16)
 by MW3PR12MB4363.namprd12.prod.outlook.com (2603:10b6:303:56::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.23; Tue, 16 Jun
 2020 14:46:35 +0000
Received: from MW2PR12MB2569.namprd12.prod.outlook.com
 ([fe80::584c:e49:1331:4d44]) by MW2PR12MB2569.namprd12.prod.outlook.com
 ([fe80::584c:e49:1331:4d44%7]) with mapi id 15.20.3088.028; Tue, 16 Jun 2020
 14:46:35 +0000
From:   "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>
To:     Alexander Monakov <amonakov@ispras.ru>,
        Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
CC:     Guenter Roeck <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [PATCH 1/3 v7] hwmon: Add amd_energy driver to report energy
 counters
Thread-Topic: [PATCH 1/3 v7] hwmon: Add amd_energy driver to report energy
 counters
Thread-Index: AQHWLfU4bXfRfy3r7UC27klZb4uGxqi0HWWAgAAOp4CABtSEAIAASkyAgABB/oCAADw3AIAAa2CAgAC73ICAFX1IAIAJD3MA
Date:   Tue, 16 Jun 2020 14:46:35 +0000
Message-ID: <MW2PR12MB2569591CBFFB613E88EAD9F1E89D0@MW2PR12MB2569.namprd12.prod.outlook.com>
References: <20200519155011.56184-1-nchatrad@amd.com>
 <d3cf6e06-8cda-a3d6-b528-fd2b5360585a@roeck-us.net>
 <CAHfPSqAUYjT_QDmLoQBSQwtjfzyTeNqGqxtBpfGUGc+uO8j+KA@mail.gmail.com>
 <alpine.LNX.2.20.13.2005270120271.8241@monopod.intra.ispras.ru>
 <CAHfPSqCDSQkR03B_g+OAWvja9-+Zwo4Pbx0jLpsHUu_sn9K77Q@mail.gmail.com>
 <alpine.LNX.2.20.13.2005270940400.18802@monopod.intra.ispras.ru>
 <CAHfPSqC6gQzRt-_O-zHTHoSa=vOO064+dfoGrV2abQr=rMvfgA@mail.gmail.com>
 <alpine.LNX.2.20.13.2005271944560.18802@monopod.intra.ispras.ru>
 <CAHfPSqAYBKXJkG21hqjyuRN8X+HqaX5df6ByeSRoMycBeVU48A@mail.gmail.com>
 <alpine.LNX.2.20.13.2006102320180.15859@monopod.intra.ispras.ru>
In-Reply-To: <alpine.LNX.2.20.13.2006102320180.15859@monopod.intra.ispras.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2020-06-16T14:46:22Z;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=bed5bb7f-840f-4b08-ad92-0000420e4ea5;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_enabled: true
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_setdate: 2020-06-16T14:45:37Z
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_method: Standard
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_name: Internal Use Only -
 Unrestricted
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_actionid: 8cdcafe4-2e74-48d1-906b-0000847281fa
msip_label_76546daa-41b6-470c-bb85-f6f40f044d7f_contentbits: 0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_enabled: true
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_setdate: 2020-06-16T14:46:31Z
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_method: Privileged
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_name: Public_0
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_siteid: 3dd8961f-e488-4e60-8e11-a82d994e183d
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_actionid: 27f77cd4-6fff-4f74-94e2-00000b6587cb
msip_label_0d814d60-469d-470c-8cb0-58434e2bf457_contentbits: 0
authentication-results: ispras.ru; dkim=none (message not signed)
 header.d=none;ispras.ru; dmarc=none action=none header.from=amd.com;
x-originating-ip: [122.172.141.219]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 4b3e043d-decb-4ebf-14ee-08d81204115f
x-ms-traffictypediagnostic: MW3PR12MB4363:
x-microsoft-antispam-prvs: <MW3PR12MB4363F52A14568F8FB3A29327E89D0@MW3PR12MB4363.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 04362AC73B
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9BXwk9P1QK5kG/hUhMY4kxN13uIdQ5Xsw+h3d0PcL4a6Pjwxg9oA4qkUOR1swa80E53A7rASuYiHN+FApcup3TBAa2IYusv/bpDleppiC7ibwEcjTKJyHwcLl2oGH5cHUnnfP+zJ5MPFkgv6MTmukyysJSwbv+uhCnEtHk7I57k2PwKcG+HSYy4EefRWiMYfPu07sF8JgxxCADpPXQsfxs2ufZJ+fG9mf7uGpVtlL000Me3aL9grD+Lnn64/VzLEwR6XqD1KjyAGJAuV/HCEfGetK+9oZnI1cUCkguePVEBBzsg+7zfzr91qt71UtEmc
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW2PR12MB2569.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(396003)(346002)(39860400002)(366004)(376002)(136003)(186003)(71200400001)(54906003)(478600001)(83380400001)(7696005)(110136005)(52536014)(26005)(5660300002)(316002)(6506007)(53546011)(55236004)(64756008)(55016002)(8676002)(8936002)(33656002)(76116006)(9686003)(86362001)(66556008)(66946007)(4326008)(2906002)(66446008)(66476007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: EV87WgHbNTZJs8/5LlNct41Y9pQywkF06Sjl45f2d/753kepQxkEgqo54xTQdqm52/0P9pLnN2ndu8+zVXjtjNQnB4RnAQKCNSYWlgACjhF8w0+6BtrMV1s3TeUmkseq1b+5U3nYGJWwVnNkcPzjbsV86EBf/Y8qGBMMl1iw/HuC6tE0xwlXR0SkJ/FzcL3oKbITWfhlmUu6uYz1HkRAayGCQydotxTY0dCj9n5qMXL0DydAyF3ZJGMp/zLpvKMYZsLZpfxejp7+FP/qy3FULSubT/U946s7Lt/FVWwzIOwRbjsQOsW4j4BkAMLHFWtq2+5wwxldtkM6rqxMvD8PaIE294huy9JQPqqdeIiOz8w9p4QgDHlM1hEFKhRMDCo5fhh3bOIOVMbJuy/Sh51zY40+oD/714hZa2tw3NPuTrmwVPXQtLBwBsV+Vzc2IEWh6LpyhoZcC+ylrBBv1vU2NRlUxOOuDTb+iuL1gaZrBQ7li+qaQHPqAWx5fBFjJlMs
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b3e043d-decb-4ebf-14ee-08d81204115f
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2020 14:46:35.2159
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zi59e6XakPfYzw002wJ/SIKjrjxZ/ETo7p0vd8T5da9pOTFpLscGv6Wlpsa+u0TRtUcLz8JnckUcqW5eF780vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4363
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

[AMD Public Use]

Hi Alexander,

The issue does not seem to be in the driver, it is in the register values p=
opulated by the firmware.
We have tested this in the server platforms and it works fine.
I've raised an issue internally to analyze and provide a solution for clien=
t systems.
I'm still waiting for their update.=20

Guenter,
This issue is seen on client machines model ranging from 0x40 and above. Sh=
ould I submit a patch
to support only server specific models 0x0 to 0x3f until we triage the issu=
e for client systems.

Regards,
Naveen
-----Original Message-----
From: Alexander Monakov <amonakov@ispras.ru>=20
Sent: Thursday, June 11, 2020 1:52 AM
To: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>; Chatradhi, Naveen Krishna <NaveenKr=
ishna.Chatradhi@amd.com>; linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/3 v7] hwmon: Add amd_energy driver to report energy c=
ounters

[CAUTION: External Email]

On Thu, 28 May 2020, Naveen Krishna Ch wrote:

> > No, this isn't right. The workload is not stressing all cores,=20
> > you're reporting 235 J for core 0 and only 35 J for core 7.
> >
> > If you are running the avx-turbo test, please run it like this:
> >
> >   ./avx-turbo --iters 10000000 --spec avx256_fma_t/8
> >
> > This will run AVX code on all 8 cores for about 1 second. To run it=20
> > for longer, increase the --iters argument.
> I ran with all cores loaded now and i see that sum of diff of energy=20
> consumed by all cores is greater than the diff of socket energy=20
> consumed in 100secs.
>
> Kindly, give me time. I will come back with some explanation or solution.

Hello. Is there any update on this issue?

Thanks.
Alexander
