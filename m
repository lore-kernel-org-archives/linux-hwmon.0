Return-Path: <jae.hyun.yoo@linux.intel.com>
Return-path: <jae.hyun.yoo@linux.intel.com>
Subject: Re: [PATCH v2 7/8] [PATCH 7/8] drivers/hwmon: Add a generic PECI
 hwmon client driver
To: Andrew Lunn <andrew@lunn.ch>
Cc: Guenter Roeck <linux@roeck-us.net>, joel@jms.id.au, andrew@aj.id.au,
 arnd@arndb.de, gregkh@linuxfoundation.org, jdelvare@suse.com,
 benh@kernel.crashing.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-8-jae.hyun.yoo@linux.intel.com>
 <20180221182608.GA11635@roeck-us.net>
 <618f34cd-ee43-d8e4-4fb0-3c23bf03835f@linux.intel.com>
 <20180221214859.GA30263@roeck-us.net>
 <576a50c6-c302-654c-ceb3-aaf820b7738a@linux.intel.com>
 <20180222003720.GA25250@lunn.ch>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <b506b4b1-7e7d-abd6-bac2-c45e7c1e0aae@linux.intel.com>
Date: Wed, 21 Feb 2018 17:29:27 -0800
MIME-Version: 1.0
In-Reply-To: <20180222003720.GA25250@lunn.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On 2/21/2018 4:37 PM, Andrew Lunn wrote:
>> But even with this change, it still needs to use delayed creation
>> because BMC side kernel doesn't know how many DIMMs are populated on
>> a remote server before the remote server completes its memory
>> training and testing in BIOS, but it needs to check the remote
>> server's CPU temperature as immediate as possible to make
>> appropriate thermal control based on the remote CPU's temperature to
>> avoid any critical thermal issue. What would be a better solution in
>> this case?
> 
> You could change this driver so that it supports one DIMM.  Move the
> 'hotplug' part into another driver which creates and destroys
> instances of the hwmon DIMM device as the DIMMS come and go.
> 
> Also, do you need to handle CPU hotplug? You could split the CPU
> temperature part into a separate hwmon driver? And again create and
> destroy devices as CPUs come and go?
> 
> 	Andrew
> 

That seems like a possible option. I'll rewrite the hwmon driver again 
like that.

Thanks for the good idea. :)

Jae
