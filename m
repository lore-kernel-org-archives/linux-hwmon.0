Return-path: <alexander.sverdlin@gmail.com>
Subject: Re: [1/5] w83627ehf: Use hwmon_device_register_with_info and sensor
 groups
To: Peter Huewe <PeterHuewe@gmx.de>, Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20170323130308.29166-1-peterhuewe@gmx.de>
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Message-ID: <3e0dd0a4-0e88-a11d-a0b4-f75ecdbd8e9f@gmail.com>
Date: Wed, 17 May 2017 21:35:52 +0200
MIME-Version: 1.0
In-Reply-To: <20170323130308.29166-1-peterhuewe@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Hello Peter!

On 23/03/17 14:03, Peter Huewe wrote:
> This patch replaces the old, deprecated call to hwmon_device_register
> with the new hwmon_device_register_with_info and converts the whole
> driver to the new hwmon interface using the hwmon_chip_info methods
> and the attribute_group method.
> 
> All standard attributes were converted to the corresponding
> hwmon_chip_info methods.
> For some functions a hwmon channel to device channel conversion had to
> be performed, e.g. hwmon_in_alarm has the info for alert_5 in channel 8.
> 
> All non-standard attributes are converted to the attribute_group method,
> by
> - adding them statically to the attribute_group if they are available
> for all variants of devices supported by this driver
> - adding them at probe time to the attribute_group if the availability
> is depending on the actual chip type.
> The appropriate count of entries was reserved.
> 
> As a pre-condition a reference to the sio_data structure was moved into
> w83627ehf_data for easier retrieval of the information, since this is
> much easier than trying to access the platform_data.
> 
> The driver is now much more "checkpatch clean" than it used to be, but
> still not completely.
> The conversion saves about 20k in the resulting .ko
> 
> Tested with a NCT6776F chip.
> 
> v2:
> - converted to proper is_visible methods
> - applied minor feedback of v1
> 
> Signed-off-by: Peter Huewe <peterhuewe@gmx.de>

I've applied the whole series (5 of 5 patches) on top of hwmon-next
and tested on Intel D525MW, where the module finds "W83627DHG-P chip at 0x290".

The values of all the inputs are exactly the same as back in Linux v4.7.x
(when the used HWMON API wasn't deprecated).

Therefore, feel free to add

Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

to the whole series when you re-spin.
Thanks for fixing this!

> ---
>  drivers/hwmon/w83627ehf.c | 1536 +++++++++++++++++++++++----------------------
>  1 file changed, 778 insertions(+), 758 deletions(-)

--
Alexander.
