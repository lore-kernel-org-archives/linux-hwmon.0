From: Thor Thayer <tthayer@opensource.altera.com>
To: linux-hwmon@vger.kernel.org
Date: Mon, 18 Apr 2016 08:07:25 -0700
Subject: Re: [RFC 1/8] dt-bindings: mfd: Add Altera Arria10 System Resource Chip bindings
In-Reply-To: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
Message-ID: <5714F942.5040309@opensource.altera.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>


Hi Lee,

On 04/18/2016 02:45 AM, Lee Jones wrote:

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


[...]


+               a10sr_hwmon: a10sr_hwmon {


Device type only please.


I need to revisit where this will live (hwmon does not seem to be
the correct place) so it will change but I can follow the format
above if it is correct.


BTW, "hwmon" is a subsystem in Linux, therefore is a Linuxism and is
not allowed in DT.  What does the device *actually* do?



OK. I'll be careful not to introduce the Linux subsystem name.

This module indicates whether the power supplies are at the correct 
voltage. It uses a boolean instead of giving an actual voltage value as 
required by HWMON. In other words it is a comparator instead of an 
Analog-to-Digital Converter.


I could call it a power supply supervisor or voltage status monitor but 
it only acts in a passive role. There is no output to trigger an error - 
only polling, so supervisor doesn't seem like a good name.


Maybe something like this?

        power_supply_status {
                compatible = "altr,a10sr-hwmon";
        }

Thanks for reviewing and helping me figure out the device tree naming.
--
To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
the body of a message to majord...@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
