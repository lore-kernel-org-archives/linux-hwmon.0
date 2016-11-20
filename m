Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:57434 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753004AbcKTDxY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 19 Nov 2016 22:53:24 -0500
Subject: Re: [05/20] hwmon/via-cputemp: Remove pointless CPU check on each CPU
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
References: <20161117183541.8588-6-bigeasy@linutronix.de>
 <20161119172331.GA25098@roeck-us.net>
 <20161119225354.gbynqtyzdxpgyqu5@linutronix.de>
Cc: linux-kernel@vger.kernel.org, rt@linutronix.de,
        Thomas Gleixner <tglx@linutronix.de>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <53da100c-f7ee-1acd-8004-dc49a0cded87@roeck-us.net>
Date: Sat, 19 Nov 2016 19:53:21 -0800
MIME-Version: 1.0
In-Reply-To: <20161119225354.gbynqtyzdxpgyqu5@linutronix.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 11/19/2016 02:53 PM, Sebastian Andrzej Siewior wrote:
> On 2016-11-19 09:23:31 [-0800], Guenter Roeck wrote:
>> Applied to -next.
>
> Thanks. Since you took that one, could you also please consider to apply
> |[PATCH 06/20 v2] hwmon/via-cputemp: Convert to hotplug state machine
> ? It depends on the 5th patch from the series which applied.
>

Problem is that I have no idea if any of the patches in this series really work.
I wasn't copied on all patches, meaning I don't have the infrastructure, meaning
I'll have to dig them up from patchwork for testing, and/or figure out if the
required infrastructure is already in the kernel, and that all takes time.
Just Acking or applying the the patches w/o testing doesn't seem appropriate,
given their level of intrusiveness. I did spend most of today working through
my backlog of hwmon patches, but that series simply was too much. I hope I'll
get to it tomorrow, but no promises.

Guenter

