Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8363DCD95
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 07:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785914370; cv=none; b=EXVIvZCzuXd0B+hObwepPXz1OLnXB3TSNU/mT5yG56M/NkEN0hm9tGuwSlZHwxsdmepKd933PFjeOS4C9sUne6jQhRebVtaV/7dscau+NxQMvCE6K4VyNMNA/9UbYhySq0waEncgRZQ0bYBzoDAvAtPqz5+UOnooBl3HcsfUwr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785914370; c=relaxed/simple;
	bh=2oarunofIitNGHsvRdX8ynsA0UjH/P83LFftPyDtbEI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Sga/CxLnw8+PLU/UXcEKSV008147ImbrPw/oko7SSaCGLV4mlaIAoKQlW3gEVR3PgOSKwgioszxCsvn3xHLvFQbY8Pwt3Q5TPDeOefoCJtKUm6dCQmqJtovdvx9fL6Saf0EnnLux99lrpaf6r9SknnALyUUXGGoTUg0TrXDhiWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=GXLtHmol; arc=none smtp.client-ip=185.67.36.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="GXLtHmol"
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 9CF6E240103
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 09:19:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.net;
	s=1984.8680eb; t=1785914360;
	bh=cRnJltpsyJ+e75vATyEi43129mtePB+PUvX0ryGqwEA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:From;
	b=GXLtHmolKk1cVZRVCDVODEjVvIvbCcaDszoewLImxoXNwVSd8w8U6IMdgb/cdlrgy
	 tuiaA3zgErCAuGXYtQevMiBRZ6aN537UNIJhWypvq5OtNMv/HRAYjY5mag3FcOxC54
	 dAJOSsvg2ewolF2nqKUECurXh0fGkQ+NniDfbJqUrbC++eIh8SbsK/4AcMhEtw+QF1
	 JkDG6+a9o18R20XDAYapCCufYiM4niCwT3Wrb/B9nmcQ2PujlgKE+EztqukHARVpJB
	 PS8jtEaREzWx06C2gV4DuJr8r/9A7XpkTSGDBU2onMI9KHJzXRn57o2orII5U6A3S2
	 3zk/coZdePLxg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hFMGw0Ymwz9rxP;
	Wed,  5 Aug 2026 09:19:19 +0200 (CEST)
Date: Wed, 05 Aug 2026 07:19:20 +0000
From: Wilken Gottwalt <wilken.gottwalt@posteo.net>
To: linux-kernel@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: corsair-psu: fix possible out-of-bounds access on
 missing string termination
Message-ID: <anLj9gPWRoRDbQBV@monster.localdomain>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In theory it could be possible that the REPLY_SIZE sized buffers for
holding the vendor and product strings could be end up missing the null
termination (for example by malicious hardware built on purpose)
required by the seq_printf() call. That limits the debugfs printf calls
to a maximum string length of REPLY_SIZE.

Fixes: d115b51e0e567 ("hwmon: add Corsair PSU HID controller driver")
Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
---
 drivers/hwmon/corsair-psu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
index ce958cdaef58..3cb0ba592250 100644
--- a/drivers/hwmon/corsair-psu.c
+++ b/drivers/hwmon/corsair-psu.c
@@ -701,7 +701,7 @@ static int vendor_show(struct seq_file *seqf, void *unused)
 {
 	struct corsairpsu_data *priv = seqf->private;
 
-	seq_printf(seqf, "%s\n", priv->vendor);
+	seq_printf(seqf, "%.*s\n", REPLY_SIZE, priv->vendor);
 
 	return 0;
 }
@@ -711,7 +711,7 @@ static int product_show(struct seq_file *seqf, void *unused)
 {
 	struct corsairpsu_data *priv = seqf->private;
 
-	seq_printf(seqf, "%s\n", priv->product);
+	seq_printf(seqf, "%.*s\n", REPLY_SIZE, priv->product);
 
 	return 0;
 }
-- 
2.55.0

