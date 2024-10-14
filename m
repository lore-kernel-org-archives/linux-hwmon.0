Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D221319F432
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Oct 2024 12:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728907929; cv=none; b=rodVDcj0LEng390NXIo4GHW0PHl6qNiAZI9JGmVFmuPvRYC0uvedK9Z8B9u4yATa1ImM+4PpqQrCqezbx5eI1wAz02kQJmB00AJw7gdRm8f675ujUwE7Su1ybC6vUXQTgPwPGw5IvwrNHbnL7GMRcVDsSM83sz0y8LCyrCsZ1tQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728907929; c=relaxed/simple;
	bh=TNN2c2lfgqUmSOxQkFtTkMc0uo2ozKjxPZyKijCk4ew=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KN2YQLuROPtNih0F97z0SmHYbY1rFD/etc5Moi/P3ukYxo5b9HfobjezPvY/LwVWrovWKI6j/+DWkxWc64ShMQdMCidegTWIyf5S8iyawb6aGYccCKQX8N9rKooSfgwClQBBCU4d98DKJmvkE0Tq5VobDlm67f0xVlQSPecirFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=h51zXOHO; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Ujtok4lc; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=MLvlWaj6; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=sgs1x8pN; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="h51zXOHO";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Ujtok4lc";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="MLvlWaj6";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="sgs1x8pN"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ED14921A03;
	Mon, 14 Oct 2024 12:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728907926; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NYIjL0xhoCaLZ/bLOQqQgqUqjSmxk1IgfzRV3b0pZxc=;
	b=h51zXOHO3i7UawvOq5dgRgSnnz1VJlHtkgmiNyaYmuZYDAHKdy+yEQRJYn/vcLaC+MQMLa
	umQgELaZp4La9GDOPMPuFbhPZGyqXOvNOTRtyKvF36B/JXBUgoST2TahiC0m0NyfZ/B5nA
	HNGonmDslHehLrZJ7KWCTtNfFlGeLTU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728907926;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NYIjL0xhoCaLZ/bLOQqQgqUqjSmxk1IgfzRV3b0pZxc=;
	b=Ujtok4lcrilgvearut3CQuXZhmaf98bsSyGHigE7OIMPukZWt1LL9fZjz+6kBUQUsiUQNd
	SLavXnvLY+Ji4+Bg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728907925; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NYIjL0xhoCaLZ/bLOQqQgqUqjSmxk1IgfzRV3b0pZxc=;
	b=MLvlWaj6+c81FcwM3RR/tp8lFbc07TDAgaozpUNvDAhLBJD9eEbbxfphW+qrUxDYc/7q/w
	uHNR2C6URfV4g6dox9+KBx+sGQ/wdqFMlQdJn2vxSM9dREwq4ZuJQpZxq6CnvvnZau1g3v
	nBJwq2tW+zMDU78QnNw6oVJagRvn3Ig=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728907925;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NYIjL0xhoCaLZ/bLOQqQgqUqjSmxk1IgfzRV3b0pZxc=;
	b=sgs1x8pN5pQDJbOpoeb9Hsw0AscVqrxWa413IStArkYGcZrTEuVGVVhHYw8r6joKX9ndLn
	X8eU6XQwlq32jsBA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C780E13A51;
	Mon, 14 Oct 2024 12:12:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id QNquLpUKDWf9PAAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Mon, 14 Oct 2024 12:12:05 +0000
Date: Mon, 14 Oct 2024 14:12:04 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (jc42)  Strengthen detect function
Message-ID: <20241014141204.026f4641@endymion.delvare>
In-Reply-To: <20240630202028.1874325-1-linux@roeck-us.net>
References: <20240630202028.1874325-1-linux@roeck-us.net>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+]
X-Spam-Flag: NO
X-Spam-Level: 

Hi Guenter,

On Sun, 30 Jun 2024 13:20:28 -0700, Guenter Roeck wrote:
> Configuration register bit 5 must read 0 for all JC42.4 compliant chips.
> Several capability register bits must be set for all TSE2004 compliant
> chips. Use that information to strengthen the detect function.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/jc42.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/jc42.c b/drivers/hwmon/jc42.c
> index 1180af1b1638..a260cff750a5 100644
> --- a/drivers/hwmon/jc42.c
> +++ b/drivers/hwmon/jc42.c
> @@ -413,7 +413,11 @@ static int jc42_detect(struct i2c_client *client, struct i2c_board_info *info)
>  	if (cap < 0 || config < 0 || manid < 0 || devid < 0)
>  		return -ENODEV;
>  
> -	if ((cap & 0xff00) || (config & 0xf800))
> +	if ((cap & 0xff00) || (config & 0xf820))
> +		return -ENODEV;
> +
> +	if ((devid & TSE2004_DEVID_MASK) == TSE2004_DEVID &&
> +	    (cap & 0x00e7) != 0x00e7)
>  		return -ENODEV;
>  
>  	for (i = 0; i < ARRAY_SIZE(jc42_chips); i++) {

I have a user reporting that this change is causing the jc42 driver to
no longer bind to his memory module temperature sensor devices after
updating to kernel v6.11. I asked for a register dump:

     0,8  1,9  2,a  3,b  4,c  5,d  6,e  7,f
00: 7f00 0000 0000 0000 0000 6ac2 091b 3022 

After swapping the bytes, I see that this is a TSE2004-compliant device
(devid = 0x2230) and the capabilities register reads 0x007f. This
doesn't pass the 0x00e7 mask test you added, as bit 7 isn't set in his
case.

The JEDEC standard indeed says that bit 7 should be set, but apparently
this isn't always the case in the real world.

Also note that I looked at the Renesas TSE2004GB2B0 datasheet and it
shows bit 2 (RANGE) as not always set. The ST STTS2004 datasheet shows
bits 0 (EVENT) and 2 (RANGE) as possibly reading 0. So I wonder how
much we can rely on these capability bits being set in the detect
function. Unfortunately I don't have any TS2004-compliant device at
hand to verify, nor do I own register dumps of such devices. Would it
be OK with you if we relax the check to at least ignore bit 7, and
possibly also bits 0 and 2?

Thanks,
-- 
Jean Delvare
SUSE L3 Support
