Return-path: <peterhuewe@gmx.de>
Date: Wed, 17 May 2017 22:35:28 +0200
In-Reply-To: <3e0dd0a4-0e88-a11d-a0b4-f75ecdbd8e9f@gmail.com>
References: <20170323130308.29166-1-peterhuewe@gmx.de> <3e0dd0a4-0e88-a11d-a0b4-f75ecdbd8e9f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [1/5] w83627ehf: Use hwmon_device_register_with_info and sensor groups
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>,Guenter Roeck <linux@roeck-us.net>
CC: Jean Delvare <jdelvare@suse.com>,linux-hwmon@vger.kernel.org,linux-kernel@vger.kernel.org
From: Peter Huewe <peterhuewe@gmx.de>
Message-ID: <3A972572-949A-4FDD-9A4D-A08396781254@gmx.de>
List-ID: <linux-hwmon@vger.kernel.org>



Am 17=2E Mai 2017 21:35:52 MESZ schrieb Alexander Sverdlin <alexander=2Esv=
erdlin@gmail=2Ecom>:
>Hello Peter!
>
>On 23/03/17 14:03, Peter Huewe wrote:
>> This patch replaces the old, deprecated call to hwmon_device_register
>> with the new hwmon_device_register_with_info and converts the whole
>> driver to the new hwmon interface using the hwmon_chip_info methods
>> and the attribute_group method=2E
>>=20
>> All standard attributes were converted to the corresponding
>> hwmon_chip_info methods=2E
>> For some functions a hwmon channel to device channel conversion had
>to
>> be performed, e=2Eg=2E hwmon_in_alarm has the info for alert_5 in chann=
el
>8=2E
>>=20
>> All non-standard attributes are converted to the attribute_group
>method,
>> by
>> - adding them statically to the attribute_group if they are available
>> for all variants of devices supported by this driver
>> - adding them at probe time to the attribute_group if the
>availability
>> is depending on the actual chip type=2E
>> The appropriate count of entries was reserved=2E
>>=20
>> As a pre-condition a reference to the sio_data structure was moved
>into
>> w83627ehf_data for easier retrieval of the information, since this is
>> much easier than trying to access the platform_data=2E
>>=20
>> The driver is now much more "checkpatch clean" than it used to be,
>but
>> still not completely=2E
>> The conversion saves about 20k in the resulting =2Eko
>>=20
>> Tested with a NCT6776F chip=2E
>>=20
>> v2:
>> - converted to proper is_visible methods
>> - applied minor feedback of v1
>>=20
>> Signed-off-by: Peter Huewe <peterhuewe@gmx=2Ede>
>
>I've applied the whole series (5 of 5 patches) on top of hwmon-next
>and tested on Intel D525MW, where the module finds "W83627DHG-P chip at
>0x290"=2E
>
>The values of all the inputs are exactly the same as back in Linux
>v4=2E7=2Ex
>(when the used HWMON API wasn't deprecated)=2E
>
>Therefore, feel free to add
>
>Tested-by: Alexander Sverdlin <alexander=2Esverdlin@gmail=2Ecom>
>
>to the whole series when you re-spin=2E
>Thanks for fixing this!


Thanks for testing!
I will respin as soon as I find time=2E

Thanks
Peter
>
>> ---
>>  drivers/hwmon/w83627ehf=2Ec | 1536
>+++++++++++++++++++++++----------------------
>>  1 file changed, 778 insertions(+), 758 deletions(-)
>
>--
>Alexander=2E

--=20
Sent from my mobile
