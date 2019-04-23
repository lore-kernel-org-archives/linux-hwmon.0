Return-Path: <SRS0=5f14=SZ=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C253BC10F14
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 13:06:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B6E5206A3
	for <linux-hwmon@archiver.kernel.org>; Tue, 23 Apr 2019 13:06:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726421AbfDWNGr (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 23 Apr 2019 09:06:47 -0400
Received: from foss.arm.com ([217.140.101.70]:55800 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726033AbfDWNGr (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 23 Apr 2019 09:06:47 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 878CAA78;
        Tue, 23 Apr 2019 06:06:44 -0700 (PDT)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 91C8E3F557;
        Tue, 23 Apr 2019 06:06:43 -0700 (PDT)
Date:   Tue, 23 Apr 2019 14:06:41 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: SCMI sensor reads unit scaling
Message-ID: <20190423130640.GB7483@e107155-lin>
References: <9207bc01-e0c6-ef73-6a24-6deda7b789c5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9207bc01-e0c6-ef73-6a24-6deda7b789c5@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Sat, Apr 20, 2019 at 09:43:48AM -0700, Florian Fainelli wrote:
> Hi Sudeep, Guenter,
>
> The current SCMI hwmon support does not seem to make use of the sensor
> scale/unit as defined in the sensor replies (or the update scale for
> that matter).
>

That sounds like a bug as I simplified(IOW removed code that I couldn't
test with the reference platform firmware) before I pushed upstream.

> I came up with the patch below which gets the job done, but I am worried
> about possibly breaking people's SCMI deployments and sensors reading
> because they may have intentionally or not already decided to return a
> value which is scaled the way Linux's hwmon expect it, and may, or may
> not have populated a valid unit number in the sensor reply.
>

OK, will try to recollect the details and get back to you, I might have
forgotten few details as it's over  1.5 years since I originally wrote
it.

> Ideally we should probably do two conversions:
>
> - from within scmi_sensor_reading_get(), scale the value as indicated by
> the reply
> - from within scmi_hwmon_read(), take that scaled value and apply the
> necessary conversion expected by Linux's HWMON conventions (e.g.:
> reporting voltage as mV values)
>

At least, the idea I had is to have all the conversion in scmi_sensors.c
and provide sensor data scale to HWMON framework's expectation. Not sure
if I implemented correctly to obey that.

> What do you think?
>
> ---
> From: Florian Fainelli <f.fainelli@gmail.com>
> Subject: firmware: arm_scmi: Support sensor scaling
>
> The SCMI sensor management protocol includes the following provision:
>
> The power-of-10 multiplier in two’s-complement format that is applied to
> the sensor unit specified by the SensorType field.
>
> Add support for scaling the value returned based on what is provided by
> the firmware. This requires us to be able to look up a sensor identifier
> to its backing scmi_sensor_info structure and apply the necessary scale.
>

Had a brief look at the patch and this is what I had initially as mentioned
before. Since the Juno firmware at that time didn't have all these implemented
properly, I dropped. But I am happy to test and merge this if it makes sense
and get the firmware fixed if I find any bugs with it ;).

However I am not sure if we need another conversion in hwmon driver as
we can scale it in scmi itself to whatever Linux HWMON expects. Let me
know if you don't agree with that.

If possible, please post this independently. Also if you can give it a
testing on your platform, that would be great. I will try to run this on
Juno too in the meantime.

--
Regards,
Sudeep
