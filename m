Return-Path: <robherring2@gmail.com>
Return-path: <robherring2@gmail.com>
Date: Fri, 7 Jul 2017 10:52:13 -0500
From: Rob Herring <robh@kernel.org>
To: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Cc: Sebastian Reichel <sre@kernel.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Lee Jones <lee.jones@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv5 2/6] dt-bindings: mfd: da9052: support TSI as ADC
Message-ID: <20170707155213.ymwz57vxw7atbzti@rob-hp-laptop>
References: <20170703084003.31184-1-sebastian.reichel@collabora.co.uk>
 <20170703084003.31184-3-sebastian.reichel@collabora.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170703084003.31184-3-sebastian.reichel@collabora.co.uk>
List-ID: <linux-hwmon@vger.kernel.org>

On Mon, Jul 03, 2017 at 10:39:59AM +0200, Sebastian Reichel wrote:
> DA9052 allows using the touchscreen input pins as general purpose
> analogue input pin by wiring analogue inputs to X+, X-, Y+ and Y-
> and providing a reference voltage at TSIREF pin.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.co.uk>
> ---
>  Documentation/devicetree/bindings/mfd/da9052-i2c.txt | 8 ++++++++
>  1 file changed, 8 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
