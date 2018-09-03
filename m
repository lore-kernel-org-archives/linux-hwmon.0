Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx07-00252a01.pphosted.com ([62.209.51.214]:14776 "EHLO
        mx07-00252a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727493AbeICXhw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 3 Sep 2018 19:37:52 -0400
Received: from pps.filterd (m0102628.ppops.net [127.0.0.1])
        by mx07-00252a01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w83J5Woo020016
        for <linux-hwmon@vger.kernel.org>; Mon, 3 Sep 2018 20:05:32 +0100
Received: from mail-wm0-f71.google.com (mail-wm0-f71.google.com [74.125.82.71])
        by mx07-00252a01.pphosted.com with ESMTP id 2m7g609755-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=OK)
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Sep 2018 20:05:32 +0100
Received: by mail-wm0-f71.google.com with SMTP id z23-v6so1236992wma.2
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Sep 2018 12:05:32 -0700 (PDT)
MIME-Version: 1.0
References: <1535887251-29515-1-git-send-email-stefan.wahren@i2se.com>
 <99ca4f6d-d2b2-36e7-9f27-189df379cfaf@roeck-us.net> <67224834.51159.1535905604770@email.1und1.de>
 <e8d4e69c-2668-2794-6474-79749bf8b577@roeck-us.net> <829194253.51526.1535908415057@email.1und1.de>
 <642d46f3-7c1d-2b97-5d49-8772c75be530@gmail.com> <698422655.399555.1536000906069@email.1und1.de>
In-Reply-To: <698422655.399555.1536000906069@email.1und1.de>
From: Serge Schneider <serge@raspberrypi.org>
Date: Mon, 3 Sep 2018 20:05:20 +0100
Message-ID: <CAJb4yHw-FFbiRFOWH+J8KtmT6=QGXAR6s7mszyyGTVJJzuEaKg@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] hwmon: Add RPi PoE HAT fan driver
To: stefan.wahren@i2se.com
Cc: f.fainelli@gmail.com, linux@roeck-us.net, robh+dt@kernel.org,
        linux-rpi-kernel@lists.infradead.org, eric@anholt.net,
        mark.rutland@arm.com, bcm-kernel-feedback-list@broadcom.com,
        Phil Elwell <phil@raspberrypi.org>, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        jdelvare@suse.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Sep 3, 2018 at 7:55 PM Stefan Wahren <stefan.wahren@i2se.com> wrote=
:
>
>
> > Florian Fainelli <f.fainelli@gmail.com> hat am 3. September 2018 um 20:=
31 geschrieben:
> >
> >
> >
> >
> > On 9/2/2018 10:13 AM, Stefan Wahren wrote:
> > > Hi Guenter,
> > >
> > >> Guenter Roeck <linux@roeck-us.net> hat am 2. September 2018 um 18:49=
 geschrieben:
> > >>
> > >>
> > >> On 09/02/2018 09:26 AM, Stefan Wahren wrote:
> > >>> Hi Guenter,
> > >>>
> > >>>> Guenter Roeck <linux@roeck-us.net> hat am 2. September 2018 um 16:=
23 geschrieben:
> > >>>>
> > >>>>
> > >>>> On 09/02/2018 04:20 AM, Stefan Wahren wrote:
> > >>>>> This series is an early stage of the hwmon driver for the fan on =
the
> > >>>>> Raspberry Pi Power over Ethernet HAT [1]. At the end this should =
use a
> > >>>>> Device Tree Overlay.
> > >>>>>
> > >>>>> Changes by Stefan based on [2]:
> > >>>>> - reformat the downstream patches for submission
> > >>>>> - drop reboot notification
> > >>>>> - fix remaining checkpatch issues
> > >>>>> - add COMPILE_TEST to Kconfig
> > >>>>>
> > >>>>> The driver is mostly copy & paste from pwm-fan, which isn't good.=
 Personally
> > >>>>> i see two options:
> > >>>>>
> > >>>>> 1) integrate the driver function into the pwm-fan driver (new com=
patible)
> > >>>>> 2) implement the core function as a PWM driver and use the pwm-fa=
n driver on top
> > >>>>>
> > >>>>
> > >>>> I don't really see the point of thise driver. Why not implement ei=
ther of those ?
> > >>>
> > >>> i'm not sure about your question. Since the fan is placed over the =
SoC, the fan should takes care of the SoC temperature. AFAIK the firmware s=
hould have exclusive access to the I2C. So why we need this mailbox interfa=
ce instead of a I2C driver.
> > >>>
> > >>
> > >> The driver sets pwm values. The pwm-fan driver sets pwm values. A pw=
m driver
> > >> sets pwm values. The pwm-fan driver uses a pwm driver to set pwm val=
ues.
> > >> You appear to be arguing that the pwm-fan driver for Rpi is differen=
t than
> > >> a pwm-fan driver for all other hardware and should _not_ use a pwm d=
river
> > >> to set pwm values.
> > >
> > > thanks for your explanation. Now i think i understand and sorry for t=
he confusion. We need a driver which translate the pwm values into the mail=
box properties. "My" RFC series is only a starting point (not intended for =
merge and not an option) for a discussion and i'm perfectly fine with 2).
> > > Both options would be feasible in general. I only wanted to know your=
 opinion before i start to implement one of them.
> >
> > Is not there a way to expose the PWM pins directly to the kernel instea=
d
> > of going through the firmware to do that for us? I am just asking
> > because sometimes this appears to be possible, guess not in this case?
>
> According to this blog entry (no schematics available so far) [1], this i=
s my understanding of the fan control:
>
> | Raspberry Pi 3B+               | PoE HAT               |
> ARM core -Mailbox-> VideoCore4 -I2C-> Atmel MCU -PWM-> FAN
>
> The only chance would be to bypass VC4 and talk to the Atmel microcontrol=
ler directly. But this would require a specification of the I2C protocol or=
 some time of reverse engineering.
>
> Maybe the foundation guys can say something about that?

That's spot on. The communication is done through the mailbox because
it's connected to the I2C periperal that's normally reserved for the
firmware.

The interface itself is very simple. Device address is 0x51. Register
0xF0 contains the current PWM value. 0xF1 contains the default PWM
value that's loaded on power-on.

>
>
> [1] - https://www.raspberrypi.org/blog/introducing-power-over-ethernet-po=
e-hat/
>
> > --
> > Florian
