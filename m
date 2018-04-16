Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:22008 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750979AbeDPXWa (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 16 Apr 2018 19:22:30 -0400
Subject: Re: [PATCH v3 07/10] Documentation: dt-bindings: Add documents for
 PECI hwmon client drivers
To: Rob Herring <robh@kernel.org>
Cc: Alan Cox <alan@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
        Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Fengguang Wu <fengguang.wu@intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Haiyue Wang <haiyue.wang@linux.intel.com>,
        James Feist <james.feist@linux.intel.com>,
        Jason M Biils <jason.m.bills@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Joel Stanley <joel@jms.id.au>,
        Julia Cartwright <juliac@eso.teric.us>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Milton Miller II <miltonm@us.ibm.com>,
        Pavel Machek <pavel@ucw.cz>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stef van Os <stef.van.os@prodrive-technologies.com>,
        Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>,
        Vernon Mauery <vernon.mauery@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
 <20180410183212.16787-8-jae.hyun.yoo@linux.intel.com>
 <20180416181423.t4vf7sugv6z3aw5h@rob-hp-laptop>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <aee4e04c-885f-b1d8-9e85-9e741551342f@linux.intel.com>
Date: Mon, 16 Apr 2018 16:22:29 -0700
MIME-Version: 1.0
In-Reply-To: <20180416181423.t4vf7sugv6z3aw5h@rob-hp-laptop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 4/16/2018 11:14 AM, Rob Herring wrote:
> On Tue, Apr 10, 2018 at 11:32:09AM -0700, Jae Hyun Yoo wrote:
>> This commit adds dt-bindings documents for PECI cputemp and dimmtemp client
>> drivers.
> 
> "dt-bindings: hwmon: ..." for the subject.
> 

I'll change the subject.

>>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
>> Reviewed-by: James Feist <james.feist@linux.intel.com>
>> Reviewed-by: Vernon Mauery <vernon.mauery@linux.intel.com>
>> Cc: Alan Cox <alan@linux.intel.com>
>> Cc: Andrew Jeffery <andrew@aj.id.au>
>> Cc: Andrew Lunn <andrew@lunn.ch>
>> Cc: Andy Shevchenko <andriy.shevchenko@intel.com>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Fengguang Wu <fengguang.wu@intel.com>
>> Cc: Greg KH <gregkh@linuxfoundation.org>
>> Cc: Guenter Roeck <linux@roeck-us.net>
>> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
>> Cc: Jean Delvare <jdelvare@suse.com>
>> Cc: Joel Stanley <joel@jms.id.au>
>> Cc: Julia Cartwright <juliac@eso.teric.us>
>> Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
>> Cc: Milton Miller II <miltonm@us.ibm.com>
>> Cc: Pavel Machek <pavel@ucw.cz>
>> Cc: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Stef van Os <stef.van.os@prodrive-technologies.com>
>> Cc: Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>
>> ---
>>   .../devicetree/bindings/hwmon/peci-cputemp.txt     | 24 +++++++++++++++++++++
>>   .../devicetree/bindings/hwmon/peci-dimmtemp.txt    | 25 ++++++++++++++++++++++
>>   2 files changed, 49 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/hwmon/peci-cputemp.txt
>>   create mode 100644 Documentation/devicetree/bindings/hwmon/peci-dimmtemp.txt
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/peci-cputemp.txt b/Documentation/devicetree/bindings/hwmon/peci-cputemp.txt
>> new file mode 100644
>> index 000000000000..d5530ef9cfd2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/peci-cputemp.txt
>> @@ -0,0 +1,24 @@
>> +Bindings for Intel PECI (Platform Environment Control Interface) cputemp driver.
>> +
>> +Required properties:
>> +- compatible : Should be "intel,peci-cputemp".
>> +- reg        : Should contain address of a client CPU. Address range of CPU
>> +	       clients is starting from 0x30 based on PECI specification.
>> +	       <0x30> .. <0x37> (depends on the PECI_OFFSET_MAX definition)
> 
> Again, where is PECI_OFFSET_MAX defined? It can't depend on something in
> the kernel.
> 

I'll remove the unnecessary description.

>> +
>> +Example:
>> +	peci-bus@0 {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		< more properties >
>> +
>> +		peci-cputemp@cpu0 {
>> +			compatible = "intel,peci-cputemp";
>> +			reg = <0x30>;
>> +		};
>> +
>> +		peci-cputemp@cpu1 {
>> +			compatible = "intel,peci-cputemp";
>> +			reg = <0x31>;
>> +		};
>> +	};
>> diff --git a/Documentation/devicetree/bindings/hwmon/peci-dimmtemp.txt b/Documentation/devicetree/bindings/hwmon/peci-dimmtemp.txt
>> new file mode 100644
>> index 000000000000..56e5deb61e5c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/peci-dimmtemp.txt
>> @@ -0,0 +1,25 @@
>> +Bindings for Intel PECI (Platform Environment Control Interface) dimmtemp
>> +driver.
>> +
>> +Required properties:
>> +- compatible : Should be "intel,peci-dimmtemp".
>> +- reg        : Should contain address of a client CPU. Address range of CPU
>> +	       clients is starting from 0x30 based on PECI specification.
>> +	       <0x30> .. <0x37> (depends on the PECI_OFFSET_MAX definition)
>> +
>> +Example:
>> +	peci-bus@0 {
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +		< more properties >
>> +
>> +		peci-dimmtemp@cpu0 {
> 
> unit-address is wrong.
> 

Will fix it using the reg value.

> It is a different bus from cputemp? Otherwise, you have conflicting
> addresses. If that's the case, probably should make it clear by showing
> different host adapters for each example.
> 

It could be the same bus with cputemp. Also, client address sharing is 
possible by PECI core if the functionality is different. I mean, cputemp 
and dimmtemp targeting the same client is possible case like this.
peci-cputemp@30
peci-dimmtemp@30

>> +			compatible = "intel,peci-dimmtemp";
>> +			reg = <0x30>;
>> +		};
>> +
>> +		peci-dimmtemp@cpu1 {
>> +			compatible = "intel,peci-dimmtemp";
>> +			reg = <0x31>;
>> +		};
>> +	};
>> -- 
>> 2.16.2
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe devicetree" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
