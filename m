Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44615 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727141AbeHOP30 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 15 Aug 2018 11:29:26 -0400
Subject: Re: [PATCH 2/2 v2] hwmon: (adt7475) Make adt7475_read_word() return
 errors
To: IKEGAMI Tokunori <ikegami@allied-telesis.co.jp>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc: Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
References: <TYAPR01MB2175C5AA4B777C61CB0AE04DDC380@TYAPR01MB2175.jpnprd01.prod.outlook.com>
 <20180814100747.oovzd66gxmm755nr@kili.mountain>
 <20180814134049.GA607@roeck-us.net>
 <TY2PR01MB216928C2DF3E2976F4E9BDADDC3F0@TY2PR01MB2169.jpnprd01.prod.outlook.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <01f7b2a7-f1af-65d0-5e6e-9d2a484f3a48@roeck-us.net>
Date: Wed, 15 Aug 2018 05:37:23 -0700
MIME-Version: 1.0
In-Reply-To: <TY2PR01MB216928C2DF3E2976F4E9BDADDC3F0@TY2PR01MB2169.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 08/14/2018 11:02 PM, IKEGAMI Tokunori wrote:
> Hi Guenter-san,
> 
> Could you please let me know the git repository that applied the fixes by Dan-san?
> 

Series now uploaded. I'll send a pull request to Linus after -rc1 has been published.

git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon

Guenter

> Regards,
> Ikegami
> 
>> -----Original Message-----
>> From: Guenter Roeck [mailto:groeck7@gmail.com] On Behalf Of Guenter
>> Roeck
>> Sent: Tuesday, August 14, 2018 10:41 PM
>> To: Dan Carpenter
>> Cc: Jean Delvare; IKEGAMI Tokunori; linux-hwmon@vger.kernel.org;
>> kernel-janitors@vger.kernel.org
>> Subject: Re: [PATCH 2/2 v2] hwmon: (adt7475) Make adt7475_read_word()
>> return errors
>>
>> On Tue, Aug 14, 2018 at 01:07:47PM +0300, Dan Carpenter wrote:
>>> The adt7475_read_word() function was meant to return negative error
>>> codes on failure.
>>>
>>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>>> Reviewed-by: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
>>
>> Applied.
>>
>> Thanks,
>> Guenter
> 
