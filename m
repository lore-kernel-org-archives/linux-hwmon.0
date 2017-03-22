Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:33880 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759401AbdCVNGi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 22 Mar 2017 09:06:38 -0400
Received: by mail-io0-f196.google.com with SMTP id n76so10156342ioe.1
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Mar 2017 06:06:00 -0700 (PDT)
Date: Wed, 22 Mar 2017 07:05:55 -0600
From: Sam Povilus <kernel.development@povil.us>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com
Subject: Re: [PATCH v5] hwmon: ads7828 optional parameters from the device
 tree
Message-ID: <20170322130555.wgwrkeju43dvj232@irascible.povil.us>
References: <20170321032434.9268-1-kernel.development@povil.us>
 <20170322084240.xspj432z2mpyzykq@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170322084240.xspj432z2mpyzykq@ninjato>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Mar 22, 2017 at 09:42:40AM +0100, Wolfram Sang wrote:
> 
> >  .../devicetree/bindings/i2c/trivial-devices.txt    |  2 --
> 
> This file is about to get moved one directory up:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git/commit/?h=dt/next&id=b7e252fcddfa573bb1ee275b53bba6cef85671d4
> 
> Just so you know already...
> 

Thanks! I'm a bit new to this, what's the best way for me to handle
this? Submit against Linus' tree (presumably making a merge nightmare
for someone) or rebase my branch off robh's (and presumably risking some
other branch's patch conflicting)?
