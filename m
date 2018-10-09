Return-Path: <nicoleotsuka@gmail.com>
Return-path: <nicoleotsuka@gmail.com>
Date: Tue, 9 Oct 2018 12:11:11 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: jdelvare@suse.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, mingo@redhat.com
Subject: Re: [PATCH] hwmon: (core) Add trace events to _attr_show/store
 functions
Message-ID: <20181009191111.GA6166@Asurada-Nvidia.nvidia.com>
References: <20181009182602.3085-1-nicoleotsuka@gmail.com>
 <20181009145721.0669e412@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181009145721.0669e412@gandalf.local.home>
List-ID: <linux-hwmon@vger.kernel.org>

On Tue, Oct 09, 2018 at 02:57:21PM -0400, Steven Rostedt wrote:

> > Trace events are useful for people who collect data from the
> > ftrace output. This patch adds initial trace events for the
> > hwmon core. To call hwmon_attr_base() for aligned attr index
> > numbers, this patch also moves the function upward.
> > 
> > Ftrace outputs:
> >  ...: hwmon_attr_show_string: index=2, attr_name=in2_label, val=VDD_5V
> >  ...: hwmon_attr_show: index=2, attr_name=in2_input, val=5112
> >  ...: hwmon_attr_show: index=2, attr_name=curr2_input, val=440
> > 
> > Note that the _attr_show and _attr_store functions are tied
> > to the _with_info API. So a hwmon driver requiring the trace
> > events feature should use _with_info API to register a hwmon
> > device.
> 
> Hmm, this doesn't really explain why these trace events are needed.
> They look to be attached to sysfs reads. What's the purpose of tracing
> these?

Our power folks analyse Ftrace outputs of cpufreq, thermal and
hwmon (power/voltage/current) so as to get the relationship of
them. The reason why we specifically need trace events is that
it's convenient and timestamped, and because both cpufreq and
thermal already have trace events.

I could add this to make the commit message more convincing if
you'd prefer that.

> > @@ -193,6 +206,7 @@ static ssize_t hwmon_attr_show_string(struct device *dev,
> >  				      char *buf)
> >  {
> >  	struct hwmon_device_attribute *hattr = to_hwmon_attr(devattr);
> > +	enum hwmon_sensor_types type = hattr->type;
> >  	const char *s;
> >  	int ret;
> >  
> > @@ -201,6 +215,9 @@ static ssize_t hwmon_attr_show_string(struct device *dev,
> >  	if (ret < 0)
> >  		return ret;
> >  
> > +	trace_hwmon_attr_show_string(hattr->index + hwmon_attr_base(type),
> 
> Also, the other to tracepoints use hattr->type, here you create a
> separate variable. Is that just to keep within the 80 char limit?

Yes. It looks clearer to me than wrapping the line here, since
complier usually optimize the local variable away.

Thanks
Nicolin
