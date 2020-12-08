Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00EE1C4361B
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Dec 2020 21:53:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9431B20C56
	for <linux-hwmon@archiver.kernel.org>; Tue,  8 Dec 2020 21:53:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727737AbgLHVx5 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 8 Dec 2020 16:53:57 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:4415 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726758AbgLHVx5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 8 Dec 2020 16:53:57 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fcff5cc0000>; Tue, 08 Dec 2020 13:53:16 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 8 Dec
 2020 21:53:15 +0000
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (104.47.46.50) by
 HQMAIL111.nvidia.com (172.20.187.18) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 8 Dec 2020 21:53:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cfSxk8HosBU0XjppAVD7RfIlgsFjqx6bo67LcAq2QQ4i8vEMoDcmYaXa7bfHi/sama1AZvOkjjodzihSjBA7qO4aPrM5vIRynrrAe6UepacFqJ9dfsffRQS0Em+1fLV9D+RLa+Rm9txfHm4nx+rISBSDM2yFnWDA4DXaaI30T6U2rPgB1h8RC6JoIp9zKlIyD3iu267mxuWF/UCqTPDS7iu/qA2kmufsrzp261uLMWxJ31H1L2QTLnZT5inyTJ48qqaY8l51RZHQ0se2x/pLpYALIf8omSDR9UlxU9e+InHVQSh45h6HuPBoFjFAh4ns0uksHkVfYt1AEdCeU7WC6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKuEkU+jFn0ITwBTb32ztA3wjVSqvRP4gd+4yi1eg+I=;
 b=EFi+QLsSiBTlhksFkLgVDHLZyPvLMsVgpP0iZshnkFkV/QRPq31BZQ6Vy/QmlXCyi/ZKFM4AJR8/ijY+3tm39T7M+oz7SLhelBmRzwaTSNbly0DjkuJfgmdXOdD6U0bxgS/GfVsRexZizwWG9vfLqw5DvJHUPfH0nEy9RXEe6WoE9oDWT4wNRrzHGICHrnywx097hzAGf0KFPZWVXBbs1Ul+hN9al0xjWJcw59dErP6ZTSroEv4bbyQu9ZUge3TAoiVGt83LkeJUYRDAsX5F8P7JBfEEk7sqPll8SkNUIhl1dX0wPQkLzHayjkKbo2kHx5Sf/Lav7n96u75L2bYrYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3898.namprd12.prod.outlook.com (2603:10b6:5:1c6::18)
 by DM6PR12MB3804.namprd12.prod.outlook.com (2603:10b6:5:1cd::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Tue, 8 Dec
 2020 21:53:14 +0000
Received: from DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::80c1:3479:15b6:a7a2]) by DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::80c1:3479:15b6:a7a2%6]) with mapi id 15.20.3632.022; Tue, 8 Dec 2020
 21:53:14 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [PATCH hwmon-next 1/1] hwmon: (mlxreg-fan) Add support for fan
 drawers capability and present registers
Thread-Topic: [PATCH hwmon-next 1/1] hwmon: (mlxreg-fan) Add support for fan
 drawers capability and present registers
Thread-Index: AQHWzUSwY7eD8C6axEqp3zq8G9uJrKntm/SAgAAR1+A=
Date:   Tue, 8 Dec 2020 21:53:14 +0000
Message-ID: <DM6PR12MB38983B082DA4960F3FDB3236AFCD0@DM6PR12MB3898.namprd12.prod.outlook.com>
References: <20201208092931.1074-1-vadimp@nvidia.com>
 <20201208194931.GD71189@roeck-us.net>
In-Reply-To: <20201208194931.GD71189@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [46.117.169.59]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 22638a42-1fbe-442e-48b7-08d89bc3a9c0
x-ms-traffictypediagnostic: DM6PR12MB3804:
x-microsoft-antispam-prvs: <DM6PR12MB3804CFEC20EC28FBC71C83F1AFCD0@DM6PR12MB3804.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PcgqVweAoRODEtcuqCOhiU+Zzcz4WiWpyTYf25o2lUoc2C1crrt/RKSF+9Mt9aGqI6OXYSwluyzmfJLtjymr9FFpvTE5niQJgUdVG+eQwnud16pBMAQKvTL3WpVUupK1x7XMGM+GeFqncvF/pCNpl1FG5mxZcj4m8zQhDim4JeyNOmrF5OOAyR02GfiZtIvjBZN8m1okabzH29YDgyidfeQbFf90SqG36dZITrjoKOgIsijNuUuOzVUJk9hYJjH2NT87NhdOyRFBaZH3wWWCwHQYx8udtA6XQOUbwagxMo1aVW1Z4W7S7wb8no6ZkQEzLxqDQMmX46curIciwdCJ+A==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3898.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(346002)(376002)(7696005)(186003)(2906002)(66446008)(4326008)(76116006)(71200400001)(5660300002)(83380400001)(55016002)(6916009)(8936002)(33656002)(66476007)(9686003)(64756008)(66946007)(508600001)(52536014)(66556008)(26005)(86362001)(8676002)(6506007)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?dUai0GU5nXAlPZ1QFRcJ24lJMzlef2JNwefC7dEqrR7JWI68nllaKY6PUS18?=
 =?us-ascii?Q?776/ijKjQLQKZkPAtaSIEIibwfZxw6JDCNfT3b4s1x88ltKMuE5xbCj3ATpT?=
 =?us-ascii?Q?O/Yp4mLGP/xreZGLHxfLtHmFz0ylSdgBYf4ix7jc0F80VNQppusfFImCIMAN?=
 =?us-ascii?Q?6JKZFSggQM7dehgr1o77CkhlgPOTiNbPxgtrrruWwVUFHfqxmS4jjgnMjYG3?=
 =?us-ascii?Q?WTbbx8WKJkCQN3nhH+yVNeh7qZXnF5ispy7BpjDk0+RdNDv4g7M3ecjPhnKL?=
 =?us-ascii?Q?rQkfYKUTmubxUJkPYKuJD0+2q2UzT9hJw9pXh4weOne9gPnWCrf8gFcY0cO8?=
 =?us-ascii?Q?4wKByruHU2XD73E0qL+zPlTo7QneGOF7HE95KA6aIq07F0OQ8M9NF7oymIxr?=
 =?us-ascii?Q?6jZJtDnDVNXEt45PjffXmiLUG4qsg4lNekmxLunPkF0vr+YM0qeLM2tiQIGy?=
 =?us-ascii?Q?mutgRXyMGHmFGJe0MvIbeSY6k6lXf+KY+kwUjn6jSsAh502WCWEE3xDjFXlb?=
 =?us-ascii?Q?M9xoxMh9strnPqfnEh2ANG74/YFtLGXTN3wtcOmrx3yiYpMB6vkReb7wIIRD?=
 =?us-ascii?Q?otFKynzH8Da20CKLnEI5Xd7EV2zKPux+E8+L0WtT43FgsV8DEx7folOuM+Ue?=
 =?us-ascii?Q?pE8u9B94BC+yyUYRkRLTyLvN01NVahI6fcD/84thjCZZetChChARFrCrypNT?=
 =?us-ascii?Q?GcBxjzOkNjIGQbrFTuB13c8/V7tmpehNnhRts0dZIT2Gjd87JXhQc4scvEmp?=
 =?us-ascii?Q?V4Q8LvDqKiuLOsA1jaF6ex7i5Zckw/QwZw4nV+fUocJDd+4jc8MK3xZikO7+?=
 =?us-ascii?Q?XVxqMbfX0hd5QMbwEHxvLTG4igBB1vvkLF3BhbI4UZEAfeTNLgKiDHPP9iEi?=
 =?us-ascii?Q?V6c4TQurh+q3LyvrvMVNO3oe1Wu2oIXMtWkjh7UWApvd1na9Ewp0PZGN1PcH?=
 =?us-ascii?Q?FFGcJ/wR9G61jTwJE21Oj9dmZ+AF7UnCqEMPZezMEHo=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3898.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22638a42-1fbe-442e-48b7-08d89bc3a9c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Dec 2020 21:53:14.0514
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xwON3gx4onIj1GiV9Qc0xsf8O66z15GbWg8p0YGJ3JzsCflvKu2fIC89fNAmZWskeFTp1ugT/Cyre2OIIq7dMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3804
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1607464396; bh=sKuEkU+jFn0ITwBTb32ztA3wjVSqvRP4gd+4yi1eg+I=;
        h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
         CC:Subject:Thread-Topic:Thread-Index:Date:Message-ID:References:
         In-Reply-To:Accept-Language:Content-Language:X-MS-Has-Attach:
         X-MS-TNEF-Correlator:authentication-results:x-originating-ip:
         x-ms-publictraffictype:x-ms-office365-filtering-correlation-id:
         x-ms-traffictypediagnostic:x-microsoft-antispam-prvs:
         x-ms-oob-tlc-oobclassifiers:x-ms-exchange-senderadcheck:
         x-microsoft-antispam:x-microsoft-antispam-message-info:
         x-forefront-antispam-report:x-ms-exchange-antispam-messagedata:
         x-ms-exchange-transport-forked:Content-Type:
         Content-Transfer-Encoding:MIME-Version:
         X-MS-Exchange-CrossTenant-AuthAs:
         X-MS-Exchange-CrossTenant-AuthSource:
         X-MS-Exchange-CrossTenant-Network-Message-Id:
         X-MS-Exchange-CrossTenant-originalarrivaltime:
         X-MS-Exchange-CrossTenant-fromentityheader:
         X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
         X-MS-Exchange-CrossTenant-userprincipalname:
         X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
        b=qhNNjohR0p0BkVo3UYWzq779xbPkZnrUG9cpDtqbt9JHRxHeM3Ahdu7bfg+ibxwaR
         M+kNXVIY1OHV6DgTtWXnJduRziSAkly+jyuarBc4ORQYqwc720ax+pF4dwRAWuksoa
         IbzWBk+p24LXLAWherAXnjUq75g108xHEPOrH3Dcsj1HrN0dASeyje9eqGbC/KooT0
         IVGvYzgbpBPTaLephKYjLwIBoo0kdnc+TZ+rOSBVhPO3uURAkaqKNMiFJ+Or01JIeI
         q6W2IxUi+FC9zLzUxHXBHAti7OFrdGfbqucE3+nocYhE7+6JUiq120W4v6KjxxAzrc
         jLOeXMlOx6Kyg==
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



> -----Original Message-----
> From: Guenter Roeck <linux@roeck-us.net>
> Sent: Tuesday, December 08, 2020 9:50 PM
> To: Vadim Pasternak <vadimp@nvidia.com>
> Cc: linux-hwmon@vger.kernel.org
> Subject: Re: [PATCH hwmon-next 1/1] hwmon: (mlxreg-fan) Add support for
> fan drawers capability and present registers
>=20
> On Tue, Dec 08, 2020 at 11:29:31AM +0200, Vadim Pasternak wrote:
> > Add support for fan drawer's capability and present registers in order
> > to set mapping between the fan drawers and tachometers. Some systems
> > are equipped with fan drawers with one tachometer inside. Others with
> > fan drawers with several tachometers inside. Using present register
> > along with tachometer-to-drawer mapping allows to skip reading missed
> > tachometers and expose input for them as zero, instead of exposing
> > fault code returned by hardware.
> >
> > Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> > ---
> >  drivers/hwmon/mlxreg-fan.c | 46
> > +++++++++++++++++++++++++++++++++++++++++++++-
> >  1 file changed, 45 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
> > index ed8d59d4eecb..ab743929a6cd 100644
> > --- a/drivers/hwmon/mlxreg-fan.c
> > +++ b/drivers/hwmon/mlxreg-fan.c
> > @@ -67,11 +67,13 @@
> >   * @connected: indicates if tachometer is connected;
> >   * @reg: register offset;
> >   * @mask: fault mask;
> > + * @prsnt: present register offset;
> >   */
> >  struct mlxreg_fan_tacho {
> >  	bool connected;
> >  	u32 reg;
> >  	u32 mask;
> > +	u32 prsnt;
> >  };
> >
> >  /*
> > @@ -92,6 +94,7 @@ struct mlxreg_fan_pwm {
> >   * @regmap: register map of parent device;
> >   * @tacho: tachometer data;
> >   * @pwm: PWM data;
> > + * @tachos_per_drwr - number of tachometers per drawer;
> >   * @samples: minimum allowed samples per pulse;
> >   * @divider: divider value for tachometer RPM calculation;
> >   * @cooling: cooling device levels;
> > @@ -103,6 +106,7 @@ struct mlxreg_fan {
> >  	struct mlxreg_core_platform_data *pdata;
> >  	struct mlxreg_fan_tacho tacho[MLXREG_FAN_MAX_TACHO];
> >  	struct mlxreg_fan_pwm pwm;
> > +	int tachos_per_drwr;
> >  	int samples;
> >  	int divider;
> >  	u8 cooling_levels[MLXREG_FAN_MAX_STATE + 1]; @@ -123,6 +127,26
> @@
> > mlxreg_fan_read(struct device *dev, enum hwmon_sensor_types type, u32
> attr,
> >  		tacho =3D &fan->tacho[channel];
> >  		switch (attr) {
> >  		case hwmon_fan_input:
> > +			/*
> > +			 * Check FAN presence: FAN related bit in presence
> register is one,
> > +			 * if FAN is not physically connected, zero - otherwise.
> > +			 */
> > +			if (tacho->prsnt) {
> > +				err =3D regmap_read(fan->regmap, tacho->prsnt,
> &regval);
> > +				if (err)
> > +					return err;
> > +
> > +				/*
> > +				 * Map channel to presence bit - drawer can
> be equipped with
> > +				 * one or few FANs, while presence is
> indicated per drawer.
> > +				 */
> > +				if ((BIT(channel / fan->tachos_per_drwr) &
> regval)) {
>=20
> The outer double (( )) is pointless.
>=20
> > +					/* FAN is not connected - return zero
> for FAN speed. */
> > +					*val =3D 0;
> > +					return 0;
> > +				}
>=20
> Assuming fan configuration is static, it might make more sense to disable=
 the
> attribute in the is_visible function instead of checking the presence con=
dition
> over and over again.

This is not static: ' tacho->prsnt' is present register. Presence bit 'n' i=
ndicates if
replaceable FAN drawer{n}  is in or out.
For example, for system, which can be equipped with  6 drawers, presence re=
gister
will be zero in case all of them are inserted, and will dynamically change =
to f.e. to
0x03, in case drawers 1 and 2 are removed.

>=20
> > +			}
> > +
> >  			err =3D regmap_read(fan->regmap, tacho->reg, &regval);
> >  			if (err)
> >  				return err;
> > @@ -388,9 +412,11 @@ static int mlxreg_fan_speed_divider_get(struct
> > mlxreg_fan *fan,  static int mlxreg_fan_config(struct mlxreg_fan *fan,
> >  			     struct mlxreg_core_platform_data *pdata)  {
> > +	int tacho_num =3D 0, regval, regsize, drwr_avail =3D 0, tacho_avail =
=3D 0,
> > +i;
> >  	struct mlxreg_core_data *data =3D pdata->data;
> >  	bool configured =3D false;
> > -	int tacho_num =3D 0, i;
> > +	unsigned long drwrs;
> > +	u32 bit;
> >  	int err;
> >
> >  	fan->samples =3D MLXREG_FAN_TACHO_SAMPLES_PER_PULSE_DEF;
> > @@ -415,7 +441,9 @@ static int mlxreg_fan_config(struct mlxreg_fan
> > *fan,
> >
> >  			fan->tacho[tacho_num].reg =3D data->reg;
> >  			fan->tacho[tacho_num].mask =3D data->mask;
> > +			fan->tacho[tacho_num].prsnt =3D data->reg_prsnt;
> >  			fan->tacho[tacho_num++].connected =3D true;
> > +			tacho_avail++;
> >  		} else if (strnstr(data->label, "pwm", sizeof(data->label))) {
> >  			if (fan->pwm.connected) {
> >  				dev_err(fan->dev, "duplicate pwm entry:
> %s\n", @@ -453,6 +481,22
> > @@ static int mlxreg_fan_config(struct mlxreg_fan *fan,
> >  		}
> >  	}
> >
> > +	if (pdata->capability) {
> > +		/* Obtain the number of FAN drawers, supported by system.
> */
> > +		err =3D regmap_read(fan->regmap, pdata->capability, &regval);
> > +		if (err) {
> > +			dev_err(fan->dev, "Failed to query capability register
> 0x%08x\n",
> > +				pdata->capability);
> > +			return err;
> > +		}
> > +		regsize =3D regmap_get_val_bytes(fan->regmap);
> > +		drwrs =3D regval;
> > +		for_each_set_bit(bit, &drwrs, 8 * regsize)
> > +			drwr_avail++;
>=20
> Why not just hweight_long() or hweight32() ? And what is the point of the
> extra variable ? It is also odd that regval is an int while
> regmap_read() takes a pointer to an unsigned int as parameter. So the
> returned value is converted to int and then to unsigned long.
>=20
> Yes, I understand this only takes bits into account which are reported by
> regmap_get_val_bytes, but regmap_read already takes that into account and
> won't set bits larger than indicated by val_bytes. So all I can see is a =
lot of
> complexity with no gain.

I see. I'll replace four above lines with just:
		drwr_avail =3D hweight32(regval);
>=20
> > +		/* Set the number of tachometers per one drawer. */
> > +		fan->tachos_per_drwr =3D tacho_avail / drwr_avail;
>=20
> What if no bit is set, ie drwr_avail =3D=3D 0 ?
>=20
> Also, what guarantees that tachos_per_drwr is not 0 ?

It can't be zero, otherwise it's wrong configuration in registers.
I will add check for both 'tacho_avail' and 'drwr_avail' for non-zero
and return, something like:

		if (!tacho_avail || !drwr_avail) {
			dev_err(fan->dev, "Configuration is invalid: drawers num %d tachos num %=
d\n",
				drwr_avail, tacho_avail);
			return -EINVAL;
		}
	=09

>=20
> > +	}
> > +
> >  	/* Init cooling levels per PWM state. */
> >  	for (i =3D 0; i < MLXREG_FAN_SPEED_MIN_LEVEL; i++)
> >  		fan->cooling_levels[i] =3D MLXREG_FAN_SPEED_MIN_LEVEL;
> > --
> > 2.11.0
> >
