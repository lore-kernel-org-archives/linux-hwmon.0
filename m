Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from ms.trustica.cz ([82.208.32.68]:58627 "EHLO ms.trustica.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933841AbcKMQhH (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 13 Nov 2016 11:37:07 -0500
Subject: Re: Changing PWM on Winbond W83627DHG-P
To: Patrik Dufresne <info@patrikdufresne.com>
References: <CAJ=kj5zud0RiV1nORXoX0Rop4TvsuAxd4vRZtRL-1ANMegkWTw@mail.gmail.com>
Cc: linux-hwmon@vger.kernel.org
From: Rudolf Marek <r.marek@assembler.cz>
Message-ID: <49f137d4-b50d-0642-6532-3097137d4c7d@assembler.cz>
Date: Sun, 13 Nov 2016 17:27:35 +0100
MIME-Version: 1.0
In-Reply-To: <CAJ=kj5zud0RiV1nORXoX0Rop4TvsuAxd4vRZtRL-1ANMegkWTw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Patrik

Please read this:

https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/Documentation/hwmon/w83627ehf?id=refs/tags/v4.9-rc4

IIRC you need to set it to manual mode first via echo 1 > .../pwmX_enable
and perhaps then it will accept your PWM values.

I'm giving proper mailing list on CC, maybe someone will help.

Thanks
Rudolf


Dne 13.11.2016 v 17:18 Patrik Dufresne napsal(a):
> Hello,
> 
> Sorry to contact you directly, but I didn't find the proper mailing list to post
> my question related to w83627ehf driver.
> 
> I own a Supermicro X8DTL-iF with a Winbond W83627DHG-P chipset. The chipset was
> properly discovered and enabled by lm-sensors. In sysfs, I can see the path
> /sys/devices/platform/w83627ehf.2576.
> 
> I've tried changing the value of pwm* according
> to https://www.kernel.org/doc/Documentation/hwmon/w83627ehf. But it doesn't have
> any effect on the actual fan speed. 
> 
> Any suggestions ?
> 
> --
> Patrik Dufresne Service Logiciel inc.
> http://www.patrikdufresne.com <http://patrikdufresne.com/>/
> 514-971-6442
> 1-114 rue des Hautbois,
> St-Colomban, QC J5K 2H6
