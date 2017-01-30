Return-path: <andrea.merello@gmail.com>
MIME-Version: 1.0
Reply-To: andrea.merello@gmail.com
In-Reply-To: <0a666ff2-a67c-c6c9-af88-593e162ef78e@roeck-us.net>
References: <1485440263-26477-1-git-send-email-andrea.merello@gmail.com> <0a666ff2-a67c-c6c9-af88-593e162ef78e@roeck-us.net>
From: Andrea Merello <andrea.merello@gmail.com>
Date: Mon, 30 Jan 2017 08:36:28 +0100
Message-ID: <CAN8YU5O1DJwTAwakzHvnQaY-RnP9E1Er-7z=FD9dAmf5qY9-yQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] hwmon: new driver for ST stts751 thermal sensor
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, LABBE Corentin <clabbe.montjoie@gmail.com>,
	Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-hwmon@vger.kernel.org>

On Sun, Jan 29, 2017 at 7:18 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On 01/26/2017 06:17 AM, Andrea Merello wrote:
>>
>> This patch adds a HWMON driver for ST Microelectronics STTS751
>> temperature sensors.
>>
>> Changes since V3:
>> - fix sysfs_notify() filename
>> - simplify error exit path in stts751_update_temp(): kill useless goto
>> - fix set function were racy due to lock incorrectly placed
>> - use msecs_to_jiffies instead of manual calculation
>> - fix jiffies and msecs were mixed up
>> - don't mark cache as good unless reads really succeded to fill up it
>> - when updating therm, hyst keeps relative value rather than abs value
>> - don't should in dev_dbg when chip is detected
>> - don't ever generate two uevents
>> - clarify clear-on-read behaviour of status reg alarm flags
>> - simplify mDEG to HW conversion function
>> - fix chip stops due to incorrect resolution configuration
>> - fix incorrectly reading negative numbers from HW
>>
>> Thanks-to: LABBE Corentin [for suggestions]
>> Signed-off-by: Andrea Merello <andrea.merello@gmail.com>
>> Cc: LABBE Corentin <clabbe.montjoie@gmail.com>
>> Cc: Guenter Roeck <linux@roeck-us.net>
>> Cc: Jean Delvare <jdelvare@suse.com>
>
>
> [ ... ]
>
>> +
>> +static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, show_input, NULL, 0);
>> +static SENSOR_DEVICE_ATTR(temp1_min, S_IWUSR | S_IRUGO, show_min,
>> set_min, 0);
>> +static SENSOR_DEVICE_ATTR(temp1_max, S_IWUSR | S_IRUGO, show_max,
>> set_max, 0);
>> +static SENSOR_DEVICE_ATTR(temp1_min_alarm, S_IRUGO, show_min_alarm, NULL,
>> 0);
>> +static SENSOR_DEVICE_ATTR(temp1_max_alarm, S_IRUGO, show_max_alarm, NULL,
>> 0);
>> +static SENSOR_DEVICE_ATTR(temp1_crit, S_IWUSR | S_IRUGO, show_therm,
>> +                       set_therm, 0);
>> +static SENSOR_DEVICE_ATTR(temp1_crit_hyst, S_IWUSR | S_IRUGO, show_hyst,
>> +                       set_hyst, 0);
>> +static SENSOR_DEVICE_ATTR(temp1_crit_alarm, S_IRUGO, show_therm_trip,
>> NULL, 0);
>> +static SENSOR_DEVICE_ATTR(update_interval, S_IWUSR | S_IRUGO,
>> +                       show_interval, set_interval, 0);
>
>
> I forgot to mention: Symbolic permissions ran out of favor upstream.
> Please use octals above to make the annoying checkpatch warnings go away.

OK

> Thanks,
> Guenter
>
