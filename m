Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:35266 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750967AbdIHFOh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 8 Sep 2017 01:14:37 -0400
Subject: Re: [PATCH] hwmon: pmbus: Make reg check and clear faults functions
 return errors
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
        linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org,
        corbet@lwn.net, linux-kernel@vger.kernel.org
References: <20170905070132.17682-1-andrew@aj.id.au>
 <20170905170002.GG11478@roeck-us.net> <1504657417.28363.8.camel@aj.id.au>
 <20170906225102.GA32210@roeck-us.net> <1504740749.5042.2.camel@aj.id.au>
 <b9209305-6273-6147-a6de-033a1b3d190b@roeck-us.net>
 <1504797770.5105.7.camel@aj.id.au>
 <cbbca5f6-4c40-d20e-b27d-2e965822ccb4@roeck-us.net>
 <1504832527.6124.1.camel@aj.id.au>
 <f5752c40-4f1a-c6d6-ee4f-8099e802815e@roeck-us.net>
 <1504836369.6124.2.camel@aj.id.au>
 <75d9f838-aa4a-5cbd-744a-4d8e8bf1a370@roeck-us.net>
 <1504839076.6124.8.camel@aj.id.au> <1504842058.6124.10.camel@aj.id.au>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <a9924f0c-ee26-6c6b-262e-84dacb50b6a6@roeck-us.net>
Date: Thu, 7 Sep 2017 22:14:34 -0700
MIME-Version: 1.0
In-Reply-To: <1504842058.6124.10.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/07/2017 08:40 PM, Andrew Jeffery wrote:
> On Fri, 2017-09-08 at 12:51 +1000, Andrew Jeffery wrote:
>>> I can't test with devicetree. x86 system.
>>>   
>>> 2,100+ iterations with your driver, no failures.
>>
>> Great. I really appreciate your testing here, so thanks for your
>> efforts. I owe you a few drinks if we ever happen to meet.
> 
> Actually, on that, how did you chop out the devicetree parts? Did you
> keep the configuration writes at the end of max31785_of_fan_config()
> and max31785_of_tmp_config()? Or did you just not call them? These two
> functions cause the bulk of the bus traffic with on probe.
> 
fan config hardcoded, four fans connected. Still no failure.

Guenter

