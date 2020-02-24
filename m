Return-Path: <SRS0=BLaD=4M=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCEB3C38BFA
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 22:29:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 94D8E222D9
	for <linux-hwmon@archiver.kernel.org>; Mon, 24 Feb 2020 22:29:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=Mellanox.com header.i=@Mellanox.com header.b="tMAXh9pJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728069AbgBXW3d (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 24 Feb 2020 17:29:33 -0500
Received: from mail-vi1eur05on2066.outbound.protection.outlook.com ([40.107.21.66]:6083
        "EHLO EUR05-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726651AbgBXW3d (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Feb 2020 17:29:33 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPF9fV4v5hiZNOsycMYeKWwhtsR7Ej8niAjyycmyzEfbZZvifJGr7M3pNUgOI+BQD0dAKb6U8fwDmMyLc3Tm9MH1EtsOSMuEsA7rsVRCW7lDYLF6lepEDsrUn8iJ+woKOvyTsO2HWXsDMA8ylUFX/8h/NKoHjyiyFDoWUZe3J+br7jtAA7n0OleDTaTfZsiiO18ekM7y12CGjaVRzdZh4zAtJ5OxiromfwyqKhwb1K9KWZIR3/hwmITg+paVE5GaKYnUxLLgdBHZeqyH9vGVZwlplXGtWOegMtPWBy+ky38/L0Aj1w2BGLG+J6AMMntBWMP3il3RfBbr1B0bHsC3Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bC/zj4Aum4FmfHDvUdYotKPlqxOXtJzB+X/byEKdcbk=;
 b=RFWYs9q9IHohIuC+B5UHHdwMi/wlOtv3jzo6mMq6cknPZg0qj41WIHZ8SlECqXWDBRsCoNmXxdqsxxZUGs7DTPvt0P1WfJ2u7PlZ8u1eaQG2BrWyv7u1C4A99M+o0CAH8CPHeGNJ+d5V0csnb2eFAZHzrkc7K9H2CXjvAaHDBUqwWUW7SDUhftzFZgVehT2j5FVr/k6vQ3ZJlWc7Lps02BCNXijO+zE5IBKx+79KknzbfBxvT5gpFeMu4Zox3d6A88iDanLMafpc8CIEsyY+ve0NbXnmGLK2IDvez7NZw8fKQWP7gr9C1fYosSwe7bz6mhycHd2ZGdoYvGIc15fwjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mellanox.com; dmarc=pass action=none header.from=mellanox.com;
 dkim=pass header.d=mellanox.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Mellanox.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bC/zj4Aum4FmfHDvUdYotKPlqxOXtJzB+X/byEKdcbk=;
 b=tMAXh9pJFpCFTtVCwe94j7nM6da3Y8eugDSTXGArRGETA8vBaxgOgZOneGD1l0Vz/y0XWXECIh5YSGERtnGd5UTwu2e0bLCvZeujdLr+qgDxXKU0exbbDV0c4x4neQT6FEC1Ti0bjgFkWCeaoZTro4Df/u99qInZJUDHsfGlzYs=
Received: from DB6PR0501MB2358.eurprd05.prod.outlook.com (10.168.57.146) by
 DB6PR0501MB2504.eurprd05.prod.outlook.com (10.168.76.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.21; Mon, 24 Feb 2020 22:29:28 +0000
Received: from DB6PR0501MB2358.eurprd05.prod.outlook.com
 ([fe80::5108:a8d6:5b9:45f4]) by DB6PR0501MB2358.eurprd05.prod.outlook.com
 ([fe80::5108:a8d6:5b9:45f4%10]) with mapi id 15.20.2750.021; Mon, 24 Feb 2020
 22:29:28 +0000
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [hwmon-next v1] hwmon: (pmbus/tps53679) Add support for
 historical registers for TPS53688
Thread-Topic: [hwmon-next v1] hwmon: (pmbus/tps53679) Add support for
 historical registers for TPS53688
Thread-Index: AQHV6xRZB08WINjb/UWHvGecIbZtXagqbWaAgAB4LACAAAaQgIAAAJhg
Date:   Mon, 24 Feb 2020 22:29:28 +0000
Message-ID: <DB6PR0501MB2358937B2A0A5405018B5EABA2EC0@DB6PR0501MB2358.eurprd05.prod.outlook.com>
References: <20200224131316.28238-1-vadimp@mellanox.com>
 <b9b2d96b-1b1d-7445-18a7-21e3d28e6819@roeck-us.net>
 <DB6PR0501MB23584EB4453A14BC1EE29C13A2EC0@DB6PR0501MB2358.eurprd05.prod.outlook.com>
 <20200224222415.GA7282@roeck-us.net>
In-Reply-To: <20200224222415.GA7282@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vadimp@mellanox.com; 
x-originating-ip: [46.116.34.10]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fca54584-7619-4ab7-a245-08d7b97902e9
x-ms-traffictypediagnostic: DB6PR0501MB2504:
x-microsoft-antispam-prvs: <DB6PR0501MB2504DFA150891CBB37C44817A2EC0@DB6PR0501MB2504.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 032334F434
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(189003)(199004)(26005)(33656002)(7696005)(86362001)(8676002)(81156014)(186003)(4326008)(53546011)(6506007)(81166006)(8936002)(66446008)(64756008)(66556008)(6916009)(52536014)(5660300002)(71200400001)(55016002)(9686003)(66476007)(76116006)(316002)(66946007)(478600001)(2906002);DIR:OUT;SFP:1101;SCL:1;SRVR:DB6PR0501MB2504;H:DB6PR0501MB2358.eurprd05.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: mellanox.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3XfFUVtUKRZ877vKX8O4FVSJxJUsuoF+rxABMvNAB0SVV/7CXvJE8F2UqjL95EhqEE6zJfuYaBC7XF39yuSMRJ1/bphfNCdcCjN2K/ip8BdrHOd8huGkmfxK7J67GNMcR+0s9+jE5LzghKbvn1fb2ke2PVpAV25AuBIAjQ+/irn2s2fUuzvcqKdDJr5zcXZx3P+bnJz0gAxgauWPEUCaAmDS/yOBYvtQeWSZMz/AovrLuhK509A9x66x83VgtT+edZw7SrJQJ9g3gMrrFsEK19nKEJ+ksSphRQxmLHB6arOuTWOwY2JTGj626Nz6aqVOogfyvAPjZs+rZXFzHjhxHlRMvWx9ckswUSntgzMLjLKGRe8Jr8hkQr49w+e5P53XLTpMJzVxTEeZvuIZINx6Ll13u/qMsICqrwm+s5awLyPH2ZJKnVkDvDBi5V/U01DO
x-ms-exchange-antispam-messagedata: 71IKM3JwoWvgRxxQ7Zio4Wr8OhY9Q/lwHE6tDgEFnoCOcBPqWVVCOEBvgfc9KLH6+wCPcwjX1tora5aK9eLOLP5VxmI1Fq4OYd4K4cYovP7cMEdjqq3EjBKHKY2c0bq1xW60k6+1OlI8agJTDF4EQw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Mellanox.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fca54584-7619-4ab7-a245-08d7b97902e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2020 22:29:28.6751
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a652971c-7d2e-4d9b-a6a4-d149256f461b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KCuAM2D73yQUkLEsSoK3TJyGIH8la8MJGXNvZrp2oQiT/rtOBeCqbebliz/9wuISZOb5Y9kJL/UgiQ2eCfGxDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0501MB2504
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Tuesday, February 25, 2020 12:24 AM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: linux-hwmon@vger.kernel.org
> Subject: Re: [hwmon-next v1] hwmon: (pmbus/tps53679) Add support for
> historical registers for TPS53688
>=20
> On Mon, Feb 24, 2020 at 10:13:18PM +0000, Vadim Pasternak wrote:
> >
> >
> > > -----Original Message-----
> > > From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> > > Sent: Monday, February 24, 2020 4:51 PM
> > > To: Vadim Pasternak <vadimp@mellanox.com>
> > > Cc: linux-hwmon@vger.kernel.org
> > > Subject: Re: [hwmon-next v1] hwmon: (pmbus/tps53679) Add support for
> > > historical registers for TPS53688
> > >
> > > On 2/24/20 5:13 AM, Vadim Pasternak wrote:
> > > > TPS53688 supports historical registers. Patch allows exposing the
> > > > next attributes for the historical registers in 'sysfs':
> > > > - curr{x}_reset_history;
> > > > - in{x}_reset_history;
> > > > - power{x}_reset_history;
> > > > - temp{x}_reset_history;
> > > > - curr{x}_highest;
> > > > - in{x}_highest;
> > > > - power{x}_input_highest;
> > > > - temp{x}_highest;
> > > > - curr{x}_lowest;
> > > > - in{x}_lowest;
> > > > - power{x}_input_lowest;
> > > > - temp{x}_lowest.
> > > >
> > > > This patch is required patch:
> > > > "hwmon: (pmbus/core) Add callback for register to data conversion".
> > > >
> > > > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> > > > ---
> > > >   drivers/hwmon/pmbus/tps53679.c | 244
> > > ++++++++++++++++++++++++++++++++++++++++-
> > > >   1 file changed, 243 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/hwmon/pmbus/tps53679.c
> > > > b/drivers/hwmon/pmbus/tps53679.c index 157c99ffb52b..ae5ce144e5fe
> > > > 100644
> > > > --- a/drivers/hwmon/pmbus/tps53679.c
> > > > +++ b/drivers/hwmon/pmbus/tps53679.c
> > > > @@ -34,6 +34,227 @@ enum chips {
> > > >
> > > >   #define TPS53681_MFR_SPECIFIC_20	0xe4	/* Number of phases,
> per page
> > > */
> > > >
> > > > +/* Registers for highest and lowest historical values records */
> > > > +#define TPS53688_VOUT_PEAK		0xd1
> > > > +#define TPS53688_IOUT_PEAK		0xd2
> > > > +#define TPS53688_TEMP_PEAK		0xd3
> > > > +#define TPS53688_VIN_PEAK		0xd5
> > > > +#define TPS53688_IIN_PEAK		0xd6
> > > > +#define TPS53688_PIN_PEAK		0xd7
> > > > +#define TPS53688_POUT_PEAK		0xd8
> > > > +#define TPS53688_HISTORY_REG_BUF_LEN	5
> > > > +#define TPS53688_HISTORY_REG_MIN_OFFSET	3
> > > > +#define TPS53688_HISTORY_REG_MAX_OFFSET	1
> > > > +
> > > > +const static u8 tps53688_reset_logging[] =3D { 0x04, 0x00, 0x01,
> > > > +0x00,
> > > > +0x00 }; const static u8 tps53688_resume_logging[] =3D { 0x04, 0x20=
,
> > > > +0x00, 0x00, 0x00 };
> > > > +
> > > Passing the length as 1st field seems wrong.
> > >
> > > > +static int tps53688_reg2data(u16 reg, int data, long *val) {
> > > > +	s16 exponent;
> > > > +	s32 mantissa;
> > > > +
> > > > +	if (data =3D=3D 0)
> > > > +		return data;
> > > > +
> > > > +	switch (reg) {
> > > > +	case PMBUS_VIRT_READ_VOUT_MIN:
> > > > +	case PMBUS_VIRT_READ_VOUT_MAX:
> > > > +		/* Convert to LINEAR11. */
> > > > +		exponent =3D ((s16)data) >> 11;
> > > > +		mantissa =3D ((s16)((data & GENMASK(10, 0)) << 5)) >> 5;
> > > > +		*val =3D mantissa * 1000L;
> > > > +		if (exponent >=3D 0)
> > > > +			*val <<=3D exponent;
> > > > +		else
> > > > +			*val >>=3D -exponent;
> > > > +		return 0;
> > > > +	default:
> > > > +		return -ENODATA;
> > > > +	}
> > > > +}
> > > > +
> > > As with the xpde driver, I would suggest to implement the conversion
> > > in the read_word_data function.
> > >
> > > > +static int
> > > > +tps53688_get_history(struct i2c_client *client, int reg, int page,=
 int
> unused,
> > > > +		     int offset)
> > >
> > > What is the point of passing "unused" to this function ?
> > >
> > > > +{
> > > > +	u8 buf[TPS53688_HISTORY_REG_BUF_LEN];
> > > > +	int ret;
> > > > +
> > > > +	ret =3D pmbus_set_page(client, page, 0);
> > > > +	if (ret < 0)
> > > > +		return ret;
> > > > +
> > > > +	ret =3D i2c_smbus_read_i2c_block_data(client, reg,
> > > > +					    TPS53688_HISTORY_REG_BUF_LEN,
> > > > +					    buf);
> > > > +	if (ret < 0)
> > > > +		return ret;
> > > > +	else if (ret !=3D TPS53688_HISTORY_REG_BUF_LEN)
> > > > +		return -EIO;
> > >
> > > I am a bit confused here. Are you sure this returns (and is supposed
> > > to return)
> > > 5 bytes of data, not 4, and that the data offsets are 1 and 3, not 0 =
and 2 ?
> > > i2c_smbus_read_i2c_block_data() returns the length, and only copies
> > > the data into the buffer, not the length field.
> > >
> > > > +
> > > > +	return *(u16 *)(buf + offset);
> > >
> > > This implies host byte order. I don't think it will work on big endia=
n systems.
> > > Besides, it won't work on systems which can not directly read from
> > > odd addresses (if the odd offsets are indeed correct).
> > >
> > > > +}
> > > > +
> > > > +static int
> > > > +tps53688_reset_history(struct i2c_client *client, int reg) {
> > > > +	int ret;
> > > > +
> > > > +	ret =3D i2c_smbus_write_i2c_block_data(client, reg,
> > > > +					     TPS53688_HISTORY_REG_BUF_LEN,
> > > > +					     tps53688_reset_logging);
> > > > +	if (ret < 0)
> > > > +		return ret;
> > > > +
> > > > +	ret =3D i2c_smbus_write_i2c_block_data(client, reg,
> > > > +					     TPS53688_HISTORY_REG_BUF_LEN,
> > > > +					     tps53688_resume_logging);
> > > > +	if (ret < 0)
> > > > +		return ret;
> > > > +
> > > Are you sure that a single write of 00 00 01 00 wouldn't do it ?
> > > Is it indeed necessary to resume logging after resetting it ?
> > >
> >
> > Yes.
> > I used initially '0x00, 0x01, 0x00' and it didn't work for me.
> > Then I managed to have a call with TI and after some debug they said I
> > should resume after reset, so I added '0x02 0x00, 0x00, 0x00'.
> >
> > Datasheet says:
> > Issue a write transaction with the following values to control peak log=
ging
> functions.
> > Logging is not automatically started or stopped by TPS536xx.
> > 0000 0001h Pause minimum value logging
> > 0000 0002h Pause maximum value logging
> > 0000 0004h Pause minimum and maximum value logging
> > 0000 0008h Resume minimum value logging (if paused)
> > 0000 0010h Resume maximum value logging (if paused)
> > 0000 0020h Resume minimum and maximum value logging (if paused)
> > 0000 0040h Reset the minimum value logging
> > 0000 0080h Reset the maximum value logging
> > 0000 0100h Reset both minimum and maximum value logging Other
> > Invalid/Unsupported data.
> >
> > So it's not active by default and should be resumed for starting loggin=
g.
> >
> > Because of that I also added tps53688_reset_history_all() in probe,
> > because otherwise after boot these registers have some abnormal values.
> > But anyway I'll drop this routine following your comment below.
> > Also considering that driver can be re-probed and in this case history
> > after the first reset/resume could be important.
> >
> Thanks for the explanation.
>=20
> That means though that you'll need to call something like
> tps53688_start_logging_all() in the probe function, or am I missing somet=
hing ?
> Otherwise the user would have to explicitly reset the history to start lo=
gging it,
> which would not be desirable either.

Yes, this is was my intention to activate logging on probe and do not
it explicitly through all '{x}_reset_history' attributes.
So, keep it in probe and just rename to tps53688_start_logging_all()?

>=20
> Thanks,
> Guenter
