Return-Path: <SRS0=kMjT=26=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3856AC33C9E
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Jan 2020 03:07:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C3ED620705
	for <linux-hwmon@archiver.kernel.org>; Thu,  9 Jan 2020 03:07:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=alliedtelesis.co.nz header.i=@alliedtelesis.co.nz header.b="L5ymDPah"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727524AbgAIDH3 (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 8 Jan 2020 22:07:29 -0500
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:44185 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726913AbgAIDH3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 8 Jan 2020 22:07:29 -0500
Received: from mmarshal3.atlnz.lc (mmarshal3.atlnz.lc [10.32.18.43])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by gate2.alliedtelesis.co.nz (Postfix) with ESMTPS id AF512891AA
        for <linux-hwmon@vger.kernel.org>; Thu,  9 Jan 2020 16:07:25 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alliedtelesis.co.nz;
        s=mail181024; t=1578539245;
        bh=Q7NBBL83VukW24Uz9QdNnz56VMcpXJej44H6O3qNzRI=;
        h=From:To:CC:Subject:Date:References:In-Reply-To;
        b=L5ymDPahoUVy/HcGU20jg/BB4WxMsYN/jGZfWuYv8pWTdr6muFMabONdkqVZRSL0t
         ya+gxC1O4qTTAnjGCtqmE2SrEsB0uix2xJkK9Z4LUvLmbPpatAK/w+eDlahs5cUiMs
         CqHAtp2LKGr0SUZJ7UzZxMt5ZAviaPYSst2oOcgeqPBloQa6NSdzIvWlvRrplZZKc/
         XKKox9uUsVNzfyVe/7QUOvaKzVUyezrXzHVJiGSbhJ/C63UGB8hmEsI7L7cUtg/VEB
         xAoZ9GRL8Oo3cgU05mZvGitS0SF9PKYbnu9i6kcofZ070J4t4MYhK1uY7Z6o/Cc0PR
         Wqy7m0FeO5myA==
Received: from svr-chch-ex1.atlnz.lc (Not Verified[10.32.16.77]) by mmarshal3.atlnz.lc with Trustwave SEG (v7,5,8,10121)
        id <B5e1698ee0000>; Thu, 09 Jan 2020 16:07:26 +1300
Received: from svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8)
 by svr-chch-ex1.atlnz.lc (2001:df5:b000:bc8:409d:36f5:8899:92e8) with
 Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 9 Jan 2020 16:07:22 +1300
Received: from svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8]) by
 svr-chch-ex1.atlnz.lc ([fe80::409d:36f5:8899:92e8%12]) with mapi id
 15.00.1473.005; Thu, 9 Jan 2020 16:07:22 +1300
From:   Logan Shaw <Logan.Shaw@alliedtelesis.co.nz>
To:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "jdelvare@suse.com" <JDelvare@suse.com>
CC:     Joshua Scott <Joshua.Scott@alliedtelesis.co.nz>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2 2/2] hwmon: (adt7475) Added attenuator bypass support
Thread-Topic: [PATCH v2 2/2] hwmon: (adt7475) Added attenuator bypass support
Thread-Index: AQHVthzqestyVtwTz0S+q/NkKMJJp6e/+a+AgAyBvACAFUqaCQ==
Date:   Thu, 9 Jan 2020 03:07:21 +0000
Message-ID: <1578539241676.24817@alliedtelesis.co.nz>
References: <20191219033213.30364-1-logan.shaw@alliedtelesis.co.nz>
         <20191219033213.30364-3-logan.shaw@alliedtelesis.co.nz>
         <e88b029b-dbb3-e423-5c37-0917d7716b66@roeck-us.net>,<804d10c6a459b9d7fa02d1e7ba08369c1c95ec87.camel@alliedtelesis.co.nz>
In-Reply-To: <804d10c6a459b9d7fa02d1e7ba08369c1c95ec87.camel@alliedtelesis.co.nz>
Accept-Language: en-NZ, en-US
Content-Language: en-NZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.32.1.10]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

A gentle reminder that this patch exists, as it has (understandably) gone s=
ilent over the holiday period. I would appreciate some feedback on my ideas=
 before modifying the patch, so I know I am headed in the right direction.=
=0A=
=0A=
On Wed, 2019-12-18 at 19:53 -0800, Guenter Roeck wrote:=0A=
> On 12/18/19 7:32 PM, Logan Shaw wrote:=0A=
> > Added a new file documenting the adt7475 devicetree and added the=0A=
> > five=0A=
> > new properties to it.=0A=
> >=0A=
> > Signed-off-by: Logan Shaw <logan.shaw@alliedtelesis.co.nz>=0A=
> > ---=0A=
> > ---=0A=
> >   .../devicetree/bindings/hwmon/adt7475.txt     | 35=0A=
> > +++++++++++++++++++=0A=
> >   1 file changed, 35 insertions(+)=0A=
> >   create mode 100644=0A=
> > Documentation/devicetree/bindings/hwmon/adt7475.txt=0A=
> >=0A=
> > diff --git a/Documentation/devicetree/bindings/hwmon/adt7475.txt=0A=
> > b/Documentation/devicetree/bindings/hwmon/adt7475.txt=0A=
> > new file mode 100644=0A=
> > index 000000000000..388dd718a246=0A=
> > --- /dev/null=0A=
> > +++ b/Documentation/devicetree/bindings/hwmon/adt7475.txt=0A=
> > @@ -0,0 +1,35 @@=0A=
> > +*ADT7475 hwmon sensor.=0A=
> > +=0A=
> > +Required properties:=0A=
> > +- compatible: One of=0A=
> > +   "adi,adt7473"=0A=
> > +   "adi,adt7475"=0A=
> > +   "adi,adt7476"=0A=
> > +   "adi,adt7490"=0A=
> > +=0A=
> > +- reg: I2C address=0A=
> > +=0A=
> > +optional properties:=0A=
> > +=0A=
> > +- bypass-attenuator-all: Configures bypassing all voltage input=0A=
> > attenuators.=0A=
> > +   This is only supported on the ADT7476 and ADT7490, this=0A=
> > property does=0A=
> > +   nothing on other chips.=0A=
>=0A=
> Both adt7473 and adt7475 do support configuring an attenuator on VCCP=0A=
>=0A=
=0A=
That is true, but as the function of register 0x73 bit 5 differs=0A=
between the two set of hardware ({adt7473, adt7475} and {adt7476,=0A=
adt7490}) a solution which allows bypassing VCCP on both gets more=0A=
complicated which I was trying to avoid.=0A=
=0A=
Is it acceptable to split the function=0A=
load_individual_bypass_attenuators into two, one for each set of=0A=
chips, and call the appropriate function for the chip? That way adding=0A=
"bypass-attenuator-in1" to any of the four adt chips DTS will result in=0A=
the attenuator for VCCP being bypassed (albeit by setting different=0A=
bits depending on the specific bit).=0A=
=0A=
> > +           property present: Bit set to bypass all voltage input=0A=
> > attenuators.=0A=
> > +           property absent: Registers left unchanged.=0A=
> > +=0A=
> > +- bypass-attenuator-inx: Configures bypassing individual voltage=0A=
> > input=0A=
> > +   attenuators, where x is an integer from the set {0, 1, 3, 4}.=0A=
> > This=0A=
> > +   is only supported on the ADT7476 and ADT7490, this property=0A=
> > does nothing=0A=
> > +   on other chips.=0A=
> > +           property present: Bit set to bypass specific voltage=0A=
> > input attenuator=0A=
> > +                   for voltage input x.=0A=
> > +           property absent: Registers left unchanged.=0A=
> > +=0A=
>=0A=
> This is interesting. It essentially means "retain configuration from=0A=
> ROM=0A=
> Monitor", but leaves no means to _disable_ the bypass.=0A=
>=0A=
=0A=
Only a power cycle (after removing the properties from the DTS) will=0A=
set the affected bits back to 0. Removing the properties, but only=0A=
softly restarting the system (no interrupted power supply to the adt=0A=
chip), will not set the bits back to 0.=0A=
=0A=
I decided against setting the bits to 0 by default (if no property was=0A=
present) as doing so might break compatibility with systems that expect=0A=
the bits to remain unchanged.=0A=
=0A=
A compromise would be to change the "bypass-attenuator-inx" property to=0A=
"bypass-attenuator-inx =3D <y>", where y =3D 1 bypasses the attenuator and=
=0A=
y =3D 0 does not. If the property is not present then the register is=0A=
left unchanged. It would make sense to do the same to the "bypass-=0A=
attenuator-all" property. Would these changes be acceptable?=0A=
=0A=
> > +Example:=0A=
> > +=0A=
> > +hwmon@2e {=0A=
> > +   compatible =3D "adi,adt7475";=0A=
> > +   reg =3D <0x2e>;=0A=
> > +   bypass-attenuator-all;=0A=
> > +   bypass-attenuator-in1;=0A=
>=0A=
> What would be the purpose of specifying both all and in1 ?=0A=
=0A=
There would be no practical purpose, it was to keep the example=0A=
compact. Instead "bypass-attenuator-in1" could be removed and added to=0A=
second device hwmon@2d. This would show off the syntax for each set of=0A=
properties in a more practical way.=0A=
=0A=
>=0A=
> > +};=0A=
> > \ No newline at end of file=0A=
> >=0A=
>=0A=
>=0A=
