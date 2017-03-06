Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:56040 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753769AbdCGCDj (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Mar 2017 21:03:39 -0500
Date: Mon, 6 Mar 2017 14:46:39 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Hanson <peterh@google.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: pmbus platform flag PMBUS_SKIP_STATUS_CHECK
Message-ID: <20170306224639.GB13725@roeck-us.net>
References: <CAPozSNq2KVEJ3bNGMC6wzZotTE7JTEgx1yko5wkxepEq+PJKGw@mail.gmail.com>
 <98f39408-2da1-0ef5-b122-7397012385ab@roeck-us.net>
 <CAPozSNpMZ_eYftNA02McdFhGg9n7MxNOkuHUXe1K5yG3CxoU6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPozSNpMZ_eYftNA02McdFhGg9n7MxNOkuHUXe1K5yG3CxoU6A@mail.gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Mar 06, 2017 at 01:59:41PM -0800, Peter Hanson wrote:
> On Sun, Mar 5, 2017 at 7:07 AM, Guenter Roeck <linux@roeck-us.net> wrote:
> > Hi Peter,
> >
> > On 03/03/2017 04:44 PM, Peter Hanson wrote:
> >>
> >> Ahoy hwmon maintainers,
> >>
> >> In studying up for some OpenBmc work, I have encountered a family of
> >> parts for which the generic pmbus drivers will work, except that their
> >> initial configuration silently ignores CLEAR_FAULTS.
> >
> > Any chance to let us know more about this family of devices ?
> > Pointers to datasheets would be most helpful.
> 
> Working on it - however, I can say the data sheet does not mention
> such behavior.
> 

Ok.

> >> So I'm sending this email for comments on top-level design for most useful
> >> fix.
> >
> > I would prefer to know what devices we are dealing with first.
> 
> Understand and agree. Please stand by while I determine what I can say.
> 
> >> There are two classes of fix, and in general, both could be valuable:
> >> a) Set PMBUS_SKIP_STATUS_CHECK flag
> >>  - caveat: parts must generate I/O errors for unused functions in that
> >> case.
> >
> > and they don't ?
> 
> The part I tested works fine if I set that flag.
> 

Guess that is all we can hope for.

> (Just listing a caveat associated with using that flag in the first place.)
> 

Ok.

> >> b) Preconfigure device to enable CLEAR_FAULTS
> >>  - caveats: must happen before register checks, affects state of device
> >>
> >> Either can be accomplished in a special driver, but everything else
> >> matches generic pmbus. Moreover, each could be supported with minor
> >> adjustments to the generic driver and/or core.
> >>
> > The idea behind front-end drivers is to handle such inconsistencies.
> > That is what the framework is for. Otherwise we could just (try to)
> > incorporate all the special handling in the various pmbus drivers
> > into the pmbus core.
> >
> > Small front-end drivers are not really hard to write. Just look at
> > tps40422.c
> > or max20751.c.
> >
> >> Conceptually simplest version of (a):
> >> . In pmbus.c, add a new generic compatibility string such as
> >> "pmbus-skipstatuscheck"
> >> . Set the platform flag when that name is used (perhaps as 3rd parameter)
> 
> Oops, n00b trick: didn't check current code base - sorry!
> 

Glad this doesn't only happen to me :-)

When you refer to pmbus-skipstatuscheck, do you mean a DT property ? 
That would of course always be possible, by just extending, say,
pmbus.c to explicitly support DT.

> As of commit cc00decf0e280953e9067e938ad331f93bda8b40 pmbus_probe
> _does_ set the skip flag for three devices, so actually we should be
> good if we upgrade kernel or backport that commit and pick, say,
> "dps800" as the device name.
> 
> >> Generic driver logic for (b) would be analogous, but would touch
> >> device, not just platform flags.
> >>
> >> As a variation on (a), I have tested a patch to pmbus_core.c register
> >> check logic that rechecks CML after the following CLEAR_FAULTS, and
> >> sets PMBUS_SKIP_STATUS_CHECK only when it determines CML can't be
> >> cleared.
> >>
> > I must be missing something. Current code in pmbus_core.c does not set
> > PMBUS_SKIP_STATUS_CHECK at all.
> 
> Yes, I meant `only when' as a modifier on when I would propose to set
> the flag. Sorry if I implied it was already a thing.
> 
> Doing so would yield more generic pmbus behavior than exists now.
> Reviewing the newest code, pretty sure "dpsxxx" devices need to set
> this flag for the same reason: CLEAR_FAULTS ignored.
> 

The commit log says it all:

"These devices do not support the STATUS_CML register, and reports a
 communication error in response to this command. For this reason,
 the status register check is disabled for these controllers."

I hesitate to make it more generic or automatic. PMBus controllers
are usually implemented with a microcontroller, and the code isn't
always as stable as one would like it to be. Anything out of order
might get them to hiccup. In other words, trying to be more generic
could result in some devices to stop working. We would have to
re-test all supported devices to make sure that nothing breaks.

> I can accept that your feedback is to keep such considerations out of
> the core. That's the find of comment I am looking for.
> 
> >> Most platforms can accomplish (b) by scripting reconfiguration and
> >> probe in startup. But this is a device quirk, so it seems simplest to
> >> solve it by device.
> >>
> > It might really help to tell us about the affected devices, and maybe
> > to publish your suggested changes as RFCs, to give us a better idea what you
> > are talking about.
> 
> Oops, I intended that initial email as an RFC. What I should do
> differently for a real RFC?
> 
Real code, just tag it "RFC" instead of "PATCH".

Thanks,
Guenter
