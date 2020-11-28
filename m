Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F445C83029
	for <linux-hwmon@archiver.kernel.org>; Sat, 28 Nov 2020 22:17:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 06EBE21D40
	for <linux-hwmon@archiver.kernel.org>; Sat, 28 Nov 2020 22:17:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="cvSoQOge"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388799AbgK1Vto (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Sat, 28 Nov 2020 16:49:44 -0500
Received: from mout01.posteo.de ([185.67.36.65]:58661 "EHLO mout01.posteo.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731463AbgK1Swx (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 28 Nov 2020 13:52:53 -0500
Received: from submission (posteo.de [89.146.220.130]) 
        by mout01.posteo.de (Postfix) with ESMTPS id 8FBAB160060
        for <linux-hwmon@vger.kernel.org>; Sat, 28 Nov 2020 11:35:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1606559730; bh=Q87dTJa3uK3W265onyuF++bZHx5o2RBc6p2faGdjbPM=;
        h=Date:From:To:Cc:Subject:From;
        b=cvSoQOgeJA+dbJbSZVYNSsBApbpDqHlYiYvI0F2qv86ajImfY0BSLhMWXWrhTU5Tl
         7rCZ2w8nW8n+3kjPEFZGtChd3larQ68kwcGAKB1XtPJ3cWZN72Tkgb2wNH/PgzkvAo
         ARjh1zOCF6v6uFxFmMw/OuRlOn27NSiXI0iipmcIxIxr3Jx1gjL/Q3XbH8XLKeFH4s
         2XmWyW/4XvVgh0jgXbkCE9MaYUdJPGX0rKv+tytCxC8qCg5BQ8oSEdYlA5Y036YBx6
         s4xVCgyK3TerVGyokg2jOA/z1WZAItpxdoRWXnQ0fWDHINkhJplkIq8Zt6VpduH3Kl
         p0tEIU/dCGiLQ==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4CjnvP0g9nz9rxM;
        Sat, 28 Nov 2020 11:35:29 +0100 (CET)
Date:   Sat, 28 Nov 2020 11:35:24 +0100
From:   Wilken Gottwalt <wilken.gottwalt@posteo.net>
To:     Jonas Malaco <jonas@protocubo.io>
Cc:     linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: corsair-psu: update supported devices
Message-ID: <20201128113524.24f4f56f@monster.powergraphx.local>
In-Reply-To: <CANS_-EN8rgFEyE5rDw3=JLUYNwLQexafn7efvMC_=+4s2h1R6Q@mail.gmail.com>
References: <X7+T4aZSUuzfsf7H@monster.powergraphx.local>
        <CANS_-EN8rgFEyE5rDw3=JLUYNwLQexafn7efvMC_=+4s2h1R6Q@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, 28 Nov 2020 02:37:38 -0300
Jonas Malaco <jonas@protocubo.io> wrote:

> On Thu, Nov 26, 2020 at 8:43 AM Wilken Gottwalt
> <wilken.gottwalt@posteo.net> wrote:
> >
> > Adds support for another Corsair PSUs series: AX760i, AX860i, AX1200i,
> > AX1500i and AX1600i. The first 3 power supplies are supported through
> > the Corsair Link USB Dongle which is some kind of USB/Serial/TTL
> > converter especially made for the COM ports of these power supplies.
> > There are 3 known revisions of these adapters. The AX1500i power supply
> > has revision 3 built into the case and AX1600i is the only one in that
> > series, which has an unique usb hid id like the RM/RX series.
> 
> Can I ask what AXi power supplies were tested?
> 
> I ask because, based on the user-space implementations I am aware of,
> the AXi dongle protocol appears to be different from the RMi/HXi series.

I was not able to test this against the AX power supplies, they are really
hard to find (and are far to expensive). But I went through all these tools
and stuck to the most common commands, which all 3 series support. Not every
series supports all commands (there also seem to be different firmwares in
the micro-conrollers). But this is fine, some sensors will show up as N/A.
Even my HX850i does not support all commands covered in this driver.

> AXi dongle:
>  - https://github.com/ka87/cpsumon

This tool made me to consider including the AX series, because it uses some
of the same commands on the AX760i, AX860i, AX1200i and AX1500i. But it is
a usb-serial tool only. But it was nice to know, that the commands are mostly
the same. I left out all the commands for configuring, PCIe power rails, 
efficiency and others which do not really belong into hwmon.

> RMi/HXi:
>  - https://github.com/jonasmalacofilho/liquidctl
>  - https://github.com/audiohacked/OpenCorsairLink

This tool made me include the AX series, because it uses the rmi protocol
component for the rmi driver (RM/HX series) and the corsair dongles.

>  - https://github.com/notaz/corsairmi

This one covers only some HX/RM PSUs, but is uses the rawhid access which
made me looking up the actual usb chips/bridges Corsair uses.

> 
> One additional concern is that the non-HID AXi dongles may only have bulk
> USB endpoints, and this is a HID driver.[1]

You are right, in the case of the dongles it could be different. But I did
some research on Corsair usb driven devices and they really like to stick to
the cp210x, which is an usb hid bridge. The commit
b9326057a3d8447f5d2e74a7b521ccf21add2ec0 actually covers two Corsair USB
dongles as a cp210x device. So it is very likely that all Corsair PSUs with
such an interface/dongle use usb hid. But I'm completely open to get proven
wrong. Actually I really would like to see this tested by people who have
access to the more rare devices.

> Thanks,
> Jonas
> 
> [1] https://github.com/ka87/cpsumon/issues/4

Yes ... that one. The last revision of the dongle could indeed be a problem.
But I'm not really sure what is described here. The last commenter is actually
the one who provided the cp210x patch mentioned up there. The problem here is,
the AX1500i has both connectors, USB and that other one. I call it the other
one because it is the only PSU where it is labeled I2C COMM instead of COMM
only. But at the same time this tools uses the same commands for this PSU.

So, only some real hardware tests will show.

Greetings,
Wilken

> >
> > The patch also changes the usb hid ids to use upper case letters to be
> > consistent with the rest of the hex numbers in the driver and updates
> > the hwmon documentation.
> >
> > This patch adds:
> > - hwmon/corsair-psu documentation update
> > - corsair-psu driver update
> >
> > Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
> > ---
> >  Documentation/hwmon/corsair-psu.rst | 10 +++++++++
> >  drivers/hwmon/Kconfig               |  7 +++---
> >  drivers/hwmon/corsair-psu.c         | 33 +++++++++++++++++++----------
> >  3 files changed, 36 insertions(+), 14 deletions(-)
> >
> > diff --git a/Documentation/hwmon/corsair-psu.rst b/Documentation/hwmon/corsair-psu.rst
> > index 396b95c9a76a..6227e9046d73 100644
> > --- a/Documentation/hwmon/corsair-psu.rst
> > +++ b/Documentation/hwmon/corsair-psu.rst
> > @@ -7,6 +7,16 @@ Supported devices:
> >
> >  * Corsair Power Supplies
> >
> > +  Corsair AX760i (by Corsair Link USB Dongle)
> > +
> > +  Corsair AX860i (by Corsair Link USB Dongle)
> > +
> > +  Corsair AX1200i (by Corsair Link USB Dongle)
> > +
> > +  Corsair AX1500i (by builtin Corsair Link USB Dongle)
> > +
> > +  Corsair AX1600i
> > +
> >    Corsair HX550i
> >
> >    Corsair HX650i
> > diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> > index 716df51edc87..3c059fc23cd6 100644
> > --- a/drivers/hwmon/Kconfig
> > +++ b/drivers/hwmon/Kconfig
> > @@ -453,11 +453,12 @@ config SENSORS_CORSAIR_PSU
> >         tristate "Corsair PSU HID controller"
> >         depends on HID
> >         help
> > -         If you say yes here you get support for Corsair PSUs with a HID
> > +         If you say yes here you get support for Corsair PSUs with an USB HID
> >           interface.
> >           Currently this driver supports the (RM/HX)550i, (RM/HX)650i,
> > -         (RM/HX)750i, (RM/HX)850i, (RM/HX)1000i and HX1200i power supplies
> > -         by Corsair.
> > +         (RM/HX)750i, (RM/HX)850i, (RM/HX)1000i, HX1200i and AX1600i power
> > +         supplies by Corsair. The AX760i, AX860i, AX1200i and AX1500i
> > +         power supplies are supported through the Corsair Link USB Dongle.
> >
> >           This driver can also be built as a module. If so, the module
> >           will be called corsair-psu.
> > diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
> > index 99494056f4bd..0146dda3e2c3 100644
> > --- a/drivers/hwmon/corsair-psu.c
> > +++ b/drivers/hwmon/corsair-psu.c
> > @@ -571,17 +571,28 @@ static int corsairpsu_raw_event(struct hid_device *hdev, struct
> > hid_report *repo }
> >
> >  static const struct hid_device_id corsairpsu_idtable[] = {
> > -       { HID_USB_DEVICE(0x1b1c, 0x1c03) }, /* Corsair HX550i */
> > -       { HID_USB_DEVICE(0x1b1c, 0x1c04) }, /* Corsair HX650i */
> > -       { HID_USB_DEVICE(0x1b1c, 0x1c05) }, /* Corsair HX750i */
> > -       { HID_USB_DEVICE(0x1b1c, 0x1c06) }, /* Corsair HX850i */
> > -       { HID_USB_DEVICE(0x1b1c, 0x1c07) }, /* Corsair HX1000i */
> > -       { HID_USB_DEVICE(0x1b1c, 0x1c08) }, /* Corsair HX1200i */
> > -       { HID_USB_DEVICE(0x1b1c, 0x1c09) }, /* Corsair RM550i */
> > -       { HID_USB_DEVICE(0x1b1c, 0x1c0a) }, /* Corsair RM650i */
> > -       { HID_USB_DEVICE(0x1b1c, 0x1c0b) }, /* Corsair RM750i */
> > -       { HID_USB_DEVICE(0x1b1c, 0x1c0c) }, /* Corsair RM850i */
> > -       { HID_USB_DEVICE(0x1b1c, 0x1c0d) }, /* Corsair RM1000i */
> > +       /*
> > +        * The Corsair USB/COM Dongles appear in at least 3 different revisions, where rev 1
> > and 2
> > +        * are commonly used with the AX760i, AX860i and AX1200i, while rev3 is rarely seen with
> > +        * these PSUs. Rev3 is also build into the AX1500i, while the AX1600i is the first PSU
> > of
> > +        * this series which has an unique usb hid id. Though, the actual device name is part of
> > +        * the HID message protocol, so it doesn't matter which dongle is connected.
> > +        */
> > +       { HID_USB_DEVICE(0x1B1C, 0x1C00) }, /* Corsair Link USB/COM Dongle rev1 */
> > +       { HID_USB_DEVICE(0x1B1C, 0x1C01) }, /* Corsair Link USB/COM Dongle rev2 */
> > +       { HID_USB_DEVICE(0x1B1C, 0x1C02) }, /* Corsair Link USB/COM Dongle rev3 (AX1500i) */
> > +       { HID_USB_DEVICE(0x1B1C, 0x1C03) }, /* Corsair HX550i */
> > +       { HID_USB_DEVICE(0x1B1C, 0x1C04) }, /* Corsair HX650i */
> > +       { HID_USB_DEVICE(0x1B1C, 0x1C05) }, /* Corsair HX750i */
> > +       { HID_USB_DEVICE(0x1B1C, 0x1C06) }, /* Corsair HX850i */
> > +       { HID_USB_DEVICE(0x1B1C, 0x1C07) }, /* Corsair HX1000i */
> > +       { HID_USB_DEVICE(0x1B1C, 0x1C08) }, /* Corsair HX1200i */
> > +       { HID_USB_DEVICE(0x1B1C, 0x1C09) }, /* Corsair RM550i */
> > +       { HID_USB_DEVICE(0x1B1C, 0x1C0A) }, /* Corsair RM650i */
> > +       { HID_USB_DEVICE(0x1B1C, 0x1C0B) }, /* Corsair RM750i */
> > +       { HID_USB_DEVICE(0x1B1C, 0x1C0C) }, /* Corsair RM850i */
> > +       { HID_USB_DEVICE(0x1B1C, 0x1C0D) }, /* Corsair RM1000i */
> > +       { HID_USB_DEVICE(0x1B1C, 0x1C11) }, /* Corsair AX1600i */
> >         { },
> >  };
> >  MODULE_DEVICE_TABLE(hid, corsairpsu_idtable);
> > --
> > 2.29.2
> >

