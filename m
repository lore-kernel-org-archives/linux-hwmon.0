Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:45930 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757480AbcH2Oqi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 29 Aug 2016 10:46:38 -0400
Subject: Re: [v4.7.2: Oops] When loading IT87 HARDWARE MONITORING DRIVER
To: Jean Delvare <jdelvare@suse.de>,
        Alexander Kapshuk <alexander.kapshuk@gmail.com>
References: <CAJ1xhMXZNMYMew4N2SZdhJm9FaiRjr=T63+72UdYpYfC+api_A@mail.gmail.com>
 <20160829120634.039204a6@endymion> <20160829121140.38c10554@endymion>
Cc: linux-hwmon@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <ea52f8e5-7dad-45f6-c1e8-6a1c1b787261@roeck-us.net>
Date: Mon, 29 Aug 2016 07:46:36 -0700
MIME-Version: 1.0
In-Reply-To: <20160829121140.38c10554@endymion>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 08/29/2016 03:11 AM, Jean Delvare wrote:
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
Yes. Oops, I should know better. Thanks for picking this up so quickly.

Guenter

