Return-Path: <robh@kernel.org>
Return-path: <robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <b6c6310ff0fde9d0df29a57fcd229591@dev.tdt.de>
References: <20170901065818.2037-1-fe@dev.tdt.de> <20170901065818.2037-2-fe@dev.tdt.de>
 <20170901142622.GC599@roeck-us.net> <20170912162008.y2dp3llaikkp3l45@rob-hp-laptop>
 <a5a2e95a1fb671eb59459542af122d6e@dev.tdt.de> <CAL_Jsq+udc2p_jqQN+m4R69zW=7RBfJCDrQgNXOiMycErP43LQ@mail.gmail.com>
 <b6c6310ff0fde9d0df29a57fcd229591@dev.tdt.de>
From: Rob Herring <robh@kernel.org>
Date: Tue, 19 Sep 2017 21:53:41 -0500
Message-ID: <CAL_JsqKKqTdHCxf-rbg4FN_JxtDVmm9KXW7HgjRm-kHWT7bjdg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] hwmon: (ltq-cputemp) add devicetree bindings documentation
To: Florian Eckert <fe@dev.tdt.de>
Cc: Guenter Roeck <linux@roeck-us.net>, Mark Rutland <mark.rutland@arm.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Linux HWMON List <linux-hwmon@vger.kernel.org>, Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

On Thu, Sep 14, 2017 at 2:06 AM, Florian Eckert <fe@dev.tdt.de> wrote:
> Hello Rob
>
>>>>> > +
>>>>> > +Requires node properties:
>>>>> > +- compatible value :
>>>>> > +     "lantiq,cputemp"
>>>>
>>>>
>>>>
>>>> Kind of non-specific. How is this device even accessed without any other
>>>> property?
>>>
>>>
>>>
>>> It does not need any further properties. If this is set in the device
>>> tree
>>> then the driver is loaded.
>>
>>
>> DT is not the only way to instantiate drivers.
>>
>> What I meant is how do you access the hardware? That should be evident
>> from the binding and it is not.
>
>
> Agree with our statement.
>
>>
>> Looking at the driver, you have some memory mapped system control
>> registers which get ioremapped in arch/mips/lantiq/xway/sysctrl.c and
>> accesses thru some platform specific macros. That is not the ideal way
>> to do things as we use syscon and regmap for such things. But that's
>> all mostly kernel details not so relevant to the DT binding.
>
>
> For lanitq xrx200 this is all i have. So if i have to use syscon and regmap
> i am also not sure how to handle this.
>
>> For DT, I'd expect this is a child node of the sysctrl block with a
>> reg property value of <0x40 4> (along with any other child devices).
>> You could also not even put this in DT and the system controller can
>> have it's own driver that instantiates the child device for this
>> driver.
>
>
> Yes this would be the best practice. But the hardware designer for what ever
> reason
> placed the Register for the temperature sensors into the CGU (Clock
> Generation Unit) section!
> And the Register is also shared with some other stuff which is not only
> assign for temperature
> stuff! I am not sure how to handle this in the device tree.

This is quite common and there are plenty of examples. Look for
bindings with "syscon".

>
> This is a Register description extract from the data sheet
>
> GPHY Configuration Register 01
> This register configures the booting options of GPHY1 IP.
>
> Offset 0x0040
> Reset Value 0x01FC0000
>
> 31: RES
> 30: 100FX_H
> 29: 100FX_F
> 28: 10BT_F
> 27: 10BT_H
> 26: 100BT_F
> 25: 100BT_H
> 24: 1000BT_F
> 23: 1000BT_H
> 22: RES
> 21: RES
> 19: TEMP_PD <--- NEEDED Power down the Temperature Sensor
> 18: TEMP_HL <--- NEEDED Indicate temperature higher than 128 C
> 17: TEMP    <--- NEEDED Value
> 16: TEMP    <--- NEEDED Value
> 15: TEMP    <--- NEEDED Value
> 14: TEMP    <--- NEEDED Value
> 13: TEMP    <--- NEEDED Value
> 12: TEMP    <--- NEEDED Value
> 11: TEMP    <--- NEEDED Value
> 10: TEMP    <--- NEEDED Value
> 09: TEMP    <--- NEEDED Value
> 08: RES
> 07: RES
> 06: SPI_Delay
> 05: SPI_Delay
> 04: AHB_EnD
> 03: DMA_OR
> 02: RES
> 01: RES
> 00: RES
>
> And that is a dts tree from LEDE/Openwrt for lantiq
> URL:
> https://github.com/lede-project/source/blob/c88770c766fdc5599efc4672bca230017f52e8e4/target/linux/lantiq/dts/vr9.dtsi#L54
>
> Extraction:
>         sram@1F000000 {
>                 #address-cells = <1>;
>                 #size-cells = <1>;
>                 compatible = "lantiq,sram", "simple-bus";
>                 reg = <0x1F000000 0x800000>;
>                 ranges = <0x0 0x1F000000 0x7FFFFF>;
>
>                 eiu0: eiu@101000 {
>                         #interrupt-cells = <1>;
>                         interrupt-controller;
>                         compatible = "lantiq,eiu-xway";
>                         reg = <0x101000 0x1000>;
>                         interrupt-parent = <&icu0>;
>                         lantiq,eiu-irqs = <166 135 66 40 41 42>;
>                 };
>
>                 pmu0: pmu@102000 {
>                         compatible = "lantiq,pmu-xway";
>                         reg = <0x102000 0x1000>;
>                 };
>
>                 cgu0: cgu@103000 {
>                         compatible = "lantiq,cgu-xway";
>                         reg = <0x103000 0x1000>;
> -> This is the place to add the binding?

Yes.

>                 };
>
> Sorry for the noise but i am unsure how to do this.
> Thanks for help
>
> Florian
