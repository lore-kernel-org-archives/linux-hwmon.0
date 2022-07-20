Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13586C433EF
	for <linux-hwmon@archiver.kernel.org>; Wed, 20 Jul 2022 10:08:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231247AbiGTKI6 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 20 Jul 2022 06:08:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiGTKI5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 20 Jul 2022 06:08:57 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AD905E318
        for <linux-hwmon@vger.kernel.org>; Wed, 20 Jul 2022 03:08:56 -0700 (PDT)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26K7MlGr024891;
        Wed, 20 Jul 2022 06:08:40 -0400
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3hbt85sx46-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 20 Jul 2022 06:08:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pael+3l0aHP5VKT8F9cCFnieXXJyycTwbQnFXpVicKw5So2QwmF54VYVtKdRl4tqba8EkjAXIdzJc8Ap5kisD/Z8xDRJeDPk7eQdSXkXLiZ1+Q6UWujxB8VoxqRmF37yqEuZM+zIERyLv9NBEBDBpVUBRTlSj1ghKwuTrb6ouZgnLXxHs8wUnd0Ixs69yFZExAWq8qNOAb8iUA85YMtAXQrT+v7bmTLFY7+PBPnUeVzQmLyBo+er7EtG4Il8NKcVNPKEYFNN0qDRsNE6bv2aIPMnvfKdqg4VNOGf7pFfepAgDZno1vqxxpJlzVGqHR5JeOurcZqCkP8sVhOFIUb+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NbEp6WL+XRjRTZlnOjBeYA98ZZfSu2gwTf41eaVNtpQ=;
 b=dHtNQyETYWTTXkI+/l60v2zhykgxR1u5BdCgycMXBkCKSbxs3r4UdVniRGYuvxB2ade7/inthXaz647Yi/0ZZJL3sYW+KgFDxuhMquSNW6bZL+okzNwWHNjUe28xpxwBHYe4k1R0p768ePYB7X9LjzqQFs7TAQfwB6k6BVbyGmMSvQL4yqo0e1r92RH7TbALF/ljKi5DA17+9Ymm49q6wecRDhLYFRvIr2CU20+Qzf79Wtet5gQcFzOTx1fizMOTXkq0cUW2fo2MVAoIXFbFPqn2w9cAGoQduhmcIkF6JvJ1oLqgCbXGMJ7SdJjILDjpbxkt4Yni78Aml2a2wwwpqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NbEp6WL+XRjRTZlnOjBeYA98ZZfSu2gwTf41eaVNtpQ=;
 b=ZpGYM9O5sLod8vC+pA4WdJmT3QkC6v5j6aDmzlpWYBpgOGf/+eFBLC7MuSnkji9N3QXeoMOahq/JlsP0lwO9QEJGzjNnw3+hV88vX4HdzGY/odMleUV29MB3ZuVoNBST2Y4k89EXfQ+OcYxlPvc86NjAhFhw4RzBcKKyv/3MLXA=
Received: from DM8PR03MB6247.namprd03.prod.outlook.com (2603:10b6:8:3b::6) by
 CO1PR03MB5716.namprd03.prod.outlook.com (2603:10b6:303:94::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5458.18; Wed, 20 Jul 2022 10:08:38 +0000
Received: from DM8PR03MB6247.namprd03.prod.outlook.com
 ([fe80::5d2e:802d:c6d0:1a09]) by DM8PR03MB6247.namprd03.prod.outlook.com
 ([fe80::5d2e:802d:c6d0:1a09%7]) with mapi id 15.20.5438.023; Wed, 20 Jul 2022
 10:08:37 +0000
From:   "Tilki, Ibrahim" <Ibrahim.Tilki@analog.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "jdelvare@suse.com" <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "Bolucu, Nurettin" <Nurettin.Bolucu@analog.com>
Subject: RE: [PATCH] drivers: hwmon: Add max31760 fan speed controller driver
Thread-Topic: [PATCH] drivers: hwmon: Add max31760 fan speed controller driver
Thread-Index: AQHYj8ApjsJ/3UaueEWKC30ni3sH1q1/zrGAgAYX4lA=
Date:   Wed, 20 Jul 2022 10:08:32 +0000
Deferred-Delivery: Tue, 19 Jul 2022 15:39:19 +0000
Message-ID: <DM8PR03MB624710E4039F7C6212320363968E9@DM8PR03MB6247.namprd03.prod.outlook.com>
References: <20220704160606.52-1-Ibrahim.Tilki@analog.com>
 <20220715181709.GA3775212@roeck-us.net>
In-Reply-To: <20220715181709.GA3775212@roeck-us.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 675ef5a6-a59c-424f-0147-08da6a37cff7
x-ms-traffictypediagnostic: CO1PR03MB5716:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iH9oOjOIIUmrvKkaURbsOfQgHBXPZUJUk9HVGHIvC1yD/m4MSVOdw8o5BS/E+oqL/Z0SnARVGj2NC+UkcpX5bVgUSdreGHrXTEUrS1GRM8yT35NpAUAqdE8lTA2kS9D1Fpac6OPElRb5OA1NrlR9KjgHdik0IwoPKa5Cont21uPiHz2q7WEB4wPACMpzyolK6yfhsHZZXkja20+gWRY00gKhDPA6RDHroo+fAivSMFD9KuUBjp8SFdEDkf1P4H0yUSkhwvqOmiD+NZsYVlUcscwq/HqsTUOevWIN8xD81UYYOSRJZt7UrmfiU8RIClCQ/Se777cbdqhVFGNdxpDhboYybnaSX7Rz/eNlbpFsGzkUdx/mTaqbhLSekPqMRtkAWwnKtSDTe5sbInXhf+xTtAQMIC3akXw7XQs5GQDkZLpB5W2AmItHw6yHYGwVJd3li70oyI/Om86qF0uSzS5NIqToHSwOaQvYkCizXeccDwJ0JCR8sxFRA8yavfAfYDpLLjw/dME23cbZmUEqz0d8jQAVdoc+7jSl0msN/En8rjV+MCWMgO95rfRCKZPIyNDYlcdbap+AapPK+xz9qrDsestDnLXEEtukRmkv0XJJEhJCr9Bd74OSexitEKWYjiiGzXpQq4AKkxBBExk3egS4BYfQVVERWiV4nSXypnrEBiLLDlrK7TkI9fNAiD0uejet36eNUGyuIWcT7rzYdIM4OhTtuSqXSaQRu7FcLH/SONbapJIiR8TiQuN6GWo99adMxwiD9LFpqo+DYSf7zZA++WbtvtQWl+UdDxuW5FogInUkYrhw2CKiWLczpK44fhFnZsab9mn0e4EKg/hodasCCg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6247.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(376002)(346002)(396003)(39860400002)(366004)(316002)(6916009)(107886003)(186003)(54906003)(33656002)(66946007)(83380400001)(6506007)(4326008)(76116006)(8676002)(64756008)(66446008)(66476007)(66556008)(7696005)(9686003)(55016003)(26005)(478600001)(38070700005)(6666004)(2906002)(41300700001)(71200400001)(52536014)(86362001)(122000001)(38100700002)(966005)(8936002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Wz7gXq4We/P/L/JjJMuCmEquhaIsqgF8axRncmmUBCPXnwbkr21hwH5DQ4d1?=
 =?us-ascii?Q?8Y12AxE1OlaI5jEkOXd2KdyeKKrvdyWO1y1di5PhZq5aZXEqkM33IvMzdjtM?=
 =?us-ascii?Q?eMDBuqers2vJ3lOIFamtgFg2Z1xeS6EGHQ6yIlxjRLU9oAvzWS5xIhKRYgKY?=
 =?us-ascii?Q?WJwU8+vjJuEwJcjQCHxWpTTvEFpSBDhNRr861OHg351Gza+A9dLDM2TOV5MK?=
 =?us-ascii?Q?UFos2YWT09uacGliR3x86/XQ34x86qiPo1C6sK50c04DspJifUzuWKKf7wtR?=
 =?us-ascii?Q?vtsHvKI8NxyIrJAUWXc78nFTvIdpC56thmRz0Vw2+vkO6Oye8jQMtkBrvXay?=
 =?us-ascii?Q?15CCCQ7mRcZTFRBH042oWFhy88J2O/NwpdtfnLbY1m7dWDR0FPrBGqrkVAH6?=
 =?us-ascii?Q?fBX8tiwvBOMVri9XksSS5P3nBFf0gjJw+CEOjU+A9xbP8nSNC6Ifl5NTvOXq?=
 =?us-ascii?Q?t76EkXRWao2Uvj9N0T4FpruRFklHh2+uqVp7EC2iMwHPtL3mNW33wTVzTSBu?=
 =?us-ascii?Q?x1SlCasJzhB4AHGkLWPafyZJKOM7UudECKdJ3FoLofup7CggnOnrGERZ5y0E?=
 =?us-ascii?Q?6ktP0Ne/TnRt6OpR3h1eQssoA5UTu1e8s+rtLFxYTEjn9coY3KFtfEemdxuH?=
 =?us-ascii?Q?26FWa6VDkvEuME4WegM6kzVFK7x1eDYs46oVbxS9/A51tBiUwpuGmAUFvLFq?=
 =?us-ascii?Q?i8NvGyL3OaP/uIivHIqLFuv1nr11kfzqH63E3jYuDG2vPiEnz/um84lkMy2g?=
 =?us-ascii?Q?d1BbS2lauq9eY+MIerFV1WvsRq3+Mz29LxHftHj/6UArxN/qOOu2JzsS5eS6?=
 =?us-ascii?Q?RJOffrCJf3cd/20ftg+L67sGXg+Y6jUyV7fl+hJ7wjCMzPMYOqxIULYL3ZxO?=
 =?us-ascii?Q?F+6/ImXcahKIGDvkFyudJReOe20wzVZIt/NuznJIm9A53cLSj42HfLYkll3R?=
 =?us-ascii?Q?GDHCWYF++xgbVrRiEO45ZuTLIkXf8/wpnrbBADmMHAnR4Py4JeOxEdrj1vuH?=
 =?us-ascii?Q?/z5sxHOq8BqLv6SCnuQ/b0rnYTF7c6+6fJlMdUJQTRQFkfAkceyTTbzmpDmA?=
 =?us-ascii?Q?BgQwmSVBqLf6G35OS+i6EZyfwDmrwQPZSMXG14mro8OKpMOybYaGTLLOB8aW?=
 =?us-ascii?Q?jOz0sDj71QvFpxzQHMRym3rDAkOzUIUllykDgqcQgeU/DXoahX4wRlNf4/MJ?=
 =?us-ascii?Q?EkgcKl7Q7oBQp7wY8/95EMcKnP6l5/36CrE9QnZanBPxyxM05BCZd63r9PkD?=
 =?us-ascii?Q?SiHUcxtjfa5/F9VT/lLUfFv8/MwJZw82hIQ2CwK0rZlJDrt+OVeL1WCZNDdE?=
 =?us-ascii?Q?GGOhh/q2Egehii04tQd1IOirpYsHGWQOtPTrYXOe9V9fjFVntQc85lbP8oWh?=
 =?us-ascii?Q?zPhLzoHR2GrwBp/WwNY3UNvegBRUmbeXHzy3VX5gzypYy47M9NpSjSceHyuk?=
 =?us-ascii?Q?Nf7YWfdBVCD4uS5vcw6RHKbciYqgJ1fltLc+qcS56Nf9YuYQu74TTXd1w+ig?=
 =?us-ascii?Q?vwMW83PvUj+tBes9qyAVTpFhuLHxJD6vMUxOgl3BM8f9KtK4NXZksyY1Z5iy?=
 =?us-ascii?Q?wfY76V9deBLH0yHzD+NNvYx+eUIveNoDOQtlp9hO?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6247.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 675ef5a6-a59c-424f-0147-08da6a37cff7
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2022 10:08:37.1007
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vb4SeNodCbPFUdPKLJEaq9+98F3tr0oTem6rltXC5pNTk1HjXhmRu2RiFUmV6kI1k4xQ8yLsjI8iyE+VQY9/tn1UX9GsXk93nq2vhrsGimY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5716
X-Proofpoint-ORIG-GUID: 9pHEfXyZf10Rip-vWKqlFvk2BuK5VZkk
X-Proofpoint-GUID: 9pHEfXyZf10Rip-vWKqlFvk2BuK5VZkk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-20_05,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 mlxlogscore=367 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207200042
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

> On Mon, Jul 04, 2022 at 04:06:05PM +0000, Ibrahim Tilki wrote:
> > MAX31760 is a presicion fan speed controller with nonvolatile lookup ta=
ble.
> > Device has one internal and one external temperature sensor support.
> > Controls two fans and measures their speeds.
> > Generates hardware alerts when programmable max and critical temperatur=
es are exceeded.
> >=20
> > Driver creates following sysfs attributes for configuring lookup table:
> > pwm1_auto_point[1-48]_{pwm,temp,temp_hyst}
> >=20
> > Signed-off-by: Ibrahim Tilki <Ibrahim.Tilki@analog.com>
> > Reviewed-by: Nurettin Bolucu <Nurettin.Bolucu@analog.com>
> > ---
> >  drivers/hwmon/Kconfig    |  10 +
> >  drivers/hwmon/Makefile   |   1 +
> >  drivers/hwmon/max31760.c | 614=20
> > +++++++++++++++++++++++++++++++++++++++
>=20
> Please add doucmentation describing the supported sysfs attributes.
>=20

Driver does not create a sysfs attribute other than the standard sysfs attr=
ibutes defined here:
https://www.kernel.org/doc/Documentation/hwmon/sysfs-interface

Should I still add documentation?

> >  3 files changed, 625 insertions(+)
> >  create mode 100644 drivers/hwmon/max31760.c
> >=20
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig index=20
> > 590d3d550..59cc44a5c 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig

...

> > +	case hwmon_pwm:
> > +		switch (attr) {
> > +		case hwmon_pwm_input:
> > +			if (val < 0 || val > 255)
> > +				return -EINVAL;
> > +
> > +			return regmap_write(state->regmap, REG_PWMR, val);
> > +		case hwmon_pwm_enable:
> > +			if (val =3D=3D 0)
> > +				return -EOPNOTSUPP;
> > +
> > +			if (val =3D=3D 1)
> > +				return regmap_set_bits(state->regmap, REG_CR2, CR2_DFC);
> > +
>=20
> Accepting all other values ?
>=20

Standard sysfs documentation defines pwm_enable as follows:
  - 0: no fan speed control (i.e. fan at full speed)
  - 1: manual fan speed control enabled (using pwm[1-*])
  - 2+: automatic fan speed control enabled

So I assumed I should accept all other values as automatic fan speed contro=
l.
If that is not the case, what is the correct way to handle this attribute?

> > +			return regmap_clear_bits(state->regmap, REG_CR2, CR2_DFC);
> > +		case hwmon_pwm_freq:
> > +			pwm_index =3D find_closest(val, max31760_pwm_freq,
> > +						 ARRAY_SIZE(max31760_pwm_freq));
> > +
> > +			return regmap_update_bits(state->regmap,
> > +						  REG_CR1, CR1_DRV,
> > +						  FIELD_PREP(CR1_DRV, pwm_index));

...



