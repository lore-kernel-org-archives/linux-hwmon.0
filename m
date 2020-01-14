Return-Path: <SRS0=c1px=3D=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE865C33CA9
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jan 2020 06:54:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 868592187F
	for <linux-hwmon@archiver.kernel.org>; Tue, 14 Jan 2020 06:54:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=Mellanox.com header.i=@Mellanox.com header.b="Y7EqqZfG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728656AbgANGyK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 14 Jan 2020 01:54:10 -0500
Received: from mail-eopbgr70059.outbound.protection.outlook.com ([40.107.7.59]:14092
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726995AbgANGyJ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 14 Jan 2020 01:54:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i49JN3ONqXB7CkVlQkb4rNxPDWEFpF4KX9OYdYxF/tuldy89NKTG5e+z2krd22JDrPka9oam/TTmLycd26NBUrQXz4hSS1h5XvmBVKMWZSbYx7Mpp3IyhGgHON8Qyv367Wxc4OGaZVIwvhksFJW2R5qZ17n3y3t67eGOSxbOfCuYjN2asFAU5SnKc7/wwYQFHz/phBOtT6dYS7jlLPpKa6yayW3fIIJ5UfrfT2+zEHemYJEEkb2DYKM9BsEJYKIGqnHrWEP2qsNTskBjb8Mfo1zNPj//7Myolyj8KQvEW7ksnrtDeD3fLkFfF+EzOWCFgGZF0eSrKeItmr14a8ChDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oIM8Ulm936TfpqOX63JQ8tYdMJd77eLosJ016uxMys=;
 b=OaGP5bZLdZhBXbYUOutlhIx6uJiYCnsHF/for1SASrZhlLcAfmpnR6u89Smhh/Z/bK+8RgCpHYyzyBCX/V0Fo9B5gaBYMuUXbTOx+iMFGMEOF0oQ8ZvDSNzMB3MxsUJOiJZv8AK8+t7Bx/m6npcMxsmooJtMq+m+RBl9wmEqHdgkKShMmd6VR9j//GoGn3BTL3OfM55PAeGBOUvLTq7U+YiUVNr2UFvLM3x+dy7JP1frdOtmclDTxVlFW56Q/dEn/pdGgb/nV+jkC/N/lAL5EvYUNFlpitKqYIe5QgKCUE/WbPNjBe8NSWY7eFCPiT75TJMGnvgmma2zcKm1C3+9dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/oIM8Ulm936TfpqOX63JQ8tYdMJd77eLosJ016uxMys=;
 b=Y7EqqZfGP9B7w+FVtzjpP91qS06CYM5BbmK+E9xtgu+sv5az4XZ+FFem3XOVVzjo3fiHp141LeKGf4qvfP4etsbBeZ5n6rqNho4tzTAUkc6UhAkLMifunaS18RJbsJZHlISwyb8NO56eDC7X4wpyrO7+SU0aBLIxDEARSbPCQtI=
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com (20.177.196.210) by
 AM6PR05MB6214.eurprd05.prod.outlook.com (20.178.94.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.10; Tue, 14 Jan 2020 06:54:03 +0000
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::bd4d:e8dc:9b58:3a7c]) by AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::bd4d:e8dc:9b58:3a7c%7]) with mapi id 15.20.2623.017; Tue, 14 Jan 2020
 06:54:03 +0000
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "vijaykhemka@fb.com" <vijaykhemka@fb.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Michael Shych <michaelsh@mellanox.com>,
        Ofer Levy <oferl@mellanox.com>
Subject: RE: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679) Extend
 device list supported by driver
Thread-Topic: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679) Extend
 device list supported by driver
Thread-Index: AQHVw7ccUo77+1Sy70mxGafA8mf8l6fcO+2AgAAG1qCAACN3gIAA8BkwgABkGgCAAA3mcIAAWQ8AgAAMj0CAAD4/AIAARClQgABwMwCAAVmVcIAAhSgAgAeQJhCAAJDrAIAApkaw
Date:   Tue, 14 Jan 2020 06:54:03 +0000
Message-ID: <AM6PR05MB522448927DE44812BECAFE74A2340@AM6PR05MB5224.eurprd05.prod.outlook.com>
References: <05925e70-0079-2467-b703-eba8d8667eaf@roeck-us.net>
 <AM6PR05MB52242EA6A029D4C5F011A21BA23C0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <20200106210104.GA9219@roeck-us.net>
 <AM6PR05MB52247DB7AB2677F5F36BAAE9A23C0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <a76015b5-74e3-5f84-dfce-f5cce34c302a@roeck-us.net>
 <AM6PR05MB5224ED5368BD037051F5BF92A23F0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <5be3c6c4-81e8-7731-2b6e-39b7ad6531d5@roeck-us.net>
 <AM6PR05MB5224C166E608C3BBD09E4606A23E0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <20200108164748.GD28993@roeck-us.net>
 <AM6PR05MB5224026B612B674681E81DF9A2350@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <20200113205614.GA24228@roeck-us.net>
In-Reply-To: <20200113205614.GA24228@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vadimp@mellanox.com; 
x-originating-ip: [193.47.165.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 16fa72b6-3e9a-4c5a-8813-08d798be8ad9
x-ms-traffictypediagnostic: AM6PR05MB6214:|AM6PR05MB6214:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR05MB62148D31B9B969C22484A24FA2340@AM6PR05MB6214.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 028256169F
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(199004)(189003)(6506007)(186003)(33656002)(53546011)(6916009)(4326008)(26005)(478600001)(55016002)(86362001)(8936002)(5660300002)(52536014)(71200400001)(9686003)(76116006)(316002)(107886003)(2906002)(66946007)(64756008)(66556008)(54906003)(66476007)(66446008)(7696005)(8676002)(81156014)(81166006);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR05MB6214;H:AM6PR05MB5224.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iy6++AQHekBdX6mvglf9r4COhefBzir9nwN97i3RgYCYZni3h257Jxu1qpmqbCXHBiJxvAayQTSXJnBGxhExO0CmE0gas37HYHqBlIQ6giulsESG9L08O/5i/3mr0YRYBvJlPzxWxvwNlnaty19Mv69VI06mCSpOXwAkbqdYjsz583Q3/ysZ6RXLNE2L1VZBnzAN2w41YS41p+rr1t4XbMRuUjlE9PCmt82/ZwyNVYgM/qsKvxOUMoDjWaPcbITfreHxyCNa4Bi2ODJ9GAIpAt5Zz5vY5ImPSeUP4g2jv/d05vvX+mygfuIDuAqB0ciALz01oG+0+Q5ZWG2/GzY4jLxq/Nigw14fSrbBR3wGCwRwqqqtM2oe2hB5TyA8JKvuf0zjIMSboZKI0USqCX1vajVYMJZB8saEL+Nq3O33nvIm5TAJ1ibH9Hg4R+nmmwLS
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16fa72b6-3e9a-4c5a-8813-08d798be8ad9
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jan 2020 06:54:03.5105
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xw9DF/qcBFdMILCV2v0wu8+X59uyc6YtwdxE+YwaFAUbdXgk43fFlgQk+ZwVrbLRw/+Lsl0KIl/RqFOfvGPaJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB6214
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Monday, January 13, 2020 10:56 PM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: robh+dt@kernel.org; vijaykhemka@fb.com; linux-hwmon@vger.kernel.org;
> devicetree@vger.kernel.org; Michael Shych <michaelsh@mellanox.com>; Ofer
> Levy <oferl@mellanox.com>
> Subject: Re: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679) Extend
> device list supported by driver
>=20
> Hi Vadim,
>=20
> On Mon, Jan 13, 2020 at 12:25:44PM +0000, Vadim Pasternak wrote:
> >
> >
> > > -----Original Message-----
> > > From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> > > Sent: Wednesday, January 08, 2020 6:48 PM
> > > To: Vadim Pasternak <vadimp@mellanox.com>
> > > Cc: robh+dt@kernel.org; vijaykhemka@fb.com;
> > > linux-hwmon@vger.kernel.org; devicetree@vger.kernel.org; Michael
> > > Shych <michaelsh@mellanox.com>
> > > Subject: Re: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679)
> > > Extend device list supported by driver
> > >
> > > On Wed, Jan 08, 2020 at 02:10:50PM +0000, Vadim Pasternak wrote:
> > > >
> > > > Hi Guenter,
> > > >
> > > > We are looking for possibility to provide some kind of flexible
> > > > driver to handle different devices from different vendors, but
> > > > which have common nature, like support of two pages for telemetry
> > > > with same set of functions and same formats. (Actually driver
> > > > could be flexible regarding the
> > > number of pages).
> > > >
> > > > While the difference only in VID codes mapping.
> > > >
> > > > The motivation for that is to give free hand to HW design to
> > > > choose which particular device to use on the same system type.
> > > > There are two main reasons for such requirement:
> > > > - Quality of device (we already had a serios problems with ucd9224 =
and
> > > >   tps53679, caused system meltdown). In such case the intention is =
to move
> > > >   to fallback devices in the next batches.
> > > > - Device availability in stock. Sometimes vendors can't supply in t=
ime the
> > > >    necessary quantity.
> > > >
> > > > Currently there are the devices from three vendor: TI tps536xx,
> > > > Infineon
> > > > xdpe122 and MPS mp2975.
> > > > All have different mapping of VID codes.
> > > >
> > > > It could be also few additional devices, which are supposed to be
> > > > used as fallback devices.
> > > >
> > > > We have several very big customers ordering now huge quantity of
> > > > our systems, which are very conservative regarding image upgrade.
> > > > Means we can provide now support for tps536xx, xdpe122xx and
> > > > mp2975 but in case new devices are coming soon, we will be able to
> > > > support it in kernel for their image after year or even more.
> > > >
> > > > We can provide ACPI pmbus driver, which will read VID mapping from
> > > > ACPI DSDT table. This mapping table will contain the names of
> > > > available modes and specific vendor code for this mode. Like:
> > > > PMBVR11=3D1
> > > > PMBVR12=3D2
> > > > PMBVR13=3D5
> > > > PMBIMVP9=3D10
> > > > And driver will set info->vrm_version[i] according to this mapping.
> > > >
> > >
> > > The DSDT would have to provide all properties, not just the VID modes=
.
> > > At the very least that would have to be the number of pages, data
> > > formats, vrm version, and the supported attributes per page. It
> > > should be possible to also add m/b/R information for each of the
> > > sensor classes, but I guess the actual implementation could be postpo=
ned
> until it is needed.
> > >
> > > This could all be done through the existing generic driver
> > > (pmbus.c); it would not really require a new driver. ACPI/DSDT could
> > > provide firmware properties, and pmbus.c could read those using
> > > device_property API functions (eg device_property_read_u32(dev, "vrm-
> mode")). Would that work for you ?
> >
> > Hi Guenter,
> >
> > We thought that it's possible to provide just modified DSDT with the
> > specific configuration as an external table, which is loaded during sys=
tem boot.
> >
> > It should not be integrated into BIOS image.
> > We want to avoid releasing of new BIOS or new each time system
> > configuration is changed.
> > New BIOS is released only when new CPU type should be supported.
> > Also BIOS overwriting is not an option, sine we have to support secured=
 BIOS.
> >
> > It should not be located in initrd.
> > The new system batch is released with BIOS, SMBIOS and with customer's
> > OS or with install environment like ONIE.
> > Means no kernel changes.
> > Also not all our customers use initrd.
> >
> > So, it seems there is no place, when we can locate modified DSDT and
> > load it dynamically.
> > But we should think more about possible methods for doing it.
> >
> > Today all the static devices are instantiated  from the user space.
> > It's supposed to work for us while we have to support some pre-defined
> > set of devices, for which we can detect the specific configuration
> > through DMI tables (SKU in particular).
> > But it'll not work for some new coming devices.
> >
> > We have a possibility to provide VID mapping info through CPLD device.
> > But in this case we'll have to implement Mellanox specific PMBus
> > driver aware of CPLD register map.
> > Not sure if such approach is accepted?
> >
>=20
> How about a platform driver which loads the parameters into device proper=
ties
> from whatever location and instantiates the pmbus driver ?
> The PMBus driver would then read the device attributes and instantiate it=
self
> accordingly.
>=20
> If the other PMBus attributes can be auto-detected, it might actually be
> sufficient to have a per-page vrm-mode property and otherwise use the aut=
o-
> detect mechanism of pmbus.c.

Hi Guenter,

I didn't think about such possibility.
It sounds promising.

So, we can add our platform driver to "drivers/platform/mellanox",
which can:
- fetch "vrm" mapping per each relevant device.
- for each allocate device node, create properties table with vrm mode
 mapping like "vrm-mode-vr11", "vrm-mode-vr12", "vrm-mode-vr13",
 "vrm-mode-imvp9", "vrm-mode-amd625mv", coded accordingly to
 "enum vrm_version".
- attach this node to "i2c_board_info" and instantiate it with
  i2c_new_device() for "pmbus" type.=20

And i"pmbus" will get these properties like
device_property_read_8(dev, "vrm-mode-vr11")) etcetera.

Did I get your suggestion correctly?

Thanks,
Vadim.

>=20
> Thanks,
> Guenter
