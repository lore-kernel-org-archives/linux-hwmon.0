Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0AC530568D
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 14:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786025439; cv=none; b=JQbzH7TeXDkVgBuwYl6qbcCiD/vsvyfzcHujYEmCVhrt6Bkj3kqDiEO3CyoMuuzHqrg3l4+YXvPvjzOVgwohapEQqwaAlntH4tUEly66gQdV6N9IX5ufYGCB4qOxQE0rXM48jzpX25+h4JQknR+nt1Ay8t1536TZ411o/ry8Jz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786025439; c=relaxed/simple;
	bh=jljL07B7GOL9S7xGb9ZOHMbXzCmcks26bNoekAvcLh0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PIj5ofwl/t+7ONzyxvn7swX6tjdguZTAYkIDhhIYlNP72+ovTdpNyxZgjfMyRvZ1Dvd2TvEkbaEARpd6pI9vgwPYl9wW5rUbXebjaPAOCl9PtN2Ywgs4on/pB0nPau5kELkogeb4+GGkTFRI3/X1ck/HQs7EuHktANoHO3Bqsxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=TYe89lMw; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="TYe89lMw"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id C7E5C240101
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 16:10:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1786025431;
	bh=J6igP1BxYUoVmB8krkGw0DnTzgzlnCKEp83mT6Cp6ag=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=TYe89lMwNcuXsYfjs1ne1YO2SIPM7ZDa6csqHAO3dItAxYzf80VaNvxYqce4PvDJ7
	 w/Z3aWPDeOH3S0Dc9ko7cgWlnGMIAKuon8I7mjQqIENJsM9zxMn4x/TRQKW1jFQ8h+
	 /vH6ZCF/0D88azevHo0TT1EE1V3XeIHCAEwEVAabH1gBhQchs/Z8LQQYL3os7s/PMV
	 R+3FiVzyD+nILghT2cYgvLUKvS03eyK2xZTMeNMTk2d6tGgXAN24DbaO4zG8ffIkDD
	 b6Jd/PcQcXB4fyLygM2lWyFjr7cFHi4nsGgxpkZ3MThojce7RldbPz/aoeQU+hu09e
	 +Bvyli/srmz1Q==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hG8Ls5jb9z9rxG;
	Thu,  6 Aug 2026 16:10:29 +0200 (CEST)
Date: Thu, 06 Aug 2026 14:10:31 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Ali Ahmet Memis <ali@iusegentoo.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (corsair-psu) serialize debugfs access against
 hwmon
Message-ID: <20260806161028.42218ebd@posteo.net>
In-Reply-To: <20260802123653.19532-1-ali@iusegentoo.com>
References: <20260802123653.19532-1-ali@iusegentoo.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  2 Aug 2026 12:36:53 +0000
Ali Ahmet Memis <ali@iusegentoo.com> wrote:

> corsairpsu_request() sends a rail select command and then the actual
> read as two separate transfers, both going through the single shared
> cmd_buffer and wait_completion in corsairpsu_usb_cmd(). The hwmon core
> serializes its own callers, but the debugfs files call
> corsairpsu_get_value() directly and never take that lock, so a debugfs
> read can land between another reader's rail select and its value read.
> 
> The result is a value from the wrong rail reported as the right one,
> because corsairpsu_usb_cmd() only checks the command echo and both
> transfers echo the command it expects. It can also make a caller consume
> the reply meant for the other one, since raw_event() writes into the
> shared buffer and completes whoever happens to be waiting.
> 
> Locking was dropped in commit 4207069edbf0 ("hwmon: (corsair-psu) Rely
> on subsystem locking") on the grounds that the subsystem serializes for
> us, which holds for sysfs but not for these files. Take
> the same lock in the debugfs paths that issue commands, using the guard
> added in commit d1e720c7328e ("hwmon: Support guard() and scoped_guard
> for subsystem locks"), as suggested in [1].
> 
> The lock cannot go into corsairpsu_request() itself: the hwmon core
> already holds it across ->read, so every sysfs read would deadlock.
> vendor_show() and product_show() only print strings cached during probe
> and issue no command, and corsairpsu_get_criticals() and
> corsairpsu_check_cmd_support() run before either interface is
> registered, so none of them need it.
> 
> [1] https://lore.kernel.org/all/5f0406fa-9692-49f0-bcfe-c013f5fc7b62@roeck-us.net/
> 
> Fixes: 4207069edbf0 ("hwmon: (corsair-psu) Rely on subsystem locking")
> Signed-off-by: Ali Ahmet Memis <ali@iusegentoo.com>
> ---
> This is the fix Guenter asked for in the May thread, written the way he
> suggested there. Wilken's patch used a driver private mutex around
> corsairpsu_request(); that thread stalled and the race is still present.
> 
> Wilken, does this cover the chained command case you were worried about?
> As far as I can tell it does: the whole select-rail plus read sequence
> now runs under the same lock the hwmon core takes around ->read, so a
> debugfs reader cannot land in the middle of one. If you had a case in
> mind that this misses, I would rather hear it than guess.
> 
> I have no Corsair PSU, so this is reasoned from the code rather than
> measured on hardware. What I did check:
> 
>   - hwmon_lock() takes hwdev->lock, and the hwmon core takes the same
>     mutex around ->read and ->write, so this really does serialize the
>     two entry points
>   - the lock therefore cannot go into corsairpsu_request(), the sysfs
>     path would deadlock on itself
>   - probe registers the hwmon device before creating the debugfs files
>     and remove tears them down in the opposite order, so priv->hwmon_dev
>     is always valid inside a debugfs read
> 
> Prior discussion:
>   https://lore.kernel.org/all/agR9YW7hGTJ_l7ms@monster.localdomain/
> 
>  drivers/hwmon/corsair-psu.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
> index ce958cdaef58..24100519cd83 100644
> --- a/drivers/hwmon/corsair-psu.c
> +++ b/drivers/hwmon/corsair-psu.c
> @@ -664,6 +664,8 @@ static void print_uptime(struct seq_file *seqf, u8 cmd)
>  	long val;
>  	int ret;
>  
> +	guard(hwmon_lock)(priv->hwmon_dev);
> +
>  	ret = corsairpsu_get_value(priv, cmd, 0, &val);
>  	if (ret < 0) {
>  		seq_puts(seqf, "N/A\n");
> @@ -730,6 +732,8 @@ static int ocpmode_show(struct seq_file *seqf, void *unused)
>  	 * getting of the value itself can also fail during this. Because of this every other
> value
>  	 * than OCP_MULTI_RAIL can be considered as "single rail".
>  	 */
> +	guard(hwmon_lock)(priv->hwmon_dev);
> +
>  	ret = corsairpsu_get_value(priv, PSU_CMD_OCPMODE, 0, &val);
>  	if (ret < 0)
>  		seq_puts(seqf, "N/A\n");
> 
> base-commit: 2d2338c93da79b3bfe4b6099a931d9468d539952

That works so far.

Running tests without the guard basically end all in variantes similar to this:
-----
# cat /sys/class/hwmon/hwmon9/in1_input
12000
# cat /sys/kernel/debug/corsair-psu-0003:1B1C:1C1F.0006/uptime
08:18:30
# cat /sys/class/hwmon/hwmon9/in1_input &; cat /sys/kernel/debug/corsair-psu-0003:1B1C:1C1F.0006/uptime
cat: /sys/class/hwmon/hwmon9/in1_input: Operation not supported
N/A
-----
Sometimes, there is only the "N/A" and sometimes there is only the "Operation not
supported", but most of the time both happen in one try. And very rarely both go
through without an issue. That hints on two different things that can go wrong.
"in1_input" is one of the commands with a rail change, aka rail + request.
The first scenario is that one, where the debugfs exactly goes between the rail
change and the final request. The second scenario is the one, where the 
corsairpsu_get_value() is more or less called at the same time. But the change
fixes both issues.

Several hundred tests with the guard included always result in this:
-----
# cat /sys/class/hwmon/hwmon9/in1_input
12015
# cat /sys/kernel/debug/corsair-psu-0003:1B1C:1C1F.0006/uptime
08:21:48
cat /sys/class/hwmon/hwmon9/in1_input &; cat /sys/kernel/debug/corsair-psu-0003:1B1C:1C1F.0006/uptime
12015
08:21:49
-----

Though, I would like to see the second guard() go before the big comment, beyond
that, it looks fine to me:

Tested-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>

greetings,
Wilken
