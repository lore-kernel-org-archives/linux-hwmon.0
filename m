Received: from 013.lax.mailroute.net (013.lax.mailroute.net [199.89.1.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AA333A6E9
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Feb 2026 21:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771883425; cv=none; b=lQyAivMC34Va6TZrfDia3mdRg8BraDtvr9c4yvHP+TCyn9Pnv7xWVs3Hn8PHbdwXHTYDWd+XqooK+vUV/NxZnmbIwRx9MWczJlgNAk7YfbRIPSvr8vGYvC36DXwozB1xU+b3L/XLbRadNXHhnkms8mmCaiNol7YOOs8V29T1mZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771883425; c=relaxed/simple;
	bh=rp5H+YsiQ7dvB+LSfiD9STxcx9fOGNkcXtY7NKyl3DU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fWyZOlcC8dZKPyj38CUz6loGZZmGJTARDDNrqT7FRn25ZxZkFc5MME8qXxUpL33IYENj09wGMwW4+6wLghW1Gid61OsRyKANOwM5SnSIj/OG6wQ4ug7CQqahTM/BSR/o6f58IoQm+zx8YwzKobPG8rTM5G+leBa+IEsv59T8jbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=UuWhNT8s; arc=none smtp.client-ip=199.89.1.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="UuWhNT8s"
Received: from localhost (localhost [127.0.0.1])
	by 013.lax.mailroute.net (Postfix) with ESMTP id 4fKZKC4Znpzlh1Wj;
	Mon, 23 Feb 2026 21:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1771883422; x=1774475423; bh=T7NGZ
	G7T95/ho43evwBlo2X9xQ7liZ54uMYgZXBWq8A=; b=UuWhNT8sz0lAEncrD8OwY
	aSa/j1YO4uKWus9GASi8xFKT/PVks1p5Q8pdtNfv8rnsZ+ANvuGSE3FRLC0tLEHY
	E5H6WnSNx8jVDHR0+aGh2WRFeAJXy7KKSey7WYUAECi464h8vBXOm+lBnBB6rDVr
	7S1saCuykpRS1sgTH1wOsQixeNpHjQ4kAJvDrhx6AN4p6sWlbTcsD62JJfW8Si15
	oGQfdF/IguqZVAnyQZaAfvc4sg+Zx8L5/66Ox44bftuJjDJxxBdpJlvUrOp/l14d
	Xs8PfHZa8YDfPxVtb+hAfXjuQOiIMmKUuZ0moeN7cd89I2+Ed2LfIB7RVcLKI15D
	w==
X-Virus-Scanned: by MailRoute
Received: from 013.lax.mailroute.net ([127.0.0.1])
 by localhost (013.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id vqR6xRiZbK1V; Mon, 23 Feb 2026 21:50:22 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 013.lax.mailroute.net (Postfix) with ESMTPSA id 4fKZK90lNCzlfddf;
	Mon, 23 Feb 2026 21:50:20 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Bart Van Assche <bvanassche@acm.org>,
	Frank Crawford <frank@crawford.emu.id.au>,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org
Subject: [PATCH 14/62] hwmon: (it87) Check the it87_lock() return value
Date: Mon, 23 Feb 2026 13:49:02 -0800
Message-ID: <20260223214950.2153735-15-bvanassche@acm.org>
X-Mailer: git-send-email 2.53.0.371.g1d285c8824-goog
In-Reply-To: <20260223214950.2153735-1-bvanassche@acm.org>
References: <20260223214950.2153735-1-bvanassche@acm.org>
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
