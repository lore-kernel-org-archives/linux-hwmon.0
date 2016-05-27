Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:39742 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932456AbcE0IS7 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 27 May 2016 04:18:59 -0400
Date: Fri, 27 May 2016 10:18:53 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [GIT PULL] hwmon updates for Linux 4.7
Message-ID: <20160527101853.3da95450@endymion>
In-Reply-To: <CA+55aFyA9VJ_=R_7VuPVbXtqV6Lig=YMMM-PohsxEhteKgfT2g@mail.gmail.com>
References: <20160526111219.0f8c0341@endymion>
	<CA+55aFwPAt66=C3OwqH4HJTv8DQeMjsiNaghNd5gMYdsx=ZyGg@mail.gmail.com>
	<CA+55aFyA9VJ_=R_7VuPVbXtqV6Lig=YMMM-PohsxEhteKgfT2g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Linus,

On Thu, 26 May 2016 09:50:46 -0700, Linus Torvalds wrote:
> On Thu, May 26, 2016 at 9:46 AM, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> > On Thu, May 26, 2016 at 2:12 AM, Jean Delvare <jdelvare@suse.de> wrote:
> >> Hi Linus,
> >>
> >> Please pull hwmon subsystem updates for Linux 4.7 from:
> >>
> >>  Documentation/hwmon/max34440 | 6 +++---
> >>  drivers/hwmon/emc2103.c      | 2 +-
> >>  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > From where?
> 
> Ok, seems to be the usual place at
> 
>     git://git.kernel.org/pub/scm/linux/kernel/git/jdelvare/staging
> hwmon-for-linus

Thanks for figuring it out and fixing my mistake.

> however, please fix whatever workflow bug that made that not be part
> of the pull request.

I'd have to fix myself then, as the workflow is basically copy and past
from my previous email ;-)

I enhanced my script to also generate this part of the message
automatically, so hopefully such a mistake will never happen again.

-- 
Jean Delvare
SUSE L3 Support
