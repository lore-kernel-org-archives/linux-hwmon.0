Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6602371056;
	Mon, 23 Feb 2026 21:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771883565; cv=none; b=pxBkaM9M3QxXlyW2B86b2UcUsuV3D/Srk/FCxIl05kfX0geG8ApddZ0pobCEFcLeAHSk/CILBegyxGdNF7V739HzrUP7/13hyCACUvSukAw9SGL14x1sik7NP/8n/7x3YEKYLaBmBqD+ZYTdxYWpLXeI9HSPn05j2AnrHMv9I0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771883565; c=relaxed/simple;
	bh=rp5H+YsiQ7dvB+LSfiD9STxcx9fOGNkcXtY7NKyl3DU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lfx8Ya6koRBGJ5tLz/Aoc4p2JmsKMOgdNhdCnIyVVz/5/j0aFKsMmTtdBISvUywrcQvaK9+4pWg1CqXze+vqeZHPZEzlyYoWO2p9db4IESuPQaEDkGpwd1uArJ2rS4w+eNPdNs26jVfSomxvcRZiN9owdk6rtjRWtsoV1lwAXqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=cKGnlIPl; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="cKGnlIPl"
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4fKZMv6Hgczlh2fL;
	Mon, 23 Feb 2026 21:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1771883560; x=1774475561; bh=T7NGZ
	G7T95/ho43evwBlo2X9xQ7liZ54uMYgZXBWq8A=; b=cKGnlIPly3r+leLnLGwo0
	WFbVVOfLNbG88c4f1MtCegVqi5e89/JKIRtslCaIo8hiR3THQyrsOK9WV+1T1bxC
	TO+xioEsncVXjk+nxZYPwKnOFqK+rSFC9TjAeG2+VAU9c36pycvFb3i/6WbWCbwz
	XNPmQ9C8hKw+++g70aJ0Z1nTRnwRvP75R6xqchnS97tie7C/npHFDRY43tyKrvxv
	KSEy3EcS8/A1k/KTept0HqEteGjKhDyG+GaaK0FljmXdaDDjNgrU3riuCHgjBamm
	jedxpvfvcFGUEcjTLGzn6FtzpH6c6lfjriBoTSkO77D6nKyK4uoLHJD/PWEYnlzJ
	w==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id rRLY6riyTR_x; Mon, 23 Feb 2026 21:52:40 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4fKZMm3Lyjzlh2fJ;
	Mon, 23 Feb 2026 21:52:36 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	linux-kernel@vger.kernel.org,
	Marco Elver <elver@google.com>,
	Christoph Hellwig <hch@lst.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Frank Crawford <frank@crawford.emu.id.au>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH 14/62] hwmon: (it87) Check the it87_lock() return value
Date: Mon, 23 Feb 2026 13:50:29 -0800
Message-ID: <20260223215118.2154194-15-bvanassche@acm.org>
X-Mailer: git-send-email 2.53.0.371.g1d285c8824-goog
In-Reply-To: <20260223215118.2154194-1-bvanassche@acm.org>
References: <20260223215118.2154194-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Return early in it87_resume() if it87_lock() fails instead of ignoring th=
e
return value of that function. This patch suppresses a Clang thread-safet=
y
warning.

Cc: Frank Crawford <frank@crawford.emu.id.au>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org
Fixes: 376e1a937b30 ("hwmon: (it87) Add calls to smbus_enable/smbus_disab=
le as required")
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/hwmon/it87.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index e233aafa8856..8e3935089fca 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -3593,7 +3593,9 @@ static int it87_resume(struct device *dev)
=20
 	it87_resume_sio(pdev);
=20
-	it87_lock(data);
+	int err =3D it87_lock(data);
+	if (err)
+		return err;
=20
 	it87_check_pwm(dev);
 	it87_check_limit_regs(data);
