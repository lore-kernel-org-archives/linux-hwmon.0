Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-ua0-f172.google.com ([209.85.217.172]:35923 "EHLO
        mail-ua0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751921AbdDLKnE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 12 Apr 2017 06:43:04 -0400
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.20.1704121124510.1874@nanos>
References: <20161122173622.771252945@linutronix.de> <65310945-a720-5437-f7cb-9d8af1e5b53d@roeck-us.net>
 <CA+ydwtpYPP9xSTDfOmZSUamb1aadOoqCs18sWBanzFaSxJhWWQ@mail.gmail.com> <alpine.DEB.2.20.1704121124510.1874@nanos>
From: Tommi Rantala <tt.rantala@gmail.com>
Date: Wed, 12 Apr 2017 13:43:03 +0300
Message-ID: <CA+ydwtqKqzjLDiaCEuvXfYp3Lkbh+z-+s=1JfwkuiVOWp3QfgA@mail.gmail.com>
Subject: Re: [patch 0/6] hwmon/coretemp: Hotplug fixes, cleanups and state
 machine conversion
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Guenter Roeck <linux@roeck-us.net>,
        LKML <linux-kernel@vger.kernel.org>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        Sebastian Siewior <bigeasy@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>, x86@kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

2017-04-12 12:28 GMT+03:00 Thomas Gleixner <tglx@linutronix.de>:
> On Wed, 12 Apr 2017, Tommi Rantala wrote:
>> Resume-from-suspend stopped working in HP xw6600 in fedora kernel
>> 4.10.8-200.fc25.x86_64, while it worked just fine in
>> 4.9.9-200.fc25.x86_64.
>>
>> When powering on the suspended PC, there is no video output, and to
>> recover, I need to reset the machine.
>
> Is there just no video output or is the machine completely frozen? If it's
> not completely dead, then you might be able to ssh into it.

It's completely hosed: not possible to ssh, does not respond to ping either.

I made a quick test with netconsole. After booting with
no_console_suspend=1, and setting the netconsole parameters, I can get
kernel messages (to my android phone) when suspending the machine. But
no messages after the failed resume.

Hmm, might I be able to capture messages over USB serial port...?

-Tommi
