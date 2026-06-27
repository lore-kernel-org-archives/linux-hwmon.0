Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D674F325490;
	Sat, 27 Jun 2026 16:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782578358; cv=none; b=Oeb3iuxEixK5FUMn9cjc5eGOVhSTvFRfLsVf/p5tq7V1K2omWu3MCGifETxeaG8MIFsxn9TV+3jVz9/N6AG++EUf5H2zKhXmSoFDP7fE+uLdT+dl/I2wgESC4uD7Emcb7W0b0+AybU72c3J/KEARAc7V2M6v9fQXI3Ayzkz/Lso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782578358; c=relaxed/simple;
	bh=HMUeAYogHkC8kbRWhPqwXJxNX4LXaOQmsK54p9qxy3k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SlB+xnaLfQasViIk0oOjT/NeYPgKmYZIR3FbPfvws+TzJAOjqIZW00nGg5juNuKQlZBcE4lDRP7e38+zn6djzQW4Zj0A8dkHTUFmVuI4YyTzdJUArR5hGrh35qZp1ri4wC41zVe/4ThcU+J0Hh6FH1oSNSCECdAIS0LxviZbqnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=liC9Sixz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="liC9Sixz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90C641F00A3E;
	Sat, 27 Jun 2026 16:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782578357;
	bh=c6McYuUahIUh3MsULajmA/oVdTu5ooeSQ68hmu/YX4E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=liC9SixzDS+dlmekHK+RXgeG+IcMuyat3TtJemQB4H+hx/XjZdS3wCENDG7CSgb2s
	 DTsgYffYTJ++DtmTyc1i2pmtMPneHjkd+FYzCZdz2ORqvrn0n34LilYcKWYNBgpaHZ
	 OAw8nLrASWdWmUXliBXPaKrc+KkwRGbnKD8gFHMyA8xDRm79O1VmN4JBiDvs+8B6v3
	 SgHPExegnM1E5mwm6NmHEdVt+P2YiY8NEIcpaHLjTmwIxhNSraNJXXKKPLKm59iJNl
	 JjI4CMFC5TKaVnPz9K8gZAKgi/vGwiJyuKMoSoODrdJA/JBY4mwnL/eYdkThgwQtjt
	 9EAwxMBuPK5ZA==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Sat, 27 Jun 2026 17:37:30 +0100
Subject: [PATCH 2/6] hwmon: xgene: Stop writing PCC shared memory signature
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260627-acpi_pcc_signature-v1-2-c1b7268d4fdc@kernel.org>
References: <20260627-acpi_pcc_signature-v1-0-c1b7268d4fdc@kernel.org>
In-Reply-To: <20260627-acpi_pcc_signature-v1-0-c1b7268d4fdc@kernel.org>
To: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 linux-hwmon@vger.kernel.org
X-Mailer: b4 0.15.2

ACPI specification defines the generic PCC shared memory signature as
the PCC base signature ORed with the subspace ID.

ACPI 6.6 added clarification that the signature is populated by the
platform and verified by OSPM.

The PCC mailbox controller now validates the signature when the channel
is requested. Stop rewriting the signature before each command and
leave the platform-populated value intact.

Cc: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/hwmon/xgene-hwmon.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/hwmon/xgene-hwmon.c b/drivers/hwmon/xgene-hwmon.c
index 11c5d80428cd..38b140c23c88 100644
--- a/drivers/hwmon/xgene-hwmon.c
+++ b/drivers/hwmon/xgene-hwmon.c
@@ -133,10 +133,6 @@ static int xgene_hwmon_pcc_rd(struct xgene_hwmon_dev *ctx, u32 *msg)
 	init_completion(&ctx->rd_complete);
 	ctx->resp_pending = true;
 
-	/* Write signature for subspace */
-	WRITE_ONCE(generic_comm_base->signature,
-		   cpu_to_le32(PCC_SIGNATURE | ctx->mbox_idx));
-
 	/* Write to the shared command region */
 	WRITE_ONCE(generic_comm_base->command,
 		   cpu_to_le16(MSG_TYPE(msg[0]) | PCC_CMD_GENERATE_DB_INTR));

-- 
2.43.0

