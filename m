Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5C237CD55
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 15:53:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778687636; cv=none; b=CJKp4gJFP3ZOniIgSaVSUnTEZ/ayiUpgmMZCRgFT7ccem45I6fKQ2vc7W81+5dleZxreg4RvY5Sr8QLjmrgieObmgxL92sWZdZoerZ8UFxSfvMhN54isH4nON2GSX7Y7LrBgoER2hZ+7iUBw2/2GGlthuUUCSzsm9Xzpus3wr4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778687636; c=relaxed/simple;
	bh=ariVmT4V6aw/1S16l2870F1794oYHt18zLyRDTEg87g=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EyT9Es3H3AIG9L0Cec+LKQdDWZuQvfaPod3whSjaWPG6PUsc2XD+zzLIzAX5hQFSTcHb7WWDBqF7PImXD2PwoDFL0Pt2JSe9M8KvuMGy8Lu2o5YUO7VP9l3gu3sRE0nsfzqEhtgzwRfQHE/yp72u2plXztpRUW3MKNfXRUfouks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=QRgpnGR3; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="QRgpnGR3"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 09C13240104
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 17:53:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1778687632; bh=TcDfuxn04JO4SnfiL6l3DQ04T92/9cvg5JMghMoS2EM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=QRgpnGR3XOuY/A/iTcyTBrrMcuc8Ee2/JZN7ku9qWigsUGDTkJpYR4PriBUh3vdQV
	 e9/QtEG5y9Rc7qZJApryLsReuwAn/XUSZIvVc3xpOAXaLmAWFEzo9IqcEEqEUoLYu9
	 M7+75CFY1k0eyfXJjI6dEJsJd+ytOp4A3F4b3pj6nRPQ5tYu3MYs4TmLSRI3Ibgm3F
	 rlWkRL3RrvKtS3o3gdRnzj7K8Kh9YoNoQj3DYK8ZwIe6xDGISsR2GRFzkSbtdXxsmh
	 0o+dHyc4uK03c4VlEH5QTsTWmeCXkYVGtJmyRhcqfA03f9q3tYBPVnHgPV4wgz/5l2
	 tGARBqwxVSZ8Q==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4gFygM45vyz6twR;
	Wed, 13 May 2026 17:53:51 +0200 (CEST)
Date: Wed, 13 May 2026 15:53:51 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: corsair-psu: fix and readd locking of command
 buffer
Message-ID: <20260513175350.07900558@posteo.net>
In-Reply-To: <254b59a8-182f-4ad3-8469-4f9e9511d3a5@roeck-us.net>
References: <agR9YW7hGTJ_l7ms@monster.localdomain>
	<5f0406fa-9692-49f0-bcfe-c013f5fc7b62@roeck-us.net>
	<bde0fa1e-93a5-4819-aa19-04554c24d31c@roeck-us.net>
	<20260513162135.2893e42d@posteo.net>
	<254b59a8-182f-4ad3-8469-4f9e9511d3a5@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 13 May 2026 07:58:14 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> On 5/13/26 07:21, Wilken Gottwalt wrote:
> > On Wed, 13 May 2026 07:05:41 -0700
> > Guenter Roeck <linux@roeck-us.net> wrote:
> > 
> >> On 5/13/26 06:43, Guenter Roeck wrote:
> >>> On 5/13/26 06:32, Wilken Gottwalt wrote:
> >>>> Fix removed locking mechanism. The locking mechanism does protect
> >>>> chained commands (set rail + get value), which are two separate calls
> >>>> to the low level access function. The hwmon (temps for example) and
> >>>> debugfs (uptimes for example) subsystem can trigger that chain of
> >>>> commands in parallel. The serialization in the hw monioring core alone
> >>>> is not enough.
> >>>>
> >>>> Fixes: 4207069edbf0 ("hwmon: (corsair-psu) Rely on subsystem locking")
> >>>> Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
> >>>
> >>> You'll need to explain why using the subsystem lock for debugfs
> >>> accesses does not work.
> >>>
> >>
> >> Clarifying: "Why using hwmon_lock() / hwmon_unlock() in the debugfs functions
> >> would be insufficient".
> > 
> > Yes, I understand that. You gave me an idea for a nice "hack" that would
> > demonstrate the problem. I will try it and look if it really happens.
> > Though, my thought process is, that debugfs and hwmon are two subsystems
> > which do not run in the same thread context. Each one of them would
> > trigger a call to corsairpsu_request(), one comming from a *_show callback
> > of the debufs and one comming from a hwmon_ops.read callback.
> > corsairpsu_request() often calls corsairpsu_usb_cmd() twice, one for
> > setting the rail, the second for reading a value of the rail. The mutex
> > protects that chain of calls. I really don't think that the debugfs
> > callbacks are serailized against the hwmon callbacks. I could create a
> > nice demonstration if I passthrough a little hint via function parameters
> > from where a callback is triggered. Do you understand, what I mean?
> > 
> 
> No. That does not explain why calling hwmon_lock() / hwmon_unlock()
> would not work when called from the debugfs functions.

Okay, that will get a bit complex now, because I added my hack and I see
exactly what I assumed is happening.

What I did: I let init functions (only running once during probe()) pass
through an 'i' to corsairpsu_request() (where the mutex should be, but is
not anymore). Callbacks from the debugfs (uptime in that case) pass through
a 'd', hwmon functions (12v line, triggers a rail change) pass through a
'h'. I do two printk() in corsairpsu_request(), one beforce the first
corsairpsu_usb_cmd() (the rail change) and the second corsairpsu_usb_cmd(),
which runs the command that collects values. Both printk also print the
rail number "rX".

This is the result of of the driver where the mutex is removed in
corsairpsu_request():
--- probe() ---
[41458.336453] corsair-psu 0003:1B1C:1C1F.0006: hidraw5: USB HID v1.11 Device [CORSAIR HX1500i
Power Supply] on usb-0000:2c:00.1-5.4.2/input0 [41458.393231] corsairpsu_request: cmd 2 (r0)(i)
[41458.395240] corsairpsu_request: cmd 2 (r1)(i)
[41458.397215] corsairpsu_request: cmd 1 (r0)(i)
[41458.399201] corsairpsu_request: cmd 2 (r0)(i)
[41458.401198] corsairpsu_request: cmd 1 (r0)(i)
[41458.403198] corsairpsu_request: cmd 2 (r0)(i)
[41458.405198] corsairpsu_request: cmd 1 (r0)(i)
[41458.407197] corsairpsu_request: cmd 2 (r0)(i)
[41458.409197] corsairpsu_request: cmd 1 (r1)(i)
[41458.411198] corsairpsu_request: cmd 2 (r1)(i)
[41458.413198] corsairpsu_request: cmd 1 (r1)(i)
[41458.415197] corsairpsu_request: cmd 2 (r1)(i)
[41458.417196] corsairpsu_request: cmd 1 (r1)(i)
[41458.419196] corsairpsu_request: cmd 2 (r1)(i)
[41458.421196] corsairpsu_request: cmd 1 (r2)(i)
[41458.423196] corsairpsu_request: cmd 2 (r2)(i)
[41458.425196] corsairpsu_request: cmd 1 (r2)(i)
[41458.427198] corsairpsu_request: cmd 2 (r2)(i)
[41458.429198] corsairpsu_request: cmd 1 (r2)(i)
[41458.431198] corsairpsu_request: cmd 2 (r2)(i)
[41458.433199] corsairpsu_request: cmd 2 (r0)(i)

--- single read of v12 line ---
[41488.217072] corsairpsu_request: cmd 2 (r0)(h)
[41488.219077] corsairpsu_request: cmd 2 (r0)(h)

--- parallel read of v12 line and debugfs uptime ---
[41520.169651] corsairpsu_request: cmd 1 (r0)(h)
[41520.170485] corsairpsu_request: cmd 2 (r0)(d)

the single v12 read:
# cat /sys/class/hwmon/hwmon8/in1_input
11984

the parallel read:
# cat /sys/class/hwmon/hwmon8/in1_input &; cat
/sys/kernel/debug/corsair-psu-0003:1B1C:1C1F.0006/uptime [1] 192598
cat: /sys/class/hwmon/hwmon8/in1_input: Operation not supported
[1]  + 192598 exit 1     cat /sys/class/hwmon/hwmon8/in1_input
11:30:22

The parallel read does not succeed. The second part of the v12 line read
after the rail switch, the second call to corsairpsu_request() is blocked
by the call from the debugfs uptime read. The debugfs callback gets exactly
between the first (rail change) and the second call (get value). It is
some form of race condition.

The last part should look like this.
---- read of v12 line and debugfs uptime ---
[41520.169651] corsairpsu_request: cmd 1 (r0)(h)
[41520.169XXX] corsairpsu_request: cmd 2 (r0)(h)
[41520.170485] corsairpsu_request: cmd 2 (r0)(d)



Now let me show you how it looks like if the removed mutex is back in
corsairpsu_request() protecting the chained commands.

--- probe ---
[42898.208992] corsair-psu 0003:1B1C:1C1F.0006: hidraw5: USB HID v1.11 Device [CORSAIR HX1500i Power Supply] on usb-0000:2c:00.1-5.4.2/input0
[42898.266492] corsairpsu_request: cmd 2 (r0)(i)
[42898.268492] corsairpsu_request: cmd 2 (r1)(i)
[42898.270492] corsairpsu_request: cmd 1 (r0)(i)
[42898.272491] corsairpsu_request: cmd 2 (r0)(i)
[42898.274491] corsairpsu_request: cmd 1 (r0)(i)
[42898.276494] corsairpsu_request: cmd 2 (r0)(i)
[42898.278492] corsairpsu_request: cmd 1 (r0)(i)
[42898.280491] corsairpsu_request: cmd 2 (r0)(i)
[42898.282493] corsairpsu_request: cmd 1 (r1)(i)
[42898.284489] corsairpsu_request: cmd 2 (r1)(i)
[42898.286493] corsairpsu_request: cmd 1 (r1)(i)
[42898.288495] corsairpsu_request: cmd 2 (r1)(i)
[42898.290504] corsairpsu_request: cmd 1 (r1)(i)
[42898.292499] corsairpsu_request: cmd 2 (r1)(i)
[42898.294498] corsairpsu_request: cmd 1 (r2)(i)
[42898.296505] corsairpsu_request: cmd 2 (r2)(i)
[42898.298495] corsairpsu_request: cmd 1 (r2)(i)
[42898.300493] corsairpsu_request: cmd 2 (r2)(i)
[42898.302494] corsairpsu_request: cmd 1 (r2)(i)
[42898.304493] corsairpsu_request: cmd 2 (r2)(i)
[42898.306491] corsairpsu_request: cmd 2 (r0)(i)

--- single read of v12 line ---
[43003.146035] corsairpsu_request: cmd 1 (r0)(h)
[43003.148029] corsairpsu_request: cmd 2 (r0)(h)

--- parallel read of v12 line and debugfs uptime ---
[43113.129615] corsairpsu_request: cmd 1 (r0)(h)
[43113.131515] corsairpsu_request: cmd 2 (r0)(h)
[43113.133503] corsairpsu_request: cmd 2 (r0)(d)

And now the parallel read succeeds, no blocking, because the chained
commands are protected by the mutex. I get the v12 line value and the
uptime.

# cat /sys/class/hwmon/hwmon8/in1_input &; cat /sys/kernel/debug/corsair-psu-0003:1B1C:1C1F.0006/uptime
[1] 196389
11984
[1]  + 196389 done       cat /sys/class/hwmon/hwmon8/in1_input
11:56:47

If this does not explain the obvious issue, I have not idea how explain
it further. My English is limited. This is a HID driver with data gathering
functions running in the context of the USB-HID context. Callbacks from the
hwmon and the debugfs subsystem call these data gathering functions, and the
first function in that context, corsairpsu_request(), which can run several
instances in paralellel, needs the mutex.

greetings,
Wilken
