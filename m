Return-Path: <SRS0=vS6D=ZE=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED070C43331
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Nov 2019 15:03:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AD44121A49
	for <linux-hwmon@archiver.kernel.org>; Tue, 12 Nov 2019 15:03:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=distech-controls.com header.i=@distech-controls.com header.b="RO+ORDMQ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727097AbfKLPDJ (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 12 Nov 2019 10:03:09 -0500
Received: from mx0a-002ab301.pphosted.com ([148.163.150.161]:49146 "EHLO
        mx0a-002ab301.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726981AbfKLPDJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 12 Nov 2019 10:03:09 -0500
Received: from pps.filterd (m0118790.ppops.net [127.0.0.1])
        by mx0a-002ab301.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xACEjSKI019901;
        Tue, 12 Nov 2019 10:01:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=distech-controls.com; h=from : to :
 cc : subject : date : message-id : references : in-reply-to : content-type
 : content-transfer-encoding : mime-version; s=pps-02182019;
 bh=MpmYh0mghqTbnm0vF83qL1K1KYBDcXpHQwM0k+CBEAY=;
 b=RO+ORDMQYTn2sUQJZauD3n1iB38ok3VyCGyvfmdn6n7kJT4YEdqkTAWnL5/EsVnxWjLo
 +SZ4+Rbek0jgpKQ+60exKKs5jZzC3LmElGi0k5FeDf57CwagaxErQg7A2oyO+ns01H93
 UygFr9DrrmFMs0NhPRZJdN79HWKZXx+NVHPAgD5iZFuyu/sacpgjGByA+ZLvz16a7sNK
 lYfvPeFXRsi2jOUPXL00G9rNwISevgyG3s7yHvFKVyeUm3pOm6DisIs73l1lIWDc+PgA
 49YHlPJ7hOMnLfx4UtJ0ddKhHTAuMMHFgwc/yY51DZUCSrEgLxlxkGfuitqnR6uemFK9 uA== 
Received: from nam05-co1-obe.outbound.protection.outlook.com (mail-co1nam05lp2050.outbound.protection.outlook.com [104.47.48.50])
        by mx0a-002ab301.pphosted.com with ESMTP id 2w7cv49052-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Nov 2019 10:01:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G6LdZDFVy3Ttbr6OYWX88Cn8dqoGLsxdqvmyeod5G5k/lJt5ZcC4J0Et7MYFo1M3RxMm1RCpyY+lCcVaxtE/bhF9WFbPI8iVxpsCXpRthE2uMbsSPvx+Yi2ldzATgHZel6hONXR38lfetzXyzWaAbhld9efn5zf8Itpvl68sQE8g2QzDomAMX1hkz5SbSpcvzC27mOYh7Z8UF417ZWeW5vKHAv7ayu4OKxPqTg1gOtrsuQhy/hwQw3NJOZOQFn+0T0wZuDPHxSJlrrVCR0F1IUyV6/Jn/QhjyUJmCCfvQguoIjW+r0ixSgeW9jWJ1pKZAm21z+l/c6cXoj1EOu8sAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MpmYh0mghqTbnm0vF83qL1K1KYBDcXpHQwM0k+CBEAY=;
 b=ak+zwrWRmVvYGhUUV4p11ItwKkt4SGir1+ywM41BZ6BP3UOEzwgVqb7stTsFgm4LakuQZEYp9fzzkczV7HMtM7pXBFsgv3UCcVe0TpAH4ZGEZ1e6OphrTFeCQpWmd188Pjuge5lwgS2nPWP3hKWgKRr4FD+3xlj5a5EJBGNxycRheKMTNBYOt4ZFNicsQsS3ilYtK+ItI3kcrTiPjSkyVDY7TvGje8QIOFe0i3DwIar9oEqq6lOPtxWIIKTaS64QsoMNSSpz3cq5UajZpwTNyiwHB8D75ZPczM8o5VQ32aMEYCgq1Spm/Uk/nbpQkyAZa20s3BFJJdGL4x/vPeBMuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=distech-controls.com; dmarc=pass action=none
 header.from=distech-controls.com; dkim=pass header.d=distech-controls.com;
 arc=none
Received: from BL0PR01MB4835.prod.exchangelabs.com (20.177.147.211) by
 BL0PR01MB4083.prod.exchangelabs.com (10.167.179.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Tue, 12 Nov 2019 15:01:11 +0000
Received: from BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::b00e:eb7:d585:5086]) by BL0PR01MB4835.prod.exchangelabs.com
 ([fe80::b00e:eb7:d585:5086%6]) with mapi id 15.20.2430.027; Tue, 12 Nov 2019
 15:01:11 +0000
From:   "Tremblay, Eric" <etremblay@distech-controls.com>
To:     Rob Herring <robh@kernel.org>
CC:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "corbet@lwn.net" <corbet@lwn.net>
Subject: RE: [PATCH v7 1/2] dt-bindings: hwmon: Add TMP512/513
Thread-Topic: [PATCH v7 1/2] dt-bindings: hwmon: Add TMP512/513
Thread-Index: AQHVmM+QVZuvH6alYkaCtrsGmFXw6KeGuHGAgADoaYA=
Date:   Tue, 12 Nov 2019 15:01:11 +0000
Message-ID: <BL0PR01MB4835CDB5E9693A06F10012EF95770@BL0PR01MB4835.prod.exchangelabs.com>
References: <20191111203445.27130-1-etremblay@distech-controls.com>
 <20191111203445.27130-2-etremblay@distech-controls.com>
 <20191112010345.GA19664@bogus>
In-Reply-To: <20191112010345.GA19664@bogus>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mib-plugin: true
x-originating-ip: [207.253.3.19]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 5aa6a1c0-cfa5-44ef-a296-08d7678127d7
x-ms-traffictypediagnostic: BL0PR01MB4083:
x-ms-exchange-purlcount: 3
x-microsoft-antispam-prvs: <BL0PR01MB408350B45BD85641135F991095770@BL0PR01MB4083.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:1388;
x-forefront-prvs: 021975AE46
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(396003)(39860400002)(366004)(376002)(346002)(199004)(189003)(4326008)(6436002)(54906003)(9686003)(186003)(6916009)(53546011)(6246003)(102836004)(6506007)(478600001)(99286004)(446003)(7736002)(966005)(229853002)(26005)(11346002)(476003)(486006)(305945005)(74316002)(316002)(76176011)(55016002)(25786009)(86362001)(6306002)(14454004)(66946007)(256004)(33656002)(52536014)(7696005)(8936002)(76116006)(2906002)(66556008)(6116002)(5660300002)(14444005)(66066001)(3846002)(71190400001)(71200400001)(8676002)(81166006)(81156014)(66446008)(64756008)(66476007);DIR:OUT;SFP:1101;SCL:1;SRVR:BL0PR01MB4083;H:BL0PR01MB4835.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:3;
received-spf: None (protection.outlook.com: distech-controls.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 07nLd2y2+9CPi6wi5AO7PYkrc+UI2/P1qorBRZDZ+XxxQ/Wpo7y1SfJCuw80J/Fo63ONoJlnGg/nBK/+ZhJrX/xol0cfpfv+OYXgSA54PL4wjmw4IOl+vzAUFtrjbcBPEkN/7OnzEWio2w0akEZLeLgP10GAYVbenqd0CR27Ai7Rp7b1LQ5mGJl/CmMmzN6BCMoxXdR+tOx3KOIruWDfmD8eJBMdwA30nRwA+uxi8l7a8FEhqpwNsoIRp5f9QSRwykTQHwo9pEV5fxOBOz9HwvEYjH4mpWZqYXnceZ5N44ty4avIKtv9Oz+7UQiFfxPWxKrscg0rt75U5UJ/GFu4yzSDqaHiBZdJcymwcb9NdJKtfKolSNKYQfJFY9I+hD5J+iraTEzD+2Hf70Zwr986RXKV6JpNKEShcIUVMN1tnwxxYdRPH8col4eHRRSndQmE1ZeNYqRg9HezIix4Brpf6KK4zy7NLJO4SJ79BlgpPXk=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: distech-controls.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa6a1c0-cfa5-44ef-a296-08d7678127d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2019 15:01:11.1860
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: caadbe96-024e-4f67-82ec-fb28ff53d16d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FRJAabqyUd8WeUYgkx4HAeqLEwy5Vt35AYSTTmPv/moWKYPwSxJg4qOmKbBd/CCFgSef4JW2qza2ht+SFRBiNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR01MB4083
X-Proofpoint-Processed: True
X-Proofpoint-Spam-Details: rule=outbound_spam_notspam policy=outbound_spam score=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911120132
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

> From: Rob Herring <robh@kernel.org>
> Sent: Monday, November 11, 2019 8:04 PM
> To: Tremblay, Eric <etremblay@distech-controls.com>
> Cc: linux@roeck-us.net; linux-hwmon@vger.kernel.org; devicetree@vger.kern=
el.org; linux-doc@vger.kernel.org;
> jdelvare@suse.com; mark.rutland@arm.com; corbet@lwn.net
> Subject: Re: [PATCH v7 1/2] dt-bindings: hwmon: Add TMP512/513
>=20
> On Mon, Nov 11, 2019 at 03:34:44PM -0500, etremblay@distech-controls.com =
wrote:
> > From: Eric Tremblay <etremblay@distech-controls.com>
> >
> > Document the TMP513/512 device devicetree bindings
> >
> > Signed-off-by: Eric Tremblay <etremblay@distech-controls.com>
> > ---
> >  .../devicetree/bindings/hwmon/ti,tmp513.yaml  | 89
> > +++++++++++++++++++
> >  1 file changed, 89 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
> > b/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
> > new file mode 100644
> > index 000000000000..de4ed3645e0f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/ti,tmp513.yaml
> > @@ -0,0 +1,89 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) %YAML 1.2
> > +---
> > +
> > +$id:
> > +https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__devicetree.org_s=
c
> > +hemas_hwmon_ti-2Ctmp513.yaml-23&d=3DDwIBAg&c=3DtvvHx3uC0XdtgG-ImPDjfM0=
Qna
> > +kIsmmGcwejQDVxD-g&r=3Dy34zLl9_AvBy5NSrvskG6SFbiKoCzI99WW2xhKlsVV4&m=3D=
sqT
> > +mLsfhqAI5ubkZyE2FvNS0zZ42lJ4Xsiyf12MKPbI&s=3Dcqxgi-ff4mlqg1dH-w0rmoWT9=
T
> > +G9UEzI4jP4boAzSTQ&e=3D
> > +$schema:
> > +https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__devicetree.org_m=
e
> > +ta-2Dschemas_core.yaml-23&d=3DDwIBAg&c=3DtvvHx3uC0XdtgG-ImPDjfM0QnakIs=
mmG
> > +cwejQDVxD-g&r=3Dy34zLl9_AvBy5NSrvskG6SFbiKoCzI99WW2xhKlsVV4&m=3DsqTmLs=
fhq
> > +AI5ubkZyE2FvNS0zZ42lJ4Xsiyf12MKPbI&s=3DMFdE05g19en41dOAGudb8oQzrSKdBS_=
5
> > +uhKXoz3xbfM&e=3D
> > +
> > +title: TMP513/512 system monitor sensor
> > +
> > +maintainers:
> > +  - Eric Tremblay <etremblay@distech-controls.com>
> > +
> > +description: |
> > +  This driver implements support for Texas Instruments TMP512, and TMP=
513.
> > +  The TMP512 (dual-channel) and TMP513 (triple-channel) are system
> > +monitors
> > +  that include remote sensors, a local temperature sensor, and a
> > +high-side
> > +  current shunt monitor. These system monitors have the capability of
> > +measuring
> > +  remote temperatures, on-chip temperatures, and system
> > +voltage/power/current
> > +  consumption.
> > +
> > +  Datasheets:
> > +
> > + https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__www.ti.com_lit_=
g
> > + pn_tmp513&d=3DDwIBAg&c=3DtvvHx3uC0XdtgG-ImPDjfM0QnakIsmmGcwejQDVxD-g&=
r=3Dy
> > + 34zLl9_AvBy5NSrvskG6SFbiKoCzI99WW2xhKlsVV4&m=3DsqTmLsfhqAI5ubkZyE2FvN=
S
> > + 0zZ42lJ4Xsiyf12MKPbI&s=3DaRuMhzI-UQfQORXhmK3OaA7UZ_6segIbgQ4k5SoKF0E&=
e
> > + =3D
> > + https://urldefense.proofpoint.com/v2/url?u=3Dhttp-3A__www.ti.com_lit_=
g
> > + pn_tmp512&d=3DDwIBAg&c=3DtvvHx3uC0XdtgG-ImPDjfM0QnakIsmmGcwejQDVxD-g&=
r=3Dy
> > + 34zLl9_AvBy5NSrvskG6SFbiKoCzI99WW2xhKlsVV4&m=3DsqTmLsfhqAI5ubkZyE2FvN=
S
> > + 0zZ42lJ4Xsiyf12MKPbI&s=3DmMNKG3dkkscHl5e73jC-ESFBdu05NhcCuJ-Pfpwls7E&=
e
> > + =3D
> > +
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ti,tmp512
> > +      - ti,tmp513
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  shunt-resistor-micro-ohms:
> > +    description: |
> > +      If 0, the calibration process will be skiped and the current and=
 power
> > +      measurement engine will not work. Temperature and voltage measur=
ement
> > +      will continue to work. The shunt value also need to respect:
> > +      rshunt <=3D pga-gain * 40 * 1000 * 1000.
> > +      If not, it's not possible to compute a valid calibration value.
> > +    default: 1000
> > +
> > +  ti,pga-gain:
> > +    description: |
> > +      The gain value for the PGA function. This is 8, 4, 2 or 1.
> > +      The PGA gain affect the shunt voltage range.
> > +      The range will be equal to: pga-gain * 40mV
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [1, 2, 4, 8]
> > +    default: 8
> > +
> > +  ti,bus-range-microvolt:
> > +    description: |
> > +      This is the operating range of the bus voltage in microvolt
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#/definitions/uint32
> > +    enum: [16000000, 32000000]
> > +    default: 32000000
> > +
> > +  ti,nfactor:
> > +    description: |
> > +      Array of three(TMP513) or two(TMP512) n-Factor value for each re=
mote
> > +      temperature channel.
> > +      See datasheet Table 11 for n-Factor range list and value interpr=
etation.
> > +    allOf:
> > +      - $ref: /schemas/types.yaml#definitions/uint8-array
> > +      - minItems: 2
> > +        maxItems: 3
> > +        items:
> > +          default: 0
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +examples:
> > +  - |
> > +    i2c {
>=20
> 'make dt_binding_check' fails. You need #address-cells and #size-cells in=
 here:
>=20
> Documentation/devicetree/bindings/hwmon/ti,tmp513.example.dts:20.17-30: W=
arning (reg_format): /example-
> 0/i2c/tmp513@5c:reg: property has invalid length (4 bytes) (#address-cell=
s =3D=3D 2, #size-cells =3D=3D 1)
> Documentation/devicetree/bindings/hwmon/ti,tmp513.example.dt.yaml: Warnin=
g (pci_device_bus_num): Failed prerequisite
> 'reg_format'
> Documentation/devicetree/bindings/hwmon/ti,tmp513.example.dts:17.5-26.11:=
 Warning (i2c_bus_bridge): /example-0/i2c: incorrect
> #address-cells for I2C bus
> Documentation/devicetree/bindings/hwmon/ti,tmp513.example.dts:17.5-26.11:=
 Warning (i2c_bus_bridge): /example-0/i2c: incorrect
> #size-cells for I2C bus
> Documentation/devicetree/bindings/hwmon/ti,tmp513.example.dt.yaml: Warnin=
g (i2c_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/hwmon/ti,tmp513.example.dt.yaml: Warnin=
g (i2c_bus_reg): Failed prerequisite 'i2c_bus_bridge'
> Documentation/devicetree/bindings/hwmon/ti,tmp513.example.dt.yaml: Warnin=
g (spi_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/hwmon/ti,tmp513.example.dts:18.23-25.15=
:
> Warning (avoid_default_addr_size): /example-0/i2c/tmp513@5c: Relying on d=
efault #address-cells value
> Documentation/devicetree/bindings/hwmon/ti,tmp513.example.dts:18.23-25.15=
: Warning (avoid_default_addr_size): /example-
> 0/i2c/tmp513@5c: Relying on default #size-cells value

Sorry I was confused a little by the documentation. I did not saw that I co=
uld run `make dt_binding_check' on a single file.

I ran it on my tree and it gives me a warning on another file. I wrongly as=
sume that it ran all over the tree.

I`ll fix those issue.

Thanks
>=20
> > +        tmp513@5c {
> > +            compatible =3D "ti,tmp513";
> > +            reg =3D <0x5C>;
> > +            shunt-resistor-micro-ohms =3D <330000>;
> > +            ti,bus-range-microvolt =3D <32000000>;
> > +            ti,pga-gain =3D <8>;
> > +            ti,nfactor =3D [01 F3 00];
> > +        };
> > +    };
> > --
> > 2.17.1
> >
