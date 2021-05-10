Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,PDS_BAD_THREAD_QP_64,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D41C433ED
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 May 2021 18:29:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B536F613CA
	for <linux-hwmon@archiver.kernel.org>; Mon, 10 May 2021 18:28:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231538AbhEJSaD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 10 May 2021 14:30:03 -0400
Received: from mail-bn8nam11on2049.outbound.protection.outlook.com ([40.107.236.49]:58289
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231815AbhEJSaD (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 May 2021 14:30:03 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DAsA0Enh/ZocPcO+u0k+YkL6zf2aHaADlW9aVweTeXDEfrnTShPB4+v3YX8hHH9iTn/cGEyhpfN3f0O9gvQqBBAmOXjSuCiviwaKOw/Trq9AU0zqVsv8Yk9jdLjPSI32kOtWg5qyFDDPdeCwVevF/t4q4MWzFBdC70qk6uFa/hH8HuYUnD7aFNLwz3mIH/QblZsxYPOmpIolMnmb6PlmveU0nWDXi9OuLeGpI5/AHO/EkSJ0kIcr83NzaTx5KfbMnhFzAn3CQtsAsuMVvsakUQ/3qSWqrMIOJGPLeQz2TAcoRo9pnnDQAo3bMK4S1JH1YC8sEBDA1i00TGxm1s1RCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qml1R7Om3ugAtDPsvNChMQybSn2SRe63v9gT8vmJ2CY=;
 b=OwPFB0iOUuiqx5tMRhwM4KupYcGHQBfhG4qiMNyTDSj7CXYDXz2i0U4i+QCG/99f0lsFAhsDhnsmKPuV7Af8a9BYQ4/r3cIoGET84o3qmv/OnOCAtsmtePwv0vJ3QJwofQuuMmVSYOIZEsuBuvivXOaGmxwrUZXnluwOpRl+V1+7AySbxiaO8suhZ7zwzuUQqme6WPJneonEflnGBjOxu15yRIPjNOQbQmJmhRYG00Nw3ssiK+7gI6DN56n1ijJmfC4j+9q07a8NtwSwjxPFoStIdKKgsk42tXq7kLnxKyn3skPfeC4mPpWc5GNo0ATFuA/Wf06vKqKGWJnYzosUcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qml1R7Om3ugAtDPsvNChMQybSn2SRe63v9gT8vmJ2CY=;
 b=sz3wFII1UWOsNmNO5Y7aVYNA2q+30Ks5DXrSx9CUDbq5qbtW4oeh6kjIp1iLHGL4o6e7aT7vcPJM24YPdxfKtM8+tP4ie2mdsg1CB/hVcfYRNmBRurPOGGrewuY0E20ec4gzhqIf1aTPNwFu0/tFl79SRctUdZoRBQKcwZFHJgT+Ohzh6N1Nz8rfb4MO0Pt6554gDTKv17IO0RujyAJlXie1xKpJWSyVf3HE2wS9rtDSQsAwgRnR7tz2Il2qGUMcaymMDVdBOSfYHpZQAzIZ2bmWbe5K+m0eWPw+W04jHkmNpDHDMqo8dYJMlESTrvpeUswh0fyHJaITgt+Cld2b+w==
Received: from DM6PR12MB3898.namprd12.prod.outlook.com (2603:10b6:5:1c6::18)
 by DM5PR1201MB0233.namprd12.prod.outlook.com (2603:10b6:4:55::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Mon, 10 May
 2021 18:28:56 +0000
Received: from DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::dce6:427d:df17:3974]) by DM6PR12MB3898.namprd12.prod.outlook.com
 ([fe80::dce6:427d:df17:3974%5]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 18:28:56 +0000
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH hwmon-next v6 2/3] hwmon: (pmbus) Add support for MPS
 Multi-phase mp2888 controller
Thread-Topic: [PATCH hwmon-next v6 2/3] hwmon: (pmbus) Add support for MPS
 Multi-phase mp2888 controller
Thread-Index: AQHXQ2Sew5p+Ar8hjkeD0w9U/K+RWKrc8cIAgAAbuTA=
Date:   Mon, 10 May 2021 18:28:56 +0000
Message-ID: <DM6PR12MB3898541A1EBC1B3C2A476E02AF549@DM6PR12MB3898.namprd12.prod.outlook.com>
References: <20210507171421.425817-1-vadimp@nvidia.com>
 <20210507171421.425817-3-vadimp@nvidia.com>
 <20210510164816.GA882936@roeck-us.net>
In-Reply-To: <20210510164816.GA882936@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: roeck-us.net; dkim=none (message not signed)
 header.d=none;roeck-us.net; dmarc=none action=none header.from=nvidia.com;
x-originating-ip: [46.117.116.151]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23385ce8-0a58-4c2a-e1a6-08d913e178df
x-ms-traffictypediagnostic: DM5PR1201MB0233:
x-microsoft-antispam-prvs: <DM5PR1201MB0233102F81597607A5EEA84FAF549@DM5PR1201MB0233.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Q37H5m0wfNya03nD2chrQKc2j8a74B6QpCZLAhNxCxqHSJi73liBgWNzgMFzjIw6nYpSND32SAXsfkwFqPNcjUI1Spxv0uTiXQZVX6D8IibmB3MqHmrSmdqRCswdlt5A+cpAyXytV1d1lDXNzXdtkliaX9j68lYzzt3bkG+8BHk9u+08ZBUhxMkfUTAu+hky5ob/SgSiCzz7qwLNHlqsSOzuoeFHX1PCSFhSpP0DunGaS4kiaij7JMPnO7olHlXzl8F7OM6PWQueGc0ije6mkxcnSDoCT597a/cNumparGozwb5dpy6wQYsUFGsvxnwWezlICKZ0xEPJiJZA4pWTN9kqISMDahkz+XmG7R6tnybr8K3bGnY/9MP3j3gy+sBdN86NQ6n53YhNCLNia3tMjRdGkncNq4SMfLsCa4+xcvkPoWlutub1RT68QOKGkM3V5wXJgdObBKxnlmeKlzM3VmnzxT6h/6dSGhdrQfvemjZ+5eKRLCDyyOrWe7b0jqdd0tmFPNV2CaZ5DlWvvXzY667e6RCNXxY5lTb9gkoZ4phJ06ysbUjmmLg2B9peT9OICFtM4ktz9R/HPfto23BrOjr8qeTpnBNl+WKVmS8wpu0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3898.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(396003)(136003)(39860400002)(376002)(346002)(53546011)(6506007)(38100700002)(66556008)(66476007)(86362001)(7696005)(316002)(4326008)(66946007)(76116006)(122000001)(9686003)(55016002)(52536014)(6916009)(5660300002)(66446008)(64756008)(8936002)(71200400001)(26005)(8676002)(2906002)(54906003)(186003)(33656002)(83380400001)(478600001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?XK6b0sjwqKye4xwAgm8jFuxpMvQnNbyZv9ei/6QkLlmNON9w4UOT2WtHBZ51?=
 =?us-ascii?Q?EhVOb/urCJtPmV/2Ez8xvJpw68rqncOykZuyfrDonTQZCchUazChC4AjFr9O?=
 =?us-ascii?Q?0KwmDNFwA0lByPelzDavntb069IUMX3Axa8j+Ouyo+c0/huFRsJBU2RWS3Q3?=
 =?us-ascii?Q?tJxnjvOY1K0y1drf8M/A6IHDx6q2yPLZdAyqdjvHN8NJFZfr2MXfPFgvYXlZ?=
 =?us-ascii?Q?sfJXIiglzshy2Q4QDwjAG3734tTEOkwV1U9rFCgbio9CWh/70mypMG6tRZDj?=
 =?us-ascii?Q?YYuuR5Y3baDMAH2h4C/kZyVHhp/C5zIvVuTDnVewCN7xewVDVRzULv2OHZeY?=
 =?us-ascii?Q?ZgJ+4/Pri8fKzA6u2AKccgHiIW2PO83BkV74LqNnlx6N2GWStpN6AJPDNNNW?=
 =?us-ascii?Q?GPdpWIA1HchmJoIATL18Grfb/NWCzU1O//NS6pWOv0PUzQneA8H3DOiemhS0?=
 =?us-ascii?Q?bL6jXgphtfLhBwXWhZgzYnAOIC09mz8WQHzovUNRuASJi6sdaimDS3bgaH5s?=
 =?us-ascii?Q?RUlSOR5UHobsAH2/kzvRGbP+xS+67/LVFfEwU62Bq1L97wGu05HoJqfSd//7?=
 =?us-ascii?Q?6yGIP22AWOTUlaSKs6y4WR/rQL7Ji36AEhtrhHDxOn1eUEGX1tOwwMhLpT3s?=
 =?us-ascii?Q?O+RcOHS+2KYJyZsnFtypHn0etRGQfREg+I//PWPJxUexUQ6afLSybHzJmB2u?=
 =?us-ascii?Q?9JSIbze8XMuUtmNRYS3WKZ8B6mAe/tvhoCiC6jgPdKDarC3SKxRpEyQAnozW?=
 =?us-ascii?Q?kIK5l1uOGaokfbc8NrK/nvqFn7kUB2jiGnW1Jrg7RlRqIrzoVe9BFBHvNCJQ?=
 =?us-ascii?Q?JeANMlcJZT8l3Rr0XE7XfMSXEzfA2Bywniy/kCa+ZEQ8mKEvsXGYYzXOr/76?=
 =?us-ascii?Q?WuGlRbSA3UjZMl+Fr4rnvZaFLpGvGllXP3PZFe8f5ft+w7HwAuD3dDf5lGjE?=
 =?us-ascii?Q?3mthbSsfHYKH0JUzpiUzeWlmkBt2xzwlN4bXzllfKm+qLDC4FJi1EfBnP8md?=
 =?us-ascii?Q?GtOAG3v5cR+z3uJLR7D7Ij93w57tmJFUYX5pllqPk1GmpeRDg0TrqBHuUMqQ?=
 =?us-ascii?Q?2n1iXT+4qjjt5+mbQkCy7o4m5vf1OmJonic6Hs31HiGXOPRtEF/GPDM+uk8Q?=
 =?us-ascii?Q?fdcorFWFLXSx7oIhTR5E0/ldvxl97rAXTZC/pgusF+1BPW7RUZFiv47Vsr4h?=
 =?us-ascii?Q?kRUv0aK7fUFxKdSXBxL9P9zC9sQFtclFy6KkPsB4nwK/emE4arIdG9ecfIuS?=
 =?us-ascii?Q?LC0Y326AL5BfHLUrVrDdZZudKbUGdSxnjYN9RqHNFX3sqsCdGIvB9th/znOo?=
 =?us-ascii?Q?m61ftPjVGodGQFIO5QUFbJeN?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3898.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23385ce8-0a58-4c2a-e1a6-08d913e178df
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 May 2021 18:28:56.4364
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OpdqgcYjcjGh6Eth5nLXSVR1OCR9YrrTsTAsX1MDbhgzK+UU+5/NXeOsxfOR+ypEEP2IO1Z2u9fJ2k20XNxUgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0233
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org



> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Monday, May 10, 2021 7:48 PM
> To: Vadim Pasternak <vadimp@nvidia.com>
> Cc: robh+dt@kernel.org; linux-hwmon@vger.kernel.org;
> devicetree@vger.kernel.org
> Subject: Re: [PATCH hwmon-next v6 2/3] hwmon: (pmbus) Add support for
> MPS Multi-phase mp2888 controller
>=20
> On Fri, May 07, 2021 at 08:14:20PM +0300, Vadim Pasternak wrote:
> > Add support for mp2888 device from Monolithic Power Systems, Inc.
> > (MPS) vendor. This is a digital, multi-phase, pulse-width modulation
> > controller.
> >
> > This device supports:
> > - One power rail.
> > - Programmable Multi-Phase up to 10 Phases.
> > - PWM-VID Interface
> > - One pages 0 for telemetry.
> > - Programmable pins for PMBus Address.
> > - Built-In EEPROM to Store Custom Configurations.
> > - Can configured VOUT readout in direct or VID format and allows
> >   setting of different formats on rails 1 and 2. For VID the following
> >   protocols are available: VR13 mode with 5-mV DAC; VR13 mode with
> >   10-mV DAC, IMVP9 mode with 5-mV DAC.
> >
> > Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> > ---
> > v5->v6
> >  Comments pointed out by Guenter:
> >  - Fix comments for limits in mp2888_read_word_data().
> >  - Remove unnecessary typecasts from mp2888_write_word_data().
> >
> > v4->v5
> >  Comments pointed out by Guenter:
> >  - Fix calculation of PMBUS_READ_VIN.
> >  - Add mp2888_write_word_data() for limits setting.
> >  - Treat PMBUS_POUT_OP_WARN_LIMIT in separate case.
> >  - Drop tuning of "m[PSC_POWER]" and "m[PSC_CURRENT_OUT]" from
> probing
> >    routine.
> >  Fixes from Vadim:
> >  - Treat PMBUS_IOUT_OC_WARN_LIMIT in separate case.
> >
> > v3->v4
> >  Comments pointed out by Guenter:
> >   - Fix PMBUS_READ_VIN and limits calculations.
> >   - Add comment for PMBUS_OT_WARN_LIMIT scaling.
> >   - Fix PMBUS_READ_IOUT, PMBUS_READ_POUT, PMBUS_READ_PIN
> calculations.
> >   - Enable PMBUS_IOUT_OC_WARN_LIMIT and
> PMBUS_POUT_OP_WARN_LIMIT.
> >  Fixes from Vadim:
> >   - Disable PMBUS_POUT_MAX. Device uses this register for different
> >     purpose.
> >   - Disable PMBUS_MFR_VOU_MIN. Device doe not implement this
> register.
> >   - Update documentation file.
> >
> > v2->v3
> >  Comments pointed out by Guenter:
> >  - Fix precision for PMBUS_READ_VIN (it requires adding scale for
> >    PMBUS_VIN_OV_FAULT_LIMIT and PMBUS_VIN_UV_WARN_LIMIT.
> >  - Fix precision for PMBUS_READ_TEMPERATURE_1 (it requires adding
> >    scale for PMBUS_OT_WARN_LIMIT).
> >  - Use DIV_ROUND_CLOSEST_ULL for scaling PMBUS_READ_POUT,
> >    PMBUS_READ_PIN readouts.
> >  Notes and fixes from Vadim:
> >   - READ_IOUT in linear11 does not give write calculation (tested with
> >     external load), while in direct format readouts are correct.
> >   - Disable non-configured phases in mp2888_identify_multiphase().
> >
> > v1->v2:
> >  Comments pointed out by Guenter:
> >   - Use standard access for getting PMBUS_OT_WARN_LIMIT,
> >     PMBUS_VIN_OV_FAULT_LIMIT, PMBUS_VIN_UV_WARN_LIMIT.
> >   - Use linear11 conversion for PMBUS_READ_VIN, PMBUS_READ_POUT,
> >     PMBUS_READ_PIN, PMBUS_READ_TEMPERATURE_1 and adjust
> coefficients.
> >   - Add reading phases current from the dedicated registers.
> >   - Add comment for not implemented or implemented not according to the
> > 	spec registers, for which "ENXIO" code is returned.
> >   - Set PMBUS_HAVE_IOUT" statically.
> >   Notes from Vadim:
> >   - READ_IOUT uses direct format, so I did not adjust it like the below
> >     registers.
> > ---
>=20
> [ ... ]
>=20
> > +
> > +static int mp2888_write_word_data(struct i2c_client *client, int
> > +page, int reg, u16 word) {
> > +	const struct pmbus_driver_info *info =3D
> pmbus_get_driver_info(client);
> > +	struct mp2888_data *data =3D to_mp2888_data(info);
> > +
> > +	switch (reg) {
> > +	case PMBUS_OT_WARN_LIMIT:
> > +		word =3D DIV_ROUND_CLOSEST((int)word,
> MP2888_TEMP_UNIT);
>=20
> Sorry if I am missing something, but why those typecasts here and below ?

I forgot to remove it. Sorry.

>=20
> > +		/* Drop unused bits 15:8. */
> > +		word =3D clamp_val(word, 0, GENMASK(7, 0));
> > +		break;
> > +	case PMBUS_IOUT_OC_WARN_LIMIT:
> > +		/* Fix limit according to total curent resolution. */
> > +		word =3D data->total_curr_resolution ?
> DIV_ROUND_CLOSEST((int)word, 8) :
> > +		       DIV_ROUND_CLOSEST((int)word, 4);
> > +		/* Drop unused bits 15:10. */
> > +		word =3D clamp_val(word, 0, GENMASK(9, 0));
> > +		break;
> > +	case PMBUS_POUT_OP_WARN_LIMIT:
> > +		/* Fix limit according to total curent resolution. */
> > +		word =3D data->total_curr_resolution ?
> DIV_ROUND_CLOSEST((int)word, 4) :
> > +		       DIV_ROUND_CLOSEST((int)word, 2);
> > +		/* Drop unused bits 15:10. */
> > +		word =3D clamp_val(word, 0, GENMASK(9, 0));
> > +		break;
> > +	default:
> > +		return -ENODATA;
> > +	}
> > +	return pmbus_write_word_data(client, page, reg, word); }
> > +
> > +static int
> > +mp2888_identify_multiphase(struct i2c_client *client, struct mp2888_da=
ta
> *data,
> > +			   struct pmbus_driver_info *info) {
> > +	int i, ret;
> > +
> > +	ret =3D i2c_smbus_write_byte_data(client, PMBUS_PAGE, 0);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	/* Identify multiphase number - could be from 1 to 10. */
> > +	ret =3D i2c_smbus_read_word_data(client,
> MP2888_MFR_VR_CONFIG1);
> > +	if (ret <=3D 0)
> > +		return ret;
> > +
> > +	info->phases[0] =3D ret & GENMASK(3, 0);
> > +
> > +	/*
> > +	 * The device provides a total of 10 PWM pins, and can be configured
> to different phase
> > +	 * count applications for rail.
> > +	 */
> > +	if (info->phases[0] > MP2888_MAX_PHASE)
> > +		return -EINVAL;
> > +
> > +	/* Disable non-configured phases. */
> > +	for (i =3D info->phases[0]; i < MP2888_MAX_PHASE; i++)
> > +		info->pfunc[i] =3D 0;
>=20
> Not that it matters much, but this is unnecessary since the pmbus core wo=
n't
> look at phase data beyond info->phases[].

I see. So I'll drop these two lines.

>=20
> Guenter
