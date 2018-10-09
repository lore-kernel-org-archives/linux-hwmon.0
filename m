Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:39946 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727469AbeJJELO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Oct 2018 00:11:14 -0400
Date: Tue, 9 Oct 2018 13:52:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        mingo@redhat.com
Subject: Re: [PATCH] hwmon: (core) Add trace events to _attr_show/store
 functions
Message-ID: <20181009205226.GA11520@roeck-us.net>
References: <20181009182602.3085-1-nicoleotsuka@gmail.com>
 <20181009145721.0669e412@gandalf.local.home>
 <20181009191111.GA6166@Asurada-Nvidia.nvidia.com>
 <20181009154945.65300231@gandalf.local.home>
 <20181009195654.GA7963@Asurada-Nvidia.nvidia.com>
 <20181009203937.GA11222@roeck-us.net>
 <20181009164242.76e397ad@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181009164242.76e397ad@gandalf.local.home>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Oct 09, 2018 at 04:42:42PM -0400, Steven Rostedt wrote:
> On Tue, 9 Oct 2018 13:39:37 -0700
> Guenter Roeck <linux@roeck-us.net> wrote:
> 
> > > Personally a checkpatch warning bugs me more than having an extra
> > > line :)
> > >   
> > Same here. If we no longer believe in the 80-column limit, we should remove it,
> > not use it to hide other problems in the noise.
> 
> Yes, please, can we?
> 
> I personally hate the 80 character limit rule, because I like
> descriptive variables and function names, which itself causes the 80
> character limit to be broken. I find line breaks to avoid that limit
> just makes the code look worse. Or at least up it to 100 chars.
> 

It is a two-edged sword. Downside is that a longer limit also invites
deeply nested loops and conditionals, which I am sure will be used as
argument against raising it.

Feel free to submit a patch to raise the limit to 100; I'll be more
than happy to give it an enthusiastic Reviewed-by:. My personal desire
for conflict isn't strong enough to submit it myself, though.

Guenter
