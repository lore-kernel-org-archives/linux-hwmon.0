Return-Path: <fe@dev.tdt.de>
Return-path: <fe@dev.tdt.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 04 Sep 2017 09:13:09 +0200
From: Florian Eckert <fe@dev.tdt.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guenter Roeck <groeck7@gmail.com>
Subject: Re: [v2,1/2] hwmon: (adcxx) add devictree bindings documentation
In-Reply-To: <20170901143257.GA1167@roeck-us.net>
References: <20170821081952.18508-1-fe@dev.tdt.de>
 <20170901143257.GA1167@roeck-us.net>
Message-ID: <67e2eac70f0b64ffb7802fb39ca571d6@dev.tdt.de>
List-ID: <linux-hwmon@vger.kernel.org>

Hello Guenter

Thank you again for reviewing my patches!
It was the first time for me :-) to add something to the kernel.

>> +- vref-supply
>> +  The external reference in microvolt for this device is set to this 
>> value.
>> +  If it does not exists the reference will be set to 3300000uV 
>> (3.3V).
> 
> s/exists/exist/
> 

Sorry for the noise and thank you for the hint.

>> +
>> +Example:
>> +
>> +adc@6 {
>> +	compatible = "national,adcxx2s";
>> +	reg = <6 0>;
>> +	spi-max-frequency = <1000000>;
> 
> I asssume that means that standard spi properties are accepted / 
> required,
> which I think should be documented. We'll need input from Rob for that.

Yes this is a standard option.
I have added this because 
"Documentation/devicetree/bindings/hwmon/lm70.txt"
did the same. This was my pattern.

I will send a follow up patch set if this is clarivied. Let me know if 
this is needed or not.

Thanks
Florian
