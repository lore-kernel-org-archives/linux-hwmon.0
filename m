Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-it0-f48.google.com ([209.85.214.48]:36825 "EHLO
        mail-it0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752105AbdCDApH (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 3 Mar 2017 19:45:07 -0500
Received: by mail-it0-f48.google.com with SMTP id h10so22865526ith.1
        for <linux-hwmon@vger.kernel.org>; Fri, 03 Mar 2017 16:44:49 -0800 (PST)
MIME-Version: 1.0
From: Peter Hanson <peterh@google.com>
Date: Fri, 3 Mar 2017 16:44:48 -0800
Message-ID: <CAPozSNq2KVEJ3bNGMC6wzZotTE7JTEgx1yko5wkxepEq+PJKGw@mail.gmail.com>
Subject: pmbus platform flag PMBUS_SKIP_STATUS_CHECK
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Ahoy hwmon maintainers,

In studying up for some OpenBmc work, I have encountered a family of
parts for which the generic pmbus drivers will work, except that their
initial configuration silently ignores CLEAR_FAULTS.

So I'm sending this email for comments on top-level design for most useful fix.

There are two classes of fix, and in general, both could be valuable:
a) Set PMBUS_SKIP_STATUS_CHECK flag
 - caveat: parts must generate I/O errors for unused functions in that case.
b) Preconfigure device to enable CLEAR_FAULTS
 - caveats: must happen before register checks, affects state of device

Either can be accomplished in a special driver, but everything else
matches generic pmbus. Moreover, each could be supported with minor
adjustments to the generic driver and/or core.

Conceptually simplest version of (a):
. In pmbus.c, add a new generic compatibility string such as
"pmbus-skipstatuscheck"
. Set the platform flag when that name is used (perhaps as 3rd parameter)

Generic driver logic for (b) would be analogous, but would touch
device, not just platform flags.

As a variation on (a), I have tested a patch to pmbus_core.c register
check logic that rechecks CML after the following CLEAR_FAULTS, and
sets PMBUS_SKIP_STATUS_CHECK only when it determines CML can't be
cleared.

Most platforms can accomplish (b) by scripting reconfiguration and
probe in startup. But this is a device quirk, so it seems simplest to
solve it by device.

Let loose the hounds!
 -- peterh
