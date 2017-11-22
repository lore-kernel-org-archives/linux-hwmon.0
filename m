Return-Path: <festevam@gmail.com>
Return-path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20171122234510.c8a90de3d689d2ea78114e72@videhug.ch>
References: <20170910094446.3154-1-linus.walleij@linaro.org>
 <CAOMZO5D_m=4UKBBGb0-jurDib+g+v82ATMHbiRGhvTSsfz1P6w@mail.gmail.com>
 <CAM4PwSWtxU+87HxP7k3-4qgt4E_q3cS5EZoKjNP7_rh43XJJhg@mail.gmail.com>
 <HE1PR0402MB3562DEEDDCA16F6B8E04CA2FF6680@HE1PR0402MB3562.eurprd04.prod.outlook.com>
 <HE1PR0402MB35625D52800B1810FDFB8774F6680@HE1PR0402MB3562.eurprd04.prod.outlook.com>
 <20171121002849.776d585b9eb3f9f6b04387a0@videhug.ch> <1511279379.29108.7.camel@nxp.com>
 <20171122234510.c8a90de3d689d2ea78114e72@videhug.ch>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 22 Nov 2017 20:53:33 -0200
Message-ID: <CAOMZO5C4K-+nqTOQQsbO-FOAZ5o10Wps3-Fe96ikyg+s4jEAEQ@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon/sht15: Root out platform data
To: Davide Hug <d@videhug.ch>
Cc: Marco Franchi <marco.franchi@nxp.com>, "linux@roeck-us.net" <linux@roeck-us.net>,
	"arm@kernel.org" <arm@kernel.org>, "jic23@cam.ac.uk" <jic23@cam.ac.uk>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>, "jdelvare@suse.com" <jdelvare@suse.com>,
	"jic23@kernel.org" <jic23@kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

Hi Davide,

On Wed, Nov 22, 2017 at 8:45 PM, Davide Hug <d@videhug.ch> wrote:

> Thanks. As I understand it imx7d-sdb-sht11.dts uses gpio4 specified in
> arch/arm/boot/dts/imx7s.dtsi, which has compatible = "fsl,imx7d-gpio",
> "fsl,imx35-gpio".
> I don't find a driver compatible fsl,imx7d-gpio, so I guess it is the
> gpio/gpio-mxc.c driver compatible fsl,imx35-gpio.

Correct.

> This driver doesn't use GPIOLIB_IRQCHIP, so I would understand why hwmon/sht15
> loads here.

We build the kernel with imx_v6_v7_defconfig. GPIOLIB_IRQCHIP is selected there.

Regards,

Fabio Estevam
