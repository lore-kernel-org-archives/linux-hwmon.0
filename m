Received: from relay.yourmailgateway.de (relay.yourmailgateway.de [185.244.194.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD963DC87A;
	Mon,  1 Jun 2026 15:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.244.194.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780329514; cv=none; b=ZMGWeIDBEUlIeZTfIWJNhSEY9Dxbcy5m3h1sECX47KU19vW3Nx5qqG+w1IYqBw34+c2goMNx8hWzbGGn4o2QPIxD8xYJAUrHvw89U9ifzbZPUMB9j/NISrDGBtGn0KvEW0JCNEjZgW9YRWIeIC6V57/g+8zlS+Jh3JziSvG7/dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780329514; c=relaxed/simple;
	bh=E4txPWn7Nl29Bfwi9wYAz0AHnlw8lr71YV1nmooUiP0=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=B/KE3AJuu6xNfQjtpGykZ5hlRuWAgKGzyN1OvhdbHpTwKTeMq/yS0ZECJvXqhbL7wmNZixVP7vx8gB5hjxfz9zPnDvwRXEHGNxXGkln/ZCx5SHf895USCcmANTIKMwIiSPxg05/+zokuWxWRnSLwJ62uw5Mwm+Y+l6czgFcbofc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b=k7NAbSyV; arc=none smtp.client-ip=185.244.194.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leemhuis.info header.i=@leemhuis.info header.b="k7NAbSyV"
Received: from relay01-mors.netcup.net (localhost [127.0.0.1])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4gTdsr74phz96r5;
	Mon,  1 Jun 2026 17:58:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1780329505;
	bh=E4txPWn7Nl29Bfwi9wYAz0AHnlw8lr71YV1nmooUiP0=;
	h=Date:From:To:Cc:Subject:From;
	b=k7NAbSyVWrKYP4S7s5rKowizyTNuVao8Hc8LMkJkJki3WhXcU6rOP1ixInIjb9K6N
	 yTMXwKbK6hptinfosbVl4oElJYqNEw7rOmR7ZidnNbfJ6WDJ7AcUgBu1f4FNlXHgwh
	 dinJ1qaRGQHgo/wGNn2XmXIfSUbMJofA1uMpaNZ/q30EgoYWWy8oSpZqEYKt9j8MbX
	 DC5lZEY52+LssS9M1DeiBNxhmQWz5LvI+CL7b/Cn6K8JnfxqM3mU+rPe1PCb+jJFv6
	 BPdl9iegQVELQDPuH0PKsiegw7nsZtD8GmX3opMtTVpuDA7dbPjqngJk6vbXldNpO4
	 GCnLCMoSXo6cw==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by relay01-mors.netcup.net (Postfix) with ESMTPS id 4gTdsr6Nh7z7yTh;
	Mon,  1 Jun 2026 17:58:24 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4gTdsq5dqPz8sZw;
	Mon,  1 Jun 2026 17:58:23 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 2DA8E5FE79;
	Mon,  1 Jun 2026 17:58:23 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <4fb7bbf1-466e-438c-a301-e118e7e2a225@leemhuis.info>
Date: Mon, 1 Jun 2026 17:58:21 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
To: James Seo <james@equiv.tech>
Cc: Linux kernel regressions list <regressions@lists.linux.dev>,
 Linux Hardware Monitoring <linux-hwmon@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, moravec@ukf.sk
Subject: [regression] Laptop fan too loud (spinning nearly always) hp-wmi
 7.1-rc4 kernel
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: 
 <178032950346.2211337.11804800805813449237@mxe9fb.netcup.net>
X-NC-CID: nX/KvVGSvwnjGLpkx8mWyuxg3XoRDY1mId/6G/Ru8Vy9JjEguP4=

Hi James! I noticed a regression report that might or might not be
related to hp-wmi; to quote
https://bugzilla.kernel.org/show_bug.cgi?id=221569 :

"""
> Hello, I'm testing 7.1 kernel tree end seeing much louder fan on my laptop even when system is idling. CPU fan is spinning nearly all the time even CPU reported temperatures are low. Currently:
> 
> migo@migo-HP:~$ uname -a
> Linux migo-HP 7.1.0-rc4-00685-g4cbfe4502e3d #45 SMP PREEMPT_DYNAMIC Sun May 24 12:47:18 CEST 2026 x86_64 GNU/Linux
> 
> 
> In 7.0 kernel tree is my laptop much quieter, fan spins only sometimes and with lower RPM.
> 
> Machine is: HP OmniBook X Flip Laptop 16-ar0xx, with Arch Linux installed.
> 
> Is there any way I can make more exact/useful report or debug this issue?
"""

See the ticket for details and kernel logs, I asked a few questions to
hopefully make things a bit easier for you.

Maybe you might have an idea what's wrong here; if not, I guess Milan,
the reporter (CCed), must bisect this to find the change that causes the
problem.

Ciao, Thorsten
