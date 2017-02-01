Return-path: <andrea.merello@gmail.com>
MIME-Version: 1.0
Reply-To: andrea.merello@gmail.com
In-Reply-To: <625efd69-2cce-7029-0163-4353703e5a5e@roeck-us.net>
References: <1485769255-27118-1-git-send-email-andrea.merello@gmail.com>
 <1bb3b18c-d765-2180-7759-76d7dc76e6d6@roeck-us.net> <CAN8YU5O_xhD2Dbti-d9eBHMYyOHZG128G44QXpVt65WfBiXtEw@mail.gmail.com>
 <625efd69-2cce-7029-0163-4353703e5a5e@roeck-us.net>
From: Andrea Merello <andrea.merello@gmail.com>
Date: Wed, 1 Feb 2017 08:31:35 +0100
Message-ID: <CAN8YU5Ma_1c9xw==w5FL5WiPwA=C5ozLoBDWJ+c0Rcmb=_x-bA@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] hwmon: new driver for ST stts751 thermal sensor
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, LABBE Corentin <clabbe.montjoie@gmail.com>,
	Jean Delvare <jdelvare@suse.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-hwmon@vger.kernel.org>

On Tue, Jan 31, 2017 at 12:47 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> On 01/30/2017 11:11 PM, Andrea Merello wrote:
>>
>> On Mon, Jan 30, 2017 at 3:24 PM, Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>> On 01/30/2017 01:40 AM, Andrea Merello wrote:
>>>>
>>>>
>>>> This patch adds a HWMON driver for ST Microelectronics STTS751
>>>> temperature sensors.
>>>>
>>>
>>> Overall looks good. One thing I noticed, though: In the log function
>>> calls,
>>> you use a mix of priv->dev and &client->dev as log device. Also, you
>>> sometimes
>>> use &priv->client->dev even when a local client variable is available.
>>> I can fix up the latter (no need to resend for that), but please have a
>>> look at the overall use and either send a fixed up version or let me know
>>> if the log devices are all intentional as-is.
>>
>>
>> Hmm, you are right: there is a bit of mess here. It's not intentional
>> indeed..
>>
>> I gave a look to lm90.c and lm63.c; it seems no one uses the hwmon
>> device for this purpose. We can probably stick to &client->dev or
>> &priv->client->dev when a local client variable is not already
>> available.
>
>
> It is really your call as the driver's author to make if you want to use
> the hwmon device or &client->dev.

I've decided to stick with &client->dev for all dev_dbg(), while I
would use the hwmon device for dev_notice() and dev_warn(), that are
supposed to be eventually read by the user.

However, while keeping an eye on the log messages I've realized that
if the temperature remains out-of-limit for a lot of time, especially
if the conversion rate is set fast, we tend to spam the log with alert
messages.. I learned that you are usually concerned by noisy drivers,
so I guess you might want to mitigate this..

I could use dev_notice_once(), but it seems inappropriate here, or I
can silence the message at least until one reads the chip. Lm90 does
even disable the alarm until that happen, but it has only one alarm;
here we have two, so it seems not correct here.

Any suggestion?


>>
>>
>> Also, it looks like we can change some &priv->client->dev in
>> &client->dev in probe function when calling i2c read/write functions.
>>
>> If you ACK, I'll fix and resend.
>>
> SGTM.
>
> Thanks,
> Guenter
>
