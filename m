Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44151 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726525AbeJJD6Y (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 9 Oct 2018 23:58:24 -0400
Date: Tue, 9 Oct 2018 13:39:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
        mingo@redhat.com
Subject: Re: [PATCH] hwmon: (core) Add trace events to _attr_show/store
 functions
Message-ID: <20181009203937.GA11222@roeck-us.net>
References: <20181009182602.3085-1-nicoleotsuka@gmail.com>
 <20181009145721.0669e412@gandalf.local.home>
 <20181009191111.GA6166@Asurada-Nvidia.nvidia.com>
 <20181009154945.65300231@gandalf.local.home>
 <20181009195654.GA7963@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181009195654.GA7963@Asurada-Nvidia.nvidia.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Oct 09, 2018 at 12:57:43PM -0700, Nicolin Chen wrote:
> On Tue, Oct 09, 2018 at 03:49:45PM -0400, Steven Rostedt wrote:
> > > > > Trace events are useful for people who collect data from the
> > > > > ftrace output. This patch adds initial trace events for the
> > > > > hwmon core. To call hwmon_attr_base() for aligned attr index
> > > > > numbers, this patch also moves the function upward.
> > > > > 
> > > > > Ftrace outputs:
> > > > >  ...: hwmon_attr_show_string: index=2, attr_name=in2_label, val=VDD_5V
> > > > >  ...: hwmon_attr_show: index=2, attr_name=in2_input, val=5112
> > > > >  ...: hwmon_attr_show: index=2, attr_name=curr2_input, val=440
> > > > > 
> > > > > Note that the _attr_show and _attr_store functions are tied
> > > > > to the _with_info API. So a hwmon driver requiring the trace
> > > > > events feature should use _with_info API to register a hwmon
> > > > > device.  
> > > > 
> > > > Hmm, this doesn't really explain why these trace events are needed.
> > > > They look to be attached to sysfs reads. What's the purpose of tracing
> > > > these?  
> > > 
> > > Our power folks analyse Ftrace outputs of cpufreq, thermal and
> > > hwmon (power/voltage/current) so as to get the relationship of
> > > them. The reason why we specifically need trace events is that
> > > it's convenient and timestamped, and because both cpufreq and
> > > thermal already have trace events.
> > > 
> > > I could add this to make the commit message more convincing if
> > > you'd prefer that.
> > 
> > I'm not against the patch, but yes, having this in the change log is
> > helpful.
> 
> I will add it in v2.
> 
> > > > > @@ -193,6 +206,7 @@ static ssize_t hwmon_attr_show_string(struct device *dev,
> > > > >  				      char *buf)
> > > > >  {
> > > > >  	struct hwmon_device_attribute *hattr = to_hwmon_attr(devattr);
> > > > > +	enum hwmon_sensor_types type = hattr->type;
> > > > >  	const char *s;
> > > > >  	int ret;
> > > > >  
> > > > > @@ -201,6 +215,9 @@ static ssize_t hwmon_attr_show_string(struct device *dev,
> > > > >  	if (ret < 0)
> > > > >  		return ret;
> > > > >  
> > > > > +	trace_hwmon_attr_show_string(hattr->index + hwmon_attr_base(type),  
> > > > 
> > > > Also, the other to tracepoints use hattr->type, here you create a
> > > > separate variable. Is that just to keep within the 80 char limit?  
> > > 
> > > Yes. It looks clearer to me than wrapping the line here, since
> > > complier usually optimize the local variable away.
> > 
> > Or you can just break the 80 character limit ;-)
> 
> Personally a checkpatch warning bugs me more than having an extra
> line :)
> 
Same here. If we no longer believe in the 80-column limit, we should remove it,
not use it to hide other problems in the noise.

Thanks,
Guenter
