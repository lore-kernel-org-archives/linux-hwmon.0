Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD1427A916
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Feb 2026 21:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770239755; cv=none; b=JaoHIYZQFAJXa0DLwEn76QhTqyBGjjp6LwF7mX5KbKwhMtESMqzwbdp0sIK/XYDClr93UZvCbnpu3JE7ciIUo8eSGTNS/uIjM2gjbXVE7469ZI56YpljMZitpsst/PhxGKwvfvhayLaXIslQxo7zQ41lcNl0NjUH+wYrrx3XW/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770239755; c=relaxed/simple;
	bh=qhyjugf2sguI/Woc6yqFYRiijmuq4WokLJlWoDaF3k8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e/ij7ff40DxrkDl5ecJYHCMBWa89377J/OZyqV37WLnxmm3JCL0qwhLUP0g/+YFhrOo7NGCpgDp5GN699oJsA0ALb269MVTaBqlV+ZZF0AtEm8BKBTuHpq+Gp++ron+pEDD50LTArlJaemomr23wDECrfbyJp37SQoKW85tJ6/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=DwhpThyW; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b="DwhpThyW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=fe-953a8a3ca9; t=1770239748;
 bh=OECWjixFUVLtzAZrfShCaZzClr8CRBZgg/7Z82pRR+c=;
 b=DwhpThyW3BZt++ZdOiDIKzOXLvLqlGRwbMXKcKtrkNwbGhKi4CdC/9W8//0j96C7Ur1MD6jfX
 OK89Qmb2i1qqGcs4GxOnMZaC5XeX6I67PtXHVt7P13KKgzaYg46y5amy4V5YIAOU/u7i2N4D2XZ
 MSNrtRQpOg8sIuuVfb0xq7VxMdDcjb6+3TAPDSeSXMKNsl+IKCpttaIYFpnhhEyumsnBBCJFVBJ
 xOv0IO1gAKgK5JK2M6/L4sXeaJMMQTkjddCHdRxPjK+9GCzJb9aRgBZWHfVOEg2eVfWuPqSStAJ
 krTQVYmahJYZ9lhKrQsPX6UG6JQhLjl8XHKTSC1PZFRQ==
X-Forward-Email-ID: 6983b7000a28e3ce3aee4458
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.6.0
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Joshua Peisach <jpeisach@ubuntu.com>
To: linux-hwmon@vger.kernel.org
Cc: Joshua Peisach <jpeisach@ubuntu.com>
Subject: [PATCH] hwmon: nct6683: fix memory leak in nct6683_create_attr_group
Date: Wed,  4 Feb 2026 16:15:36 -0500
Message-ID: <20260204211543.70029-1-jpeisach@ubuntu.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If allocation fails, free prior allocations before returning.

Not tested on real hardware. Did not update rest of file for style
changes, only updated the NULL conditional checks.

Signed-off-by: Joshua Peisach <jpeisach@ubuntu.com>
---
 drivers/hwmon/nct6683.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index 6cda35388..365f6b99d 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -431,18 +431,18 @@ nct6683_create_attr_group(struct device *dev,
 		return ERR_PTR(-EINVAL);
 
 	group = devm_kzalloc(dev, sizeof(*group), GFP_KERNEL);
-	if (group == NULL)
+	if (!group)
 		return ERR_PTR(-ENOMEM);
 
 	attrs = devm_kcalloc(dev, repeat * count + 1, sizeof(*attrs),
 			     GFP_KERNEL);
-	if (attrs == NULL)
-		return ERR_PTR(-ENOMEM);
+	if (!attrs)
+		goto out_free_group;
 
 	su = devm_kzalloc(dev, array3_size(repeat, count, sizeof(*su)),
 			  GFP_KERNEL);
-	if (su == NULL)
-		return ERR_PTR(-ENOMEM);
+	if (!su)
+		goto out_free_attrs;
 
 	group->attrs = attrs;
 	group->is_visible = tg->is_visible;
@@ -481,6 +481,12 @@ nct6683_create_attr_group(struct device *dev,
 	}
 
 	return group;
+
+out_free_attrs:
+	devm_kfree(dev, attrs);
+out_free_group:
+	devm_kfree(dev, group);
+	return ERR_PTR(-ENOMEM);
 }
 
 /* LSB is 16 mV, except for the following sources, where it is 32 mV */
-- 
2.51.0

