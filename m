Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C3A3C1F
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Aug 2026 13:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785675842; cv=none; b=fyF6Q3eHfQco7L2D+ppPv9U0JqvzHexHcA2dvembttfc3xQ5WJcbfmsw7TVLIgqQjOz7vx6XZUFNc3fRJulcDcwAawq+2H4FsSsjGhu2P4jkHxVbunBSoBLTRcgENnFxxN58EJK4BRsmBUj5+xuWIRGUqDmraJvK5Z5o1vTTx7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785675842; c=relaxed/simple;
	bh=9pjBDXvpRl//KQPtovgLYiZbhJg1opFWXdvqVm1q4sU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jPxPKSCRjSM7afpaIXXpJTVwsMKRaIgrV3UXvNYv0i4e4J3C3yezC6O8Ayv7HcL5F5HlC/rNMxnsEWaKS6cNAnHyw2akDrEpKMICd8XVrlfE0uGIhz1KdDR9Q7OIshBPiL6E2MzxIhJcWrg2hlay+PhuQK6zvT9cfCs7jWNRtGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=JLkQLk+1; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="JLkQLk+1"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id A47B5240101
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Aug 2026 15:03:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1785675836;
	bh=42h/cmJyTFgxlqXQG+ygWstc72GOLk+VRu2n2mMTRQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=JLkQLk+1Rfx/WJ4QgSeYoxhEnqFJXEMPB9RcEa91bg+p1UJw6MWiyUZkLaUTrpoTl
	 nVY76wimIR6zV4kTl0p+PKX6w6PRtZStW3EPa43Gnagtfyh41SBaTH3DFW/ojlT+QN
	 DfLctbhIPBggObJlfnjoXkl4CPQXcG/t3aXVH3vcyUca6FDdIG3RJxtjiAMhNWfx8C
	 5Wkon9CEXBz48AXw8/IJhv03nFn+KQ3QX5q3zX4hAoZ+rQclYPmJ9qNXfBUwefHHRZ
	 H6s8oYI3/Mnq9VFwjbFR7SgFzRymq/QhAlgy2a5XkEUeD7bmtjj35SzzJ5RyVMeAaq
	 NaQc21HKf3bxg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hCg3v3Tjlz6tw8;
	Sun,  2 Aug 2026 15:03:55 +0200 (CEST)
Date: Sun, 02 Aug 2026 13:03:56 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: Ali Ahmet Memis <ali@iusegentoo.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (corsair-psu) null terminate the vendor and
 product strings
Message-ID: <20260802150354.04fd3857@posteo.net>
In-Reply-To: <20260802125327.21469-1-ali@iusegentoo.com>
References: <20260802125327.21469-1-ali@iusegentoo.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun,  2 Aug 2026 12:53:27 +0000
Ali Ahmet Memis <ali@iusegentoo.com> wrote:

> corsairpsu_usb_cmd() copies a fixed REPLY_SIZE bytes out of the reply
> into the caller's buffer:
> 
> 	if (data)
> 		memcpy(data, priv->cmd_buffer + 2, REPLY_SIZE);
> 
> corsairpsu_fwinfo() passes priv->vendor and priv->product, both declared
> as char[REPLY_SIZE]. A device that fills all 24 bytes without a NUL
> leaves them unterminated, and the debugfs files print them with %s:
> 
> 	seq_printf(seqf, "%s\n", priv->vendor);
> 
> The read then runs on into whatever follows in the structure, product
> for vendor and temp_crit[] for product, until it happens to find a zero
> byte. priv comes from devm_kzalloc() so it stays inside the allocation
> and terminates eventually, but the strings are still wrong and the
> contents of neighbouring fields end up in debugfs.
> 
> Give both arrays one more byte. The structure is zero allocated and
> nothing else writes past REPLY_SIZE, so the terminator is always there.
> 
> Fixes: d115b51e0e56 ("hwmon: add Corsair PSU HID controller driver")
> Signed-off-by: Ali Ahmet Memis <ali@iusegentoo.com>
> ---
> This came up while looking at the driver for the debugfs locking patch
> posted earlier today, and the automated review on that thread flagged it
> too:
> 
>   https://lore.kernel.org/all/20260802123653.19532-1-ali@iusegentoo.com/
> 
> The two are independent; this one applies to master on its own and does
> not depend on the locking change.
> 
> I have no Corsair PSU, so I have not seen a device actually fill all 24
> bytes. The fix is on the grounds that the driver should not depend on
> the device terminating the string.

The device always provides terminated strings. The vendor string ("CORSAIR"
or "Corsair") and the device string (3/4 numbers + 3 letters) are allways
around 10-16 bytes. Actually, it would make more sense to change the memcpy
to "REPLY_SIZE - 1". Just my thought.

greetings Wilken

>  drivers/hwmon/corsair-psu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
> index 24100519cd83..a242373c4656 100644
> --- a/drivers/hwmon/corsair-psu.c
> +++ b/drivers/hwmon/corsair-psu.c
> @@ -123,8 +123,8 @@ struct corsairpsu_data {
>  	struct dentry *debugfs;
>  	struct completion wait_completion;
>  	u8 *cmd_buffer;
> -	char vendor[REPLY_SIZE];
> -	char product[REPLY_SIZE];
> +	char vendor[REPLY_SIZE + 1];
> +	char product[REPLY_SIZE + 1];
>  	long temp_crit[TEMP_COUNT];
>  	long in_crit[RAIL_COUNT];
>  	long in_lcrit[RAIL_COUNT];
> 
> base-commit: 2d2338c93da79b3bfe4b6099a931d9468d539952
> prerequisite-patch-id: b3289aa9b605d10f8499c46149f857a9d0a2b2e7

