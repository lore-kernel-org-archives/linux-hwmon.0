From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Date: Sat, 05 Jan 2019 09:06:22 -0800
Subject: Re: [PATCH 2/4] dt-bindings: power supply: Document dps650ab
In-Reply-To: <cover.1546591275.git.xiaoting.liu@hxt-semitech.com>
Message-ID: <20190105170518.GA1879@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

On Fri, Jan 04, 2019 at 05:00:30PM +0800, Xiaoting Liu wrote:
> Bindings for DPS650AB power, voltage, temperature, and fan monitering.
> 

Misleading subject. While the DPS650AB may ber a power supply,
it is a PMBus hwmon driver, and should be marked accordingly in the subject.

Guenter

> Signed-off-by: Xiaoting Liu <xiaoting....@hxt-semitech.com>
> ---
>  Documentation/devicetree/bindings/hwmon/dps650ab.txt | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> --
> 1.8.3.1
> 
> 
> 
> 
> This email is intended only for the named addressee. It may contain 
> information that is confidential/private, legally privileged, or 
> copyright-protected, and you should handle it accordingly. If you are not the 
> intended recipient, you do not have legal rights to retain, copy, or 
> distribute this email or its contents, and should promptly delete the email 
> and all electronic copies in your system; do not retain copies in any media. 
> If you have received this email in error, please notify the sender promptly. 
> Thank you.
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/dps650ab.txt 
> b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
> new file mode 100644
> index 000000000000..bbd601100e66
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/dps650ab.txt
> @@ -0,0 +1,11 @@
> +Bindings for DPS650AB power, voltage, temperature, and fan monitering
> +
> +Required properties:
> +- compatible : "dps650ab"
> +- reg        : I2C address, one of 0x58, 0x59.
> +
> +Example:
> +       dps650ab@58 {
> +                   compatible = "dps650ab";
> +                   reg = <0x58>;
> +       };
