Return-Path: <SRS0=8BOP=MV=goodmis.org=rostedt@kernel.org>
Return-path: <SRS0=8BOP=MV=goodmis.org=rostedt@kernel.org>
Date: Tue, 9 Oct 2018 16:42:42 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, jdelvare@suse.com,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, mingo@redhat.com
Subject: Re: [PATCH] hwmon: (core) Add trace events to _attr_show/store
 functions
Message-ID: <20181009164242.76e397ad@gandalf.local.home>
In-Reply-To: <20181009203937.GA11222@roeck-us.net>
References: <20181009182602.3085-1-nicoleotsuka@gmail.com>
	<20181009145721.0669e412@gandalf.local.home>
	<20181009191111.GA6166@Asurada-Nvidia.nvidia.com>
	<20181009154945.65300231@gandalf.local.home>
	<20181009195654.GA7963@Asurada-Nvidia.nvidia.com>
	<20181009203937.GA11222@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On Tue, 9 Oct 2018 13:39:37 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> > Personally a checkpatch warning bugs me more than having an extra
> > line :)
> >   
> Same here. If we no longer believe in the 80-column limit, we should remove it,
> not use it to hide other problems in the noise.

Yes, please, can we?

I personally hate the 80 character limit rule, because I like
descriptive variables and function names, which itself causes the 80
character limit to be broken. I find line breaks to avoid that limit
just makes the code look worse. Or at least up it to 100 chars.

-- Steve
