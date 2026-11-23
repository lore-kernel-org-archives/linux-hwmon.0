Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428387;
	b=XazGMqLsp26e9QPBYCBKIKfYklj+qh6rnk9bWoADYDQx2wqjz5MQUwEiqLopaxIiwfOY
	 So0A2YT9o0b2ZxGXTbDvTHFY85dEgZakOq5fnFG4lQMVtrP3aInyzmh9qNncoM3rUSogU
	 11u6gTo8o3g5KnQ4VABoigP39hFkKJjCzaSYeJO8KQIm4SWT6gAjIuWIpQj/PCnCfgqBP
	 Nn4DJvPUw1kQ+fJkmThkMzVtUEZlHq+czcYQUMBr4dvkeXwTGgyTcaE3kyWeI2PutITV4
	 Y9TRNaZWuJeDJfvoqooM2Vap4qWzodfKWsRNh314HaP68CawFUH8kZvP6lVrI2btYQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428387;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 Organization:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Spamd-Result:X-Spam-Score:X-Spam-Level:
	 X-Spam-Flag;
	bh=3LQMQHM88hcNWH/9OzjuS7CwwOgArJ2VMMaL+R88A+A=;
	b=TAD+SEZZkZjlwN7Uq4bZEqx8g0TgicZN2ET4LHExb51F7++UCVlLLch4nwwMAkuNHD/n
	 1k/5xPkTb6kFIAO6Of52RoKUvR+S0ZfTmraPrxp1a3jedhPshXGNx9VaMlo2Z415w6sb8
	 f7iQBWAMRWcz46HOYrcSosJarY8UTBraLFxcvytuGFrXFp0QuUCrGYbuTdY3qXHTd5qDR
	 71TT+022M8txpltaXrnREKM9i+cqfKhYGdRYBk3dl/PxjxVt/MJRnVN6VE8uiWLa+hvGn
	 F54RhPXYa4wyM7bmDcj4JEtjbG3Cyhj1U9xyD2xNHTssdcLtaebJW2iC6t7XXSzaOdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b="weiL4O/E";
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=o8ul7xhb;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QZOHUGI+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=I6O7bofq;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4EAB606A339
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 10:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4EAB606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=weiL4O/E;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=o8ul7xhb;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=QZOHUGI+;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=I6O7bofq
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E9FA81F387;
	Mon, 23 Nov 2026 10:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795428385; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3LQMQHM88hcNWH/9OzjuS7CwwOgArJ2VMMaL+R88A+A=;
	b=weiL4O/E6VqQUIk5FbkgJa3QcexcuuyUuo6Qt+yrgwOvFajV+GuuG4qKxZzaqsqUpOVsI2
	5qI40hXpBKpiouK4wzaUl5PzfABRqkRI0KgfC6iFClmeYwo5VWvksD88+DIAcUDDCBs24W
	e1s1PP/AhiI/vYdU9CbLtHI3LUigMDY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795428385;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3LQMQHM88hcNWH/9OzjuS7CwwOgArJ2VMMaL+R88A+A=;
	b=o8ul7xhbkRvfVZcLg8c6U6rLLwMvJ7K0y0aj/TGTx7UNzJRYYHr2SLYMvsFzznlXiIzGvb
	AtP+c9GGMqpubZAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1795428384; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3LQMQHM88hcNWH/9OzjuS7CwwOgArJ2VMMaL+R88A+A=;
	b=QZOHUGI+ocpk2riuzZLMIXkpnB7Qi76xi8J1NdcFbpMr0DUlM1p9sUSvE8cbtVBcc0/5V7
	iut2TsWKlbqG90rbmNU+v0j0+A6wc82vMoZNG5anGDFn3lvdJ58H/heWTbm+ry/DFag9xb
	Ge+ZjKO6M1R0b1lAtqtgTVbrer2gmuw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1795428384;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3LQMQHM88hcNWH/9OzjuS7CwwOgArJ2VMMaL+R88A+A=;
	b=I6O7bofqFgwyuHNegWvBib9ibHvSdjzySVJ90s1zppA+qIEe1MArjqz+JEwqUptxNdv6xV
	UJ27r5IAON0lqEBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A6FD13510;
	Mon, 23 Nov 2026 10:06:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SFLIGyAQBGvTSQAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Mon, 23 Nov 2026 10:06:24 +0000
Date: Mon, 23 Nov 2026 11:06:16 +0100
From: Jean Delvare <jdelvare@suse.de>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: Unknown values check in acpi_power_meter
Message-ID: <20261123110616.1a3b8290@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.50; x86_64-suse-linux-gnu)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-12.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.80
X-Spam-Level: 
X-Spam-Flag: NO

Hi all,

I have a concern about the following construct found in the
acpi_power_meter driver:

> /*
>  * ACPI integers can either be 32-bit or 64-bit wide, so
>  * we have to check for both values.
>  */
> static bool acpi_power_meter_is_unknown(u64 val)
> {
> 	return val == U32_MAX || val == U64_MAX;
> }

If the implementation is returning 64-bit values on a given system,
then only U64_MAX means that a value is unknown; U32_MAX is a regular
number as any other and should not be handled as an error case.

Don't we have a way to figure out whether a given ACPI integer object
is a 32-bit or 64-bit value, and only compare the result with the one
appropriate special value which means unknown for that integer size?

Thanks,
-- 
Jean Delvare
SUSE L3 Support
