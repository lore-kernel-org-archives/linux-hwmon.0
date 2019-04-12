Return-Path: <SRS0=9bva=SO=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18449C10F0E
	for <linux-hwmon@archiver.kernel.org>; Fri, 12 Apr 2019 13:57:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D97B4206BA
	for <linux-hwmon@archiver.kernel.org>; Fri, 12 Apr 2019 13:57:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbfDLN5v (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 12 Apr 2019 09:57:51 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:33440 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726765AbfDLN5v (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 12 Apr 2019 09:57:51 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0943374;
        Fri, 12 Apr 2019 06:57:50 -0700 (PDT)
Received: from e107155-lin (e107155-lin.cambridge.arm.com [10.1.196.42])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B96953F557;
        Fri, 12 Apr 2019 06:57:49 -0700 (PDT)
Date:   Fri, 12 Apr 2019 14:57:47 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: Couple of questions on SCMI sensor protocol and Linux
 implementation
Message-ID: <20190412135747.GC23351@e107155-lin>
References: <1902f151-7ddd-6b4b-4135-a2affe20c009@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1902f151-7ddd-6b4b-4135-a2affe20c009@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Tue, Apr 02, 2019 at 08:22:58PM -0700, Florian Fainelli wrote:
> Hi Sudeep,
> 
> There are a couple of things on which I would appreciate your feedback
> regarding the Linux SCMI sensor protocol:
> 
> 1) The Linux SCMI implementation has all the nuts and bolts to allow
> configuring trip points, but the hwmon subsystem through the use of
> hwmon_thermal_add_sensor() API does not actually make use of that
> capability. Would it be a big stretch to use the hwmon_ops::write
> function to get to support that feature?

As a concept, it sounds good. Though I am not sure if write API semantics
match with what we want here with trip point configuration.

> The other thing that puzzles me
> is that there does not appear to be provision in the SCMI sensor
> protocol to describe thermal zones, so I assume that people still have
> to provide supplemental data through Device Tree for
> devm_thermal_zone_of_sensor_register() to pick up the thermal zones
> definitions?
>

Yes, I tend to agree. When SCMI v1.0 was designed we were not sure if
we can incorporate thermal zones into the specification without losing
the flexibility that vendors have today with DT. If you think we should
update the specification for this, can you send me brief summary so that
the discussion on the specification side can be kicked off.

> 2) Support for regulators through SCMI
>
> I work with a device where the regulators can only be controlled via a
> dedicated piece of HW which is accessible through SCMI from the Linux
> side. Do you think there is value in coming up with a scmi-regulator.c
> driver that makes use of the sensor protocol for discovering and
> reporting regulators or would that be something that belongs more to the
> power domain protocol?
>

Controlling regulators directly from OSPM/Linux via SCMI was intentionally
not added to the specification. One of the issues SCMI wanted to address
is clockscrew[1] kind of security attacks exploiting direct regulator control.

--
Regards,
Sudeep

[1] https://www.usenix.org/system/files/conference/usenixsecurity17/sec17-tang.pdf
