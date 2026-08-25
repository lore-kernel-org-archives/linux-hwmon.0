Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32DC361668;
	Tue, 25 Aug 2026 06:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787641171; cv=none; b=JmRqm0jjbw6h1Qt26tdwgBTmkYjVj2PHzAd0Xf6BI3S777zMG2f/dwjlp3GDATB69egC68HAeELnQdlxriLfe1E1dJYi5irkfmziV5rxtmVXWcwR0kiSgFTvoaiFnl01WVi5tF1hE5yRW443ToyMFeu71BtNPRs8FNwot0gBxxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787641171; c=relaxed/simple;
	bh=3ZtKsvpFpMjEBY1cdQ5MfxJbDeLeB/F57OvvN2ix3lI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lHPZWazsZwzzAPIao020fViCUD0j3ZT+UAsmSeH++qKCd8Huhw+4qWSWqBsw5O9q1BY33F0pUUL1dz/LMUDkoykUfXNshMV9GInw/xe73VUiaXxScIYKcY/YYH9StucHruok+t862xy8lczEPAWut74ACfsgckgdkv1A8SkIqs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V9s46O8R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V9s46O8R"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7BB6AC2BCF4;
	Tue, 25 Aug 2026 06:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787641170;
	bh=3ZtKsvpFpMjEBY1cdQ5MfxJbDeLeB/F57OvvN2ix3lI=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=V9s46O8RDoTgMrDBZzgn6hXUPxQed6pn7/+NMYwFYzFdE2+vny17Z4sxOFKyFZFpk
	 5MlVctYUxVFi3s83BDg6P2ykYX0tXTIWRqu/J8eC/qX6NHxCTU5Hc2JSTlhTRXLRFI
	 3rGwuRp5h0R+mFgwB1J7YQAH1qkXrjNBJMdHIHRXHuTsYRc8Ns320TpeitDIT/dGdd
	 ghysdaQY/8RcQ6+I3AZmPXezF6VJyu2imfI61E2yLuNrnOj7QXBmC/23BP4FAjIQHH
	 zpQ//cPZgGpP9tKT8756tL+NaM7aO6IQHEGd9OsS7uCKgie3w7IAosavJmLrpoizFF
	 bRBwtng3Q+PsA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57599C61DB6;
	Tue, 25 Aug 2026 06:59:30 +0000 (UTC)
From: Vishnu Razdan via B4 Relay <devnull+vrazdan.openai.com@kernel.org>
Date: Mon, 24 Aug 2026 23:58:00 -0700
Subject: [PATCH] hwmon: (pmbus) Clear generic status alarms with
 CLEAR_FAULTS
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260824-vrazdan-pmbus-status-word-b4-v1-1-2606ecd0c029@openai.com>
X-B4-Tracking: v=1; b=H4sIAPc8jWoC/yWMwQ6CMBBEf4Xs2U2AVCH+ivGwpavUhEJ2WzQS/
 t1WTpM3M3kbKItnhWu1gfDq1c8hQ3OqYBgpPBm9ywxt3V7qvjW4Cn0dBVwmmxQ1UszxnsWhNWh
 r15i+P3edaSArFuGH//z1t/vBmuyLh1ic5WFJGa1QGMZSHda0aBSmCcsK+/4DMTocPaYAAAA=
X-Change-ID: 20260824-vrazdan-pmbus-status-word-b4-b0d148857741
To: linux@roeck-us.net
Cc: vrazdan@openai.com, linux-hwmon@vger.kernel.org, 
 linux-kernel@vger.kernel.org, vikash.chandola@linux.intel.com
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787641169; l=2169;
 i=vrazdan@openai.com; s=io-wq-kernel-20260811; h=from:subject:message-id;
 bh=alnznPhZtLYc/QrJKqWIsTFzP2+B2p3+SqAtTUiocw4=;
 b=XEA92ojJF0fXsiH2Wt20uaU8sx2/6fgUSc2w/Wq51aeTRqP9rLmhIYYAHMym5/972zJOcY/kH
 +m66muWcXo6AQHtut8QLBgh3YPqCcu+znuS7YQ81eLcCFYc6h9jk0XE
X-Developer-Key: i=vrazdan@openai.com; a=ed25519;
 pk=45vHW8D/KId5RtsP3Qx7zMcNpgDwEvCnL5uAw0KzuS0=
X-Endpoint-Received: by B4 Relay for
 vrazdan@openai.com/io-wq-kernel-20260811 with auth_id=937
X-Original-From: Vishnu Razdan <vrazdan@openai.com>
Reply-To: vrazdan@openai.com

From: Vishnu Razdan <vrazdan@openai.com>

Some hwmon alarms fall back to STATUS_WORD summary bits when no
individual limit alarm is available. On PMBus 1.2 and newer devices,
pmbus_get_boolean() acknowledges these alarms with the same byte-data
write used for detailed status registers. For example, PB_STATUS_INPUT
is 0x2000, so it is truncated to zero when passed to
_pmbus_write_byte_data(). The resulting write cannot acknowledge the
input alarm.

PMBus 1.3 Part II, sections 10.2.4 and 10.2.5, excludes ordinary
STATUS_BYTE and STATUS_WORD summary bits from individual clearing.
Their summary bits clear when the underlying status bits clear, so
changing this to a word-data write would not fix the generic input
alarm either.

Use the existing page CLEAR_FAULTS path for generic STATUS_WORD
alarms, including devices whose status accessor uses STATUS_BYTE.
Keep individual byte writes for detailed status registers on PMBus
1.2 and newer devices. As with the existing older-device fallback,
CLEAR_FAULTS can clear other latched status; an active condition can
reassert its status.

Fixes: 35f165f08950 ("hwmon: (pmbus) Clear pmbus fault/warning bits after read")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Vishnu Razdan <vrazdan@openai.com>
---
 drivers/hwmon/pmbus/pmbus_core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 806c9a4913bb0..5f69c1420b4e1 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -1275,7 +1275,9 @@ static int pmbus_get_boolean(struct i2c_client *client, struct pmbus_boolean *b,
 
 	regval = status & mask;
 	if (regval) {
-		if (data->revision >= PMBUS_REV_12) {
+		/* Generic STATUS_WORD alarms are not individually clearable. */
+		if (data->revision >= PMBUS_REV_12 &&
+		    reg != PMBUS_STATUS_WORD) {
 			ret = _pmbus_write_byte_data(client, page, reg, regval);
 			if (ret)
 				return ret;

---
base-commit: 83a16909eb64360fd0659f7970665272cdbe65a1
change-id: 20260824-vrazdan-pmbus-status-word-b4-b0d148857741

Best regards,
--  
Vishnu Razdan <vrazdan@openai.com>


