Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from s067.cyon.net ([149.126.4.76]:35548 "EHLO s067.cyon.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750916AbdKYJsG (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 25 Nov 2017 04:48:06 -0500
Date: Sat, 25 Nov 2017 10:48:00 +0100
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
Message-Id: <20171125104800.d74543155c3a61f00c4cbad9@videhug.ch>
In-Reply-To: <20171125104126.67e9096572a108a2f183d9a8@videhug.ch>
References: <20170910094446.3154-1-linus.walleij@linaro.org>
        <CAOMZO5D_m=4UKBBGb0-jurDib+g+v82ATMHbiRGhvTSsfz1P6w@mail.gmail.com>
        <CAM4PwSWtxU+87HxP7k3-4qgt4E_q3cS5EZoKjNP7_rh43XJJhg@mail.gmail.com>
        <HE1PR0402MB3562DEEDDCA16F6B8E04CA2FF6680@HE1PR0402MB3562.eurprd04.prod.outlook.com>
        <HE1PR0402MB35625D52800B1810FDFB8774F6680@HE1PR0402MB3562.eurprd04.prod.outlook.com>
        <20171121002849.776d585b9eb3f9f6b04387a0@videhug.ch>
        <1511279379.29108.7.camel@nxp.com>
        <20171122234510.c8a90de3d689d2ea78114e72@videhug.ch>
        <CAOMZO5C4K-+nqTOQQsbO-FOAZ5o10Wps3-Fe96ikyg+s4jEAEQ@mail.gmail.com>
        <20171125010340.97aa0df241720c59eacc4e27@videhug.ch>
        <CAOMZO5DHWrhK1Sj3-svh+VxBUvakiFd1q63BZ_UHFkA7R=nhjw@mail.gmail.com>
        <20171125104126.67e9096572a108a2f183d9a8@videhug.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sat, 25 Nov 2017 10:41:26 +0100
Davide Hug <d@videhug.ch> wrote:

> Hi Estevam

Hi Fabio,

sorry for that.

> 
> On Sat, 25 Nov 2017 00:06:44 -0200
> Fabio Estevam <festevam@gmail.com> wrote:
> 
> > Hi Davide,
> > 
> > On Fri, Nov 24, 2017 at 10:03 PM, Davide Hug <d@videhug.ch> wrote:
> > 
> > > So the GPIOLIB_IRQCHIP code in gpiolib.c is enabled. But the driver
> > > gpio-mxc doesn't use it. In particular it doesn't call gpiochip_add_irqchip
> > > which assigns the .irq_request_resources/.irq_release_resources callbacks that
> > > toggle the FLAG_USED_AS_IRQ.
> > > So in the gpio-mxc driver the guard against setting a GPIO with active IRQ as
> > > output is not in place. And it is this guard that makes the sht15 driver fail
> > > to load when in place.
> > 
> > What is the gpio driver you are using that shows the error?
> 
> The following two drivers:
> 
>   - gpio/gpio-omap (on the beaglebone black)
>   - pinctrl/bcm/pinctrl-bcm2835 (on the raspberry pi 2).
> 
> Where pinctrl-bcm2835 has to include commit
> 85ae9e512f437cd09bf61564bdba29ab88bab3e3 where the driver was converted to
> using the GPIOLIB_IRQCHIP helper library.
> 
> Regards
> Davide
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
