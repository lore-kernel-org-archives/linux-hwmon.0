Received: from sender-of-o58.zoho.eu (sender-of-o58.zoho.eu [136.143.169.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA32489865;
	Sun,  2 Aug 2026 12:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785675240; cv=pass; b=kDJPMfSItIFMRdU6K/iBg+kojWFFPu4SPra0pWxdhvd6CI9btHv0s33sza7Jffe5fSW8aZ16kQbCSru/ICynwgUhFUVA0/4xqaPpwa9VPdZC/RX9joMy97gAmFh1523KQWs0RPV/8SRGpikow/dXh2r6HPlU/R+kY0C89RKkEnI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785675240; c=relaxed/simple;
	bh=vsJ7TjyaQctbC/ovy/l9K5gqDxt3xO+3S3+/n0anHvk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JwY4yislb9kmCVyTckiQ5G9R18RaA+T8y8zHkuOZX7geSWj9DRtfAfNTTSnwjnEM3dqCYaeDkOG5S9fLqM2cx6FZwP5nA7HkJFg4A2unEIfleD9+c/Iyf4XqsnbC2LNhXEBFc6yTgtnYkpPCaELyRbj3EllJMUJN5BI55cZ1Xu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com; spf=pass smtp.mailfrom=iusegentoo.com; dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b=gBeI5cgv; arc=pass smtp.client-ip=136.143.169.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b="gBeI5cgv"
ARC-Seal: i=1; a=rsa-sha256; t=1785675218; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=kgifT6eL5dZaKnFhYlZfUHm7KhTswnJ+lJLXqsCJaLXVwwBr17jLt2nnGCrNw0IX2TW0QNZFI5oOwC3bZ4zxMxGxonV1VisCZFIgvO5L4f9u2B3kfimNgsMojsT96nwemTM1Yr1rN3z5w26oL9beUyZDiltLSmgYshys4NgmoUo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1785675218; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aGfBqBgS8wpCOiIXZnOQRX+FSgYCixnzg6cIc6f/lqU=; 
	b=RHw3mOS+137pMMKmlfs7I6k+BVUzMZaNLPSSOSBx7n6OKGrQB1cN4P8A6gL91qerStPl8yCjzCK+x0FrdWDvpG85H14gEYnhILkH+quGJIA7NXcO7jg64lfpOHBeBPOQyuMaY58yHUoJmoLqAidv+yEP59cL/KuEuaAgeNEumJ4=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iusegentoo.com;
	spf=pass  smtp.mailfrom=ali@iusegentoo.com;
	dmarc=pass header.from=<ali@iusegentoo.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785675218;
	s=zmail; d=iusegentoo.com; i=ali@iusegentoo.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=aGfBqBgS8wpCOiIXZnOQRX+FSgYCixnzg6cIc6f/lqU=;
	b=gBeI5cgv2W73uTDkRDJ74axbuMLRAnr0n5QWPy1GLaR8SFa+Uvq80jSeFWC+3Dao
	cdk6KtCccdualsuo/Q+v4+xAw1ln81iJ2mDvyom1HpuJ6dKVAoF3tN31tB6pqw6Hn/k
	Qi6qz3v3OqjNYO1+839gurg0xFtY0ch/TRo0G6SY=
Received: by mx.zoho.eu with SMTPS id 1785675217109579.811818923895;
	Sun, 2 Aug 2026 14:53:37 +0200 (CEST)
From: Ali Ahmet Memis <ali@iusegentoo.com>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (corsair-psu) null terminate the vendor and product strings
Date: Sun,  2 Aug 2026 12:53:27 +0000
Message-ID: <20260802125327.21469-1-ali@iusegentoo.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

corsairpsu_usb_cmd() copies a fixed REPLY_SIZE bytes out of the reply
into the caller's buffer:

	if (data)
		memcpy(data, priv->cmd_buffer + 2, REPLY_SIZE);

corsairpsu_fwinfo() passes priv->vendor and priv->product, both declared
as char[REPLY_SIZE]. A device that fills all 24 bytes without a NUL
leaves them unterminated, and the debugfs files print them with %s:

	seq_printf(seqf, "%s\n", priv->vendor);

The read then runs on into whatever follows in the structure, product
for vendor and temp_crit[] for product, until it happens to find a zero
byte. priv comes from devm_kzalloc() so it stays inside the allocation
and terminates eventually, but the strings are still wrong and the
contents of neighbouring fields end up in debugfs.

Give both arrays one more byte. The structure is zero allocated and
nothing else writes past REPLY_SIZE, so the terminator is always there.

Fixes: d115b51e0e56 ("hwmon: add Corsair PSU HID controller driver")
Signed-off-by: Ali Ahmet Memis <ali@iusegentoo.com>
---
This came up while looking at the driver for the debugfs locking patch
posted earlier today, and the automated review on that thread flagged it
too:

  https://lore.kernel.org/all/20260802123653.19532-1-ali@iusegentoo.com/

The two are independent; this one applies to master on its own and does
not depend on the locking change.

I have no Corsair PSU, so I have not seen a device actually fill all 24
bytes. The fix is on the grounds that the driver should not depend on
the device terminating the string.

 drivers/hwmon/corsair-psu.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/corsair-psu.c b/drivers/hwmon/corsair-psu.c
index 24100519cd83..a242373c4656 100644
--- a/drivers/hwmon/corsair-psu.c
+++ b/drivers/hwmon/corsair-psu.c
@@ -123,8 +123,8 @@ struct corsairpsu_data {
 	struct dentry *debugfs;
 	struct completion wait_completion;
 	u8 *cmd_buffer;
-	char vendor[REPLY_SIZE];
-	char product[REPLY_SIZE];
+	char vendor[REPLY_SIZE + 1];
+	char product[REPLY_SIZE + 1];
 	long temp_crit[TEMP_COUNT];
 	long in_crit[RAIL_COUNT];
 	long in_lcrit[RAIL_COUNT];

base-commit: 2d2338c93da79b3bfe4b6099a931d9468d539952
prerequisite-patch-id: b3289aa9b605d10f8499c46149f857a9d0a2b2e7
-- 
2.55.0

