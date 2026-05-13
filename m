Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E37540FDBE
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 14:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778682104; cv=none; b=dqwuWoUdXD7o9u+QVM7zi7ENPBt52SyCykOYBKgBTjFjGB8yAmLRFDgUTcULxV0bfhBc/drt3pZxWv8BwjFc7dOVz6Q8k43UH2KCUhwLE06OfbvfJOXdbOFZBWppdGyN1ad0G6BmEsRdiWFU2JzkY9snGxd54R1e09SGuItZ0VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778682104; c=relaxed/simple;
	bh=PC0XFjq3QNDnwTGYe9jNCU4zjm9sbydbweAPpf9kxWU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C8yokYocDnSOCkv57OMwkCxKpwiXWwBDqlE3s/rFVYTi3D7s6BONSXeDZYnNJuAGP9KsTOkQom0Ku9IhxQVqI5ngNIDoIGNvpXdJkJ2iJUhBvnSK8efW/vyrb9iPxdINPTNoYHCLZwXBym2hb+pHDzurkD7/tddiF9fFLROyePA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=c5s7YBLz; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="c5s7YBLz"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 868C0240027
	for <linux-hwmon@vger.kernel.org>; Wed, 13 May 2026 16:21:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net; s=2017;
	t=1778682097; bh=fO2vbEX/2e2wbZpDZo5gOJ6h4R6kJF9CNed2SB6NB54=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=c5s7YBLzCi1bmM2PS7yxiFOmzkcSQc6CZszW7FLQtEMEjwWdp7bQUs7JJ5oP99bB5
	 YhH/dNxgn19oV1OFhpd9Uc9SMDOl5GCEoNoIwibTNedlcvZta4nDDKB1ac+NUF/DRB
	 SGKP3VIUiJzVf07ECLi7R3hlLntqbw9BDx4H7R6k+YGaJuq328s5f11ezsm+5HhNCz
	 e12z8rA7rjFYKVYtzCyKJGrG5Tl0tpOmuh+8ScO9+AC/uBrS1E6m3rDPHGtrOylImx
	 kA82T2PyzCZTSZ+qVHZg+m6CzPUHxeFLRJ4tErMmB7mmg0c9KfYIWb42p0hMzemoq0
	 ZKVXvfRd74V/w==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4gFwcw3wXgz9rxB;
	Wed, 13 May 2026 16:21:36 +0200 (CEST)
Date: Wed, 13 May 2026 14:21:37 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: corsair-psu: fix and readd locking of command
 buffer
Message-ID: <20260513162135.2893e42d@posteo.net>
In-Reply-To: <bde0fa1e-93a5-4819-aa19-04554c24d31c@roeck-us.net>
References: <agR9YW7hGTJ_l7ms@monster.localdomain>
	<5f0406fa-9692-49f0-bcfe-c013f5fc7b62@roeck-us.net>
	<bde0fa1e-93a5-4819-aa19-04554c24d31c@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 13 May 2026 07:05:41 -0700
Guenter Roeck <linux@roeck-us.net> wrote:

> On 5/13/26 06:43, Guenter Roeck wrote:
> > On 5/13/26 06:32, Wilken Gottwalt wrote:
> >> Fix removed locking mechanism. The locking mechanism does protect
> >> chained commands (set rail + get value), which are two separate calls
> >> to the low level access function. The hwmon (temps for example) and
> >> debugfs (uptimes for example) subsystem can trigger that chain of
> >> commands in parallel. The serialization in the hw monioring core alone
> >> is not enough.
> >>
> >> Fixes: 4207069edbf0 ("hwmon: (corsair-psu) Rely on subsystem locking")
> >> Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
> > 
> > You'll need to explain why using the subsystem lock for debugfs
> > accesses does not work.
> > 
> 
> Clarifying: "Why using hwmon_lock() / hwmon_unlock() in the debugfs functions
> would be insufficient".

Yes, I understand that. You gave me an idea for a nice "hack" that would
demonstrate the problem. I will try it and look if it really happens.
Though, my thought process is, that debugfs and hwmon are two subsystems
which do not run in the same thread context. Each one of them would
trigger a call to corsairpsu_request(), one comming from a *_show callback
of the debufs and one comming from a hwmon_ops.read callback.
corsairpsu_request() often calls corsairpsu_usb_cmd() twice, one for
setting the rail, the second for reading a value of the rail. The mutex
protects that chain of calls. I really don't think that the debugfs
callbacks are serailized against the hwmon callbacks. I could create a
nice demonstration if I passthrough a little hint via function parameters
from where a callback is triggered. Do you understand, what I mean?

greetings,
Wilken
