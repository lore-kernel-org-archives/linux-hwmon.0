Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:47728 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726566AbeLQKtD (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 17 Dec 2018 05:49:03 -0500
Date: Mon, 17 Dec 2018 11:48:59 +0100
From: Jean Delvare <jdelvare@suse.de>
To: =?UTF-8?B?T25kxZllaiBMeXNvbsSbaw==?= <olysonek@redhat.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: libsensors soname bump
Message-ID: <20181217114859.1f52e889@endymion>
In-Reply-To: <514c8587-ccf3-f7af-b88d-744add6f1da2@redhat.com>
References: <20181216124344.49d06b69@endymion>
        <514c8587-ccf3-f7af-b88d-744add6f1da2@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, 17 Dec 2018 10:46:43 +0100, Ondřej Lysoněk wrote:
> On 16. 12. 18 12:43, Jean Delvare wrote:
> > You have recently released lm-sensors 3.5.0 with a new soname for
> > libsensors:
> > 
> > -LIBMAINVER := 4
> > -LIBMINORVER := 4.0
> > +LIBMAINVER := 5
> > +LIBMINORVER := 0.0
> > 
> > -#define SENSORS_API_VERSION            0x440
> > +#define SENSORS_API_VERSION            0x500
> > 
> > This is declaring the new library as incompatible with the previous
> > version, meaning that distributions will have to build and ship both
> > libsensors4 and libsensors5 for a long time until all applications have
> > been updated and rebuilt to link with the new library. This is a
> > significant effort for the whole community and should only be done when
> > necessary.  
> 
> I thought there was an ABI change, which would warrant a soname bump. Or
> am I wrong in thinking that? I was mistaken however and I'm sorry about
> that, there was no ABI change.
> 
> I don't see why distributions would have to ship two versions of the
> library. The *name* of the library didn't change, it's still libsensors
> (not libsensors4 or libsensors5).

But the packages as they exist today, they link with libsensors.so.4,
not libsensors.so:

$ rpm -q --requires sensors | grep sensors
libsensors.so.4()(64bit)

Having only one library works only if you update the whole system at
once. That can work in some specific cases I suppose, but in practice
can be hard to achieve in a complex ecosystem without breaking things
"temporarily". That's really not the kind of thing users enjoy. The
whole point of using a distribution is that things just work, all the
time.

So the standard way to handle major library version changes is to
provide both in parallel at first, then migrate all applications, and
once all applications have been migrated, deprecate the old library.
And after a few years, remove that old library.

> [~/git/lm-sensors]$ make
> ...
> [~/git/lm-sensors]$ ls lib/ | grep libsensors.so
> libsensors.so
> libsensors.so.5
> libsensors.so.5.0.0
> 
> So all distros need to do is rebuild dependent packages. No changes to
> other packages should be required.

Well, that alone is already pretty painful. Having to rebuild, ship,
download and install all these applications is a major waste of
resources. That's no less that 98 packages for my distribution. The
whole point of having shared libraries is to make it possible to update
one package and leave the rest unchanged. Changing the soname breaks
that possibility.

For us (openSUSE) it would also require changing the BuildRequires of
all these applications from "libsensors4-devel" to "libsensors5-devel".
Maybe that package should be named "libsensors-devel" instead, I'm not
sure why we versioned it, I see that most libraries are not doing that.
Maybe we had to when transitioning from lm-sensors 2 to lm-sensors 3. I
don't remember the details.

> Am I missing something?

There are also all the 3rd party applications. Either shipped as
binaries by proprietary software editors, or built in the Open Build
Service. Changing the library version with no reason breaks
compatibility with them.

Without the soname change, it is possible for a user to cherry-pick a
package update they need, independent of what the distribution has. For
example, a user may need the latest version of libsensors because it
fixes a bug for them. They could get it from the Open Build Service
easily... But now they won't be able to install it, because the soname
is incompatible with their current distribution. They would either have
to pull all the packages using libsensors from the Open Build System
(which can be very painful if some of these packages also have complex
dependencies), or changing distributions altogether. This is opposite
to the flexibility we intend to provide to our users.

The major version of a library should only ever be changed for
incompatible changes, that is, if an application built for the old
version of the library will fail to run with the new version of the
library. If this is not the case then then major version must stay the
same.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
