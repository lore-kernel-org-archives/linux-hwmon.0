Return-Path: <joel.stan@gmail.com>
Return-path: <joel.stan@gmail.com>
MIME-Version: 1.0
Sender: joel.stan@gmail.com
In-Reply-To: <d2b275f1-cbb2-5266-51e0-4c50aa9b8798@roeck-us.net>
References: <20170624033946.120501-1-venture@google.com> <d2b275f1-cbb2-5266-51e0-4c50aa9b8798@roeck-us.net>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 26 Jun 2017 22:38:14 +0930
Message-ID: <CACPK8XckfG5bcv=ouTt=OH3UZx8GkfY8P-mBr4VQcPYmYdoG6w@mail.gmail.com>
Subject: Re: [PATCH 1/2 v3] hwmon: (aspeed-pwm-tacho) reduce fan_tach period
To: Guenter Roeck <linux@roeck-us.net>
Cc: Patrick Venture <venture@google.com>, linux-hwmon@vger.kernel.org,
	Emily Shaffer <emilyshaffer@google.com>, Peter Hanson <peterh@google.com>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-hwmon@vger.kernel.org>

On Sat, Jun 24, 2017 at 11:23 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On 06/23/2017 08:39 PM, Patrick Venture wrote:

>>
>> Reduce the fan_tach period such that the fan controller uses a shorter
>> period to measure the rpm.
>>
>
> This explains what you are doing, but not why. What is the problem you are
> trying to solve, and why doesn't it create other problems ? Presumably there
> was a reason for the larger period used earlier. If not, if it was just a
> conservative setting, here is the place to say it.
>
> I'd update the information myself, but I don't think the underlying
> specification
> is public, or at least I did not find it.

The datasheet for the Aspeed SoC is not public. Patrick and I can help
answer questions, and I've added Ryan from Aspeed who can answer
questions in more detail.

As I understand it this setting is a trade off between giving the tach
unit enough time to measure complete fan rotations under all
conditions (ie, when the fans are going slow) and getting a timely
measurement. With the driver as-is we have a large delay between
readings, which makes writing a control loop impossible.

I'm not convinced that this driver had enough testing before it was
merged. I agree that Patrick should provide reasoning for his changes,
but I also encourage his efforts as he has spent time looking at the
hardware in detail.

Cheers,

Joel

>
> Guenter
>
>
>> Testing: Tested on an ast2400 sitting on a quanta-q71l.
>>
>> Signed-off-by: Patrick Venture <venture@google.com>
>> ---
>> v3: Added missing change log
>> v2: Updated commit message language
>> ---
>>   drivers/hwmon/aspeed-pwm-tacho.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c
>> b/drivers/hwmon/aspeed-pwm-tacho.c
>> index 86e2ea8287a7..b2ab5612d8a4 100644
>> --- a/drivers/hwmon/aspeed-pwm-tacho.c
>> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
>> @@ -160,7 +160,7 @@
>>    * 11: reserved.
>>    */
>>   #define M_TACH_MODE 0x02 /* 10b */
>> -#define M_TACH_UNIT 0x1000
>> +#define M_TACH_UNIT 0x00c0
>>   #define INIT_FAN_CTRL 0xFF
>>     struct aspeed_pwm_tacho_data {
>>
>
