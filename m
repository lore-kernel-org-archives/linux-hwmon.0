Return-path: <mail@alexanderkoch.net>
Subject: Re: [RFC PATCH v2 3/4] hwmon: adc128d818: Trivial code style fixup
To: Guenter Roeck <linux@roeck-us.net>
References: <20161223221205.8825-1-mail@alexanderkoch.net>
 <20161223221205.8825-4-mail@alexanderkoch.net>
 <650d2371-57da-2494-7628-5a8bc5b756bf@roeck-us.net>
From: Alexander Koch <mail@alexanderkoch.net>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
 jdelvare@suse.com, trivial@kernel.org
Message-ID: <3b34c8aa-9d9a-cf88-0d84-8e0d47f9bf44@alexanderkoch.net>
Date: Thu, 29 Dec 2016 19:22:12 +0100
MIME-Version: 1.0
In-Reply-To: <650d2371-57da-2494-7628-5a8bc5b756bf@roeck-us.net>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
List-ID: <linux-hwmon@vger.kernel.org>

On 12/26/2016 11:47 AM, Guenter Roeck wrote:
> On 12/23/2016 02:12 PM, Alexander Koch wrote:
>> Replace sysfs symbolic file permissions, e.g. 'S_IRUGO', by octal
>> permissions. This fixes checkpatch.pl warnings.
>>
>> Signed-off-by: Alexander Koch <mail@alexanderkoch.net>
>
> Please do not bother with those warnings and ignore checkpatch.
> We are in the process of doing an automated conversion.

Okay, so I shall create v3 of the patchset, without these changes. I've
found a typo in the 4th patch so I thought about going v3 anyways.

I've tested operation modes 1-3 on real hardware today and found no
issues so far, so I hope v3 will have good chances of getting accepted.


Cheers,

Alex
