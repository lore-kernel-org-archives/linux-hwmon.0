Return-Path: <SRS0=+gze=VT=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52FAFC7618F
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 16:04:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1DCE6218EA
	for <linux-hwmon@archiver.kernel.org>; Mon, 22 Jul 2019 16:04:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com header.i=@amdcloud.onmicrosoft.com header.b="mcyHbQVC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730301AbfGVQE0 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 22 Jul 2019 12:04:26 -0400
Received: from mail-eopbgr730042.outbound.protection.outlook.com ([40.107.73.42]:36694
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726653AbfGVQE0 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 22 Jul 2019 12:04:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oE4JVnFqr0fubwhOJa/MJ/rT37HFSudjP/Hg3qfGBT8EB7peP/EjwH7ROkZWxRRyuI8TT4Uh72LNuFiNyv2lAKJw/7GZVgBtedOOxCxORolUCDHLh6Vxvbjlej/DVh+QfSVpgYYDamarO6a3JRCdKPNkYGO5sWkgfh8uXmpIz5StpalZe/ZMsrjziia9mOVfjTQL07jT09bg2CwNcbQ5zBC1kTkbZiSDGDJACDFp5QIhJMYMxSjML5xpw0knfM8GKVeB8fd7NrHcaD4ssoM2FGAV41GktU6lLvx6s3seUtzheyF2qmSfKvKImWi/fxrtZN1xa3EpvCTYi+OFWcaY0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlk34d3QFAwP66rPLyruFAhEiwsx+aq8mLXOB6Z/6DE=;
 b=Rols57TKCidHCGYcyCNgyLLxphG9Y/ZFOsTK/OXXaKhP90wH4Gql7c+W9uA2B6D2b+MigrUyVXOvHU45f5lHIzeMa6V5dQ4mvpz4lHO6MnWnsnYo51zZkwH7zF2yyBxRQqlmwEiRPMdT9Ii/DwxRfzaMOYpRXS9OKnpRQkJLCbq0PWcubiP5+RHsW+qQYq11NxBxjmvNrlHIcsXCGxhkTfQMpRSKIS1uvlF3qRUJ+oAB4uyzgOLFG0YZo40r/YY3P416mjSJNQ4tEhRhtfUUuthKAFa4IlbLDFRfJX1bA+6nQAorj9+mq6ZdN8WAMjr6I02mVIt3xacNNwToM4lnnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dlk34d3QFAwP66rPLyruFAhEiwsx+aq8mLXOB6Z/6DE=;
 b=mcyHbQVCJGXv/TSFEDjpXgGnW8Y9znrcNjE+H/iLtsFhv3idgsvSiv5QAwi+R4lax88gNVSjyqhHr9ck7gv6ioH8b+sdGq8oe3CiychqLrs8S18UTcRI+PWQnF9QklWFfrVhIc8u7ZSmO9z2M9GI60w4k2r0fl1998fKnQPMiVg=
Received: from DM6PR12MB3515.namprd12.prod.outlook.com (20.179.106.151) by
 DM6PR12MB3721.namprd12.prod.outlook.com (10.255.172.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Mon, 22 Jul 2019 16:04:24 +0000
Received: from DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::3576:d8b0:7554:adc]) by DM6PR12MB3515.namprd12.prod.outlook.com
 ([fe80::3576:d8b0:7554:adc%7]) with mapi id 15.20.2094.013; Mon, 22 Jul 2019
 16:04:24 +0000
From:   "Woods, Brian" <Brian.Woods@amd.com>
To:     Borislav Petkov <bp@alien8.de>
CC:     Thomas Gleixner <tglx@linutronix.de>,
        "Woods, Brian" <Brian.Woods@amd.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Marcel Bocu <marcel.p.bocu@gmail.com>,
        Ingo Molnar <mingo@redhat.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "x86@kernel.org" <x86@kernel.org>,
        Clemens Ladisch <clemens@ladisch.de>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Vicki Pfau <vi@endrift.com>
Subject: Re: [PATCH 1/2] x86/amd_nb: Add PCI device IDs for family 17h, model
 71h
Thread-Topic: [PATCH 1/2] x86/amd_nb: Add PCI device IDs for family 17h, model
 71h
Thread-Index: AQHVPZaeMBHdPQBtAk6JmgC81fj+3abQxC4AgADLIQCAAGDOgIAAIqAAgAAKiwCABD8YAIAAA7GAgABzAIA=
Date:   Mon, 22 Jul 2019 16:04:24 +0000
Message-ID: <20190722160420.GA16162@amd.com>
References: <20190718182617.6964-1-marcel.p.bocu@gmail.com>
 <20190718193330.GA23809@roeck-us.net>
 <690c10a3-0f5f-6ba7-9dc9-b7150b300dd1@gmail.com>
 <91c6b4cb-2ae4-c2fb-faf4-110b2c426901@roeck-us.net>
 <33703f78-c704-b904-8643-59a1fb1849fa@gmail.com>
 <20190719160840.GA26100@roeck-us.net>
 <alpine.DEB.2.21.1907221057410.1782@nanos.tec.linutronix.de>
 <20190722091245.GA23240@nazgul.tnic>
In-Reply-To: <20190722091245.GA23240@nazgul.tnic>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN4PR0201CA0039.namprd02.prod.outlook.com
 (2603:10b6:803:2e::25) To DM6PR12MB3515.namprd12.prod.outlook.com
 (2603:10b6:5:18a::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Brian.Woods@amd.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.77.1]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 91185f37-7d65-46e6-4dab-08d70ebe43c2
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:DM6PR12MB3721;
x-ms-traffictypediagnostic: DM6PR12MB3721:
x-microsoft-antispam-prvs: <DM6PR12MB3721FADED20139975AF042C8E5C40@DM6PR12MB3721.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(366004)(396003)(136003)(346002)(39860400002)(199004)(189003)(478600001)(186003)(6246003)(53936002)(4326008)(25786009)(26005)(76176011)(2906002)(52116002)(36756003)(5660300002)(66946007)(66446008)(64756008)(66556008)(66476007)(102836004)(386003)(6506007)(8936002)(8676002)(81156014)(81166006)(33656002)(66066001)(99286004)(68736007)(486006)(54906003)(71200400001)(71190400001)(14454004)(7736002)(256004)(7416002)(305945005)(14444005)(316002)(6916009)(2616005)(476003)(229853002)(1076003)(11346002)(446003)(6116002)(86362001)(3846002)(6512007)(6486002)(6436002);DIR:OUT;SFP:1101;SCL:1;SRVR:DM6PR12MB3721;H:DM6PR12MB3515.namprd12.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xMGRKDntGJ1PnW7/qx/5KgjUY0uoUCKIiPxqBXhla482prP4sBsUCRgfEFUDytm7jff+tAdfR19sQaDKeOi5DG65NVF0ZD6TvbeI35vj+05lKdkDBfwPSlDuwAXZU7ztQgpXk0vUR+HVQYdyKalE8VCT7qdXr9PLO1802rJyK+my151M0x3I8nm/x1ZlPGDGtK3FzOx9ESMeihUwatY+qY8WXH0N7BrJpoLj/lKQ/pma1TV4jNMqqR3f9izK03lrXjeHeryNIh3yUceohMdK1cAJ15QFD0+VdBxJcadIqsfEwOhx4VWiQuTqmDHhSRGrniBSrZKtbIGJslyZHyg3E/n0GhLZDOzv/GgshSRenzpvL5GRr7JkIwKyZ1tC60X49VeO2I7xh4gUKazSDUCX4cDjhCSsDDmhUK4mHiE14hA=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <AD411EAB69CE0E4284AA795AE05E5C38@namprd12.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91185f37-7d65-46e6-4dab-08d70ebe43c2
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 16:04:24.1016
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: brwoods@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3721
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, Jul 22, 2019 at 11:12:45AM +0200, Borislav Petkov wrote:
> On Mon, Jul 22, 2019 at 10:59:32AM +0200, Thomas Gleixner wrote:
> > On Fri, 19 Jul 2019, Guenter Roeck wrote:
> > > > We could merge his patches (if he contacted the x86 crew), make a v=
2 of
> > > > mine (71h -> 70h, add his Signed-off-by?) and merge, or some other =
option?
> > > >=20
> > > Either case, we'll need feedback from x86 maintainers. They are not e=
xactly
> > > happy if anyone pushes a patch into arch/x86 without their approval.
> >=20
> > Adding those PCI ids looks straight forward. So feel free to route them
> > through hwmon with:
>=20
> ... but before you do that, let's wait for Brian to confirm the proper
> model range.
>=20
> Thx.
>=20
> --=20
> Regards/Gruss,
>     Boris.
>=20
> ECO tip #101: Trim your mails when you reply.
> --

Generally we use X0-XF for a model of processors.  Starting at 70h would
be preferred.

The PCI devices match our internal documentation for what it's worth.  I
was going to test these patches but the system I borrowed was
requisitioned and hasn't been returned yet so I can't test them now, but
I don't want to delay these anymore.

Assuming the change from 71h -> 70h, feel free to add:
Acked-by: Brian Woods <brian.woods@amd.com>

--=20
Brian Woods
