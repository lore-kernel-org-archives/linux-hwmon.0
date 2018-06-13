Return-Path: <pmenzel@molgen.mpg.de>
Return-path: <pmenzel@molgen.mpg.de>
Subject: Re: nct6775: UBSAN: shift exponent 32 is too large for 32-bit type
 'long unsigned int'
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <d02001e2-fa4c-6a2e-cc50-a8d9a8146d57@molgen.mpg.de>
 <20180612221218.GA15406@roeck-us.net>
From: Paul Menzel <pmenzel+linux-hwmon@molgen.mpg.de>
Message-ID: <0591d6af-a9f4-c874-3ae8-a9a5c7161934@molgen.mpg.de>
Date: Wed, 13 Jun 2018 08:57:58 +0200
MIME-Version: 1.0
In-Reply-To: <20180612221218.GA15406@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Dear Guenter,


Am 13.06.2018 um 00:12 schrieb Guenter Roeck:

> On Tue, Jun 12, 2018 at 11:50:45PM +0200, Paul Menzel wrote:

>> Building Linux with the undefined behavior sanitizer (UBSAN), loading the
>> module *nct6775* on the ASRock E350M1 shows the error below.
>>
>> ```
>> [   28.322775] UBSAN: Undefined behaviour in drivers/hwmon/nct6775.c:4179:27
>> [   28.322833] shift exponent 32 is too large for 32-bit type 'long unsigned int'
>> ```
>>
>> I believe this was introduced by commit cc66b3038254 (hwmon: (nct6775)
>> Rework temperature source and label handling), but the same issue was
>> already present before.
> 
> I don't think so. The code used to be
> 	for (i = 0; i < data->temp_label_num - 1; i++) {
> Notice the "- 1". So it should be
> 	for (i = 0; i < 31; i++) {
> 
> In practice it doesn't matter because "data->temp_mask & BIT(31 + 1)"
> will always be false, causing the last loop iteration to abort, but
> it is nevertheless wrong.
> 
> Thanks a lot for the report. I'll prepare a patch.

Thank you for the instant response. I tested your proposed change, and, 
as expected, the error is gone.


Kind regards,

Paul
