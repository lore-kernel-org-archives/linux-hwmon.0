Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-qt0-f169.google.com ([209.85.216.169]:43765 "EHLO
        mail-qt0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751422AbeBXABJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 23 Feb 2018 19:01:09 -0500
MIME-Version: 1.0
In-Reply-To: <b506b4b1-7e7d-abd6-bac2-c45e7c1e0aae@linux.intel.com>
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-8-jae.hyun.yoo@linux.intel.com> <20180221182608.GA11635@roeck-us.net>
 <618f34cd-ee43-d8e4-4fb0-3c23bf03835f@linux.intel.com> <20180221214859.GA30263@roeck-us.net>
 <576a50c6-c302-654c-ceb3-aaf820b7738a@linux.intel.com> <20180222003720.GA25250@lunn.ch>
 <b506b4b1-7e7d-abd6-bac2-c45e7c1e0aae@linux.intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 24 Feb 2018 01:00:47 +0100
Message-ID: <CANiq72mjsfJRzfFmhbL7dnih_0=2pFoJDTrmi35x0yLmKrSBFA@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] [PATCH 7/8] drivers/hwmon: Add a generic PECI
 hwmon client driver
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Guenter Roeck <linux@roeck-us.net>,
        joel@jms.id.au, andrew@aj.id.au, Arnd Bergmann <arnd@arndb.de>,
        Greg KH <gregkh@linuxfoundation.org>, jdelvare@suse.com,
        benh@kernel.crashing.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Feb 22, 2018 at 2:29 AM, Jae Hyun Yoo
<jae.hyun.yoo@linux.intel.com> wrote:
> On 2/21/2018 4:37 PM, Andrew Lunn wrote:
>>>
>>> But even with this change, it still needs to use delayed creation
>>> because BMC side kernel doesn't know how many DIMMs are populated on
>>> a remote server before the remote server completes its memory
>>> training and testing in BIOS, but it needs to check the remote
>>> server's CPU temperature as immediate as possible to make
>>> appropriate thermal control based on the remote CPU's temperature to
>>> avoid any critical thermal issue. What would be a better solution in
>>> this case?
>>
>>
>> You could change this driver so that it supports one DIMM.  Move the
>> 'hotplug' part into another driver which creates and destroys
>> instances of the hwmon DIMM device as the DIMMS come and go.
>>
>> Also, do you need to handle CPU hotplug? You could split the CPU
>> temperature part into a separate hwmon driver? And again create and
>> destroy devices as CPUs come and go?
>>
>>         Andrew
>>
>
> That seems like a possible option. I'll rewrite the hwmon driver again like
> that.
>
> Thanks for the good idea. :)

By the way, in the rewrite, please try to avoid the create*workqueue()
functions (they are deprecated :).

Cheers,
Miguel

>
> Jae
