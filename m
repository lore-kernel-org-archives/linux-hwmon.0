Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2475BC433EF
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Oct 2021 07:54:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05244610C7
	for <linux-hwmon@archiver.kernel.org>; Tue, 26 Oct 2021 07:54:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232972AbhJZH5P (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 26 Oct 2021 03:57:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232728AbhJZH5O (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Oct 2021 03:57:14 -0400
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 739B1C061348
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Oct 2021 00:54:51 -0700 (PDT)
Received: by mail-ua1-x932.google.com with SMTP id h4so27458986uaw.1
        for <linux-hwmon@vger.kernel.org>; Tue, 26 Oct 2021 00:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nathanrossi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7KThsVsJ0ORwtbbILrkIHcQVvOXxtniaD63wKOd53qk=;
        b=HnvJ4vvoBGWPejDQnm/ceHOouktHbMPYb2NVqm8X890uLYuhTntSkXmPPrfeXPUxFf
         JaV8TxThiaayueFvWeFtc7E5kZRxffOdqIDgYnawrTS77/V2nCdJXJQLIW3UjwIUd5PK
         PoezPScg2qx0ovlwPBRS3QbxEwCQ3qQEE0n7miqUGqf+QRuID0gmWS+YmqKyowfwxUqa
         TEw0jBSG6oL3BH7IsdFPy1p7oHtarhL+e4cERUZMn/2Yb3w+zyUslD1AQ65WMu5jf422
         sE1v6m683vV+buas/UyPtz8IEzH08wLrjA8XA0dX7DhXBLdMQl+RRmD3Mn7hKV3p6+JW
         XxFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7KThsVsJ0ORwtbbILrkIHcQVvOXxtniaD63wKOd53qk=;
        b=eE6ZgIYwpOQ7WlcQ1KwCZRZiWbeRjteKyX60URp+zI1jXzRf+U9/aWMnXOvBdKSwjb
         Ww2jbGHL7YLoexDlVDNXJnulstWpbeoUC2ECvWUlwdGtW+ozPTgtVD9SAZxlD6se8ikG
         u2CwKdl16zE+NXrVdl2ZlFZIu/Yu55UoXnRJXxpi07nW10xNqFkE06O4QNDKOveuVnAf
         6n+9gNy8IeTSkJaG8WMvn3EB4iX/YICPFOgocTS0nwsZjixENCz688DkH2D6xT0ROROI
         vQ0z7j5t1NjLbEWweWo1Lv9cRUaKpPip2rpuGjbuTY8rY+hHZfsrErkGs87yQ8nqKdBt
         aNRg==
X-Gm-Message-State: AOAM53089FC+A02KtW2uX495r4eK5U5NsosGu6CMoKqtC0We6aURbKP+
        6A2wWrXO4jXEQJp0ekQe2kuaVWkmTVqGiyMPk22EKw==
X-Google-Smtp-Source: ABdhPJwA8HUnvfBBeHEMaTCPWBYGAi9sB4Mm+usDOw4yuTD8raJr2E0KRF4gRS78GU5/ltQS8MgS2XLSeiXqnOeISEE=
X-Received: by 2002:a67:f1ca:: with SMTP id v10mr18800145vsm.55.1635234890581;
 Tue, 26 Oct 2021 00:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211025025805.618566-0-nathan@nathanrossi.com>
 <20211025025805.618566-2-nathan@nathanrossi.com> <7297bf4c-2f8e-f217-0153-c2224a1c56b3@roeck-us.net>
 <CA+aJhH0yPZ=3LEPDm0GkWx9bLtHJ+QRbRo33HiCXM5FH6nzPFA@mail.gmail.com> <2f5aecd2-55a1-9382-46eb-f4ff48663b30@roeck-us.net>
In-Reply-To: <2f5aecd2-55a1-9382-46eb-f4ff48663b30@roeck-us.net>
From:   Nathan Rossi <nathan@nathanrossi.com>
Date:   Tue, 26 Oct 2021 17:54:39 +1000
Message-ID: <CA+aJhH0RDXPE4m2yEa2ROEW2L3fnq20XTgPrxhO5k2gSa5_XdA@mail.gmail.com>
Subject: Re: [PATCH 2/2] hwmon: Driver for Texas Instruments INA238
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nathan Rossi <nathan.rossi@digi.com>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, 26 Oct 2021 at 01:45, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 10/24/21 11:27 PM, Nathan Rossi wrote:
> [ ... ]
> >> Is there reason to believe that the shunt register value needs to be visible
> >> and writeable with sysfs attributes ? This is quite unusual nowadays.
> >> If so, please provide a use case.
> >
> > I do not have a specific use case for being able to change the shunt
> > resistor at run time. The only reason this behaviour is here is to
> > mirror the api that is provided by the ina2xx driver. Since as you
> > mention its unusual should I remove the write and leave the read?
> > Being able to determine the resistor value is useful if manually using
> > the shunt voltage. Though the shunt information could be obtained from
> > the device tree node?
> >
>
> Please drop the attribute. There is already probe noise displaying it,
> and it is contained in the devicetree data. If there is a use case,
> the attribute can always be added later.
>
> [ ... ]
>
> >> Those preinitializations make me wonder if there should be devicetree
> >> properties for at least some of the data.
> >
> > Yes, I did consider adding configuration for the conversion time and
> > sampling average as device tree properties. The existing ina2xx driver
> > handles configuring sampling average via the "update_interval" sysfs
> > attribute. Our use case does not require changing these at runtime so
> > did not implement the update_interval and was unsure if changes to
> > device tree bindings would make sense. Should these be device tree
> > properties? If yes, should the other ina drivers be updated to support
> > the properties?
> >
>
> I wasn't specifically thinking about conversion time or sampling average,
> but I do think it would be desirable to be able to configure all those
> values via devicetree. The datasheet says "... allows for robust operation
> in a variety of noisy environments", and that is definitely a system property.
> ADCRANGE should also be configurable via devicetree. The same applies to MODE,

I will add a property "ti,shunt-gain". Since the ina209, ina219,
ina220 use the PGA term which is the actual function being provided,
where ADCRANGE=0 is a /4 PGA for ina238 and the other devices have /1,
/2, /4, /8.

> but that would add some complexity so I am not sure if you'd want to get
> into that (it would require per-channel entries in devicetree to be able
> to enable/disable each channel). FWIW, you _could_ also do that with
> standard sysfs attributes if you want to ({in,curr,temp}X_enable, or
> hwmon_{temp,in,curr}_enable in the with_info API). That can also be added
> later if needed, so there is no need to do it now if it is not required
> for your use case.
>
> As for other ina drivers - that is a different question. I would not touch
> those unless you have a use case (and a means to test the code). I'd also
> consider it more important to convert those drivers to use the _with_info
> API before implementing any other changes. There is also the added
> complexity that we already have two drivers for those other chips (see
> drivers/iio/adc/ina2xx-adc.c), and I'd rather have a better API
> between IIO and HWMON and drop drivers/hwmon/ina2xx.c entirely than
> making changes to it.
>
> Can you possibly send me a register dump for the INA238 ? That would
> enable me to write a module test for the driver.

Dump of registers below. Other notes, upper two bits are ignored so
the address space wraps at 0x40, etc. The undocumented/unused
registers between 0x11 and 0x3e are 0xffff.

power on, before probe:
0x00: 0x0000
0x01: 0xfb68
0x02: 0x1000
0x03: 0xffff
0x04: 0x087c
0x05: 0x0e77
0x06: 0x0f10
0x07: 0x087c
0x08: 0x01eac3
0x09: 0xffff
0x10: 0x7ff0
0x11: 0xffff
0x3e: 0x5449
0x3f: 0x2381

after probe, actual state of device ~10mV shunt voltage, 20 mOhm
shunt, ~12V bus, ~6W power, ~30C temperature
0x00: 0x0000
0x01: 0xfb6a
0x02: 0x4000
0x03: 0xffff
0x04: 0x087c
0x05: 0x0e77
0x06: 0x0f10
0x07: 0x087c
0x08: 0x01eac3
0x09: 0xffff
0x10: 0x7ff0
0x11: 0xffff
0x3e: 0x5449
0x3f: 0x2381

Thanks,
Nathan
