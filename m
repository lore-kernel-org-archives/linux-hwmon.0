Return-Path: <d@videhug.ch>
Return-path: <d@videhug.ch>
Date: Tue, 21 Nov 2017 00:28:49 +0100
From: Davide Hug <d@videhug.ch>
To: Marco Franchi <marco.franchi@nxp.com>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "arm@kernel.org" <arm@kernel.org>, "jic23@cam.ac.uk" <jic23@cam.ac.uk>,
 "jdelvare@suse.com" <jdelvare@suse.com>, "linux@roeck-us.net"
 <linux@roeck-us.net>, "jic23@kernel.org" <jic23@kernel.org>
Subject: Re: [PATCH v2] hwmon/sht15: Root out platform data
Message-Id: <20171121002849.776d585b9eb3f9f6b04387a0@videhug.ch>
In-Reply-To: <HE1PR0402MB35625D52800B1810FDFB8774F6680@HE1PR0402MB3562.eurprd04.prod.outlook.com>
References: <20170910094446.3154-1-linus.walleij@linaro.org>
	<CAOMZO5D_m=4UKBBGb0-jurDib+g+v82ATMHbiRGhvTSsfz1P6w@mail.gmail.com>
	<CAM4PwSWtxU+87HxP7k3-4qgt4E_q3cS5EZoKjNP7_rh43XJJhg@mail.gmail.com>
	<HE1PR0402MB3562DEEDDCA16F6B8E04CA2FF6680@HE1PR0402MB3562.eurprd04.prod.outlook.com>
	<HE1PR0402MB35625D52800B1810FDFB8774F6680@HE1PR0402MB3562.eurprd04.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Sorry for the delayed question.

On Mon, 11 Sep 2017 17:35:35 +0000
Marco Franchi <marco.franchi@nxp.com> wrote:

> I tested it using the i.MX 7D SABRE-SD and device tree support and it works good.

It would be great if you could tell me what GPIO driver this platform uses?
I would like to check if I understand when the sht15 driver fails to load and
when it loads.

Thanks,
Davide
