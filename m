Received: from k25.k3ae2098.use4.send.mailgun.net (k25.k3ae2098.use4.send.mailgun.net [204.220.183.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21593191CE
	for <linux-hwmon@vger.kernel.org>; Tue,  2 Jun 2026 08:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=204.220.183.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387584; cv=none; b=JkJnIjb7mb2cp5SIPcBjnxOaKzHf9d54SOUqLnG9zux4BC2xYqE2PQ4cm3/MzDZo4GPo0QbXZMgsxy0STrkUN++glaACfBLYgpf3IQMaGOQ3QYMptiso4eCrGzZzOgMEd0SdLt2kxDJwfHHgywMh1hOqESsoEGH7YCT99M6JlQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387584; c=relaxed/simple;
	bh=nKQwc6ROTm17L/mK3AB6GTz9PAiwePIKC2f3MeRcITc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oiUh6k8PWzTOLa7p4v/tFbL8XaE+tHYHJQ1PObMlhE0RtfuA4FaKszxQ6IHW+AqZiKz2Rhinc2qrWyIUbq5Ael9Jx2O5K28B8ln9cuxZBycirNlyF7GUjtnOG7y+nzm7xTKkA1TMKN9RlQ2vgevPxAqFQKoNtpp6Gz+aQfSoqHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=equiv.tech; spf=pass smtp.mailfrom=equiv.tech; dkim=pass (2048-bit key) header.d=equiv.tech header.i=@equiv.tech header.b=VF6QZlZJ; arc=none smtp.client-ip=204.220.183.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=equiv.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=equiv.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=equiv.tech header.i=@equiv.tech header.b="VF6QZlZJ"
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt; s=pdk2; t=1780387581; x=1780394781;
 h=In-Reply-To: Content-Type: MIME-Version: References: Message-ID: Subject: Subject: Cc: To: To: From: From: Date: Sender: Sender;
 bh=nN45EGcXg1pK7uJZY49TATM2DMLNFow3vaz1Ib8vUdE=;
 b=VF6QZlZJG0Iej5ttjHoRTxcRuRAigGXykBpqMa3mEq6ri8VgBZ6lnh2r5C5ITeV74i2YM9s0bZkh/qXW3hZRNLVLQ8XwgsCupZJDfTH9c/uv3gQCkhLuHbHlIUDPdbYRES6pd1uRRUPx0gecjFyEO+y3FZHwQgQd9DHgviJFJPRDRnOiwovWQpxPSgUwD8JnyUDQebBzHXrPq49J2Oy9kv+/B2NiJ05wBe44D5vgTpiQFpScgkx2WrIkAg/2V2G6f0kFTqdzDP9WMHyAK+bbqCi+la8c9jRh1OjAmKF3Vpt5n1xDyP+m+nKE4S/iCMsOd9IWJLcdbXl3sbFzJ/tVOw==
X-Mailgun-Sid: WyJkOWUwNSIsImxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZyIsIjkzZDVhYiJd
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by
 d0d75532f70f31e547caf5e63535f78dea6419cd6ea78ce344e6207d060b9cff with SMTP id
 6a1e8efd3047a4065fa30360 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Jun 2026 08:06:21 GMT
X-Mailgun-Sending-Ip: 204.220.183.25
Sender: james@equiv.tech
Date: Tue, 2 Jun 2026 01:06:20 -0700
From: James Seo <james@equiv.tech>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
	Linux Hardware Monitoring <linux-hwmon@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>, moravec@ukf.sk
Subject: Re: [regression] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kernel
Message-ID: <ah6O_CIALz137OU_@equiv.tech>
References: <4fb7bbf1-466e-438c-a301-e118e7e2a225@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4fb7bbf1-466e-438c-a301-e118e7e2a225@leemhuis.info>


Hi Thorsten,

Thanks for your email. Unfortunately, I'm responsible for the hp-wmi-sensors
driver, so I'm not the correct person to contact regarding the hp-wmi driver.
The two drivers are for different product lines, and hp-wmi-sensors is much
more limited regarding the systems it supports and its scope of capabilities.

Sorry I can't be more helpful. For our bug reporter Milan, let's hope hp-wmi
really was the culprit and cb4daa450f ("platform/x86: hp-wmi: fix u8 underflow
in gpu_delta calculation") fixed his fan issue. If not, he may have to bisect
when he gets a chance.

-James Seo


On Mon, Jun 01, 2026 at 05:58:21PM +0200, Thorsten Leemhuis wrote:
> Hi James! I noticed a regression report that might or might not be
> related to hp-wmi; to quote
> https://bugzilla.kernel.org/show_bug.cgi?id=221569 :
> 
> """
> > Hello, I'm testing 7.1 kernel tree end seeing much louder fan on my laptop even when system is idling. CPU fan is spinning nearly all the time even CPU reported temperatures are low. Currently:
> > 
> > migo@migo-HP:~$ uname -a
> > Linux migo-HP 7.1.0-rc4-00685-g4cbfe4502e3d #45 SMP PREEMPT_DYNAMIC Sun May 24 12:47:18 CEST 2026 x86_64 GNU/Linux
> > 
> > 
> > In 7.0 kernel tree is my laptop much quieter, fan spins only sometimes and with lower RPM.
> > 
> > Machine is: HP OmniBook X Flip Laptop 16-ar0xx, with Arch Linux installed.
> > 
> > Is there any way I can make more exact/useful report or debug this issue?
> """
> 
> See the ticket for details and kernel logs, I asked a few questions to
> hopefully make things a bit easier for you.
> 
> Maybe you might have an idea what's wrong here; if not, I guess Milan,
> the reporter (CCed), must bisect this to find the change that causes the
> problem.
> 
> Ciao, Thorsten
