Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AED133CE91
	for <linux-hwmon@vger.kernel.org>; Wed, 26 Nov 2025 16:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764174036; cv=none; b=uXToEwVXqvPJ1ASAHciQlLdjrdPxCXnzAeFY5Ms5rEROc4ryIQIG5iIGIbXT7eI6+pf6d11gm77MY9Jtg2J/nIZ9Ag3Ow0nZvgihjz8IMF0bpQUog1GZg/m7GNWSZswsnJM4Irwqrk7Q3CQnDa0XAksZkbW8PkNXnBWHjElLANc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764174036; c=relaxed/simple;
	bh=D6TJb6Fz3Fo8wBex17+flKz4WaxKSTIk03xFsc2TsdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dNkZSnecPkB/HcKqapXoPZCSwfroPZRIFEAinufNN93znh6/f0biUIuxkpAwq6/DO5iBrcN1z+29+zqetjNQVrf/ddUb2h+s/968wYG68Jk8PH2wkVOpAGzpwvsDXbuftpKRq9qL7qdXgpRCZNWA0pLAsQbCtdjmL2RJMG+2liY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=tXnldcGz; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=tXnldcGz; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="tXnldcGz";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="tXnldcGz"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8A3DC5BECB;
	Wed, 26 Nov 2025 16:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1764174032; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NqzksQw7WTcZNKnXCQ4FhvD+v/7v9Egk7bc9LWG+9kw=;
	b=tXnldcGzJnq1wwrDxaOSld+dxi/vTRQD2tJiTTMx4LLFJhLkJJ9ao4ETVPbInCq/FHoN6c
	QRwUgxuu8QdMcJGlmDoXoqZXc6xVi7EnY6OlzrWz6USDB6ytZH4KfN3b2h9XIAwr8RJfJg
	6gpeEx5dYVNoN0hpaprRmBeOoymHvwc=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1764174032; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NqzksQw7WTcZNKnXCQ4FhvD+v/7v9Egk7bc9LWG+9kw=;
	b=tXnldcGzJnq1wwrDxaOSld+dxi/vTRQD2tJiTTMx4LLFJhLkJJ9ao4ETVPbInCq/FHoN6c
	QRwUgxuu8QdMcJGlmDoXoqZXc6xVi7EnY6OlzrWz6USDB6ytZH4KfN3b2h9XIAwr8RJfJg
	6gpeEx5dYVNoN0hpaprRmBeOoymHvwc=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4CB5B3EA63;
	Wed, 26 Nov 2025 16:20:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Yb3lBNAoJ2luLQAAD6G6ig
	(envelope-from <jgross@suse.com>); Wed, 26 Nov 2025 16:20:32 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 2/5] hwmon/lm78: Drop REALLY_SLOW_IO setting
Date: Wed, 26 Nov 2025 17:20:15 +0100
Message-ID: <20251126162018.5676-3-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251126162018.5676-1-jgross@suse.com>
References: <20251126162018.5676-1-jgross@suse.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -6.80
X-Spam-Level: 
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.com:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_TLS_ALL(0.00)[]

In lm78_isa_found() there is REALLY_SLOW_IO defined around some port
accesses, probably in order to wait between multiple accesses.

Unfortunately this isn't making any difference compared to not having
this define since more than a decade, as REALLY_SLOW_IO needs to be
defined while "#include <asm/io.h>" is called to have an effect.

As there seem not to be any outstanding issues in spite of this having
no effect, just drop the "#define" and add a remark to the related
comment.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 drivers/hwmon/lm78.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/lm78.c b/drivers/hwmon/lm78.c
index 8b53bb312069..9378a47bf5af 100644
--- a/drivers/hwmon/lm78.c
+++ b/drivers/hwmon/lm78.c
@@ -843,17 +843,18 @@ static int __init lm78_isa_found(unsigned short address)
 		}
 	}
 
-#define REALLY_SLOW_IO
 	/*
 	 * We need the timeouts for at least some LM78-like
 	 * chips. But only if we read 'undefined' registers.
+	 * There used to be a "#define REALLY_SLOW_IO" to enforce that, but
+	 * this has been without any effect since more than a decade, so it
+	 * has been dropped.
 	 */
 	val = inb_p(address + 1);
 	if (inb_p(address + 2) != val
 	 || inb_p(address + 3) != val
 	 || inb_p(address + 7) != val)
 		goto release;
-#undef REALLY_SLOW_IO
 
 	/*
 	 * We should be able to change the 7 LSB of the address port. The
-- 
2.51.0

