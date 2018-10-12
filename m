Return-Path: <robherring2@gmail.com>
Return-path: <robherring2@gmail.com>
Date: Fri, 12 Oct 2018 15:11:28 -0500
From: Rob Herring <robh@kernel.org>
To: Kun Yi <kunyi@google.com>
Cc: linux@roeck-us.net, linux-hwmon@vger.kernel.org, jdelvare@suse.com,
	mark.rutland@arm.com, devicetree@vger.kernel.org,
	rlippert@google.com, benjaminfair@google.com,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH v2] hwmon: (adm1275): Add device tree param for shunt
 resistor
Message-ID: <20181012201128.GA13628@bogus>
References: <20180928195800.153914-1-kunyi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180928195800.153914-1-kunyi@google.com>
List-ID: <linux-hwmon@vger.kernel.org>

On Fri, Sep 28, 2018 at 12:58:00PM -0700, Kun Yi wrote:
> The ADM series of hotswap controllers support extending
> the current measurement range by using a sensing resistor
> value other than the typical 1 mOhm. For example, using a 0.5 mOhm
> sensing resistor doubles the maximal current can be measured.
> 
> Current driver assumes a shunt resistor value of 1 mOhm in calculation,
> meaning for other resistor values, hwmon will report scaled
> current/power measurements. This patch adds a device tree parameter so
> that individual boards can configure its shunt resistor value.
> 
> Signed-off-by: Kun Yi <kunyi@google.com>
> ---
>  .../devicetree/bindings/hwmon/adm1275.txt     | 25 +++++++++++++++++++

This should be a separate patch. In particular, the subject doesn't 
really reflect that you are adding a new binding.

Otherwise, the binding looks fine.

>  Documentation/hwmon/adm1275                   |  3 +++
>  drivers/hwmon/pmbus/adm1275.c                 | 15 +++++++++--
>  3 files changed, 41 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adm1275.txt
