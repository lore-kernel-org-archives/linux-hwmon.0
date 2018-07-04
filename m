Return-Path: <shilpa.bhat@linux.vnet.ibm.com>
Return-path: <shilpa.bhat@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 2/2] hwmon: ibmpowernv: Add attributes to
 enable/disable sensor groups
To: Guenter Roeck <linux@roeck-us.net>, mpe@ellerman.id.au
References: <1530695793-4584-1-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
 <1530695793-4584-3-git-send-email-shilpa.bhat@linux.vnet.ibm.com>
 <e3a013fb-eaf0-8d45-2f23-3be8b3e5640b@roeck-us.net>
Cc: linuxppc-dev@lists.ozlabs.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, ego@linux.vnet.ibm.com
From: Shilpasri G Bhat <shilpa.bhat@linux.vnet.ibm.com>
Date: Wed, 4 Jul 2018 22:23:51 +0530
MIME-Version: 1.0
In-Reply-To: <e3a013fb-eaf0-8d45-2f23-3be8b3e5640b@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Message-Id: <c7e1272a-c9c8-a120-632f-7693cef3fd22@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>

Hi Guenter,

Thanks for reviewing the patch.
On 07/04/2018 08:16 PM, Guenter Roeck wrote:
>> +        /* Disable if last sensor in the group */
>> +        send_command = true;
>> +        for (i = 0; i < sg->nr_sensor; i++) {
>> +            struct sensor_data *sd = sg->sensors[i];
>> +
>> +            if (sd->enable) {
>> +                send_command = false;
>> +                break;
>> +            }
> 
> This is weird. So there are situations where a request to disable
> a sensor is accepted, but effectively ignored ? Shouldn't that
> return, say, -EBUSY ?

This is because we do not support per-sensor enable/disable. We can only
enable/disable at a sensor-group level.

This patch follows the semantic to disable a sensor group iff all the sensors
belonging to that group have been disabled. Otherwise the sensor alone is marked
to be disabled and returns -ENODATA on reading it.

And a sensor group will be enabled if any of the sensor in that group is enabled.

I will make changes to the remaining code according to your suggestion.

Thanks and Regards,
Shilpa
