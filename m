Return-path: <tthayer@opensource.altera.com>
Reply-To: <tthayer@opensource.altera.com>
Subject: Re: [RFC 5/8] ARM: socfpga: dts: Add Devkit A10-SR fields for Arria10
References: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
 <1459278791-3646-6-git-send-email-tthayer@opensource.altera.com>
 <alpine.DEB.2.02.1603301240250.21508@linux-builds1>
To: Dinh Nguyen <dinguyen@opensource.altera.com>
CC: <lee.jones@linaro.org>, <linus.walleij@linaro.org>, <gnurou@gmail.com>,
	<jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
	<pawell.moll@arm.com>, <mark.rutland@arm.com>,
	<ijc+devicetree@hellion.org.uk>, <linux-gpio@vger.kernel.org>,
	<linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>
From: Thor Thayer <tthayer@opensource.altera.com>
Message-ID: <56FD6C33.8040907@opensource.altera.com>
Date: Thu, 31 Mar 2016 13:28:03 -0500
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1603301240250.21508@linux-builds1>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>



On 03/30/2016 12:42 PM, Dinh Nguyen wrote:
> On Tue, 29 Mar 2016, tthayer@opensource.altera.com wrote:
>
>> From: Thor Thayer <tthayer@opensource.altera.com>
>>
>> Add the Altera Arria10 System Resource node. This is a Multi-Function
>> device with GPIO and HWMON support.
>>
>> Signed-off-by: Thor Thayer <tthayer@opensource.altera.com>
>>
>> +		spi1: spi@ffda5000 {
>> +			compatible = "snps,dw-apb-ssi";
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			reg = <0xffda5000 0x100>;
>> +			interrupts = <0 102 4>;
>> +			num-chipselect = <4>;
>> +			bus-num = <0>;
>> +			/*32bit_access;*/
>> +			tx-dma-channel = <&pdma 16>;
>> +			rx-dma-channel = <&pdma 17>;
>> +			clocks = <&spi_m_clk>;
>> +			status = "disabled";
>> +		};
>> +
>
> I think you need to split this into 2 patches, 1 for adding the SPI nodes, and
> the 2nd for adding the slave device.
>
> BR,
> Dinh
>

OK. Thanks for reviewing.
