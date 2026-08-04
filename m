Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F9D432BD0
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Aug 2026 04:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785816676; cv=none; b=Tm1ZiohOKZ8WfHWmrypJjxlZ/ADuO7lPb9mdjoQKS/OyufyMD3gYzBZELANyF6sdouHTRqd0VwZzEqTDS8hb1pY2Hvx2HQwkXJ/is/Jvpr/dNlkbbr0YCt+lQ7AUq5q4UqbH2gBkUBQ2RI3dHcn9JCFKrO1H/IIP0w5AoUFwX0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785816676; c=relaxed/simple;
	bh=3b2xjchaK9vh3/YhyfOGrgyq/CsMouy8oQoIi/MnZdA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oHrHpKUyNG03K1lQOVeCDTq3MElfnBcXggGIv/2dTmHxne5MiIATHpFEFyeT+QcazwrL64tnpabJi+6fymEu6G4ikFdPzboRqyEMZH2Ee7e0mD0IHO0nKnS7r6/FKtR9EMvIQGAWAZQeX4uI4I5DSU8BA8S1p9B2/2rHlEekfbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=QxmKg0To; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="QxmKg0To"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id B05DC240101
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Aug 2026 06:11:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1785816671;
	bh=22krlEDtvtlSAAA3iGtLqdxUDoCKSzGFvECTFwHtWGs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=QxmKg0ToQzVCs4duOBSd2xJOIMfdUti0ID2FZ7IqOBYd3j3lW1Aa2DVQVT2l6XEme
	 /RfJcVMwz6lvUyVRm+K5PYCmX1J6NF12k+jeO2IzjAfRAgfl6xNGviq/ib7qkC2HcC
	 XEhM560WPeIWxA4LAzpg7DhmsdKUHo7zB2KaW0m0J2rcqzrcd5pCjPPLbArrYy0Uqo
	 BthxaBsse7nXUlclme/0KNN1/Dv8cdENgOwaE4LYJo8ol8/invkmNbTnithXAsk5Um
	 nCkNovuwLxLS3ZGbmvsduv+hF8xBIU4KCGcErzFJck9fEEE/367yBJhfXkC7XwgXC1
	 DvmM9hxAC72iA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hDg8G6nprz9rxD;
	Tue,  4 Aug 2026 06:11:10 +0200 (CEST)
Date: Tue, 04 Aug 2026 04:11:11 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Ali Ahmet Memis <ali@iusegentoo.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (corsair-psu) serialize debugfs access against
 hwmon
Message-ID: <20260804061110.575adfc2@posteo.net>
In-Reply-To: <ec30f5bb-48bc-485a-a7a6-953af65a66f5@roeck-us.net>
References: <20260802123653.19532-1-ali@iusegentoo.com>
	<20260802145745.6f444fc2@posteo.net>
	<85f8ccd7-0d2a-43db-8690-cf220bd76e32@roeck-us.net>
	<20260804001347.164873-1-ali@iusegentoo.com>
	<ec30f5bb-48bc-485a-a7a6-953af65a66f5@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 3 Aug 2026 19:54:49 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> On 8/3/26 16:56, Ali Ahmet Memis wrote:
> > On Mon, 3 Aug 2026 16:19:57 -0700 Guenter Roeck wrote:
> >> Anyway, I (and Sashiko) think the patch is incomplete. It does not protect
> >> cmd_buffer when handling raw events (while executing corsairpsu_raw_event).
> >> That is a pre-existing issue, though. Not sure if that should be fixed in a
> >> separate patch or with this one. Thoughts ?
> > 
> > Separate, I think, and not really by choice: it cannot use the same lock.
> > corsairpsu_raw_event() is reached from the URB completion handler,
> > hid_irq_in() -> hid_safe_input_report() -> hdrv->raw_event(), and
> > Documentation/driver-api/usb/URB.rst is blunt about that path ("NEVER SLEEP
> > IN A COMPLETION HANDLER"). So whatever protects cmd_buffer there cannot be
> > the hwmon mutex this patch relies on, and has to be its own mechanism rather
> > than an extension of this one.
> > 
> > The window I see is the timeout. corsairpsu_usb_cmd() gives up with
> > -ETIMEDOUT, but the device can still deliver that reply afterwards. The next
> > command calls reinit_completion(), which makes completion_done() false again,
> > so the guard at the top of raw_event no longer rejects the late reply: it
> > memcpys into cmd_buffer and completes the new waiter with the previous
> > command's data. The echo check only catches that when the two commands
> > differ. For two reads of the same command on different rails it does not,
> > which is the same wrong-rail symptom this patch is about, reached the other
> > way round.
> > 
> > The two also blame differently, for whatever that is worth: this patch is
> > 4207069edbf0, while the raw_event side goes back to d115b51e0e56 ("hwmon:
> > add Corsair PSU HID controller driver").
> > 
> > Nobody has written the raw_event one as far as I know, so tell me which way
> > you want it: I can send it, or leave it to you. Same for this patch, if you
> > would rather use the version you already had sitting around.
> > 
> 
> For this patch, I'd rather take yours. I am inclined to take it as-is even
> if Wilken doesn't have time to test it. After all, it won't make the situation
> worse. Wilken, WDYT ?
> 
> Gemini tells me that fixing the raw event problem will require a spinlock to
> protect the completion and a separate receive buffer. No idea if it is correct,
> but other drivers do the same, so it may have a point. Either case, this is a
> bit too much to do without hardware to test, and I'd rather prefer to leave this
> up to Wilken.

I was working at that one, too, because I saw Claude Opus hinting on that one.
But it drove me crazy, because every AI is saying something slighty different. I
can not really pin down which one is actually the real solution. I tried to read
through the subsystems code and other drivers, but, argh, I don't know. I was
playing with the idea to (1) remove the raw HID mode completely or (2) make the
driver switchable, raw HID or normal HID, but not both at the same time. On the
other hand, in my Github repo where I develop the driver, I also have a tool
which demonstrates how to access the PSU completely in userspace via libhidpi.
There is actually no need to provide the raw HID access.

greetins Wilken
