Return-path: <elfring@users.sourceforge.net>
Subject: Re: hwmon-NCT: Fine-tuning for four function implementations
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-hwmon@vger.kernel.org, =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?=
 <linux@roeck-us.net>, LKML <linux-kernel@vger.kernel.org>,
 kernel-janitors@vger.kernel.org
References: <2f58a509-4aba-5c44-bc79-568b260ab692@users.sourceforge.net>
 <20170427145030.5507a32e@endymion>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <e760b938-fe40-c603-bd6d-26dba0103c55@users.sourceforge.net>
Date: Thu, 27 Apr 2017 15:23:16 +0200
MIME-Version: 1.0
In-Reply-To: <20170427145030.5507a32e@endymion>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>



Am 27.04.2017 um 14:50 schrieb Jean Delvare:
> On Thu, 27 Apr 2017 11:27:21 +0200, SF Markus Elfring wrote:
>> From: Markus Elfring <elfring@users.sourceforge.net>
>> Date: Thu, 27 Apr 2017 11:18:22 +0200
>>
>> A few update suggestions were taken into account
>> from static source code analysis.
>>
>> Markus Elfring (4):
>>   Use devm_kcalloc() in nct6683_create_attr_group()
>>   Adjust five checks for null pointers
>>   Use devm_kcalloc() in nct6775_create_attr_group()
>>   Adjust seven checks for null pointers
>>
>>  drivers/hwmon/nct6683.c | 15 +++++++--------
>>  drivers/hwmon/nct6775.c | 19 +++++++++----------
>>  2 files changed, 16 insertions(+), 18 deletions(-)
> 
> You have proven in the past on various lists that 1* you have no
> understanding about the changes you are proposing

You are right in the sense that my knowledge is still incomplete
in some areas.


> and 2* you have no skills to discuss any problem that could be found
> in your patches.

But I disagree to this view. My skills might not fit to your expectations
at the moment. But I hope that there are further opportunities to resolve
remaining software development concerns.

Regards,
Markus
