Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:35307 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756538AbcH2KRU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 29 Aug 2016 06:17:20 -0400
MIME-Version: 1.0
In-Reply-To: <20160829121140.38c10554@endymion>
References: <CAJ1xhMXZNMYMew4N2SZdhJm9FaiRjr=T63+72UdYpYfC+api_A@mail.gmail.com>
 <20160829120634.039204a6@endymion> <20160829121140.38c10554@endymion>
From: Alexander Kapshuk <alexander.kapshuk@gmail.com>
Date: Mon, 29 Aug 2016 13:16:37 +0300
Message-ID: <CAJ1xhMWgTJHUbn6B1QNKc=yi8pMZyg0DR+xUoNJAGaHhxKrEVw@mail.gmail.com>
Subject: Re: [v4.7.2: Oops] When loading IT87 HARDWARE MONITORING DRIVER
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-hwmon@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Aug 29, 2016 at 1:11 PM, Jean Delvare <jdelvare@suse.de> wrote:
> On Mon, 29 Aug 2016 12:06:34 +0200, Jean Delvare wrote:
>> I'm trying to find when the bug was introduced. I have a hard time
>> believing it went unnoticed for long. If it fixes your problem I'll
>> send a clean patch.
>
> Broken by:
>
> commit 52929715634ad36782bd7018ab0bf59a6619c393
> Author: Guenter Roeck <linux@roeck-us.net>
> Date:   Sat Mar 30 14:00:08 2013 -0700
>
>     hwmon: (it87) Use is_visible for voltage sensors
>
> Only kernel v4.7 is affected. I'll send a clean patch after my lunch.
>
> --
> Jean Delvare
> SUSE L3 Support

Hello Jean,

Thanks very much for your response.

I am away from my PC at the moment, so I cannot try out your proposed fix.
I would be able to do so at my earliest convenience, and let you know
how I went, i.e. if you still want me to try it out.

Alexander.
