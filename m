Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from s067.cyon.net ([149.126.4.76]:58558 "EHLO s067.cyon.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753817AbdKYADt (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Nov 2017 19:03:49 -0500
Date: Sat, 25 Nov 2017 01:03:40 +0100
From: Davide Hug <d@videhug.ch>
To: Fabio Estevam <festevam@gmail.com>
Cc: Marco Franchi <marco.franchi@nxp.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "arm@kernel.org" <arm@kernel.org>,
        "jic23@cam.ac.uk" <jic23@cam.ac.uk>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "jic23@kernel.org" <jic23@kernel.org>
Subject: Re: [PATCH v2] hwmon/sht15: Root out platform data
Message-Id: <20171125010340.97aa0df241720c59eacc4e27@videhug.ch>
In-Reply-To: <CAOMZO5C4K-+nqTOQQsbO-FOAZ5o10Wps3-Fe96ikyg+s4jEAEQ@mail.gmail.com>
References: <20170910094446.3154-1-linus.walleij@linaro.org>
        <CAOMZO5D_m=4UKBBGb0-jurDib+g+v82ATMHbiRGhvTSsfz1P6w@mail.gmail.com>
        <CAM4PwSWtxU+87HxP7k3-4qgt4E_q3cS5EZoKjNP7_rh43XJJhg@mail.gmail.com>
        <HE1PR0402MB3562DEEDDCA16F6B8E04CA2FF6680@HE1PR0402MB3562.eurprd04.prod.outlook.com>
        <HE1PR0402MB35625D52800B1810FDFB8774F6680@HE1PR0402MB3562.eurprd04.prod.outlook.com>
        <20171121002849.776d585b9eb3f9f6b04387a0@videhug.ch>
        <1511279379.29108.7.camel@nxp.com>
        <20171122234510.c8a90de3d689d2ea78114e72@videhug.ch>
        <CAOMZO5C4K-+nqTOQQsbO-FOAZ5o10Wps3-Fe96ikyg+s4jEAEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Fabio,

On Wed, 22 Nov 2017 20:53:33 -0200
Fabio Estevam <festevam@gmail.com> wrote:

> Hi Davide,
> 
> On Wed, Nov 22, 2017 at 8:45 PM, Davide Hug <d@videhug.ch> wrote:
> 
> > Thanks. As I understand it imx7d-sdb-sht11.dts uses gpio4 specified in
> > arch/arm/boot/dts/imx7s.dtsi, which has compatible = "fsl,imx7d-gpio",
> > "fsl,imx35-gpio".
> > I don't find a driver compatible fsl,imx7d-gpio, so I guess it is the
> > gpio/gpio-mxc.c driver compatible fsl,imx35-gpio.
> 
> Correct.

Great. Thanks!

> 
> > This driver doesn't use GPIOLIB_IRQCHIP, so I would understand why hwmon/sht15
> > loads here.
> 
> We build the kernel with imx_v6_v7_defconfig. GPIOLIB_IRQCHIP is selected there.

So the GPIOLIB_IRQCHIP code in gpiolib.c is enabled. But the driver
gpio-mxc doesn't use it. In particular it doesn't call gpiochip_add_irqchip
which assigns the .irq_request_resources/.irq_release_resources callbacks that
toggle the FLAG_USED_AS_IRQ.
So in the gpio-mxc driver the guard against setting a GPIO with active IRQ as
output is not in place. And it is this guard that makes the sht15 driver fail
to load when in place.

Thanks,
Davide
