Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C85218035
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Oct 2024 14:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728914484; cv=none; b=G5+4YNDks8hrosgqCEwhEPVTP77QFYyjKYBKYyo0zRkjkthhurCij9xIUoF+7j0fwDIDHEtTAgGG57aEKTGuMUXDfH9O55ch2vrR/iIS5NSPZGnd1mlx15JVBCiRedXXDIYaG0gQQh81VrFz4nX3AXeE1J2nqcAeVI5GUfRM58w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728914484; c=relaxed/simple;
	bh=0gmEUEWsGOnZw2IspdPssZ4hK8xvIEUZqQaekDXJftI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SMCf6geFn9J860Jsd7O1I+Prvym1W2aC/InaFTNZHY/eGDGMpksVQscZyKfRRtS0g0rbgMZfpKiTV6uAjBoT78l4eplH0MRmuz4l03Oq2d6r1YhJPFKc0run9L3LvlszMFKpEsKoe3YIRpP/qGQ0+TmtFkQ9Lzo/ei+YNVNgpZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=a5QBFoBr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ibC6Fb++; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ae6n0lU3; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=XzByNNw1; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="a5QBFoBr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ibC6Fb++";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ae6n0lU3";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="XzByNNw1"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 364011F790;
	Mon, 14 Oct 2024 14:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728914481; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lno8R3UXV4AIXt/2OA467FRZJNw6/0viynSvjBxY9LE=;
	b=a5QBFoBr7fXcrXBnmYzdIImpc+xAKWeuLv2arz4tskg/HGqfVyRHebn3MFnxNEYOsp5XcG
	5QwrSDae2YiKDcSGbt7eTTjUzhj/NrlfQw2K+RwptX0vI0bogiRREgYjWZjqMQRjaO6/Ja
	/PYRQBrfPgv7UyjgkZ01O5ZKU8p2aiY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728914481;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lno8R3UXV4AIXt/2OA467FRZJNw6/0viynSvjBxY9LE=;
	b=ibC6Fb++PQyQsDU4X8xw0qB4sVjF4/Cj1eqB3mWyaRLOIHZsVsQzkACWatFv7Su0tzb8WP
	kueDz1wwLk4E29CA==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ae6n0lU3;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=XzByNNw1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728914479; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lno8R3UXV4AIXt/2OA467FRZJNw6/0viynSvjBxY9LE=;
	b=ae6n0lU3Kytiu0y6e3zfLYW+4DpuqsH1JkQfdEuqI62bKKEgkVSocE6fMWVmiWXCAXCNzQ
	dExMxw4hBnK6skp+ghKYfH9VRFE4f2oqE5EUbSnpfm5xCWKT3BYMSuSYi0U/X56kY2H7sA
	KR8tau12dMcCyeOYYarQcdZqRGJ0qAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728914479;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lno8R3UXV4AIXt/2OA467FRZJNw6/0viynSvjBxY9LE=;
	b=XzByNNw1XqSj/PQowyGnl5T01UaB4mkqVbEI/taOJ7NbzxDzclMJPcon/aDbLlfDUyxBdv
	N4+wWF3zeESFP5Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0FEF313A51;
	Mon, 14 Oct 2024 14:01:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id PxfUAS8kDWdeYAAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Mon, 14 Oct 2024 14:01:19 +0000
Date: Mon, 14 Oct 2024 16:01:17 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (jc42) Strengthen detect function
Message-ID: <20241014160117.2f92f153@endymion.delvare>
In-Reply-To: <b33ea745-5acd-4019-aeff-59bee4d50e5a@roeck-us.net>
References: <20240630202028.1874325-1-linux@roeck-us.net>
	<20241014141204.026f4641@endymion.delvare>
	<b33ea745-5acd-4019-aeff-59bee4d50e5a@roeck-us.net>
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
X-Rspamd-Queue-Id: 364011F790
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[endymion.delvare:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Flag: NO

On Mon, 14 Oct 2024 06:52:45 -0700, Guenter Roeck wrote:
> On 10/14/24 05:12, Jean Delvare wrote:
> > I have a user reporting that this change is causing the jc42 driver to
> > no longer bind to his memory module temperature sensor devices after
> > updating to kernel v6.11. I asked for a register dump:
> > 
> >       0,8  1,9  2,a  3,b  4,c  5,d  6,e  7,f
> > 00: 7f00 0000 0000 0000 0000 6ac2 091b 3022
> > 
> > After swapping the bytes, I see that this is a TSE2004-compliant device
> > (devid = 0x2230) and the capabilities register reads 0x007f. This
> > doesn't pass the 0x00e7 mask test you added, as bit 7 isn't set in his
> > case.
> > 
> > The JEDEC standard indeed says that bit 7 should be set, but apparently
> > this isn't always the case in the real world.
> > 
> > Also note that I looked at the Renesas TSE2004GB2B0 datasheet and it
> > shows bit 2 (RANGE) as not always set. The ST STTS2004 datasheet shows
> > bits 0 (EVENT) and 2 (RANGE) as possibly reading 0. So I wonder how
> > much we can rely on these capability bits being set in the detect
> > function. Unfortunately I don't have any TS2004-compliant device at
> > hand to verify, nor do I own register dumps of such devices. Would it
> > be OK with you if we relax the check to at least ignore bit 7, and
> > possibly also bits 0 and 2?
> 
> Sigh. I guess it would have been a miracle if vendors followed the standard.
> Let's ignore all three bits, with explanation. Care to send a patch, or do
> you want me to do it ?

Working on it, I'll submit it later today.

Thanks,
-- 
Jean Delvare
SUSE L3 Support
