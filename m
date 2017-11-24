Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f47.google.com ([74.125.82.47]:46940 "EHLO
        mail-wm0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752848AbdKXLNo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Nov 2017 06:13:44 -0500
Date: Fri, 24 Nov 2017 12:13:40 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To: Oleksandr Natalenko <oleksandr@natalenko.name>
Cc: Jonathan Buzzard <jonathan@buzzard.org.uk>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mario Limonciello <mario.limonciello@dell.com>
Subject: Re: i8k_smm_func() takes enormous of time to execute
Message-ID: <20171124111340.cuszehmkmxg5re64@pali>
References: <12093169.Rm9IG5ILEB@natalenko.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12093169.Rm9IG5ILEB@natalenko.name>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thursday 23 November 2017 22:41:03 Oleksandr Natalenko wrote:
> Hi, Jonathan, Mario et al.
> 
> I've noticed that querying Dell Vostro 3360 hwmon sensor freezes the system 
> completely (like, really completely, even mouse cursor does not move, and 
> sound playback stops) for approx. half of a second. Then, system recovers and 
> runs as usual. Also, sensor readings are okay, for instance:
> 
> ===
> $ sensors dell_smm-virtual-0
> dell_smm-virtual-0
> Adapter: Virtual device
> Processor Fan: 5615 RPM
> CPU:            +51.0°C  
> Ambient:        +36.0°C  
> Other:          +63.0°C  
> SODIMM:         +41.0°C 
> ===
> 
> So, I've used trace-cmd to check what takes that much amount of time to 
> execute, and got this:
> 
> ===
> # trace-cmd record -p function_graph -l i8k_smm -F sensors dell_smm-virtual-0
> $ trace-cmd report
> ...
> sensors-23694 [002] 89099.214369: funcgraph_entry:      # 503440.746 us |  
> i8k_smm();
> ...
> ===
> 
> Clearly, 0.5 s delay.
> 
> Looking at i8k_smm(), it calls i8k_smm_func() on 0th CPU:
> 
> ===
>  232     ret = smp_call_on_cpu(0, i8k_smm_func, regs, true);
> ===
> 
> which, in turn, does some asm magic.

Hi! If you compile module with DEBUG, then i8k_smm_func function print
into dmes how much time it spend in SMM mode. And also it print which
SMM action it was.

Therefore you would be able to figure out which SMM call (which is just
RPC) cause this freeze.

Basically when CPU is in SMM mode, then execution of kernel is stopped
and kernel does not know that such thing happened. So it is up to the
SMM implementation to return control ASAP back to non-SMM mode.

Kernel has no control over SMM, it can be fixed only by vendor by new
BIOS or firmware update.

What we can do is just identify problematic calls and avoid their usage.

This problem is independent of kernel or whole operating system.

> I know that SMM is kinda "black box", and kernel has little to do with it, but 
> I think that under Windows, for instance, it would work without freezes. So, 
> likely, querying SMM might be done differently.
> 
> I do not know how to approach this issue, thus asking for help/advice. Also, 
> CCing Jonathan since the comment before asm magic says this:
> 
> ===
>  137  * Call the System Management Mode BIOS. Code provided by Jonathan 
> Buzzard.
> ===
> 
> This was also reported in various places before, for instance, [1], but 
> unfortunately, without any solution.
> 
> Thanks.
> 
> Regards,
>   Oleksandr
> 
> [1] https://bugs.launchpad.net/ubuntu/+source/acpi/+bug/10490

-- 
Pali Rohár
pali.rohar@gmail.com
