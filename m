Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:58569 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757310AbcK2LX4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 29 Nov 2016 06:23:56 -0500
Subject: Re: [PATCH] hwmon: (dme1737) Convert to use
 devm_hwmon_device_register_with_groups
To: Juerg Haefliger <juergh@gmail.com>
References: <1480199209-28532-1-git-send-email-linux@roeck-us.net>
 <CADLDEKubHgVJo7Or5qpfHUbo_UBMW1BvJmmxUJA_w6APkN8JkA@mail.gmail.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <6925e165-704b-02a5-8950-5eab2f5765f9@roeck-us.net>
Date: Tue, 29 Nov 2016 03:23:48 -0800
MIME-Version: 1.0
In-Reply-To: <CADLDEKubHgVJo7Or5qpfHUbo_UBMW1BvJmmxUJA_w6APkN8JkA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 11/28/2016 01:23 AM, Juerg Haefliger wrote:
> Hi Guenter,
>
> This is a large patch. Is it possible to break it up into smaller ones
> or does it have to be one single patch?
>

I overlooked this comment earlier. Should be possible. I'll have a look.
Going to take a while, though, but then we are not really in a hurry.

Guenter

