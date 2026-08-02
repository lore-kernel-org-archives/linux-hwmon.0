Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE96620D4F0
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Aug 2026 12:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785675471; cv=none; b=Os45JY/A32xjogX1G5YIGSxO8xb4wJREJcqocLMriOFiu83+T6Tg8YMBLCYc44aanhqu0hMjSbVp8Lmor9f8XwTx7LohSUXYDP8xLaOsebLO+hszszj9/gc99OZp9AD82hO7kvGr++8O3G3dSXo+yki1tlMTp5QPkralPt1geCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785675471; c=relaxed/simple;
	bh=tqQmo3FTnid2KBvlu/UdfMI3XYXIBSdbDJzVvgcsC0k=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=vAajyt4AKABArA7dEubxvkild5Mjjk4lfpRtjAeo+ro/9ufh35jeuaWRs6/yBvY6LYBZlhm36cFKC3GxY8Abc6yO4GizxaVOxRpbLDuIeBg6nK/NtvkbOJ7YJDNqXvZLK0kgpP8VNXr76a0oii937gpu2kHGb7eLQ+6e5h9IP0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=FWxk1aDR; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="FWxk1aDR"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id E7EAB240027
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Aug 2026 14:57:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1785675466;
	bh=NzyskEZ2uIcclijRpTUg8fClyWgDBHEEFTNMTNExL/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=FWxk1aDRaFdnp4YvGlMK4c4Nk1Im8HCS93kvmIcDt/vl/JDMtnNT8SYqXaicm8h6f
	 hZLexxglBYmWWSHICisU7NevhXi+M6fO4V0xH7VYGrnSiCy+ODNMXVCVMaYeN7XZPE
	 xPogJYHxWVMh+ZA4kQgwDZRSvd3jFbmmi+zeqdCwCeAC1Gg4+yoQopwSrTOenAt59r
	 kk+NYD7Tyq/kURmqzab1rM6ECQSr4JuzbSbr3Ke0zcHVfOQiJlNdkenfWDUvFNytNs
	 24F3m1WlMq0P884aQnnlqnGs0taRNQCzTp1SmtArIh3aUfMdWBestruHuMSkwwDUH7
	 vEUV5bVYd+6EA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hCfwn577Mz9rxF;
	Sun,  2 Aug 2026 14:57:45 +0200 (CEST)
Date: Sun, 02 Aug 2026 12:57:46 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Ali Ahmet Memis <ali@iusegentoo.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (corsair-psu) serialize debugfs access against
 hwmon
Message-ID: <20260802145745.6f444fc2@posteo.net>
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

Yes, I think that is what Guenter asked me to test. There is actually a
way to get all values from the PSU at once. You can chain together all
the commands and everything supported should even fit into a single USB
HID frame (64bytes). That would make everything a bit easier. Though,
sorry that I did not go on with that. About a day after this someone put
basically all my open source projects through an AI agent and since then
I get bombarded with AI slop. I currently have not much energy (and fun)
left doing my projects.

I think I will test it in the next days.

greetings Wilken

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

