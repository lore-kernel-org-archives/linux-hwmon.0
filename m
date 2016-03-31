Return-path: <robh@kernel.org>
Date: Thu, 31 Mar 2016 09:06:51 -0500
From: Rob Herring <robh@kernel.org>
To: Lee Jones <lee.jones@linaro.org>, tthayer@opensource.altera.com
Cc: linus.walleij@linaro.org, gnurou@gmail.com, jdelvare@suse.com,
	linux@roeck-us.net, pawell.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, dinguyen@opensource.altera.com,
	linux-gpio@vger.kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC 1/8] dt-bindings: mfd: Add Altera Arria10 System Resource
 Chip bindings
Message-ID: <20160331140651.GA2193@rob-hp-laptop>
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
 <1459278791-3646-2-git-send-email-tthayer@opensource.altera.com>
 <20160330113532.GI3323@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160330113532.GI3323@x1>
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, Mar 30, 2016 at 12:35:32PM +0100, Lee Jones wrote:
> On Tue, 29 Mar 2016, tthayer@opensource.altera.com wrote:
> 
> > From: Thor Thayer <tthayer@opensource.altera.com>
> > 
> > The Altera Arria10 Devkit System Resource chip is a Multi-Function
> > Device, it has two subdevices:
> >      - GPIO
> >      - HWMON
> > 
> > This patch adds documentation for the Altera A10-SR DT bindings.
> > 
> > Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
> > ---
> >  .../devicetree/bindings/mfd/altera-a10sr.txt       |   35 ++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/altera-a10sr.txt
> > 
> > diff --git a/Documentation/devicetree/bindings/mfd/altera-a10sr.txt b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
> > new file mode 100644
> > index 0000000..564c761
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
> > @@ -0,0 +1,35 @@
> > +* Altera Arria10 Development Kit System Resource Chip
> > +
> > +Required parent device properties:
> > +- compatible : "altr,altr_a10sr"

Why "altr" twice?

Don't use underscores.

> > +- spi-max-frequency : Maximum SPI frequency.
> > +- reg : the SPI Chip Select address for the Arria10 System Resource chip
> 
> DT bindings are much easier to read in the following format:
> 
> - compatible		: "altr,altr_a10sr"
> - spi-max-frequency	: Maximum SPI frequency.
> - reg			: the SPI Chip Select address for the Arria10 System Resource chip
> 
> ... also, sentences start with an uppercase char.
> 
> > +The A10SR consists of this varied group of sub-devices:
> > +
> > +Device                   Description
> > +------                   ----------
> > +altr_a10sr_gpio          GPIO Controller
> > +altr_a10sr_hwmon         Hardware Monitor
> > +
> > +The LEDs are implemented entirely in the device tree using
> > +the gpio-led framework.
> 
> This is a Linuxisum and should not live in DT bindings.
> 
> > +Example:
> > +
> > +        a10-sr: a10-sr@0 {
> 
> Nodes should be named after their device 'type'.
> 
> Does this device really start a address 0?

Being a SPI device, I imagine so.
