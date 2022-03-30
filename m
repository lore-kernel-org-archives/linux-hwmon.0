Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA46AC433FE
	for <linux-hwmon@archiver.kernel.org>; Wed, 30 Mar 2022 10:11:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243461AbiC3KNc convert rfc822-to-8bit (ORCPT
        <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 30 Mar 2022 06:13:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245224AbiC3KNa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Mar 2022 06:13:30 -0400
Received: from eu-smtp-delivery-151.mimecast.com (eu-smtp-delivery-151.mimecast.com [185.58.85.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5D57A165BA3
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Mar 2022 03:11:44 -0700 (PDT)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-304-oB4kqtPMMA6uQJEujX6CkA-1; Wed, 30 Mar 2022 11:11:41 +0100
X-MC-Unique: oB4kqtPMMA6uQJEujX6CkA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.32; Wed, 30 Mar 2022 11:11:39 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.033; Wed, 30 Mar 2022 11:11:39 +0100
From:   David Laight <David.Laight@ACULAB.COM>
To:     'Xu Yilun' <yilun.xu@intel.com>, Michael Walle <michael@walle.cc>
CC:     Tom Rix <trix@redhat.com>, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S . Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: RE: [PATCH v2 1/5] hwmon: introduce hwmon_sanitize_name()
Thread-Topic: [PATCH v2 1/5] hwmon: introduce hwmon_sanitize_name()
Thread-Index: AQHYRAJ8rIB0cQMH/kajVzJ0H3I8wazXtB2w
Date:   Wed, 30 Mar 2022 10:11:39 +0000
Message-ID: <5029cf18c9df4fab96af13c857d2e0ef@AcuMS.aculab.com>
References: <20220329160730.3265481-1-michael@walle.cc>
 <20220329160730.3265481-2-michael@walle.cc>
 <20220330065047.GA212503@yilunxu-OptiPlex-7050>
In-Reply-To: <20220330065047.GA212503@yilunxu-OptiPlex-7050>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
        auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

From: Xu Yilun
> Sent: 30 March 2022 07:51
> 
> On Tue, Mar 29, 2022 at 06:07:26PM +0200, Michael Walle wrote:
> > More and more drivers will check for bad characters in the hwmon name
> > and all are using the same code snippet. Consolidate that code by adding
> > a new hwmon_sanitize_name() function.
> >
> > Signed-off-by: Michael Walle <michael@walle.cc>
> > ---
> >  Documentation/hwmon/hwmon-kernel-api.rst |  9 ++++-
> >  drivers/hwmon/hwmon.c                    | 49 ++++++++++++++++++++++++
> >  include/linux/hwmon.h                    |  3 ++
> >  3 files changed, 60 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/hwmon/hwmon-kernel-api.rst b/Documentation/hwmon/hwmon-kernel-api.rst
> > index c41eb6108103..12f4a9bcef04 100644
> > --- a/Documentation/hwmon/hwmon-kernel-api.rst
> > +++ b/Documentation/hwmon/hwmon-kernel-api.rst
> > @@ -50,6 +50,10 @@ register/unregister functions::
> >
> >    void devm_hwmon_device_unregister(struct device *dev);
> >
> > +  char *hwmon_sanitize_name(const char *name);
> > +
> > +  char *devm_hwmon_sanitize_name(struct device *dev, const char *name);
> > +
> >  hwmon_device_register_with_groups registers a hardware monitoring device.
> >  The first parameter of this function is a pointer to the parent device.
> >  The name parameter is a pointer to the hwmon device name. The registration
> > @@ -93,7 +97,10 @@ removal would be too late.
> >
> >  All supported hwmon device registration functions only accept valid device
> >  names. Device names including invalid characters (whitespace, '*', or '-')
> > -will be rejected. The 'name' parameter is mandatory.
> > +will be rejected. The 'name' parameter is mandatory. Before calling a
> > +register function you should either use hwmon_sanitize_name or
> > +devm_hwmon_sanitize_name to replace any invalid characters with an
> 
> I suggest                   to duplicate the name and replace ...

You are now going to get code that passed in NULL when the kmalloc() fails.
If 'sanitizing' the name is the correct thing to do then sanitize it
when the copy is made into the allocated structure.
(I'm assuming that the 'const char *name' parameter doesn't have to
be persistent - that would be another bug just waiting to happen.)

Seems really pointless to be do a kmalloc() just to pass a string
into a function.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)

