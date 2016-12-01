Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:34942 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756400AbcLAWQI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Thu, 1 Dec 2016 17:16:08 -0500
Received: by mail-pg0-f68.google.com with SMTP id p66so5805666pga.2
        for <linux-hwmon@vger.kernel.org>; Thu, 01 Dec 2016 14:15:21 -0800 (PST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
Subject: Re: [PATCH 1/2] hwmon: Add Texas Instruments TMP108 temperature
 sensor driver.
From: John Muir <john@jmuir.com>
In-Reply-To: <20161201220817.GA5274@roeck-us.net>
Date: Thu, 1 Dec 2016 14:15:19 -0800
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        John Muir <muirj@google.com>,
        Anatol Pomazau <anatol@google.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1FB8E976-D98E-4950-B643-15D57A4ACC51@jmuir.com>
References: <1480209983-65915-1-git-send-email-john@jmuir.com>
 <1480538179-75901-1-git-send-email-john@jmuir.com>
 <1480538179-75901-2-git-send-email-john@jmuir.com>
 <e2d01c5f-8d8e-16be-24c8-d19c2a8bc400@roeck-us.net>
 <126058B2-9FD8-4F95-AEAA-3F1A60CCC1FD@jmuir.com>
 <20161201220817.GA5274@roeck-us.net>
To: Guenter Roeck <linux@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Guenter,

On Dec 1, 2016, at 2:08 PM, Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> 
>> Should we be concerned about restoring the configuration here?
>> 
> Interesting question. If the chip was really powered off, you would
> have to restore the entire configuration, not just the configuration
> register. Given that, I think it is sufficient to just restore the
> operational mode, ie the value changed when entering suspend.
> 
OK. Will do.

> Where did you find regmap_sync() ? It seems to be hiding from me.

Sorry, I meant regcache_sync().

John.
