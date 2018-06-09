Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:50155 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753230AbeFITDy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 9 Jun 2018 15:03:54 -0400
Received: from mail-pf0-f198.google.com ([209.85.192.198])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1fRj9V-0001Na-Io
        for linux-hwmon@vger.kernel.org; Sat, 09 Jun 2018 19:03:53 +0000
Received: by mail-pf0-f198.google.com with SMTP id g20-v6so475170pfi.2
        for <linux-hwmon@vger.kernel.org>; Sat, 09 Jun 2018 12:03:53 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii;
        delsp=yes;
        format=flowed
Mime-Version: 1.0 (Mac OS X Mail 11.4 \(3445.8.2\))
Subject: Re: Ryzen 2700 Temperature offset?
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <20180607154915.GA7061@roeck-us.net>
Date: Sun, 10 Jun 2018 03:03:47 +0800
Cc: Chris Ouellet <rabbit.of.war@gmail.com>,
        linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <54EAD835-C48D-4751-9BFF-71536241129A@canonical.com>
References: <C85830A6-BCC7-4137-84E5-38503873F278@canonical.com>
 <20180607154915.GA7061@roeck-us.net>
To: Guenter Roeck <linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

at 23:49, Guenter Roeck <linux@roeck-us.net> wrote:

> On Thu, Jun 07, 2018 at 11:03:13AM +0800, Kai Heng Feng wrote:
>> Hi Guenter,
>>
>> A user thinks the Ryzen 2700 temperature may not be correct [1].
>> Can you take a look when you have time? Thanks.
>>
>> Also, where can I find all these temperature offsets? I googled but with  
>> no
>> result.
> Problem is that the offsets are not documented in public, making it
> difficult to find out. For Ryzen 2700, there is currently no offset
> configured; I was told that there is none. For Ryzen 2700X, the offset
> is 10 degrees C.

I am still quite interesting where you get this information...

>
>> [1] https://bugs.launchpad.net/bugs/1774817
>
> The key here is the commit mentioned in the log (1b59788979acd). It does
> not only adjust the per-CPU offset, but also takes a configurable offset
> of 49 degrees C into account. You'll need to apply that patch in your
> kernel, or the temperature may be off by 49 degrees C.

So unless AMD shares these offsets value, we can never know what correct  
offsets are?

Kai-Heng

>
> Hope this helps. If not, please let me know. Note that I am travelling;
> responses may be delayed.
>
> Guenter


