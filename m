Return-Path: <SRS0=ADoj=2I=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46111C43603
	for <linux-hwmon@archiver.kernel.org>; Wed, 18 Dec 2019 23:12:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 18DF5218AC
	for <linux-hwmon@archiver.kernel.org>; Wed, 18 Dec 2019 23:12:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726817AbfLRXMt (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Wed, 18 Dec 2019 18:12:49 -0500
Received: from mga14.intel.com ([192.55.52.115]:40198 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726569AbfLRXMt (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 18 Dec 2019 18:12:49 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Dec 2019 15:12:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; 
   d="scan'208";a="365887756"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.143]) ([10.7.153.143])
  by orsmga004.jf.intel.com with ESMTP; 18 Dec 2019 15:12:47 -0800
Subject: Re: [PATCH v11 01/14] dt-bindings: Add PECI subsystem document
To:     Rob Herring <robh@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jonathan Corbet <corbet@lwn.net>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "Darrick J . Wong" <darrick.wong@oracle.com>,
        Eric Sandeen <sandeen@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>, Wu Hao <hao.wu@intel.com>,
        Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
        "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
        Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
        "David S . Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Vinod Koul <vkoul@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        David Kershner <david.kershner@unisys.com>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Johan Hovold <johan@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Juergen Gross <jgross@suse.com>,
        Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
        Tomer Maimon <tmaimon77@gmail.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        openbmc@lists.ozlabs.org
References: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
 <20191211194624.2872-2-jae.hyun.yoo@linux.intel.com>
 <20191218025240.GA6601@bogus>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <f6ff2cc5-a906-88ac-2b47-351a8a0770bf@linux.intel.com>
Date:   Wed, 18 Dec 2019 15:12:47 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191218025240.GA6601@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Rob,

On 12/17/2019 6:52 PM, Rob Herring wrote:
> On Wed, Dec 11, 2019 at 11:46:11AM -0800, Jae Hyun Yoo wrote:
>> This commit adds PECI subsystem document.
>>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Andrew Jeffery <andrew@aj.id.au>
>> Cc: Joel Stanley <joel@jms.id.au>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> ---
>> Changes since v10:
>> - Changed documents format to DT schema format so I dropped all review tags.
>>    Please review it again.
>>
>>   .../devicetree/bindings/peci/peci-bus.yaml    | 129 ++++++++++++++++++
>>   .../devicetree/bindings/peci/peci-client.yaml |  54 ++++++++
>>   2 files changed, 183 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/peci/peci-bus.yaml
>>   create mode 100644 Documentation/devicetree/bindings/peci/peci-client.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/peci/peci-bus.yaml b/Documentation/devicetree/bindings/peci/peci-bus.yaml
>> new file mode 100644
>> index 000000000000..b085e67089cf
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/peci/peci-bus.yaml
>> @@ -0,0 +1,129 @@
>> +# SPDX-License-Identifier: GPL-2.0
> 
> Dual license new bindings please:
> 
> (GPL-2.0-only OR BSD-2-Clause)

I see. I'll replace that with it for all new bindings in this patch set.

>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/peci/peci-bus.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Generic Device Tree Bindings for PECI bus
>> +
>> +maintainers:
>> +  - Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> +
>> +description: |
>> +  PECI (Platform Environment Control Interface) is a one-wire bus interface that
>> +  provides a communication channel from Intel processors and chipset components
>> +  to external monitoring or control devices. PECI is designed to support the
>> +  following sideband functions:
>> +
>> +  * Processor and DRAM thermal management
>> +    - Processor fan speed control is managed by comparing Digital Thermal
>> +      Sensor (DTS) thermal readings acquired via PECI against the
>> +      processor-specific fan speed control reference point, or TCONTROL. Both
>> +      TCONTROL and DTS thermal readings are accessible via the processor PECI
>> +      client. These variables are referenced to a common temperature, the TCC
>> +      activation point, and are both defined as negative offsets from that
>> +      reference.
>> +    - PECI based access to the processor package configuration space provides
>> +      a means for Baseboard Management Controllers (BMC) or other platform
>> +      management devices to actively manage the processor and memory power
>> +      and thermal features.
>> +
>> +  * Platform Manageability
>> +    - Platform manageability functions including thermal, power, and error
>> +      monitoring. Note that platform 'power' management includes monitoring
>> +      and control for both the processor and DRAM subsystem to assist with
>> +      data center power limiting.
>> +    - PECI allows read access to certain error registers in the processor MSR
>> +      space and status monitoring registers in the PCI configuration space
>> +      within the processor and downstream devices.
>> +    - PECI permits writes to certain registers in the processor PCI
>> +      configuration space.
>> +
>> +  * Processor Interface Tuning and Diagnostics
>> +    - Processor interface tuning and diagnostics capabilities
>> +      (Intel Interconnect BIST). The processors Intel Interconnect Built In
>> +      Self Test (Intel IBIST) allows for infield diagnostic capabilities in
>> +      the Intel UPI and memory controller interfaces. PECI provides a port to
>> +      execute these diagnostics via its PCI Configuration read and write
>> +      capabilities.
>> +
>> +  * Failure Analysis
>> +    - Output the state of the processor after a failure for analysis via
>> +      Crashdump.
>> +
>> +  PECI uses a single wire for self-clocking and data transfer. The bus
>> +  requires no additional control lines. The physical layer is a self-clocked
>> +  one-wire bus that begins each bit with a driven, rising edge from an idle
>> +  level near zero volts. The duration of the signal driven high depends on
>> +  whether the bit value is a logic '0' or logic '1'. PECI also includes
>> +  variable data transfer rate established with every message. In this way, it
>> +  is highly flexible even though underlying logic is simple.
>> +
>> +  The interface design was optimized for interfacing between an Intel
>> +  processor and chipset components in both single processor and multiple
>> +  processor environments. The single wire interface provides low board
>> +  routing overhead for the multiple load connections in the congested routing
>> +  area near the processor and chipset components. Bus speed, error checking,
>> +  and low protocol overhead provides adequate link bandwidth and reliability
>> +  to transfer critical device operating conditions and configuration
>> +  information.
>> +
>> +  PECI subsystem provides single or multiple bus nodes support so each bus can
>> +  have one adapter node and multiple device specific client nodes that can be
>> +  attached to the PECI bus so each processor client's features can be supported
>> +  by the client node through an adapter connection in the bus.
>> +
>> +properties:
>> +  compatible:
>> +    const: simple-bus
> 
> This is wrong. We already have a schema for this.
> 
> What's needed is a peci-bus schema that defines the bus node structure
> and then schemas for the specific controllers and child devices. See
> i2c-controller.yaml for an example.

Oh, I see. I'll fix and submit it as '/schema/peci-bus.yaml' into
dt-schema tree.

>> +
>> +  "#address-cells":
>> +    # Required to define bus device control resource address.
>> +    const: 1
>> +
>> +  "#size-cells":
>> +    # Required to define bus device control resource address.
>> +    const: 1
>> +
>> +  ranges: true
>> +
>> +required:
>> +  - compatible
>> +  - "#address-cells"
>> +  - "#size-cells"
>> +  - ranges
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/ast2600-clock.h>
>> +    peci: bus@1e78b000 {
>> +        compatible = "simple-bus";
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges = <0x0 0x1e78b000 0x200>;
>> +
>> +        peci0: peci-bus@0 {
>> +            compatible = "aspeed,ast2600-peci";
>> +            reg = <0x0 0x100>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +            interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&syscon ASPEED_CLK_GATE_REF0CLK>;
>> +            resets = <&syscon ASPEED_RESET_PECI>;
>> +            clock-frequency = <24000000>;
>> +        };
>> +
>> +        // Just an example. ast2600 doesn't have a second PECI module actually.
>> +        peci1: peci-bus@100 {
>> +            compatible = "aspeed,ast2600-peci";
>> +            reg = <0x100 0x100>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +            interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&syscon ASPEED_CLK_GATE_REF0CLK>;
>> +            resets = <&syscon ASPEED_RESET_PECI>;
>> +            clock-frequency = <24000000>;
>> +        };
>> +    };
>> +...
>> diff --git a/Documentation/devicetree/bindings/peci/peci-client.yaml b/Documentation/devicetree/bindings/peci/peci-client.yaml
>> new file mode 100644
>> index 000000000000..fc7c4110e929
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/peci/peci-client.yaml
>> @@ -0,0 +1,54 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/peci/peci-client.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Generic Device Tree Bindings for PECI clients
>> +
>> +maintainers:
>> +  - Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - intel,peci-client
>> +
>> +  reg:
>> +    description: |
>> +      Address of a client CPU. According to the PECI specification, client
>> +      addresses start from 0x30.
> 
> 0x30 being the min should be a constraint in the bus schema.

Right. Will add that.

Thanks a lot for your review!

-Jae

>> +    maxItems: 1
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
>> +    #include <dt-bindings/clock/ast2600-clock.h>
>> +    peci: bus@1e78b000 {
>> +        compatible = "simple-bus";
>> +        #address-cells = <1>;
>> +        #size-cells = <1>;
>> +        ranges = <0x0 0x1e78b000 0x60>;
>> +
>> +        peci0: peci-bus@0 {
>> +            compatible = "aspeed,ast2600-peci";
>> +            reg = <0x0 0x100>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +            interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
>> +            clocks = <&syscon ASPEED_CLK_GATE_REF0CLK>;
>> +            resets = <&syscon ASPEED_RESET_PECI>;
>> +            clock-frequency = <24000000>;
>> +
>> +            peci-client@30 {
>> +                compatible = "intel,peci-client";
>> +                reg = <0x30>;
>> +            };
>> +
>> +            peci-client@31 {
>> +                compatible = "intel,peci-client";
>> +                reg = <0x31>;
>> +            };
>> +        };
>> +    };
>> +...
>> -- 
>> 2.17.1
>>
> 
