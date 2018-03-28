Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:45069 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753013AbeC1NRo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Mar 2018 09:17:44 -0400
Subject: Re: [PATCH v3] hwmon: MC13783: add uid and die temperature sensor
 inputs
To: Lee Jones <lee.jones@linaro.org>
Cc: Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        jdelvare@suse.com, cphealy@gmail.com, andrew.smirnov@gmail.com,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1522160389-18822-1-git-send-email-andrey.gusakov@cogentembedded.com>
 <ecb9f724-de98-5435-135c-2ca2661f5ee6@roeck-us.net>
 <20180328100606.huvblelpdsbzx3w7@dell>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <66c664db-c4d8-f2bc-e34c-2480509d0d95@roeck-us.net>
Date: Wed, 28 Mar 2018 06:17:40 -0700
MIME-Version: 1.0
In-Reply-To: <20180328100606.huvblelpdsbzx3w7@dell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 03/28/2018 03:06 AM, Lee Jones wrote:
> On Tue, 27 Mar 2018, Guenter Roeck wrote:
> 
>> On 03/27/2018 07:19 AM, Andrey Gusakov wrote:
>>> The uid and die temperature can be read out on the ADIN7 using
>>> input mux. Map uid and die temperature sensor to channels 16
>>> and 17.
>>>
>>> Signed-off-by: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
>>
>> Applied to hwmon-next.
> 
> You've applied changes to a subsystem without an appropriate
> Maintainer Ack?
> 

Me blind. I didn't realize that part of it was in mfd. Now dropped, and sorry.

Guenter

>>> ---
>>> Changes in v3:
>>> - comment style fixes
>>> Changes in v2:
>>> - suport both mc13783 and mc13892
>>> - uid_input renamed to in16_input
>>> - style fixes
>>> ---
>>>    drivers/hwmon/mc13783-adc.c | 60 +++++++++++++++++++++++++++++++++++++++++++++
>>>    drivers/mfd/mc13xxx-core.c  | 15 +++++++++++-
>>>    include/linux/mfd/mc13xxx.h |  2 ++
>>>    3 files changed, 76 insertions(+), 1 deletion(-)
> 

