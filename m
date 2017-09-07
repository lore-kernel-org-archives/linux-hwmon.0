Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:37435 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754862AbdIGNkw (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 7 Sep 2017 09:40:52 -0400
Subject: Re: [PATCH] hwmon: pmbus: Make reg check and clear faults functions
 return errors
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, joel@jms.id.au
References: <20170905070132.17682-1-andrew@aj.id.au>
 <20170905170002.GG11478@roeck-us.net> <1504657417.28363.8.camel@aj.id.au>
 <20170906225102.GA32210@roeck-us.net> <1504740749.5042.2.camel@aj.id.au>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <b9209305-6273-6147-a6de-033a1b3d190b@roeck-us.net>
Date: Thu, 7 Sep 2017 06:40:49 -0700
MIME-Version: 1.0
In-Reply-To: <1504740749.5042.2.camel@aj.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/06/2017 04:32 PM, Andrew Jeffery wrote:

>>   
>> Guess I need to dig up my eval board and see if I can reproduce the problem.
>> Seems you are saying that the problem is always seen when issuing a sequence
>> of "clear faults" commands on multiple pages ?
> 
> Yeah. We're also seeing bad behaviour under other command sequences as well,
> which lead to this hack of a work-around patch[1].
> 
> I'd be very interested in the results of testing against the eval board. I
> don't have access to one and it seems Maxim have discontinued them.
> 

Do you have a somewhat reliable means to reproduce the problem ?

Guenter

