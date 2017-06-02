Return-path: <sudeep.holla@arm.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Carlo Caione <carlo@endlessm.com>
Subject: Re: [PATCH v4 1/2] Documentation: bindings: add
 amlogic,meson-gxbb-scpi-sensors compatible
To: Guenter Roeck <linux@roeck-us.net>, Carlo Caione <carlo@caione.org>,
 jdelvare@suse.com, linux-hwmon@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux@endlessm.com, punit.agrawal@arm.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org
References: <20170530090507.16611-1-carlo@caione.org>
 <20170530090507.16611-2-carlo@caione.org>
 <8d0c867e-2b78-63fa-f422-709e515012ca@roeck-us.net>
From: Sudeep Holla <sudeep.holla@arm.com>
Message-ID: <e915f000-66a3-f36b-b0cb-09f2d7a91a6b@arm.com>
Date: Fri, 2 Jun 2017 14:26:43 +0100
MIME-Version: 1.0
In-Reply-To: <8d0c867e-2b78-63fa-f422-709e515012ca@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>



On 02/06/17 14:14, Guenter Roeck wrote:
> On 05/30/2017 02:05 AM, Carlo Caione wrote:
>> From: Carlo Caione <carlo@endlessm.com>
>>
>> Introduce a new Amlogic specific compatible to handle how Amlogic reports
>> the sensor readings from SCPI using a different scale.
>>
>> Signed-off-by: Carlo Caione <carlo@endlessm.com>
> 
> Formally waiting for DT approval. However, I don't see any problems with
> it,
> so
> 
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> 
> Not sure what branch this is supposed to go through. For now I assume it
> will be arm/arm64.
> 

Initially I submitted it via arm-soc. But I think you can take it along
with the driver change in your tree as I don't see any other patch
touching arm,scpi.txt in time around.

-- 
Regards,
Sudeep
