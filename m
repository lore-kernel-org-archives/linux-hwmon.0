Return-Path: <groeck7@gmail.com>
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v2] hwmon: (lm92) Remove spurious test that prevented
 max6635 detection
To: Alvaro Gamez Machado <alvaro.gamez@hazent.com>,
 Jean Delvare <jdelvare@suse.de>
Cc: linux-hwmon@vger.kernel.org
References: <20180321092709.22377-1-alvaro.gamez@hazent.com>
 <20180321110944.4c6d7b98@endymion>
 <20180321102425.GA10804@salem.gmr.ssr.upm.es>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <904a635e-b7c2-a29f-b25c-bed57bc1701f@roeck-us.net>
Date: Wed, 21 Mar 2018 06:26:58 -0700
MIME-Version: 1.0
In-Reply-To: <20180321102425.GA10804@salem.gmr.ssr.upm.es>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On 03/21/2018 03:24 AM, Alvaro Gamez Machado wrote:
> Hi!
> 
> On Wed, Mar 21, 2018 at 11:09:44AM +0100, Jean Delvare wrote:
>> Hi Alvaro,
>>
>> On Wed, 21 Mar 2018 10:27:09 +0100, Alvaro Gamez Machado wrote:
>>> An assumption was made that reads of a max6635 LM92_REG_MAN_ID register
>>> would return the last value read from any other of its registers.
>>>
>>> This assumption is not only something that is not documented anywhere,
>>
>> Correct.
>>
>>> but it is also untrue, so this prevented max6635 recognition.
>>
>> You can easily imagine that it must have been true at some point. Do
>> you really believe some developer would put that code in the driver
>> just for fun?
>>
> 
> Who knows :) But in the abscense of documentation and being able to test
> with hardware I own, I can only say what I did say: it prevents max6635
> recognition. I don't make any judgment on the intent of the developer that
> put that there.
> 
>>
>> The detection was already rather weak for these devices. With this step
>> removed, it is below what I think is acceptable in terms of
>> reliability, as it could easily misdetect another chip and accidentally
>> bind to it. For a driver which uses SMBus word transactions, this could
>> be pretty problematic. So if register LM92_REG_MAN_ID does not contain
>> any useful value on the MAX6635, I would rather drop auto-detection of
>> these devices altogether, and only support them when explicitly
>> instantiated.
> 
> I understand this is not an easy device to test for, but current code with
> modern chips makes max6635_check useless, so it's in fact as good as if
> autodetection didn't exist.
> 
> If you decide to drop auto detection that's fine by me, as at least it will
> be made clear that this device can't be found automatically. I've spent a
> few hours trying to guess why the driver won't bind to my sensor, so it not
> trying to do what it can't do would have been better for my sanity.
> 

Please feel free to submit that patch.

Thanks,
Guenter
