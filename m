Return-Path: <SRS0=Ro9r=3C=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F57AC33CAD
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Jan 2020 12:25:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 15DD22084D
	for <linux-hwmon@archiver.kernel.org>; Mon, 13 Jan 2020 12:25:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=Mellanox.com header.i=@Mellanox.com header.b="J0hS1Z3D"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbgAMMZt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 13 Jan 2020 07:25:49 -0500
Received: from mail-eopbgr70085.outbound.protection.outlook.com ([40.107.7.85]:21664
        "EHLO EUR04-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725832AbgAMMZt (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 13 Jan 2020 07:25:49 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m3f23HNlTNyqMHOvIF7ulW51josPAisKuYZLUWX4Hb5nEmyvP/eNEL95Y3B8Ch6P102ktoF760MA1FY4f92I3T/5Lz8cQ4tA1V0njm3+5WSXt2Ss5KGVlkZGXY9qzjczLjPphOX0GkWWffjRRwJrSwApMXQ3yOHYw8sSQYq4NE7B9PAZGiD4cxH9jGS8hv0Wi0U0FCHdgdeQSkGMFU0TtuVEbVobEkVTA64cPt8sJkNDXeIQIVK40itfCAF29VoxC8YPoo3p7IRusKxH08t0l9x6gphP7rkFeq0muU63EgomAMzOinprxP5VYPaOLtcruPWfqdXWPX4/3UrTA5Kecg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/jVkp0xUEmhTFEH8kMFle9ax89oSONRrfSeA94AP94=;
 b=fjP2Q+W7AYdKTj0e4Iq25KZ1c5AVPUcfmjutsULFpzv2VMTNcLFRlZcb3qBCosrxY4YoB3UQMmNoGx59/2HHd9EY4BztNT9lXYFgKt9y+u3YaziZAp7QRfKw1W3CxFi8PPnbzieXhbfHXIVQVew1QmZwxwiMzGePVRUra7WRnpWYsLBbz/Q2pq3V/NLCGxtPkB5JdzMyt+6VU49a7WJkynvrwO0Xq5gP4rQ9BR/0BAGC0L1U3T0sCrjeiwOe8kNxTN/NeMf4o+kLbi/XenlUUiBg2ru+icvoY4Wp+raJJMN+buPqRN+99vgqHyMN+oKQEY/kwNFaHt5Nu4k6fef5Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/jVkp0xUEmhTFEH8kMFle9ax89oSONRrfSeA94AP94=;
 b=J0hS1Z3DKCobOVSxjeb19ETrB3nf2j9Sy0DPA/5VLB2onVnk4FbSBdTjVDQZ+6W/znl0MWBLbw1IjB1f3DWgSJqOfSnQtZJzFE3dckb+UlkbzMGNxc4qE75t3toAlCDyIM0YUkUzjcMXQWU9N3oNK9cMAc8Y32dQHUBsxcNKkkk=
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com (20.177.196.210) by
 AM6PR05MB5078.eurprd05.prod.outlook.com (20.177.36.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9; Mon, 13 Jan 2020 12:25:44 +0000
Received: from AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::bd4d:e8dc:9b58:3a7c]) by AM6PR05MB5224.eurprd05.prod.outlook.com
 ([fe80::bd4d:e8dc:9b58:3a7c%7]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 12:25:44 +0000
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
Thread-Index: AQHVw7ccUo77+1Sy70mxGafA8mf8l6fcO+2AgAAG1qCAACN3gIAA8BkwgABkGgCAAA3mcIAAWQ8AgAAMj0CAAD4/AIAARClQgABwMwCAAVmVcIAAhSgAgAeQJhA=
Date:   Mon, 13 Jan 2020 12:25:44 +0000
Message-ID: <AM6PR05MB5224026B612B674681E81DF9A2350@AM6PR05MB5224.eurprd05.prod.outlook.com>
References: <a30e4f98-65a4-f93c-371e-7691aace41f7@roeck-us.net>
 <AM6PR05MB52245C747A0EB1691C3EBFBFA23C0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <05925e70-0079-2467-b703-eba8d8667eaf@roeck-us.net>
 <AM6PR05MB52242EA6A029D4C5F011A21BA23C0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <20200106210104.GA9219@roeck-us.net>
 <AM6PR05MB52247DB7AB2677F5F36BAAE9A23C0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <a76015b5-74e3-5f84-dfce-f5cce34c302a@roeck-us.net>
 <AM6PR05MB5224ED5368BD037051F5BF92A23F0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <5be3c6c4-81e8-7731-2b6e-39b7ad6531d5@roeck-us.net>
 <AM6PR05MB5224C166E608C3BBD09E4606A23E0@AM6PR05MB5224.eurprd05.prod.outlook.com>
 <20200108164748.GD28993@roeck-us.net>
In-Reply-To: <20200108164748.GD28993@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vadimp@mellanox.com; 
x-originating-ip: [193.47.165.251]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f4618ad5-d367-42da-2d3d-08d79823b660
x-ms-traffictypediagnostic: AM6PR05MB5078:|AM6PR05MB5078:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR05MB50785F4F81E1BF14E0E54CE0A2350@AM6PR05MB5078.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 028166BF91
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(366004)(396003)(376002)(346002)(39860400002)(189003)(199004)(86362001)(5660300002)(52536014)(26005)(2906002)(107886003)(4326008)(54906003)(66946007)(76116006)(316002)(7696005)(478600001)(71200400001)(9686003)(55016002)(66476007)(66446008)(64756008)(66556008)(8676002)(81156014)(6916009)(81166006)(8936002)(186003)(6506007)(33656002)(53546011);DIR:OUT;SFP:1101;SCL:1;SRVR:AM6PR05MB5078;H:AM6PR05MB5224.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eBkv1DfObT/+m7zcfIbCF1gjI1qoEGxi5xkhiEKCFjiE6duUBUYx3PM21MKJzw0CAtZeYZ07sw1bPHlYUVNcE9sVglgSebaEWYmgEsykItsxVaJ6yTbeBHghAhsxRixy/eL8TOfDygfdejB+rjjbeLm7d84Ss2N8TMu9kglBvrdDiR6xJunAcazFzF+axKutAlPK/j6mk/7JlY0/pf9UiPSmOhjB38l8aEq2kY10+b00aEkFsWyUBz7fKWE8UK2WaOaSozvvjR+n8VUG3ffJRMpOas2Nkkk3wyt0fY51kzpvrx1SV2NpUWrwFQJE8bNbQTXLMRYqN68k7+k9U/i1vCf2noAL98UU4Ae1na3oJVAnFeuKb5p+SlRpXs6A7TA19CEcFRcZ7ZkP93FQGI727WY/2jCNM3nTqONyGlWWr694FWTlkiKOmARLkGPdlCRo
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4618ad5-d367-42da-2d3d-08d79823b660
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2020 12:25:44.2480
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SwCjpnPcHH+TI7m53ZU107H/eeTQZiY9zQ7I69tfSxqS7s/jAUvm09kziPciCJ25TR+/r7TDEkafLTxnAz7QpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB5078
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Wednesday, January 08, 2020 6:48 PM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: robh+dt@kernel.org; vijaykhemka@fb.com; linux-hwmon@vger.kernel.org;
> devicetree@vger.kernel.org; Michael Shych <michaelsh@mellanox.com>
> Subject: Re: [RFC PATCH hwmon-next v1 5/5] hwmon: (pmbus/tps53679) Extend
> device list supported by driver
>=20
> On Wed, Jan 08, 2020 at 02:10:50PM +0000, Vadim Pasternak wrote:
> >
> > Hi Guenter,
> >
> > We are looking for possibility to provide some kind of flexible driver
> > to handle different devices from different vendors, but which have
> > common nature, like support of two pages for telemetry with same set
> > of functions and same formats. (Actually driver could be flexible regar=
ding the
> number of pages).
> >
> > While the difference only in VID codes mapping.
> >
> > The motivation for that is to give free hand to HW design to choose
> > which particular device to use on the same system type.
> > There are two main reasons for such requirement:
> > - Quality of device (we already had a serios problems with ucd9224 and
> >   tps53679, caused system meltdown). In such case the intention is to m=
ove
> >   to fallback devices in the next batches.
> > - Device availability in stock. Sometimes vendors can't supply in time =
the
> >    necessary quantity.
> >
> > Currently there are the devices from three vendor: TI tps536xx,
> > Infineon
> > xdpe122 and MPS mp2975.
> > All have different mapping of VID codes.
> >
> > It could be also few additional devices, which are supposed to be used
> > as fallback devices.
> >
> > We have several very big customers ordering now huge quantity of our
> > systems, which are very conservative regarding image upgrade.
> > Means we can provide now support for tps536xx, xdpe122xx and mp2975
> > but in case new devices are coming soon, we will be able to support it
> > in kernel for their image after year or even more.
> >
> > We can provide ACPI pmbus driver, which will read VID mapping from
> > ACPI DSDT table. This mapping table will contain the names of
> > available modes and specific vendor code for this mode. Like:
> > PMBVR11=3D1
> > PMBVR12=3D2
> > PMBVR13=3D5
> > PMBIMVP9=3D10
> > And driver will set info->vrm_version[i] according to this mapping.
> >
>=20
> The DSDT would have to provide all properties, not just the VID modes.
> At the very least that would have to be the number of pages, data formats=
, vrm
> version, and the supported attributes per page. It should be possible to =
also add
> m/b/R information for each of the sensor classes, but I guess the actual
> implementation could be postponed until it is needed.
>=20
> This could all be done through the existing generic driver (pmbus.c); it =
would not
> really require a new driver. ACPI/DSDT could provide firmware properties,=
 and
> pmbus.c could read those using device_property API functions (eg
> device_property_read_u32(dev, "vrm-mode")). Would that work for you ?

Hi Guenter,

We thought that it's possible to provide just modified DSDT with the specif=
ic
configuration as an external table, which is loaded during system boot.

It should not be integrated into BIOS image.
We want to avoid releasing of new BIOS or new each time system configuratio=
n
is changed.
New BIOS is released only when new CPU type should be supported.
Also BIOS overwriting is not an option, sine we have to support secured BIO=
S.

It should not be located in initrd.
The new system batch is released with BIOS, SMBIOS and with customer's OS o=
r
with install environment like ONIE.
Means no kernel changes.
Also not all our customers use initrd.
=20
So, it seems there is no place, when we can locate modified DSDT and load
it dynamically.
But we should think more about possible methods for doing it.

Today all the static devices are instantiated  from the user space.
It's supposed to work for us while we have to support some pre-defined set =
of
devices, for which we can detect the specific configuration through DMI tab=
les
(SKU in particular).
But it'll not work for some new coming devices.

We have a possibility to provide VID mapping info through CPLD device.
But in this case we'll have to implement Mellanox specific PMBus driver awa=
re
of CPLD register map.
Not sure if such approach is accepted?

Thanks,
Vadim.

>=20
> Thanks,
> Guenter
