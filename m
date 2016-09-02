Return-path: <jdelvare@suse.de>
Date: Fri, 2 Sep 2016 16:55:29 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc: Guenter Roeck <linux@roeck-us.net>, Joshua Scott
 <Joshua.Scott@alliedtelesis.co.nz>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: adt7470: Allow faster removal
Message-ID: <20160902165529.18aac4da@endymion>
In-Reply-To: <c295f9ed1a744f35823c067b7434591b@svr-chch-ex1.atlnz.lc>
References: <20160901051721.13806-1-joshua.scott@alliedtelesis.co.nz>
	<61bb13ce-5040-40d8-c824-624a3cf08cf1@roeck-us.net>
	<c295f9ed1a744f35823c067b7434591b@svr-chch-ex1.atlnz.lc>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

Hi Chris,

On Thu, 1 Sep 2016 21:08:54 +0000, Chris Packham wrote:
> On 09/02/2016 12:12 AM, Guenter Roeck wrote:
> > This puts a heavy burden on the system, forcing it to run every ms, just for
> > the unlikely case of driver removal. Why is quick removal so important ?
> > If it is, we'll have to find a better solution.
> 
> The particular use case we have is a chassis based system with an 
> adt7470 on a removable fan-tray. The problem is that when the fan tray 
> is removed it takes auto_update_interval/1000 seconds for the update 
> thread to stop and the i2c device to be removed. In the intervening time 
> a new fan-tray could have been installed.

Thanks for the clarification. An actual use case makes it easier to
think about solutions.

> On 09/01/2016 08:18 PM, Jean Delvare wrote:
> >
> > This change looks terribly costly to me. In order to shorten the
> > duration of a rare event (you don't "rmmod adt7470" on a regular basis,
> > do you?)
> 
> It's worse than that. We're not doing rmmod, hardware is physically 
> being removed.

I wouldn't call it "worse", it's pretty much the same to me.

> > you increase the cost of a kernel thread which runs all the
> > time. I'm afraid this msleep_interruptible(1) is going to prevent the
> > CPU from entering low power states at all, leading to an increased
> > system temperature and power consumption. Have you compared the output
> > of "powertop" (specifically the "Idle stats" section) before and after
> > your patch?
> >
> > Is there no way to voluntarily interrupt this long msleep_interruptible?
> 
> If there is I'd like to know. That would be the ideal solution for us.

I've never done that before myself so I don't know more than you.
stackoverflow has a few promising pointers though:

http://stackoverflow.com/questions/26050745/is-there-a-way-inside-the-kernel-of-killing-a-kernel-kthread-just-like-kill-9
http://stackoverflow.com/questions/36344295/wakeup-a-kernel-thread-that-is-in-sleep-using-msleep

My own research suggests that maybe calling
wake_up_process(data->auto_update) right after kthread_stop() may work.
Have you tried that? I only find it suspect that nobody else in the
kernel is doing that.

-- 
Jean Delvare
SUSE L3 Support
