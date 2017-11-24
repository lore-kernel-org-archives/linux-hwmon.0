Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:46320 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752955AbdKXKWd (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 24 Nov 2017 05:22:33 -0500
Message-ID: <1511518948.15084.9.camel@suse.de>
Subject: Re: i8k_smm_func() takes enormous of time to execute
From: Jean Delvare <jdelvare@suse.de>
To: Oleksandr Natalenko <oleksandr@natalenko.name>,
        Jonathan Buzzard <jonathan@buzzard.org.uk>
Cc: Pali =?ISO-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mario Limonciello <mario.limonciello@dell.com>
Date: Fri, 24 Nov 2017 11:22:28 +0100
In-Reply-To: <12093169.Rm9IG5ILEB@natalenko.name>
References: <12093169.Rm9IG5ILEB@natalenko.name>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Oleksandr,

On jeu., 2017-11-23 at 22:41 +0100, Oleksandr Natalenko wrote:
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
> 
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

There are two patches waiting to be tested in
https://bugzilla.kernel.org/show_bug.cgi?id=195751

-- 
Jean Delvare
SUSE L3 Support
