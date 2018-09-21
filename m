Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40031 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727392AbeIUTMr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Sep 2018 15:12:47 -0400
Date: Fri, 21 Sep 2018 06:23:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Kamil Debski <kamil@wypas.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: pwm-fan: Set fan speed to 0 on suspend
Message-ID: <20180921132354.GA16764@roeck-us.net>
References: <20180921101048.11679-1-thierry.reding@gmail.com>
 <20180921101048.11679-2-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180921101048.11679-2-thierry.reding@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Sep 21, 2018 at 12:10:48PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Technically this is not required because disabling the PWM should be
> enough. However, when support for atomic operations was implemented in
> the PWM subsystem, only actual changes to the PWM channel are applied
> during pwm_config(), which means that during after resume from suspend
> the old settings won't be applied.
> 
> One possible solution is for the PWM driver to implement its own PM
> operations such that settings from before suspend get applied on resume.
> This has the disadvantage of completely ignoring any particular ordering
> requirements that PWM user drivers might have, so it is best to leave it
> up to the user drivers to apply the settings that they want at the
> appropriate time.
> 
> Another way to solve this would be to read back the current state of the
> PWM at the time of resume. That way, in case the configuration was lost
> during suspend, applying the old settings in PWM user drivers would
> actually get them applied because they differ from the current settings.
> However, not all PWM drivers support reading the hardware state, and not
> all hardware may support it.
> 
> The best workaround at this point seems to be to let PWM user drivers
> tell the PWM subsystem that the PWM is turned off by, in addition to
> disabling it, also setting the duty cycle to 0. This causes the resume
> operation to apply a configuration that is different from the current
> configuration, resulting in the proper state from before suspend getting
> restored.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Applied.

Thanks,
Guenter
