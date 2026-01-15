Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2265038A715;
	Thu, 15 Jan 2026 13:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768485368; cv=none; b=gugn42Xhki/2ZriP9a67MfYCKakWobMgC/kqKJ2YEdL/CfDoEIRN2YGblHur0g10htf7lh/AU9eXvcoU4S4Vk2UR8wdfHKSi4AlUlxlWtUqbCP+Um2sBG6G6bnFhPZ8aoQsAqrApvb69ZOWhgGPkG+MksQibyl8OFYTuYpY4YCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768485368; c=relaxed/simple;
	bh=DgSnpbL+6k8y6SlwQtDCX2THryqyuJ3pTecyzhO6Dwg=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=KLu4wrRZyKIJ4XxwRLj+ZCqeHbNDysdJX0T2Wo26T6CMalSmgFLbVOlzXISe/udrPL3rncDCdgJNr65QTrY382eB38rSeulHpnIQv49nOpVDyt/fm55HmszfUZM+xix8gz/PYc+/8ZLIt1D1bK7n2YyTDildwGdw6FZQnzmanlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=KZXozkyh; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="KZXozkyh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1768485355; bh=cgY5YtuqQ8xp3W9TeLS95JF+3us3Q/spTAhDFtiov0w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KZXozkyhjEDXJHwhmZomFTVJxXoGpi98g3b7Frdf1xg19Ya2KK/jn4vyMI9UEdPQQ
	 O3S/PDl2ydJgRjB4dMXw74PxHNbCJXdEwE7Gdmi/YK+ULTdQ400LQGHD+EXWiVQ80y
	 +kwRoFyHDi9KvfOCv6WkzaSgn05JlFMwrGnD65ug=
Received: from localhost.localdomain ([223.166.246.160])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id DA639A30; Thu, 15 Jan 2026 21:54:38 +0800
X-QQ-mid: xmsmtpt1768485278tnzm2qwbx
Message-ID: <tencent_9717645269E4C07D3D131F52201E12E5E10A@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9XxW1nfEu+kv+qIo8xC+rCyknEa1YyJ1DAcLF5GfcmZE92Aj10zh
	 5basEksVrUluIPs7T0+jt/gaTwXlolDnGE+iLRhLWTYAbYZi+RbRD9x31qRK+bFgzX86ALL8jBUC
	 vzU+GL8FHVQaN0OjxZ4BSLG3t9+KPDXOJy3vBWvpDDk8+v41TFxlAGiuwW/Y92boQ5YUnmk9s6sl
	 s/j1DwnNNUgbgwCpU2VdfEuH395csBYpSAPaLEEM0eWWLUQwm6jQ7kEcxiU/NW3quQ1Dn5a8xdbu
	 2vrXkgghqGLcqT0Xyu+lQqG93BNXpAzwQgqqYZpA47F9Gk5ACTeBymUicbbvDdZFitZRkoRkxj30
	 dMErrLZ+ZXeZV4rE8+Uz5tfm8/rNigm7Go6n16VbsxWVL/MPzwEnXTYNzrjInPeKzmbRRatoMNiW
	 35/qp+I/0zRF1g4S89QQTSjLIZOwwAzndo5148CG2zGIRrCc77CCwvrDIHKEPRUgc21U/lNsYPqr
	 4GWprtHNgqaqJgxQ5FH7Yuhr38VonO2X0CyAnFNyAdWiS0sBv3V4alI6bxUmo4C2Rhg5vCpNC6Ul
	 UothM0lwZFYTZiKPHGd91UD7UdAwrjVeUbCeXkC8hBYyI5EJFGG0yksItIp0ROTQn7FqROjCXD8w
	 m58pdLiESvQrTKsz580n9MJ2W+en4p19LZb3nVelQCJossIAZboG2ZvrhfwX0+LymnWAq1eIeq7E
	 k6WjX6UnV8AhlUMmXhdcyS8Es+HCsQtnMORoTYV2Ff1NZgnHaEyaQgtlwWg1odvpSwPrK1nCrIqF
	 qht5y3ZKyGmQeh1yq8Lb1wGi9nRzY0Bkr5XtYz7ScEo6ztcdXu1zc9b9LKv1qbEy5eUUG6swB+9J
	 5J+0kpCCB1PNXx0aZ91kLs9GiIXRu3FbVsrl8SjT0Wqkja/hIdDCNAMKmieVzkDlETH8uNOJ9Gp2
	 KjvGvNmBAj0jimylfYDK4seVQHdYCfRfulEJ7VdH6MYAhCAHi4rMzuxq0uwWoNJax7vKIFpy2Kpr
	 KSLW36LzQVScf++MeuQRdaQFXlVZqxBQnRGILKSgjcykR8UIcu4+kENTRp3k3SrrdLkJomqEfyg+
	 5KzmoZz/GpLgiI5BS4pQwuHcHs6zm9acSyJFLmdSKu2uBpF9U=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Felix Gu <gu_0233@qq.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Ban Feng <kcfeng0@nuvoton.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Felix Gu <gu_0233@qq.com>
Subject: [PATCH 2/2] hwmon: nct7363: Fix a resource leak in nct7363_present_pwm_fanin
Date: Thu, 15 Jan 2026 21:54:15 +0800
X-OQ-MSGID: <20260115135415.3886417-1-gu_0233@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_98E69D461A9CE773D3611822369100FE5A06@qq.com>
References: <tencent_98E69D461A9CE773D3611822369100FE5A06@qq.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When calling of_parse_phandle_with_args(), the caller is responsible
to call of_node_put() to release the reference of device node.
In nct7363_present_pwm_fanin, it does not release the reference,
causing a resource leak.

Signed-off-by: Felix Gu <gu_0233@qq.com>
---
 drivers/hwmon/nct7363.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/nct7363.c b/drivers/hwmon/nct7363.c
index 4946d59ff807..20f14d5e0c94 100644
--- a/drivers/hwmon/nct7363.c
+++ b/drivers/hwmon/nct7363.c
@@ -349,6 +349,7 @@ static int nct7363_present_pwm_fanin(struct device *dev,
 	if (ret)
 		return ret;
 
+	of_node_put(args.np);
 	if (args.args[0] >= NCT7363_PWM_COUNT)
 		return -EINVAL;
 	data->pwm_mask |= BIT(args.args[0]);
-- 
2.43.0

