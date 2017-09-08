Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-oi0-f49.google.com ([209.85.218.49]:36229 "EHLO
        mail-oi0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756914AbdIHV16 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 8 Sep 2017 17:27:58 -0400
Received: by mail-oi0-f49.google.com with SMTP id x190so21435503oix.3
        for <linux-hwmon@vger.kernel.org>; Fri, 08 Sep 2017 14:27:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170907151053.GA15047@roeck-us.net>
References: <20170906235001.d54617b600ae192ffc0cf206@videhug.ch> <20170907151053.GA15047@roeck-us.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 8 Sep 2017 23:27:57 +0200
Message-ID: <CACRpkdaUtxLW9JkxuigXqWZ=H5Fin6_ePeLStyTS-qUQxdZ9ng@mail.gmail.com>
Subject: Re: hwmon/sht15: gpio irq problem
To: Guenter Roeck <linux@roeck-us.net>
Cc: Davide Hug <d@videhug.ch>, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Sep 7, 2017 at 5:10 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On Wed, Sep 06, 2017 at 11:50:01PM +0200, Davide Hug wrote:

>>   - Which solution is preferable?
>
> Neither. If the gpio subsystem does not support interrupts on
> bidirectional gpio pins, it sould really refuse to change direction
> on a pin which has an interrupt assigned to it.

I think this needs to be fixed properly in gpio, but I just can't
see the solution.

It's essentially IRQ on an open drain line I think?
(I tried to explain basic open drain concepts in
Documentation/gpio/driver.txt as I understand them.)

Since open drain is a bit "in-between" it should (I guess) be allowed
to have IRQs on them even if they are output for a while,
but then I guess they should be masked/unmasked in the
irqchip part of the driver at the same time.

Maybe part of the problem is simply that the line is not set up as
open drain in the hardware? We have open drain flags for
device trees and board files using the new descriptor
infrastructure.

Davide can you investigate using the opendrain flag when
requesting the line?

Maybe the driver needs to be converted to use GPIO
descriptors first though :/

Also: which GPIO controller is this used with, so I can check
how/if it supports open drain?

Yours,
Linus Walleij
