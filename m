Return-Path: <d@videhug.ch>
Return-path: <d@videhug.ch>
Date: Wed, 22 Nov 2017 23:45:10 +0100
From: Davide Hug <d@videhug.ch>
To: Marco Franchi <marco.franchi@nxp.com>
Cc: "linux@roeck-us.net" <linux@roeck-us.net>, "arm@kernel.org"
 <arm@kernel.org>, "jic23@cam.ac.uk" <jic23@cam.ac.uk>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "jdelvare@suse.com"
 <jdelvare@suse.com>, "jic23@kernel.org" <jic23@kernel.org>
Subject: Re: [PATCH v2] hwmon/sht15: Root out platform data
Message-Id: <20171122234510.c8a90de3d689d2ea78114e72@videhug.ch>
In-Reply-To: <1511279379.29108.7.camel@nxp.com>
References: <20170910094446.3154-1-linus.walleij@linaro.org>
	<CAOMZO5D_m=4UKBBGb0-jurDib+g+v82ATMHbiRGhvTSsfz1P6w@mail.gmail.com>
	<CAM4PwSWtxU+87HxP7k3-4qgt4E_q3cS5EZoKjNP7_rh43XJJhg@mail.gmail.com>
	<HE1PR0402MB3562DEEDDCA16F6B8E04CA2FF6680@HE1PR0402MB3562.eurprd04.prod.outlook.com>
	<HE1PR0402MB35625D52800B1810FDFB8774F6680@HE1PR0402MB3562.eurprd04.prod.outlook.com>
	<20171121002849.776d585b9eb3f9f6b04387a0@videhug.ch>
	<1511279379.29108.7.camel@nxp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On Tue, 21 Nov 2017 15:49:39 +0000
Marco Franchi <marco.franchi@nxp.com> wrote:

> On Ter, 2017-11-21 at 00:28 +0100, Davide Hug wrote:
> > Sorry for the delayed question.
> > 
> > On Mon, 11 Sep 2017 17:35:35 +0000
> > Marco Franchi <marco.franchi@nxp.com> wrote:
> > 
> > > 
> > > I tested it using the i.MX 7D SABRE-SD and device tree support and
> > > it works good.
> > It would be great if you could tell me what GPIO driver this platform
> > uses?
> > I would like to check if I understand when the sht15 driver fails to
> > load and
> > when it loads.
> Hi Davide,
> 
> Please, check if this dts file can help you:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm
> it/?h=v4.14&id=fd1eb46c382a69d0fbad85def3a2f3008a76efc1

Thanks. As I understand it imx7d-sdb-sht11.dts uses gpio4 specified in
arch/arm/boot/dts/imx7s.dtsi, which has compatible = "fsl,imx7d-gpio",
"fsl,imx35-gpio".
I don't find a driver compatible fsl,imx7d-gpio, so I guess it is the
gpio/gpio-mxc.c driver compatible fsl,imx35-gpio.
This driver doesn't use GPIOLIB_IRQCHIP, so I would understand why hwmon/sht15
loads here.

Thanks,
Davide
