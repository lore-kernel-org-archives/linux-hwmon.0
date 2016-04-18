From: Lee Jones <lee.jones@linaro.org>
To: linux-hwmon@vger.kernel.org
Date: Mon, 18 Apr 2016 00:46:19 -0700
Subject: Re: [RFC 1/8] dt-bindings: mfd: Add Altera Arria10 System Resource Chip bindings
In-Reply-To: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
Message-ID: <20160418074540.GB3346@x1>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

On Fri, 15 Apr 2016, Thor Thayer wrote:
> On 03/30/2016 06:35 AM, Lee Jones wrote:
> >On Tue, 29 Mar 2016, ttha...@opensource.altera.com wrote:
> >
> >>From: Thor Thayer <ttha...@opensource.altera.com>
> >>
> >>The Altera Arria10 Devkit System Resource chip is a Multi-Function
> >>Device, it has two subdevices:
> >>      - GPIO
> >>      - HWMON
> >>
> >>This patch adds documentation for the Altera A10-SR DT bindings.
> >>
> >>Signed-off-by: Thor Thayer <ttha...@opensource.altera.com>
> >>---
> >>  .../devicetree/bindings/mfd/altera-a10sr.txt       |   35 
> >> ++++++++++++++++++++
> >>  1 file changed, 35 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/mfd/altera-a10sr.txt
> >>
> >>diff --git a/Documentation/devicetree/bindings/mfd/altera-a10sr.txt 
> >>b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
> >>new file mode 100644
> >>index 0000000..564c761
> >>--- /dev/null
> >>+++ b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
> >>@@ -0,0 +1,35 @@
> >>+* Altera Arria10 Development Kit System Resource Chip
> >>+
> >>+Required parent device properties:
> >>+- compatible : "altr,altr_a10sr"
> >>+- spi-max-frequency : Maximum SPI frequency.
> >>+- reg : the SPI Chip Select address for the Arria10 System Resource chip

[...]

> >>+           a10sr_hwmon: a10sr_hwmon {
> >
> >Device type only please.
> >
> I need to revisit where this will live (hwmon does not seem to be
> the correct place) so it will change but I can follow the format
> above if it is correct.

BTW, "hwmon" is a subsystem in Linux, therefore is a Linuxism and is
not allowed in DT.  What does the device *actually* do?

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
the body of a message to majord...@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
