Return-Path: <SRS0=BLaD=4M=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6AF1C38BFA
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 22:23:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A304321744
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 22:23:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=Mellanox.com header.i=@Mellanox.com header.b="jGilHytA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbgBXWXv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Feb 2020 17:23:51 -0500
Received: from mail-eopbgr140049.outbound.protection.outlook.com ([40.107.14.49]:6981
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727520AbgBXWXv (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Feb 2020 17:23:51 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TxytLYHeDaLiLumGp+nyVP3DJ5A48qHCVKYGOrZCMiXKsfW7JghiR9R6WME2nansGAXcXBSG5wCEpsyLz1QjvhnR3dZrayP2xdWvMzTbN6ZfnaedrJQkEY2Jig9Qrvluiu7M6PfQ/FLLY/+GUXL1FF+n9iFq63Xj/336CFGoAbBRI6xeudMvWuzHHXtG5laHUimCzTcKmXvvPhd/Hnu7Qmli0K/B+KqTx5benZKoEN2jWpInQPzU+DjnntNwrniW9O9eMChRKSZ3a6GXmYBk9LczzCV4DZ9/rlpvm2HywjgYBwQKNuQMD8ROAwTr+Ysmad+vfDE9ANnqAga2Gj80+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUhswU12fIUxG2IQlDfHEtIbom+XdPKgzk3V4uHkq5c=;
 b=BbYdbAzMowJ4cZ46D5V4uwTOaDnvWeQFWEQ1mSA0IUKvXr8+j/TlHOK8PllP1SwT50ZENstQWUH8ySUVZg+KDBJGvOh31SIH/ccQKMXmlq+QHoxUzDZonnXtIJvub6Cs4zA8spqeFDaXo0nx0cVpkxmI0Ykp6Oe6qr8I+Lplv+uWujVoxYXg8zfIWphjl8VOyKbf7w/zMnHB71zu/oAdKYKRenHh6xxPF5y06etcWOzXM5eTkT9PzWtkDbwM2786dwprn8+ZPISytumla+lS03MGNazfjMb2mD2CDmpn3H3A11ZdI2XubRQwlWY7htTtWnbFO8vMBQXP21/IotCrrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XUhswU12fIUxG2IQlDfHEtIbom+XdPKgzk3V4uHkq5c=;
 b=jGilHytAr3S52qb1AzOpl5E76tWUENQ+AD1VhCk4Ct+hBO8Hdp7sdSmK96uz2q75mHq2XuDbIYORy9jEV/dgO+7YqcoOORey5/wwmreyiKxnuQER3NhMu6iIjfD3j9rt3G8xVxRpmJnimsYv1R/7ZdrUYWvDfWF9NsYBcQrfL68=
Received: from DB6PR0501MB2358.eurprd05.prod.outlook.com (10.168.57.146) by
 DB6PR0501MB2823.eurprd05.prod.outlook.com (10.172.226.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.17; Mon, 24 Feb 2020 22:23:12 +0000
Received: from DB6PR0501MB2358.eurprd05.prod.outlook.com
 ([fe80::5108:a8d6:5b9:45f4]) by DB6PR0501MB2358.eurprd05.prod.outlook.com
 ([fe80::5108:a8d6:5b9:45f4%10]) with mapi id 15.20.2750.021; Mon, 24 Feb 2020
 22:23:12 +0000
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [hwmon-next v2] hwmon: (pmbus/xdpe12284) Add callback for vout
 limits conversion
Thread-Topic: [hwmon-next v2] hwmon: (pmbus/xdpe12284) Add callback for vout
 limits conversion
Thread-Index: AQHV61x4ofvnP3YiXEinyPFn1ybmlagq6IUAgAACUoA=
Date:   Mon, 24 Feb 2020 22:23:12 +0000
Message-ID: <DB6PR0501MB2358416FEF06AA8797C0F096A2EC0@DB6PR0501MB2358.eurprd05.prod.outlook.com>
References: <20200224215031.24729-1-vadimp@mellanox.com>
 <20200224221320.GA6917@roeck-us.net>
In-Reply-To: <20200224221320.GA6917@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vadimp@mellanox.com; 
x-originating-ip: [46.116.34.10]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 88011e73-3e95-4e69-0be1-08d7b978226c
x-ms-traffictypediagnostic: DB6PR0501MB2823:
x-microsoft-antispam-prvs: <DB6PR0501MB2823EDD1C4536D9300C0EBF2A2EC0@DB6PR0501MB2823.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 032334F434
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(39860400002)(366004)(376002)(396003)(346002)(199004)(189003)(186003)(6916009)(55016002)(26005)(76116006)(52536014)(6506007)(86362001)(9686003)(53546011)(66476007)(66446008)(7696005)(64756008)(66556008)(66946007)(478600001)(5660300002)(316002)(33656002)(4326008)(2906002)(8936002)(81166006)(8676002)(71200400001)(81156014);DIR:OUT;SFP:1101;SCL:1;SRVR:DB6PR0501MB2823;H:DB6PR0501MB2358.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +CX4hL+tuTAv0R1rwbhJfaneR5CLaM9wL4tyeGXviRgjENBQHjQRlFVfjDYfMHn+ZmIh+8dZ/9Wvut95svj7AB76rtOvV9EFiNPkDBhAmgRSGZaTl7YTchCGTJsxVTvBHR/HHGC4oUE+bbNyGQXN95RxLGz3rwbe/FMInCeylN9b4eVmDsg99GY1iKM/0LHJ5lcKGfsyC16VWqVH031A63woe/SGA0OlViM09nCvCJ5LApfs8Ou+tdxDrcO5VYrdQOO5MW189B8WAzZXRA9DZDaUD04fLv2SQf2KKbpZWbGZEbpF4Khj8ozPDmPno7HsY5WnbY8sJGfvRp9xF0zukMR1vxCzQG7i35fIv1eC37GwxXUxKsy8S8GVD4oGiSxvMp4iMVDROqqsXswJgGsoiceQT3+J5Vk25KY2bRtrFCJw3ML4GAyP4ZxEVxahbLaX
x-ms-exchange-antispam-messagedata: Go0/5L1k2xOtvdrKnkr6zCQebl6aaOhWwIFW2s0SOldYghQlhWHZXTLJAR9v75jwORTuYlo3BQ9hyNWVsRDYT4cmJTtiBHRGgw8+5nQvBTBZ83JZGBP0f+lhnBUcGBsDQ10sRngNYC0BMnFAMZm41A==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 88011e73-3e95-4e69-0be1-08d7b978226c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2020 22:23:12.0325
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aQv4C8v3d/4VrRhZ52mP0Xed60zj+qNJTW2xN1Ac4jnHpIOtv3JSNVRj9b443JTLGnhdoxDNZxjr3wYe9Vi6Rg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0501MB2823
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Tuesday, February 25, 2020 12:13 AM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: linux-hwmon@vger.kernel.org
> Subject: Re: [hwmon-next v2] hwmon: (pmbus/xdpe12284) Add callback for vo=
ut
> limits conversion
>=20
> On Mon, Feb 24, 2020 at 11:50:31PM +0200, Vadim Pasternak wrote:
> > Provide read_word_data() callback for overvoltage and undervoltage
> > output readouts conversion. These registers are presented in
> > 'slinear11' format, while default conversion for 'vout' class for the
> > devices is 'vid'. It is resulted in wrong conversion in
> > pmbus_reg2data() for in{3-4}_lcrit and in{3-4}_crit attributes.
> > )
> > Fixes: aaafb7c8eb1c ("hwmon: (pmbus) Add support for Infineon
> > Multi-phase xdpe122 family controllers")
> > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> > ---
> > v1->v2:
> >  Comments pointed out by Guenter:
> >  - Drop reg2data() callback, provide conversion through
> >    read_word_data() callback instead.
> > ---
> >  drivers/hwmon/pmbus/xdpe12284.c | 51
> > +++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >
> > diff --git a/drivers/hwmon/pmbus/xdpe12284.c
> > b/drivers/hwmon/pmbus/xdpe12284.c index ecd9b65627ec..44b737d0bc24
> > 100644
> > --- a/drivers/hwmon/pmbus/xdpe12284.c
> > +++ b/drivers/hwmon/pmbus/xdpe12284.c
> > @@ -18,6 +18,56 @@
> >  #define XDPE122_AMD_625MV		0x10 /* AMD mode 6.25mV */
> >  #define XDPE122_PAGE_NUM		2
> >
> > +static int xdpe122_read_word_data(struct i2c_client *client, int page,
> > +				  int phase, int reg)
> > +{
> > +	const struct pmbus_driver_info *info =3D pmbus_get_driver_info(client=
);
> > +	long val;
> > +	s16 exponent;
> > +	s32 mantissa;
> > +	int ret;
> > +
> > +	switch (reg) {
> > +	case PMBUS_VOUT_OV_FAULT_LIMIT:
> > +	case PMBUS_VOUT_UV_FAULT_LIMIT:
> > +		ret =3D pmbus_read_word_data(client, page, phase, reg);
> > +		if (ret < 0)
> > +			return ret;
> > +
> > +		/* Convert register value to LINEAR11 data. */
> > +		exponent =3D ((s16)ret) >> 11;
> > +		mantissa =3D ((s16)((ret & GENMASK(10, 0)) << 5)) >> 5;
> > +		val =3D mantissa * 1000L;
> > +		if (exponent >=3D 0)
> > +			val <<=3D exponent;
> > +		else
> > +			val >>=3D -exponent;
> > +
> > +		/* Convert data to VID register. */
> > +		switch (info->vrm_version[page]) {
> > +		case vr13:
> > +			if (val >=3D 500)
> > +				return 1 + DIV_ROUND_CLOSEST(val - 500, 10);
>=20
> 			return 0; ?
>=20
> > +		case vr12:
> > +			if (val >=3D 250)
> > +				return 1 + DIV_ROUND_CLOSEST(val - 250, 5);
>=20
> 			return 0; ?
>=20
> > +		case imvp9:
> > +			if (val >=3D 200)
> > +				return 1 + DIV_ROUND_CLOSEST(val - 200, 10);
>=20
> 			return 0; ?
> > +		case amd625mv:
> > +			if (val >=3D 200 && val <=3D 968750)
> > +				return DIV_ROUND_CLOSEST((1550 - val) *
> 100,
> > +							 625);

Oh, it should be 1550.
(155000 - 0 * 625) / 100 =3D 1550.
Sorry.

> 			return 0; ?
>=20
> Also, are you sure that this calculation is correct ?
> 1550 - val is almost always negative.
>=20
> > +		default:
> > +			return -EINVAL;
> > +		}
> > +	default:
> > +		return -ENODATA;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static int xdpe122_identify(struct i2c_client *client,
> >  			    struct pmbus_driver_info *info)  { @@ -70,6 +120,7
> @@ static
> > struct pmbus_driver_info xdpe122_info =3D {
> >  		PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP |
> >  		PMBUS_HAVE_POUT | PMBUS_HAVE_PIN |
> PMBUS_HAVE_STATUS_INPUT,
> >  	.identify =3D xdpe122_identify,
> > +	.read_word_data =3D xdpe122_read_word_data,
> >  };
> >
> >  static int xdpe122_probe(struct i2c_client *client,
> > --
> > 2.11.0
> >
