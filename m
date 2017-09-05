Return-Path: <SRS0=LLLD=AG=ladisch.de=clemens@webclient5.webclient5.de>
Return-path: <SRS0=LLLD=AG=ladisch.de=clemens@webclient5.webclient5.de>
Subject: Re: [PATCH] hwmon: (k10temp) Add support for family 17h
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1504575935-19476-1-git-send-email-linux@roeck-us.net>
 <0565cf17-62d9-e319-8fe5-fbdf2d69335a@ladisch.de>
 <1e168fdb-862f-60f1-d119-918e00aac1f5@roeck-us.net>
 <705bb285-c532-a52e-b350-bd2b44b67b81@ladisch.de>
 <20170905164503.GA11478@roeck-us.net>
From: Clemens Ladisch <clemens@ladisch.de>
Message-ID: <9d0daec3-9850-4e36-7fdf-414c6f3beac1@ladisch.de>
Date: Tue, 5 Sep 2017 19:48:56 +0200
MIME-Version: 1.0
In-Reply-To: <20170905164503.GA11478@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Guenter Roeck wrote:
> On Tue, Sep 05, 2017 at 04:12:07PM +0200, Clemens Ladisch wrote:
>> Guenter Roeck wrote:
>>> What we should do then, as we did for coretemp, would be to collect the various
>>> temperature offsets (and temperature limits, for that matter) and apply per-CPU
>>> adjustments. Are the offsets documented somewhere ?
>>
>> AMD says:
>>  "Tctl is the processor temperature control value, used by the platform to
>>   control cooling systems. Tctl is a non-physical temperature on an
>>   arbitrary scale measured in degrees. It does _not_ represent an actual
>>   physical temperature like die or case temperature. Instead, it specifies
>>   the processor temperature relative to the point at which the system must
>>   supply the maximum cooling for the processor's specified maximum case
>>   temperature and maximum thermal power dissipation."
>
> Pretty much the same as Intel. That doesn't mean we should not (try to) report
> the real temperature as good as we can, as at least most of the BIOSes do,

AFAIK the BIOSes use the thermal diode (with external circuitry) for that.

> and as all the Windows tools do, and as users expect us to do.
>
> Do we really have to argue about this ?

Looking at coretemp, this is going to be a maintenance nightmare.

Oh well.  If you insist, please add a proper chip-to-offset database, and
apply the offset to all four values.


Regards,
Clemens
