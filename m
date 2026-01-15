Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323EF32B9B4;
	Thu, 15 Jan 2026 13:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768485158; cv=none; b=hPQhXtW1Ej+YCa6yqK/j3XxMLvFTNnYQNFxQdZ17tOe5RVvyU1G4xIEl+7bo754DNr/sQkIIOEyd46LaEP6lmh6eq9A1hzg88K3Nx+5OZ3EQRQV9aacnqEKcl/C6ca1rgr9BUBRmv4lIQ5WZZL6AEtkiYPDDZOhor84UlDJDhfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768485158; c=relaxed/simple;
	bh=qHVmNATUiiMGTcirEvfHaCd1CLlU08CBklegvdvIPHc=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version; b=VfAYps4zjdmvo9M80DhJBndYRJP/BBKEyWArfxJe30BnQH1XwzcCmBSDjpPjVSage96hw1aWIDoebsx9b352R1dvqdzniYId3fr0sKsw+dNjzsk3QyOnr0sIvoohRau28phUSrJn4viL9FfubRNvULv8yLBQ6KVtn2RFDHCNuqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=Tp5lkLkC; arc=none smtp.client-ip=43.163.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="Tp5lkLkC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1768485147; bh=fqq5wPPG1waazmSiv0h7AJkEx+/htctoyL7wW7kkdBI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Tp5lkLkCtlxBN5ILCEx18NaSwehOiua6AF6jLA+mmB8IvRfGjqC6CKVM9OMgpAKjg
	 K5lD5664utDZiftn33o+czNgG8qJvuXkxpH+RphRjia7G0zPvH4bM9S15whAhdsVw+
	 bcNMhEwaYwvoXDTJ59MblXi/7vvxV++vhgYsjuCE=
Received: from localhost.localdomain ([223.166.246.160])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id D1904429; Thu, 15 Jan 2026 21:52:25 +0800
X-QQ-mid: xmsmtpt1768485145tknoyrs8d
Message-ID: <tencent_738BA80BBF28F3440301EEE6F9E470165105@qq.com>
X-QQ-XMAILINFO: MVzyZ2KMQtlaE5UoIVk+YDAnCqTgVXJDgYfrPdt0Dzh40w/jKJMLWDnSfuRt7L
	 r77SWllSKGBkio5y0haXapOQcoIO4/6f1bfS7fBNE7S9Z1SL6S30pZUFCUJOLt7PhjKVtw4pUa9Q
	 4I2zmMBowzcnsTCoZzkPkO/XbPMiJa0isgY3OSvyBDh0Efd4wafcsCsSHlzPYPmuVXNKNe6PSq/i
	 Hz4UFq3iDtjAU6jc5t55LYcRjUDf58hl7SOwxLBrjCskwWad+UjmjS2OIz6ukvJWgTqTkozqBea+
	 VzDSbrPBrXXnlUA+4mTdVizt1sqISQtHd0XKwLr5FWIGseSvsKqC8qAVWoTYrd/Xlo6guZHDBHHX
	 B2lZRSQNZK/yXB8L3jhX0p+GPfg6zDuMMszYk8dovsId2ce1Kv0i/27zRMVK+v16GBeEg3WMXj+H
	 MIkA15jX079ZtX6yStFJHIUx/EfWBpudI+jh7sqFntqIjEyBEZqRpcbCHsxFkPCYcLgNv+sF4F4K
	 DqRrkyl4nqIlFM7RIYUumPMcpAi6vElj0qU27e1psWKCfc8HhWk7HwT6qIzyu9nlkEydU+dYoKpI
	 GDnLfRAAEXzuOEhWF4GnUHtddpYjct82jmRyUO3NAM117DPs5Co6w+B1FJmm9D3Qs6/jMoe1Xhn/
	 iW9Nmg2ylOE1GVU+9Cd/ypQBlQu7E/5LC3tk8eQQZphIHHqSuX90DUSwhjC+od3wtk4bMZ49Lv/s
	 ZMLLrADiTkvcdXM74AOjG2yuqGvHEd0tEDD3SnP2LdFaUYXNhaOuMbtzDrUXDRNRcy9IEeMGqGGw
	 HhXU6yhUWzJ+nrBXP+MjgI8UQdcmnDrrS3XMxYWHvMrZUcviQTbOwDUQtjQIQ1lj7KFwVornBGRO
	 33VhSMq14oN186dXIvO2UgmzQoi1D8skGQk+jkHl9O+/aqsOnFPCHOUDHYNeYf1tMD8+whIZ7SNT
	 UOI4DddOlY8W90RtfZ5g7wMnLS+kwSI3IGQeoggXj6WYNt/ysP8VwE5oq5GFuAoH/P9tVscW7A7l
	 4Kl/E/LOAGHAcF0KRdRiEC2oKI3yF2pkLDCQkxvqw0FHlsZ0aIN57KWg1xhA5Y3DCRCPvg58k9ZT
	 FBm6TNjH3TLKtyfoempU3AJOcfRBKhven26UTkfZTVIMLt1BxQJcrMTRb+02X7f1oFG7SPhVVk/h
	 Z94f03VZClu7Piey87tP11NUZ7
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: Felix Gu <gu_0233@qq.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Ban Feng <kcfeng0@nuvoton.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Felix Gu <gu_0233@qq.com>
Subject: [PATCH 1/2] hwmon: emc2305: Fix a resource leak in emc2305_of_parse_pwm_child
Date: Thu, 15 Jan 2026 21:51:48 +0800
X-OQ-MSGID: <20260115135149.3886008-1-gu_0233@qq.com>
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
In emc2305_of_parse_pwm_child, it does not release the reference,
causing a resource leak.

Signed-off-by: Felix Gu <gu_0233@qq.com>
---
 drivers/hwmon/emc2305.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/emc2305.c b/drivers/hwmon/emc2305.c
index 8f80a39574f3..64b213e1451e 100644
--- a/drivers/hwmon/emc2305.c
+++ b/drivers/hwmon/emc2305.c
@@ -578,6 +578,7 @@ static int emc2305_of_parse_pwm_child(struct device *dev,
 		data->pwm_output_mask |= EMC2305_OPEN_DRAIN << ch;
 	}
 
+	of_node_put(args.np);
 	return 0;
 }
 
-- 
2.43.0

