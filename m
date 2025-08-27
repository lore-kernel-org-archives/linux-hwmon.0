Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31011338F3D
	for <linux-hwmon@vger.kernel.org>; Wed, 27 Aug 2025 09:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756286034; cv=none; b=uaRtuvh+8Moh+MhSD+bGufz353C99D0l1CimMCx5ZkFO4r3sCU2h9UzptlCbPNEW+E645A8MGou/snvrvx6/TCgzNNMMBfibwBF30HWjdasDnV2gHbbxqxzwbsJ+9LakF5dQ+b5Nxt9PbFhrVDuaa+/D6VXb1IKlgJ7oTJcCtcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756286034; c=relaxed/simple;
	bh=t+HRcKuYvoUnHeSmgcFlfzyy8s257vEOsRgWWgf1yBY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pWN1QruoWGPIyNPNgNdNnw2cKOmv9W7JOi7gN0DgC/wh41x8SqXC5dJ1V6Sji328ujYskSaMrTWVA46R3kiqpohy7SB0mwg0uLQ79ICtFYw4qGkysos1joiDrbrj/h5WB7gazEQBqLZwiQotbsWMj2LATPx8/gdYD1ZnArGixbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0dGDRISz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Y4YMdlYb; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=0dGDRISz; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Y4YMdlYb; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0dGDRISz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y4YMdlYb";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="0dGDRISz";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Y4YMdlYb"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 2C5091FFAB;
	Wed, 27 Aug 2025 09:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=knKsazVUkXyajXNDu3HUP2aZCXri/UVmdaqrgFzv06w=;
	b=0dGDRISzsyuJF1QNa1K9bqoflsn8XHEcEhYR34GET+xxxrXXiiiwymzvr3XxPqgAz+64PD
	14bT1dgF10pw6jKZNn7r9vTzhUZuFOaYyCO38usyvLkI93IL3Z20hJiGi2SGALU8PYeruq
	edavRrOAxY/jhUrWHEflSxRoDM2rUX0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286030;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=knKsazVUkXyajXNDu3HUP2aZCXri/UVmdaqrgFzv06w=;
	b=Y4YMdlYbbjLHTAStLNJ1TnVk2xuc0pYvNmD54vWBCKTxupdt+0JgsYYewsBBRDctz137Pu
	ZZnYlMkIzvB1gRCg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=0dGDRISz;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=Y4YMdlYb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1756286030; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=knKsazVUkXyajXNDu3HUP2aZCXri/UVmdaqrgFzv06w=;
	b=0dGDRISzsyuJF1QNa1K9bqoflsn8XHEcEhYR34GET+xxxrXXiiiwymzvr3XxPqgAz+64PD
	14bT1dgF10pw6jKZNn7r9vTzhUZuFOaYyCO38usyvLkI93IL3Z20hJiGi2SGALU8PYeruq
	edavRrOAxY/jhUrWHEflSxRoDM2rUX0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1756286030;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=knKsazVUkXyajXNDu3HUP2aZCXri/UVmdaqrgFzv06w=;
	b=Y4YMdlYbbjLHTAStLNJ1TnVk2xuc0pYvNmD54vWBCKTxupdt+0JgsYYewsBBRDctz137Pu
	ZZnYlMkIzvB1gRCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F18E213867;
	Wed, 27 Aug 2025 09:13:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id rsETOE3MrmjRDwAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Wed, 27 Aug 2025 09:13:49 +0000
Date: Wed, 27 Aug 2025 11:13:44 +0200
From: Jean Delvare <jdelvare@suse.de>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH] hwmon: Remove Jean Delvare from maintainers
Message-ID: <20250827111344.0debba2a@endymion>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	TO_DN_SOME(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:dkim,suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Level: 
X-Rspamd-Queue-Id: 2C5091FFAB
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.01

I haven't been active in maintaining the hwmon subsystem in the last
decade, so I think it's about time to admit that I do not have the
time for this duty and update the MAINTAINERS file to reflect that.

I would like to thank Guenter Roeck for taking over and doing an
excellent work for so many years.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
---
 MAINTAINERS |    1 -
 1 file changed, 1 deletion(-)

--- linux-6.16.orig/MAINTAINERS
+++ linux-6.16/MAINTAINERS
@@ -10557,7 +10557,6 @@ W:	http://www.kernel.org/pub/linux/kerne
 F:	drivers/platform/x86/hdaps.c
 
 HARDWARE MONITORING
-M:	Jean Delvare <jdelvare@suse.com>
 M:	Guenter Roeck <linux@roeck-us.net>
 L:	linux-hwmon@vger.kernel.org
 S:	Maintained


-- 
Jean Delvare
SUSE L3 Support
