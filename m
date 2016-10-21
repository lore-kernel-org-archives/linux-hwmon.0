Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-qt0-f182.google.com ([209.85.216.182]:36709 "EHLO
        mail-qt0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932392AbcJUI70 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Oct 2016 04:59:26 -0400
Received: by mail-qt0-f182.google.com with SMTP id m5so77728883qtb.3
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Oct 2016 01:59:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1475853669-22480-7-git-send-email-pantelis.antoniou@konsulko.com>
References: <1475853669-22480-1-git-send-email-pantelis.antoniou@konsulko.com> <1475853669-22480-7-git-send-email-pantelis.antoniou@konsulko.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 21 Oct 2016 10:59:25 +0200
Message-ID: <CACRpkdZ=mWYJpBV_WmxYcAwA5TdHM4qv9k17Jb6TnoOL4YAPHA@mail.gmail.com>
Subject: Re: [PATCH 06/10] gpio: gpio-i2cs: Document bindings of I2CS FPGA
 GPIO block
To: Pantelis Antoniou <pantelis.antoniou@konsulko.com>
Cc: Lee Jones <lee.jones@linaro.org>,
        Alexandre Courbot <gnurou@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Richard Purdie <rpurdie@rpsys.net>,
        Jacek Anaszewski <j.anaszewski@samsung.com>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Rosin <peda@axentia.se>,
        Avirup Banerjee <abanerjee@juniper.net>,
        Georgi Vlaev <gvlaev@juniper.net>,
        Guenter Roeck <linux@roeck-us.net>,
        JawaharBalaji Thirumalaisamy <jawaharb@juniper.net>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Oct 7, 2016 at 5:21 PM, Pantelis Antoniou
<pantelis.antoniou@konsulko.com> wrote:

> +This is virtual gpio driver, that maps each bit of the I2CS FPGA to
> +a gpio. It's used as a compatibility replacement for FRUs that use
> +I2CS FPGA to report presence, control and report power status in
> +the Juniper's driver infra that uses gpios. Compatible with any I2CS.

What does "virtual" mean?

I regularly NACK patches that try to shoehorn stuff into
GPIO not because they are actually GPIO hardware drivers or
general purpose at all, but because it is convenient. Don't do this.

> +- i2c-gpio-map: Map of "I2CS register" and "direction". The registers
> +       are 8 bit wide, each bit of the register is mapped to either
> +       input or output depending on the bits of the "direction". If
> +       the bit in the direction is 1, then that bit from the I2CS
> +       register is mapped to gpio input, otherwise to gpio output.

Does this mean that the hardware is synthesized so that some lines
are hardwired as input and some hardwired as output?

That again does not sound like "general purpose" at all.

I think this happens in other hardware and should be a generic
binding like

gpio-lines-input-only = <0>, <4>;
gpio-lines-output-only = <7>, <8>;

And no bitmasking, use the local offset, parse and construct the
mask.

Yours,
Linus Walleij
