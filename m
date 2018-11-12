Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:47681 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729704AbeKLKZl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 12 Nov 2018 05:25:41 -0500
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: "linux@roeck-us.net" <linux@roeck-us.net>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: add binding documentation for
 adt7475
Date: Mon, 12 Nov 2018 00:34:58 +0000
Message-ID: <7bc274d5aad04713bc068514d063b964@svr-chch-ex1.atlnz.lc>
References: <20181108225607.7521-1-chris.packham@alliedtelesis.co.nz>
 <20181108225607.7521-2-chris.packham@alliedtelesis.co.nz>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 9/11/18 11:56 AM, Chris Packham wrote:=0A=
> With the addition of the invert-pwm property the adt7475 needs its own=0A=
> binding documentation rather being captured under trivial-devices.txt.=0A=
> =0A=
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>=0A=
> ---=0A=
> Changes in v2:=0A=
> - use pwm-polarity attiribute to indicate normal or inverted polarity.=0A=
> =0A=
>   .../devicetree/bindings/hwmon/adt7475.txt     | 24 +++++++++++++++++++=
=0A=
>   .../devicetree/bindings/trivial-devices.txt   |  4 ----=0A=
>   2 files changed, 24 insertions(+), 4 deletions(-)=0A=
>   create mode 100644 Documentation/devicetree/bindings/hwmon/adt7475.txt=
=0A=
> =0A=
> diff --git a/Documentation/devicetree/bindings/hwmon/adt7475.txt b/Docume=
ntation/devicetree/bindings/hwmon/adt7475.txt=0A=
> new file mode 100644=0A=
> index 000000000000..d9212b5e9036=0A=
> --- /dev/null=0A=
> +++ b/Documentation/devicetree/bindings/hwmon/adt7475.txt=0A=
> @@ -0,0 +1,24 @@=0A=
> +*ADT7475 hwmon sensor.=0A=
> +=0A=
> +Required properties:=0A=
> +- compatible: One of=0A=
> +	"adi,adt7473"=0A=
> +	"adi,adt7475"=0A=
> +	"adi,adt7476"=0A=
> +	"adi,adt7490"=0A=
> +=0A=
> +- reg: I2C address=0A=
> +=0A=
> +optional properties:=0A=
> +=0A=
> +- pwm-polarity: This configures the polarity of the PWM. 0=0A=
> +		(PWM_POLARITY_NORMAL) uses logic high for 100% duty cycle. 1=0A=
> +                (PWM_POLARITY_INVERSED) uses logic low for 100% duty cyc=
le.=0A=
> +=0A=
> +Example:=0A=
> +=0A=
> +hwmon@2e {=0A=
> +	compatible =3D ;=0A=
=0A=
Oops. I should include a working example. I've fixed this locally but =0A=
I'll hold off on sending v3 to see if there is any additional feedback.=0A=
=0A=
> +	reg =3D <0x2e>;=0A=
> +	pwm-polarity =3D <1>;=0A=
> +};=0A=
> diff --git a/Documentation/devicetree/bindings/trivial-devices.txt b/Docu=
mentation/devicetree/bindings/trivial-devices.txt=0A=
> index 69c934aec13b..4f29100d6bbf 100644=0A=
> --- a/Documentation/devicetree/bindings/trivial-devices.txt=0A=
> +++ b/Documentation/devicetree/bindings/trivial-devices.txt=0A=
> @@ -14,10 +14,6 @@ ad,ad7414		SMBus/I2C Digital Temperature Sensor in 6-P=
in SOT with SMBus Alert an=0A=
>   ad,adm9240		ADM9240:  Complete System Hardware Monitor for uProcessor-B=
ased Systems=0A=
>   adi,adt7461		+/-1C TDM Extended Temp Range I.C=0A=
>   adt7461			+/-1C TDM Extended Temp Range I.C=0A=
> -adi,adt7473		+/-1C TDM Extended Temp Range I.C=0A=
> -adi,adt7475		+/-1C TDM Extended Temp Range I.C=0A=
> -adi,adt7476		+/-1C TDM Extended Temp Range I.C=0A=
> -adi,adt7490		+/-1C TDM Extended Temp Range I.C=0A=
>   adi,adxl345		Three-Axis Digital Accelerometer=0A=
>   adi,adxl346		Three-Axis Digital Accelerometer (backward-compatibility v=
alue "adi,adxl345" must be listed too)=0A=
>   ams,iaq-core		AMS iAQ-Core VOC Sensor=0A=
> =0A=
=0A=
