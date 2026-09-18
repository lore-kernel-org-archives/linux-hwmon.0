Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8A139B4B9
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 03:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.230.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789701536; cv=none; b=KgQNczxbf8R3O/PHEigG+U5wBRw18o29CwIad53zlMq1E82ohW5LpyNorM+/01dCaqk5TTp+YLgVfnUuHWHXJd6Dw/Rm4J6qyOlrc27+8zRLQDh4lQhQ1Xi8PpWDC3Nt4csXMaJOW/3abnQe50+pjPdQ6rHqOhCaENARVjqZZMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789701536; c=relaxed/simple;
	bh=84MoI5fTPnMKKKPyQo5MJL9I5BNaj1WjSqtusDqTaQk=;
	h=To:Message-Id:Date:Mime-Version:From:Subject:Content-Type; b=cUFNVkCeS2WqvHQUs1N8AfdRL8EmTg59B/6Ognn3b7Tr7UIc1UWN8Pn0kdDQEEU3uwRMG487K9qihG+EiXPLHAPg5A0ft3UlCs5oQLl4DxO50Jx5erVZdg/m+XgX+yIGv+b6Sh5+Vp1DPmGRv0zn6JU4b0ICv36ZKBaWVUYceLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Oz9cR8ja; arc=none smtp.client-ip=209.127.230.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Oz9cR8ja"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1789701523; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=9yhd9Wq0XEjLD2HlN/TsBBsyUkfaRFgQFdlNkLZlpTM=;
 b=Oz9cR8jaim1oftvHTfBOrgOZ+xzOnsy+cvWwp3rGGrmXd+hi3R0rxeo0df8h1zFU1LxX7p
 XxEifvFB+3vR7kPARsJVS/AK+TkwIJZjgquS6eO46Sg9OA/X/KUiC37rT2T3K++Bom+65i
 7w4Y4b7zUuz+W06QeLw3QdStdDZPmS4FIIkybl1Zy1UIXdKFzwnOYBGznbAptKXSeUYQ/F
 RyUARD45r+7Xmq9/OP+KzumZNQ1jPB3JAI91RQ9yZr+WcHg4Z3pogN57mB58Hafrd5P2Rp
 tRo/3d4FDgjNBylUGbQid4CoicL3tbMOZ1p0aERxoo2qKfnvfRBMqRibtRvDtw==
To: "Iwona Winiarska" <iwona.winiarska@intel.com>, 
	"Guenter Roeck" <linux@roeck-us.net>, <linux-hwmon@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
X-Mailer: git-send-email 2.30.2
X-Lms-Return-Path: <lba+26aacad91+f9745f+vger.kernel.org+zhangjian.3032@bytedance.com>
Message-Id: <20260918031831.1937973-1-zhangjian.3032@bytedance.com>
Date: Fri, 18 Sep 2026 11:18:31 +0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Original-From: Jian Zhang <zhangjian.3032@bytedance.com>
From: "Jian Zhang" <zhangjian.3032@bytedance.com>
Subject: [PATCH] hwmon: peci: dimmtemp: Retry unstable DIMM mask detection
Content-Type: text/plain; charset=UTF-8

Add a stable DIMM mask check around PECI DIMM discovery.

During host DIMM initialization, PECI can answer the DIMM temperature
configuration reads before every DIMM has reached a stable ready state.
There is no separate all-DIMM-ready signal for this driver to wait on,
so a single early read can capture only part of the populated DIMM mask.
Retrying the mask check avoids locking that transient state into the
hwmon device layout.

The first successful scan is saved, and the driver immediately scans
again before registering hwmon channels. If the two masks differ, the
driver returns -EAGAIN so the existing delayed detection work can retry
instead of exposing a partial channel set.

Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
---

This was tested on an affected platform where probing during
host DIMM initialization could expose an incomplete DIMM mask. With the
extra read, the driver observed the completed DIMM mask and exported the
expected hwmon channels.

This is intentionally a conservative retry of the existing detection
path. It does not add a sleep or force another delayed-work interval
between the two reads, so it avoids adding an unconditional probe delay.
However, this also means it is not a full proof that the host DIMM
initialization has completed.

I am not aware of an Intel-provided all-DIMM-ready indication for this
path. Feedback would be appreciated if there is a better way to decide
that the PECI DIMM mask is stable before registering the hwmon device.

 drivers/hwmon/peci/dimmtemp.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/peci/dimmtemp.c b/drivers/hwmon/peci/dimmtemp.c
index bd3e8715dfec..983e1e415ec2 100644
--- a/drivers/hwmon/peci/dimmtemp.c
+++ b/drivers/hwmon/peci/dimmtemp.c
@@ -285,6 +285,32 @@ static int check_populated_dimms(struct peci_dimmtemp *priv)
 	return 0;
 }
 
+static int check_populated_dimms_stable(struct peci_dimmtemp *priv)
+{
+	DECLARE_BITMAP(dimm_mask, DIMM_NUMS_MAX);
+	int ret;
+
+	ret = check_populated_dimms(priv);
+	if (ret)
+		return ret;
+
+	bitmap_copy(dimm_mask, priv->dimm_mask, DIMM_NUMS_MAX);
+
+	ret = check_populated_dimms(priv);
+	if (ret)
+		return ret;
+
+	if (!bitmap_equal(dimm_mask, priv->dimm_mask, DIMM_NUMS_MAX)) {
+		dev_dbg(priv->dev,
+			"Deferred unstable DIMM mask: %*pbl -> %*pbl\n",
+			DIMM_NUMS_MAX, dimm_mask, DIMM_NUMS_MAX,
+			priv->dimm_mask);
+		return -EAGAIN;
+	}
+
+	return 0;
+}
+
 static int create_dimm_temp_label(struct peci_dimmtemp *priv, int chan)
 {
 	int rank = chan / priv->gen_info->dimm_idx_max;
@@ -322,7 +348,7 @@ static int create_dimm_temp_info(struct peci_dimmtemp *priv)
 	 * All other states mean that the platform never reached the state that
 	 * allows to check DIMM state - causing us to retry later on.
 	 */
-	ret = check_populated_dimms(priv);
+	ret = check_populated_dimms_stable(priv);
 	if (ret == -ENODEV) {
 		dev_dbg(priv->dev, "No DIMMs found\n");
 		return 0;
-- 
2.30.2
