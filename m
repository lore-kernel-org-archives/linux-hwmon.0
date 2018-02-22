Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:8006 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933424AbeBVRUt (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Feb 2018 12:20:49 -0500
Subject: Re: [PATCH v2 1/8] [PATCH 1/8] drivers/peci: Add support for PECI bus
 driver core
To: Greg KH <gregkh@linuxfoundation.org>
Cc: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de, jdelvare@suse.com,
        linux@roeck-us.net, benh@kernel.crashing.org, andrew@lunn.ch,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-2-jae.hyun.yoo@linux.intel.com>
 <20180221175853.GA22320@kroah.com>
 <7f152459-a232-e62a-3c34-e995f8c85d63@linux.intel.com>
 <20180222065455.GA2428@kroah.com>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <9bd825f4-8497-4e2a-b8ea-56888df754e7@linux.intel.com>
Date: Thu, 22 Feb 2018 09:20:47 -0800
MIME-Version: 1.0
In-Reply-To: <20180222065455.GA2428@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 2/21/2018 10:54 PM, Greg KH wrote:
> On Wed, Feb 21, 2018 at 12:42:30PM -0800, Jae Hyun Yoo wrote:
>> On 2/21/2018 9:58 AM, Greg KH wrote:
>>> On Wed, Feb 21, 2018 at 08:15:59AM -0800, Jae Hyun Yoo wrote:
>>>> This commit adds driver implementation for PECI bus into linux
>>>> driver framework.
>>>>
>>>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>>>> ---
>>>
>>> Why is there no other Intel developers willing to review and sign off on
>>> this patch?  Please get their review first before asking us to do their
>>> work for them :)
>>>
>>> thanks,
>>>
>>> greg k-h
>>>
>>
>> Hi Greg,
>>
>> This patch set got our internal review process. Sorry if it's code quality
>> is under your expectation but it's the reason why I'm asking you to review
>> the code. Could you please share your time to review it?
> 
> Nope.  If no other Intel developer thinks it is good enough to put their
> name on it as part of their review process, why should I?
> 
> Again, please use the resources you have, to fix the obvious problems in
> your code, BEFORE asking the community to do that work for you.
> 
> greg k-h
> 

Okay. I'll take our internal review process again on this patch set and 
collect more credit tags before submitting v3.

Thanks for your advice!

Jae
