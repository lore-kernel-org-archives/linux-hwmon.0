Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:58233 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752290AbdCEQDc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Mar 2017 11:03:32 -0500
Subject: Re: pmbus platform flag PMBUS_SKIP_STATUS_CHECK
To: Peter Hanson <peterh@google.com>
References: <CAPozSNq2KVEJ3bNGMC6wzZotTE7JTEgx1yko5wkxepEq+PJKGw@mail.gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <98f39408-2da1-0ef5-b122-7397012385ab@roeck-us.net>
Date: Sun, 5 Mar 2017 07:07:22 -0800
MIME-Version: 1.0
In-Reply-To: <CAPozSNq2KVEJ3bNGMC6wzZotTE7JTEgx1yko5wkxepEq+PJKGw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Peter,

On 03/03/2017 04:44 PM, Peter Hanson wrote:
> Ahoy hwmon maintainers,
>
> In studying up for some OpenBmc work, I have encountered a family of
> parts for which the generic pmbus drivers will work, except that their
> initial configuration silently ignores CLEAR_FAULTS.
>

Any chance to let us know more about this family of devices ?
Pointers to datasheets would be most helpful.

> So I'm sending this email for comments on top-level design for most useful fix.
>

I would prefer to know what devices we are dealing with first.

> There are two classes of fix, and in general, both could be valuable:
> a) Set PMBUS_SKIP_STATUS_CHECK flag
>  - caveat: parts must generate I/O errors for unused functions in that case.

and they don't ?

> b) Preconfigure device to enable CLEAR_FAULTS
>  - caveats: must happen before register checks, affects state of device
>
> Either can be accomplished in a special driver, but everything else
> matches generic pmbus. Moreover, each could be supported with minor
> adjustments to the generic driver and/or core.
>
The idea behind front-end drivers is to handle such inconsistencies.
That is what the framework is for. Otherwise we could just (try to)
incorporate all the special handling in the various pmbus drivers
into the pmbus core.

Small front-end drivers are not really hard to write. Just look at tps40422.c
or max20751.c.

> Conceptually simplest version of (a):
> . In pmbus.c, add a new generic compatibility string such as
> "pmbus-skipstatuscheck"
> . Set the platform flag when that name is used (perhaps as 3rd parameter)
>
> Generic driver logic for (b) would be analogous, but would touch
> device, not just platform flags.
>
> As a variation on (a), I have tested a patch to pmbus_core.c register
> check logic that rechecks CML after the following CLEAR_FAULTS, and
> sets PMBUS_SKIP_STATUS_CHECK only when it determines CML can't be
> cleared.
>
I must be missing something. Current code in pmbus_core.c does not set
PMBUS_SKIP_STATUS_CHECK at all.

> Most platforms can accomplish (b) by scripting reconfiguration and
> probe in startup. But this is a device quirk, so it seems simplest to
> solve it by device.
>
It might really help to tell us about the affected devices, and maybe
to publish your suggested changes as RFCs, to give us a better idea what you
are talking about.

Thanks,
Guenter

