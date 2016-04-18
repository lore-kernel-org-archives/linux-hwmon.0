From: Thor Thayer <tthayer@opensource.altera.com>
To: linux-hwmon@vger.kernel.org
Date: Mon, 18 Apr 2016 07:51:08 -0700
Subject: Re: [RFC 1/8] dt-bindings: mfd: Add Altera Arria10 System Resource Chip bindings
In-Reply-To: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
Message-ID: <5714F569.807@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>


Hi Lee,

On 04/18/2016 02:43 AM, Lee Jones wrote:

On Fri, 15 Apr 2016, Thor Thayer wrote:

On 03/30/2016 06:35 AM, Lee Jones wrote:

On Tue, 29 Mar 2016, ttha...@opensource.altera.com wrote:


From: Thor Thayer <ttha...@opensource.altera.com>
To: linux-hwmon@vger.kernel.org

The Altera Arria10 Devkit System Resource chip is a Multi-Function
Device, it has two subdevices:
      - GPIO
      - HWMON

This patch adds documentation for the Altera A10-SR DT bindings.

Signed-off-by: Thor Thayer <ttha...@opensource.altera.com>
---
  .../devicetree/bindings/mfd/altera-a10sr.txt       |   35 ++++++++++++++++++++
  1 file changed, 35 insertions(+)
  create mode 100644 Documentation/devicetree/bindings/mfd/altera-a10sr.txt

diff --git a/Documentation/devicetree/bindings/mfd/altera-a10sr.txt 
b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
new file mode 100644
index 0000000..564c761
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
@@ -0,0 +1,35 @@
+* Altera Arria10 Development Kit System Resource Chip
+
+Required parent device properties:
+- compatible : "altr,altr_a10sr"
+- spi-max-frequency : Maximum SPI frequency.
+- reg : the SPI Chip Select address for the Arria10 System Resource chip


DT bindings are much easier to read in the following format:

- compatible            : "altr,altr_a10sr"
- spi-max-frequency     : Maximum SPI frequency.
- reg                   : the SPI Chip Select address for the Arria10 System 
Resource chip

... also, sentences start with an uppercase char.


+The A10SR consists of this varied group of sub-devices:
+
+Device                   Description
+------                   ----------
+altr_a10sr_gpio          GPIO Controller
+altr_a10sr_hwmon         Hardware Monitor
+
+The LEDs are implemented entirely in the device tree using
+the gpio-led framework.


This is a Linuxisum and should not live in DT bindings.


+Example:
+
+        a10-sr: a10-sr@0 {


Nodes should be named after their device 'type'.

Does this device really start a address 0?



I see in the documentation on device trees there are a number of
categories I can use. GPIO is easy because it is one of the
categories but I'm not sure about the new device I'm adding since
the a10sr is a new device.


It's always difficult with MFDs as they are by their very nature, more
than one device.  But how about 'resource-manager'?


OK. Yes, that would be a good name. Thanks.


I believe I should only call out the name and address on the SPI bus like:

a10sr@0 {


Correct.


+               compatible = "altr,altr-a10sr";
+               reg = <0>;
+               spi-max-frequency = <100000>;
+
+               a10sr_gpio: a10sr_gpio {


Device type only please.



and this would be a10sr_gpio: gpio-controller {

Does that seem correct?


Also correct.  No address though?



Thank you. It is at a fixed address inside the SPI device. When making 
this binding I followed the format of other gpio controllers like the 
tps65086 and lp3943 which didn't have an address.


Thanks for the clarification.


+                       compatible = "altr,a10sr-gpio";
+                       gpio-controller;
+                       #gpio-cells = <2>;
+                       ngpios = <16>;
+               };
+
+               a10sr_hwmon: a10sr_hwmon {


Device type only please.


I need to revisit where this will live (hwmon does not seem to be
the correct place) so it will change but I can follow the format
above if it is correct.

Thanks for reviewing.


+                       compatible = "altr,a10sr-hwmon";
+               };
+       };





--
To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
the body of a message to majord...@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
