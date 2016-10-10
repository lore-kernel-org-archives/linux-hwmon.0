Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from gate2.alliedtelesis.co.nz ([202.36.163.20]:52775 "EHLO
        gate2.alliedtelesis.co.nz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751638AbcJJVZj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 10 Oct 2016 17:25:39 -0400
From: Mahoda Ratnayaka <Mahoda.Ratnayaka@alliedtelesis.co.nz>
To: Rob Herring <robh@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v2] Documentation: dtb: lm87: Add hwmon binding
 documentation.
Date: Mon, 10 Oct 2016 21:25:33 +0000
Message-ID: <1476134733241.14174@alliedtelesis.co.nz>
References: <20161004005123.2004-1-mahoda.ratnayaka@alliedtelesis.co.nz>,<20161009012911.GQ18158@rob-hp-laptop>
In-Reply-To: <20161009012911.GQ18158@rob-hp-laptop>
Content-Language: en-NZ
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Rob,=0A=
=0A=
Thank you for the comments, I'll address them and send back another patch s=
hortly.=0A=
=0A=
As, for your question about " These need vendor prefixes. Or would they app=
ly for multiple vendors of LM87?"=0A=
=0A=
The driver is shared between the ADM1024 H/W monitoring sensor and LM87 sen=
sor, and both of them have the=0A=
same pin configuration for setting the channel mode register.  So, I don't =
think vendor prefixes are applicable for=0A=
this case.=0A=
=0A=
Thanks,=0A=
Mahoda=0A=
________________________________________=0A=
From: Rob Herring <robh@kernel.org>=0A=
Sent: Sunday, 9 October 2016 2:29 p.m.=0A=
To: Mahoda Ratnayaka=0A=
Cc: devicetree@vger.kernel.org; Mark Rutland; linux-hwmon@vger.kernel.org; =
Chris Packham=0A=
Subject: Re: [PATCH v2] Documentation: dtb: lm87: Add hwmon binding documen=
tation.=0A=
=0A=
On Tue, Oct 04, 2016 at 01:51:23PM +1300, Mahoda Ratnayaka wrote:=0A=
> This patch adds lm87 hwmon device tree node documentation.=0A=
>=0A=
> Signed-off-by: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>=0A=
> ---=0A=
>=0A=
> Notes:=0A=
>     Changes since v1:=0A=
>      As suggested include all the changes are moved in=0A=
>      to the same patch and the all the optional properties=0A=
>      are now defined instead of using a single variable to=0A=
>      indicate those properties.=0A=
>=0A=
>  Documentation/devicetree/bindings/hwmon/lm87.txt | 29 ++++++++++++++++++=
++++++=0A=
>  1 file changed, 29 insertions(+)=0A=
>  create mode 100644 Documentation/devicetree/bindings/hwmon/lm87.txt=0A=
>=0A=
> diff --git a/Documentation/devicetree/bindings/hwmon/lm87.txt b/Documenta=
tion/devicetree/bindings/hwmon/lm87.txt=0A=
> new file mode 100644=0A=
> index 0000000..ac578fff=0A=
> --- /dev/null=0A=
> +++ b/Documentation/devicetree/bindings/hwmon/lm87.txt=0A=
> @@ -0,0 +1,29 @@=0A=
> +*LM87 hwmon sensor.=0A=
> +=0A=
> +Required properties:=0A=
> +- compatible: Should be=0A=
> +     "ti,lm87"=0A=
> +=0A=
> +- reg: I2C address=0A=
> +=0A=
> +optional properties:=0A=
> +- has-temp3: This configures pins 18 and 19 to be used as a second=0A=
> +             remote temperature sensing channel. By default the pins=0A=
> +             are configured as voltage input pins in0 and in5.=0A=
> +=0A=
> +- has-in6: When set, pin 5 is configured to be used as voltage input=0A=
> +           in6. Otherwise the pin is set as FAN1 input.=0A=
> +=0A=
> +- has-in7: When set, pin 6 is configured to be used as voltage input=0A=
> +           in6. Otherwise the pin is set as FAN2 input.=0A=
=0A=
Should be in7 ^^^?=0A=
=0A=
These need vendor prefixes. Or would they apply for multiple vendors of=0A=
LM87?=0A=
=0A=
> +=0A=
> +- has-vcc-5v: sets the nominal voltage for internal VCC measurement to 5=
V.=0A=
> +              Default is 3.3V.=0A=
=0A=
This is set to what the supply voltage is? If so, use the regulator=0A=
binding.=0A=
=0A=
> +=0A=
> +Example:=0A=
> +=0A=
> +lm87@2e {=0A=
> +     compatible =3D "ti,lm87";=0A=
> +     reg =3D <0x2e>;=0A=
> +     has-temp3;=0A=
> +};=0A=
> --=0A=
> 2.10.0=0A=
>=0A=
