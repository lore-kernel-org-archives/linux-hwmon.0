Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:35415 "EHLO
        mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756156AbdD0S2j (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Apr 2017 14:28:39 -0400
Received: by mail-wm0-f47.google.com with SMTP id w64so24252003wma.0
        for <linux-hwmon@vger.kernel.org>; Thu, 27 Apr 2017 11:28:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGt4E5susQWWNZPbNh8AoWtK-4yu50VL=GqOw+_2w_FA+2V68Q@mail.gmail.com>
References: <20170418201702.57019-1-code@mmayer.net> <20170418201702.57019-2-code@mmayer.net>
 <CAGt4E5susQWWNZPbNh8AoWtK-4yu50VL=GqOw+_2w_FA+2V68Q@mail.gmail.com>
From: Markus Mayer <markus.mayer@broadcom.com>
Date: Thu, 27 Apr 2017 11:28:37 -0700
Message-ID: <CAGt4E5uu1Ty0ReaiBZ0kcR_-jnqJQL8vgU4Y9mL64FP7f+=T7Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt/bindings: Add bindings for Broadcom STB DRAM Sensors
To: Rob Herring <robh+dt@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
        Linux HWMON List <linux-hwmon@vger.kernel.org>,
        Device Tree List <devicetree@vger.kernel.org>,
        ARM Kernel List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 25 April 2017 at 12:29, Markus Mayer <markus.mayer@broadcom.com> wrote:
> Hi Rob,
>
> On 18 April 2017 at 13:17, Markus Mayer <code@mmayer.net> wrote:
>> From: Markus Mayer <mmayer@broadcom.com>
>>
>> Provide bindings for the Broadcom STB DDR PHY Front End (DPFE).
>
> Would you be able to have a look at this binding? The driver won't be
> upstreamed as hwmon driver (as per Guenter's comments). I am currently
> converting the driver to a "soc" driver instead, but the proposed
> binding remains unchanged.
>
> If you have comments or suggestions, I would like to incorporate them
> with the new series I will be sending out.

To explain a bit more what we are looking for: we had a internal
discussions how to structure this binding and are looking for some
guidance.

Should we create three different nodes for the three different memory
areas (dpfe-cpu@..., dpfe-dmem@..., dpfe-imem@...), each with a single
"reg" property (which is the proposal below) or should this be one
single property with 3 "reg" cells, i.e. something like this:

dpfe-cpu@f1132000 {
    ...
    reg = <0xf1132000 0x180     /* register space */
           0xf1134000 0x1000    /* data memory */
           0xf1138000 0x4000>;  /* instruction memory */
    ...
};

Regards,
-Markus

>> Signed-off-by: Markus Mayer <mmayer@broadcom.com>
>> ---
>>  .../devicetree/bindings/hwmon/brcmstb-dpfe.txt     | 68 ++++++++++++++++++++++
>>  1 file changed, 68 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/hwmon/brcmstb-dpfe.txt
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/brcmstb-dpfe.txt b/Documentation/devicetree/bindings/hwmon/brcmstb-dpfe.txt
>> new file mode 100644
>> index 0000000..3519197
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/brcmstb-dpfe.txt
>> @@ -0,0 +1,68 @@
>> +DDR PHY Front End (DPFE) for Broadcom STB
>> +=========================================
>> +
>> +DPFE and the DPFE firmware provide an interface for the host CPU to
>> +communicate with the DCPU, which resides inside the DDR PHY.
>> +
>> +There are three memory regions for interacting with the DCPU.
>> +
>> +The DCPU Register Space
>> +-----------------------
>> +
>> +Required properties:
>> +  - compatible: must be one of brcm,bcm7271-dpfe-cpu, brcm,dpfe-cpu-v12.0.0.0
>> +    or brcm,dpfe-cpu
>> +  - reg: must reference the start address and length of the DCPU register
>> +    space
>> +
>> +Optional properties:
>> +  - cell-index: the index of the DPFE instance; will default to 0 if not set
>> +
>> +Example:
>> +       dpfe_cpu0: dpfe-cpu@f1132000 {
>> +               compatible = "brcm,bcm7271-dpfe-cpu",
>> +                       "brcm,dpfe-cpu-v12.0.0.0",
>> +                       "brcm,dpfe-cpu";
>> +               reg = <0xf1132000 0x180>;
>> +               cell-index = <0>;
>> +       };
>> +
>> +The DCPU Data Memory Space
>> +--------------------------
>> +
>> +Required properties:
>> +  - compatible: must be one of brcm,bcm7271-dpfe-dmem, brcm,dpfe-dmem-v12.0.0.0
>> +    or brcm,dpfe-dmem
>> +  - reg: must reference the start address and length of the DCPU DMEM space
>> +
>> +Optional properties:
>> +  - cell-index: the index of the DPFE instance; will default to 0 if not set
>> +
>> +Example:
>> +       dpfe_dmem0: dpfe-dmem@f1134000 {
>> +               compatible = "brcm,bcm7271-dpfe-dmem",
>> +                       "brcm,dpfe-dmem-v12.0.0.0",
>> +                       "brcm,dpfe-dmem";
>> +               reg = <0xf1134000 0x1000>;
>> +               cell-index = <0>;
>> +       };
>> +
>> +The DCPU Instruction Memory Space
>> +---------------------------------
>> +
>> +Required properties:
>> +  - compatible: must be one of brcm,bcm7271-dpfe-imem, brcm,dpfe-imem-v12.0.0.0
>> +    or brcm,dpfe-imem
>> +  - reg: must reference the start address and length of the DCPU IMEM space
>> +
>> +Optional properties:
>> +  - cell-index: the index of the DPFE instance; will default to 0 if not set
>> +
>> +Example:
>> +       dpfe_imem0: dpfe-imem@f1138000 {
>> +               compatible = "brcm,bcm7271-dpfe-imem",
>> +                       "brcm,dpfe-imem-v12.0.0.0",
>> +                       "brcm,dpfe-imem";
>> +               reg = <0xf1138000 0x4000>;
>> +               cell-index = <0>;
>> +       };
>> --
>> 2.7.4
>>
