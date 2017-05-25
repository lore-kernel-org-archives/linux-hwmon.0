Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:38838 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1161788AbdEYBC4 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 24 May 2017 21:02:56 -0400
Subject: Re: [RFC] adding TDM support to applesmc module?
To: Florian Echtler <floe@butterbrot.org>, linux-hwmon@vger.kernel.org,
        rydberg@bitmath.org, rydberg@euromail.se
References: <e6b44662-8b05-fb8d-660e-77153680d11b@butterbrot.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <c88c2d6f-2ed0-0fbf-fc90-6fd113021b8d@roeck-us.net>
Date: Wed, 24 May 2017 18:02:53 -0700
MIME-Version: 1.0
In-Reply-To: <e6b44662-8b05-fb8d-660e-77153680d11b@butterbrot.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 05/09/2017 02:26 AM, Florian Echtler wrote:
> Hello everyone,
> 
> a brief question: I've recently found out how to enable Target Display Mode
> (i.e., use the iMac as a display for an external video source) when running
> Linux, namely by writing to some specific SMC keys.
> 
> Right now, this involves an ugly hacked userspace tool that can't coexist with
> applesmc, so I'd like to do this "properly" and integrate support for these keys
> in applesmc as a sysfs node.
> 
> Would this be the correct route, although applesmc is a hwmon module?
> 
> Best, Florian
> 
Just stumbled over this and realized I never answered. I don't really have
a strong opinion either way; the driver seems to be pretty much messed up as-is
and might ask for a rework as mfd driver. Adding another attribute would not make
that any worse. I'd expect Henrik to agree to any changes, though.

Thanks,
Guenter
