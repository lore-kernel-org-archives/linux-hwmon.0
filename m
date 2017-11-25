Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-ot0-f177.google.com ([74.125.82.177]:42271 "EHLO
        mail-ot0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751494AbdKYCGp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Nov 2017 21:06:45 -0500
Received: by mail-ot0-f177.google.com with SMTP id 18so20073010oty.9
        for <linux-hwmon@vger.kernel.org>; Fri, 24 Nov 2017 18:06:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20171125010340.97aa0df241720c59eacc4e27@videhug.ch>
References: <20170910094446.3154-1-linus.walleij@linaro.org>
 <CAOMZO5D_m=4UKBBGb0-jurDib+g+v82ATMHbiRGhvTSsfz1P6w@mail.gmail.com>
 <CAM4PwSWtxU+87HxP7k3-4qgt4E_q3cS5EZoKjNP7_rh43XJJhg@mail.gmail.com>
 <HE1PR0402MB3562DEEDDCA16F6B8E04CA2FF6680@HE1PR0402MB3562.eurprd04.prod.outlook.com>
 <HE1PR0402MB35625D52800B1810FDFB8774F6680@HE1PR0402MB3562.eurprd04.prod.outlook.com>
 <20171121002849.776d585b9eb3f9f6b04387a0@videhug.ch> <1511279379.29108.7.camel@nxp.com>
 <20171122234510.c8a90de3d689d2ea78114e72@videhug.ch> <CAOMZO5C4K-+nqTOQQsbO-FOAZ5o10Wps3-Fe96ikyg+s4jEAEQ@mail.gmail.com>
 <20171125010340.97aa0df241720c59eacc4e27@videhug.ch>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 25 Nov 2017 00:06:44 -0200
Message-ID: <CAOMZO5DHWrhK1Sj3-svh+VxBUvakiFd1q63BZ_UHFkA7R=nhjw@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon/sht15: Root out platform data
To: Davide Hug <d@videhug.ch>
Cc: Marco Franchi <marco.franchi@nxp.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "arm@kernel.org" <arm@kernel.org>,
        "jic23@cam.ac.uk" <jic23@cam.ac.uk>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "jic23@kernel.org" <jic23@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Davide,

On Fri, Nov 24, 2017 at 10:03 PM, Davide Hug <d@videhug.ch> wrote:

> So the GPIOLIB_IRQCHIP code in gpiolib.c is enabled. But the driver
> gpio-mxc doesn't use it. In particular it doesn't call gpiochip_add_irqchip
> which assigns the .irq_request_resources/.irq_release_resources callbacks that
> toggle the FLAG_USED_AS_IRQ.
> So in the gpio-mxc driver the guard against setting a GPIO with active IRQ as
> output is not in place. And it is this guard that makes the sht15 driver fail
> to load when in place.

What is the gpio driver you are using that shows the error?
