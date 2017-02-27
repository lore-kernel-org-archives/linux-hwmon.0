Return-path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20170227155752.b6yshpowa4ioty6a@rob-hp-laptop>
References: <1487247824-10005-1-git-send-email-marco.franchi@nxp.com> <20170227155752.b6yshpowa4ioty6a@rob-hp-laptop>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 27 Feb 2017 13:46:42 -0300
Message-ID: <CAOMZO5D9UyKpxRB_bLrDFohyofTBu=sZArVynu--Fao6PewcKg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] hwmon: (sht15) Add device tree support
To: Rob Herring <robh@kernel.org>
Cc: Marco Franchi <marco.franchi@nxp.com>, Guenter Roeck <linux@roeck-us.net>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-hwmon@vger.kernel.org,
	Marco Antonio Franchi <marcofrk@gmail.com>, FoxPeter@kabelbw.de
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-hwmon@vger.kernel.org>

Hi Rob,

On Mon, Feb 27, 2017 at 12:57 PM, Rob Herring <robh@kernel.org> wrote:

>> +Required properties:
>> +
>> + - "compatible": must be "sensirion,sht15".
>> + - "data-gpios": GPIO connected to the data line.
>> + - "clk-gpios": GPIO connected to the clock line.
>
> Looks like this device is I2C perhaps? Though I'm not sure the waveforms
> before and after transactions are compliant.

No, the SHT15 datasheet is very clear that the device does not operate
in I2C mode:
"The sensor cannot be addressed by I2C protocol".
