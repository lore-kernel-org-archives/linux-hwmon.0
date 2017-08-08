Return-Path: <cbostic@linux.vnet.ibm.com>
Return-path: <cbostic@linux.vnet.ibm.com>
Subject: Re: [RFC 0/3] drivers/hwmon/pmbus: Use STATUS_WORD and add status
 sensors
To: Eddie James <eajames@linux.vnet.ibm.com>,
        Guenter Roeck <linux@roeck-us.net>
References: <1502162748-16372-1-git-send-email-eajames@linux.vnet.ibm.com>
 <7484a66c-4f3c-5d76-7c8a-5992d2c1d3ea@roeck-us.net>
 <9b62b070-28ed-3de6-41f2-6910555bbc4d@linux.vnet.ibm.com>
Cc: linux-hwmon@vger.kernel.org, joel@jms.id.au, andrew@aj.id.au,
        jk@ozlabs.org, "Edward A. James" <eajames@us.ibm.com>
From: Christopher Bostic <cbostic@linux.vnet.ibm.com>
Date: Tue, 8 Aug 2017 14:26:15 -0500
MIME-Version: 1.0
In-Reply-To: <9b62b070-28ed-3de6-41f2-6910555bbc4d@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-Id: <1719947a-ea2b-2ce5-4b57-cca961d9ae6d@linux.vnet.ibm.com>
List-ID: <linux-hwmon@vger.kernel.org>



On 8/8/17 11:12 AM, Eddie James wrote:
>
>
> On 08/07/2017 11:00 PM, Guenter Roeck wrote:
>> On 08/07/2017 08:25 PM, Eddie James wrote:
>>> From: "Edward A. James" <eajames@us.ibm.com>
>>>
>>> Hi Guenter,
>>>
>>> I'm looking for some feedback for some extensions to the pmbus core. 
>>> We're
>>> looking for some additional functionality, particularly with 
>>> STATUS_WORD and
>>> obtaining raw status data.
>>>
>>> The first two patches enable the use of the STATUS_WORD register in 
>>> the pmbus
>>> core. This allows the use of more default alarm/fault attributes for 
>>> default
>>> pmbus sensors by allowing the use of the higher byte status bits.
>>>
>>> The third patch adds "status" attributes to each class of hwmon 
>>> sensor created
>>> by pmbus. For example, in1_status and temp1_status. These will 
>>> display the
>>> associated raw status register (e.g. STATUS_INPUT and 
>>> STATUS_TEMPERATURE). I
>>> realize this is not really "normal" for hwmon or pmbus. These are 
>>> potentially
>>> very useful in hardware diagnostic situations where it might be 
>>> impossible
>>> to tell the origin of a failure from a simple alarm or fault bit 
>>> set. We really
>>> want to access the status registers, and for a multi-page pmbus 
>>> device, this is
>>> pretty tricky from userspace.
>>>
>>> Please let me know your thoughts,
>>> Thanks,
>>
>> I don't mind providing such data with debugfs, for example, but I 
>> don't see
>> the point in providing it as part of the ABI. Which, in part, since 
>> it requires
>> a lot of thought on my side, is part of the reason why I didn't provide
>> feedback to your earlier patches yet. Sorry, I've been exceptionally 
>> busy
>> lately, and non-standard requests tend to end up at the end of the 
>> queue :-(.
Hi Guenter,

In this case we're pulling fail data out of the hardware to diagnose 
what happened, so just wanted to verify that debugfs is still ok. I was 
assuming it was for internal kernel debugging and not hardware fault 
logging.

Thanks,
Chris


>
> No problem! Thanks for the quick response on this.
>
>>
>> Any reason why debugfs is not sufficient and/or acceptable for your 
>> use case ?
>> You _are_ talking about diagnostic situations, which seems to be an 
>> exact fit
>> for debugfs.
>
> Agreed, great idea, I think debugfs will work perfectly. I probably 
> should have thought of that sooner...
>
> How about the first two patches in the series? They are unrelated to 
> adding any attributes. Mainly I would
> like to have the PB_STATUS_INPUT bit available to trigger the default 
> boolean alarm attribute, as our hardware doesn't support any limits.
>
> Thanks again,
> Eddie
>
>>
>> Guenter
>>
>>>
>>> Edward A. James (3):
>>>    drivers/hwmon/pmbus: Access word data for STATUS_WORD and use it by
>>>      default
>>>    drivers/hmwon/pmbus: store STATUS_WORD in status registers
>>>    drivers/hwmon/pmbus: Add sensor status to pmbus attributes
>>>
>>>   drivers/hwmon/pmbus/pmbus_core.c | 153 
>>> +++++++++++++++++++++++++++++++++------
>>>   1 file changed, 130 insertions(+), 23 deletions(-)
>>>
>>
>
