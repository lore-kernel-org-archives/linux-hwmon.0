Return-path: <robherring2@gmail.com>
Date: Mon, 9 Jan 2017 23:35:28 -0600
From: Rob Herring <robh@kernel.org>
To: Alexander Koch <mail@alexanderkoch.net>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Michael Hornung <mhornung.linux@gmail.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/4] devicetree: hwmon: Add bindings for ADC128D818
Message-ID: <20170110053528.ksuuxoci5rgjp6pw@rob-hp-laptop>
References: <20170106103817.11588-1-mail@alexanderkoch.net>
 <20170106103817.11588-2-mail@alexanderkoch.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170106103817.11588-2-mail@alexanderkoch.net>
List-ID: <linux-hwmon@vger.kernel.org>

On Fri, Jan 06, 2017 at 11:38:14AM +0100, Alexander Koch wrote:
> Add bindings documentation for the ADC128D818 driver, featuring default I2C
> properties along with the optional 'mode' property for chip operation mode
> selection (see datasheet, sec. 8.4.1).
> 
> Signed-off-by: Alexander Koch <mail@alexanderkoch.net>
> Acked-by: Michael Hornung <mhornung.linux@gmail.com>
> ---
>  .../devicetree/bindings/hwmon/adc128d818.txt       | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adc128d818.txt

Acked-by: Rob Herring <robh@kernel.org>
