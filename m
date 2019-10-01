Return-Path: <SRS0=nYzv=X2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 098D8ECE587
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Oct 2019 21:37:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B646B206BB
	for <linux-hwmon@archiver.kernel.org>; Tue,  1 Oct 2019 21:37:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=distech-controls.com header.i=@distech-controls.com header.b="FKIGlFWE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727926AbfJAVhE (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 1 Oct 2019 17:37:04 -0400
Received: from mx0b-002ab301.pphosted.com ([148.163.154.99]:18580 "EHLO
        mx0b-002ab301.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727898AbfJAVhE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 1 Oct 2019 17:37:04 -0400
Received: from pps.filterd (m0118795.ppops.net [127.0.0.1])
        by mx0b-002ab301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id x91LaEiw003255;
        Tue, 1 Oct 2019 17:36:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com; h=from : to :
 cc : subject : date : message-id : references : in-reply-to : content-type
 : content-transfer-encoding : mime-version; s=pps-02182019;
 bh=FCEOEJshPAs32P4HEcqX9NvzX/5GBzmJK5uZPuwny/M=;
 b=FKIGlFWEFdOd2H3lrusGBGV335IkMmOPrxTOhFBTbi0fa3mIljIyG9egJnOfovPglztH
 LJrEkiJIvCgMpK47xBKkMK7jpijLo9HBO8axq6nABU0jpieEtb5gpZ1DAsNR0/rSeq0u
 KhmXqhXq6YHhGKZ7eCfeLboykMZDLg8qYDu7u9vDB4q0leyvOty/e10cxkDr5WfJCeeI
 3XBNLCFqH/EY20VOjLcz+1wZdlq27aZJeYqrkP2VUfIw46y4wTXuEc3FfCCJlW0W+pyS
 n5iBQOeKW+aBv5uRJcT0RuOsgHDr39l6ITJOLQnSyttDpUf5WrS+9h6T4YB0ZGQPww2N vw== 
Received: from nam01-by2-obe.outbound.protection.outlook.com (mail-by2nam01lp2053.outbound.protection.outlook.com [104.47.34.53])
        by mx0b-002ab301.pphosted.com with ESMTP id 2vc9mu0c2g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
        Tue, 01 Oct 2019 17:36:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c8AZsh28Q+Ewhy5YZz/VQ2xxki/zyauoyqQsev2wTF3NWXh6Muui+CLMmUsNHXs3tA6dx5WzqQGAK9QmLkT74BUcar6+5PORfrJnt7iM7Ds0WAjJ2HnR45sSfmWB5+OsaW5xSnA1R1N0WzHrh0Vu4b9LrR7Yy1JfMkqKugRU1se7MXHWplWTMlcvaMunX57HP3KZQetrJ9vskoC0ug19gz/zic5Us/uUfEKBuLHP5ybEFBmYQWXWcw6BdVRkqFYJ4PFGxzIoBF/MfIvyPtaHp5L1MC7OKbsMjij43HiGDC/5K9rzzfv6/6ixsevaQtR7qd9uKxwQSaOFDFF70iPRvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCEOEJshPAs32P4HEcqX9NvzX/5GBzmJK5uZPuwny/M=;
 b=GNCi0+mEKOFgMiFAdlHRP4wcxXQ7igKCV+NaP9+8MvD7dDo/Fe040LZ8G/B1VAG2s5Zw9zNeV+wyb7AmNIWLJCmHdTwufTm4QKFrwPV9xslj7cCM+k7l0Fp8YPzVtH/ObqjdMfORM+6WWFCmyLhXLDlUWw6bkeA+bef1RlttmTvLweIaLZZTA+KYG2kkQcOmYU48otnh2JLd0Aaxi+cmUDhNhF5x3tNhUkurYeOxNCzU9Wc4YtpftT70BZuk2P9RmYlHBmxeRBcaiJ/0OM8ZNlNSEIJHlDYeX9t9SYK+MP7KMuWQ/n5hi2pPsQ0eWL4YIIAEXMRw7qO9tsqyX4z7zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=distech-controls.com; dmarc=pass action=none
 header.from=distech-controls.com; dkim=pass header.d=distech-controls.com;
 arc=none
Received: from BL0PR01MB4835.prod.exchangelabs.com (20.177.147.211) by
 BL0PR01MB4195.prod.exchangelabs.com (10.167.180.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Tue, 1 Oct 2019 21:36:31 +0000
Received: from BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::35e9:e131:c84f:e0a5]) by BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::35e9:e131:c84f:e0a5%3]) with mapi id 15.20.2305.017; Tue, 1 Oct 2019
 21:36:30 +0000
From:   "Tremblay, Eric" <etremblay@distech-controls.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] hwmon: Add driver for Texas Instruments TMP512/513
 sensor chips
Thread-Topic: [PATCH v2 2/2] hwmon: Add driver for Texas Instruments
 TMP512/513 sensor chips
Thread-Index: AdV4gKvqq5zO+PMTRB+ZZ75+ZF+MTgABphwAAAXhvCA=
Date:   Tue, 1 Oct 2019 21:36:30 +0000
Message-ID: <BL0PR01MB483577C3306C3B16A6CB24B4959D0@BL0PR01MB4835.prod.exchangelabs.com>
References: <BL0PR01MB48359694ECBFB5D97A508C10959D0@BL0PR01MB4835.prod.exchangelabs.com>
 <20191001183724.GB23564@roeck-us.net>
In-Reply-To: <20191001183724.GB23564@roeck-us.net>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mib-plugin: true
x-originating-ip: [207.253.3.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7dab1c21-5f9c-4b34-96a8-08d746b76c86
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: BL0PR01MB4195:
x-microsoft-antispam-prvs: <BL0PR01MB4195FA6CDD207E8A7D0B76B6959D0@BL0PR01MB4195.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(346002)(39860400002)(136003)(396003)(376002)(189003)(199004)(66476007)(476003)(74316002)(7696005)(486006)(8676002)(256004)(4326008)(76176011)(26005)(6246003)(102836004)(446003)(7736002)(2906002)(99286004)(186003)(6116002)(3846002)(66946007)(64756008)(71190400001)(81166006)(71200400001)(66066001)(305945005)(6506007)(81156014)(11346002)(76116006)(66446008)(66556008)(8936002)(33656002)(86362001)(229853002)(9686003)(55016002)(5660300002)(6436002)(478600001)(25786009)(6916009)(52536014)(14454004)(316002);DIR:OUT;SFP:1101;SCL:1;SRVR:BL0PR01MB4195;H:BL0PR01MB4835.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: distech-controls.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LlFtpAL6m75FPRdfRsT/4Zp2bCe/k1x4+E/sJaE8qTC9c5vTVWgkKHhw7T4TGl/QK3S0ggJJHUgxokudD4jjvHAXh/clmxbBhqujamivCEYOZ7hLN3dJAwsemdyreXJnPWPEj170mpeeEh9PWF/5D9JSU2tZAWT0QpwrtoqsdyTY0ZVhjzMH/gf2shiOaqiDAW3/Ta6/tm4SV1EGUAptIK5k740XNjZy0eiQUyrwrmJpDsT4KoJF1eTNPPPy15QqQDvvV1418kXLQtlNjOGBXob3YQvtEB9+L9Di6NU+bfEJlr4qYVSUmDyoMMO+aOfki5Xsoq45hV1wiOWsLfonUWArJrDBj6s9ZbKUu9gqo0XFDPpj2kAtIsSM2ZSWvW0BowZCOx7qJXSNCFXDpOEKqo5GHcCie8CUM+h1kQ57OjI=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: distech-controls.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dab1c21-5f9c-4b34-96a8-08d746b76c86
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:36:30.7914
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: caadbe96-024e-4f67-82ec-fb28ff53d16d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yrldJqr/dcxfvSgNN0aBP+JRNNSRsCNL0lkaJwvwqjD1wO0OdPw6G9X02eQj6261ZHCSlDfe3mhgr3IA4kxOIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4195
X-Proofpoint-Processed: True
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 clxscore=1011
 suspectscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1908290000 definitions=main-1910010178
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

> On Tue, Oct 01, 2019 at 05:50:32PM +0000, Tremblay, Eric wrote:
> > hwmon: Add DT bindings for TMP513 driver
> >
> > Signed-off-by: Eric Tremblay <etremblay@distech-controls.com>
> > ---
> >  .../devicetree/bindings/hwmon/tmp513.txt      | 33 +++++++++++++++++++
> >  1 file changed, 33 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/tmp513.txt
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/tmp513.txt
> > b/Documentation/devicetree/bindings/hwmon/tmp513.txt
> > new file mode 100644
> > index 000000000000..0f61793cbf2f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/tmp513.txt
> > @@ -0,0 +1,33 @@
> > +TMP513 system monitor sensor
> > +-------------------------
> > +
> > +Require node properties:
> > +- compatible: one of
> > +		"ti,tmp512"
> > +		"ti,tmp513"
> > +- reg : the I2C address of the device. This is 0x5c, 0x5d, 0x5e, or 0x=
5f.
> > +- shunt-resistor-uohm : The shunt resistor value in uOhm.
> > +
> > +Optional properties:
> > +- bus-voltage-range: 32V or 16V, default to 32V.
> > +- max-expected-current-ma: Maximum expected current value. Default to =
max possible value.
> > +- pga-gain: The gain value for the PGA function. This is 8, 4, 2 or 1.=
 Default to 8.
> > +- temp_2_nfactor: nFactor for remote channel 1. Value according to Tab=
le 11 in datasheet.
> > +- temp_3_nfactor: nFactor for remote channel 2. Value according to Tab=
le 11 in datasheet.
> > +- temp_4_nfactor: nFactor for remote channel 3. Value according to Tab=
le 11 in datasheet,
> > +				  TMP513 only.
> > +- temp_hysteresis: Hystereris for temperature limits.
>=20
> There is a standard sysfs attribute for hysteresis values, and I assume t=
his is one parameter that users might want to change at
> runtime. Why not use it ?

In those sensors, the hysteresis setting is global to all channels. Is it s=
till a standard sysfs attribute in that case ? If yes, should I name it
temp_crit_hyst to show that is a global parameter ?
>=20
> > +
> > +Example:
> > +	tmp513@5c {
> > +		  compatible =3D "ti,tmp513";
> > +		  reg =3D <0x5C>;
> > +		  shunt-resistor-uohm =3D <330>;
> > +		  bus-voltage-range =3D <32>;
> > +		  pga-gain =3D <8>;
> > +		  max-expected-current-ma =3D <100>;
> > +		  temp_2_nfactor =3D <0x01>;
> > +		  temp_3_nfactor =3D <0x02>;
> > +		  temp_4_nfactor =3D <0x03>;
> > +		  temp_hysteresis =3D <5>;
> > +	};
> > --
> > 2.17.1
> >
