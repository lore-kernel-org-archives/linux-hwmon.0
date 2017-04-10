Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:36024 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753816AbdDJPmv (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Apr 2017 11:42:51 -0400
Date: Mon, 10 Apr 2017 10:42:49 -0500
From: Rob Herring <robh@kernel.org>
To: John Muir <john@jmuir.com>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Pawel Moll <pawel.moll@arm.com>,
        Ian Campbell <ijc+devicetree@hellion.org.uk>,
        Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        Anatol Pomazau <anatol@google.com>,
        Mark Segal <segal@google.com>
Subject: Re: [PATCH 2/2] devicetree: Document the max31760 device binding.
Message-ID: <20170410154249.r77b6vf3ctzn4kua@rob-hp-laptop>
References: <20170404192034.158901-1-john@jmuir.com>
 <20170404192034.158901-3-john@jmuir.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170404192034.158901-3-john@jmuir.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Apr 04, 2017 at 12:20:34PM -0700, John Muir wrote:
> Signed-off-by: John Muir <john@jmuir.com>
> ---
>  .../devicetree/bindings/hwmon/max31760.txt         | 58 ++++++++++++++++++++++
>  1 file changed, 58 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/max31760.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/max31760.txt b/Documentation/devicetree/bindings/hwmon/max31760.txt
> new file mode 100644
> index 000000000000..43787a77c322
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/max31760.txt
> @@ -0,0 +1,58 @@
> +MAX31760 fan controller
> +-----------------------
> +
> +This device supports I2C only. Many properties of this device are configurable
> +thorugh the hwmon interface. See also Documentation/hwmon/max31760.

I really think we need to describe the fans as separate nodes and 
preferably with a common binding. This is the second fan controller 
binding recently[1].

Features of the "hwmon interface" are not relevant to the binding. 
Bindings describe h/w.

> +
> +Required node properties:
> +- compatible : "maxim,max31760"
> +- reg : The I2C address of the device. This is 0x50 - 0x57 depending on the
> +	hardware configuration.
> +
> +Optional node properties:
> +- maxim,fan1-enabled		- 1 to enable, 0 to disable. Default: 1.
> +- maxim,fan2-enabled		- 1 to enable, 0 to disable. Default: 1.
> +- maxim,fan1-label		- String: Hwmon fan1_label.
> +- maxim,fan2-label		- String: Hwmon fan2_label.

Perhaps 2 fan sub nodes. reg for fan number, status for enabled, and 
label for label.

> +- maxim,fan-fail-full-only	- Set to 1 to assert a fan failure only when the
> +				  PWM is at 100%. Default: 0.

Make this a boolean.

> +- maxim,fan-rd-signal		- Set to 1 if fan(s) provide a rotation
> +				  detection (RD) signal, or 0 if the fan
> +				  generates square-wave pulses. Default: 0.

Make this a boolean.

> +- maxim,fan-rd-polarity		- 0: RD is low when the fan is running.
> +				  1: RD is high when the fan is running.
> +				  Only relevant when fan-rd-signal is 1.
> +				  Default: 0.
> +- maxim,fan-signal-enabled	- Set to 1 if externally driving FF/FS low
> +				  should force PWM output to 100%. Default: 0.
> +- maxim,fan-spin-up-enabled     - For fan startup: Set to 1 to set the PWM to
> +				  100% until tach is detected or two seconds
> +				  have passed before reducing to the target
> +				  value. Default: 0.
> +- maxim,pwm-polarity		- 0: 100% PWM is when PWM is high.
> +				  1: 100% PWM is when PWM is low.
> +				  Default: 0.
> +- maxim,pwm-pulse-stretch-enabled
> +				- 1 to enable PWM pulse stretching, 0 to
> +				  disable. Default: 0.
> +- maxim,pwm-zero-fan-can-fail	- 0: Fan failure detection disabled when PWM is
> +				     ramping to 0%.
> +				  1: Fan failure detection enabled for all PWM
> +				     values.
> +				  Default: 0.

All these can be boolean...

> +- maxim,temp1-label		- String: Hwmon temp1_label.
> +- maxim,temp2-label		- String: Hwmon temp2_label.
> +- maxim,temp2-ideality		- Set ideality factor for the remote temperature
> +				  sensor. Integer with range 0 to 63,
> +				  representing a multiplication factor of 0.9844
> +				  to 1.0489. Default: 24 (1.0080).

No maxim,temp1-ideality? Not sure what to do with these, but perhaps 
also as sub-nodes. Surely we have some bindings already for devices with 
multiple temp sensors. Don't invent something custom here.

Rob
