Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8486334C14;
	Thu, 15 Jan 2026 13:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768484596; cv=none; b=D8WgoOsH0VlmfwstIKwirAcyDX38CvMCoMri6fkF7NJaorMuulY11KO9MM5VOt5DG+JyxFtvkbxWUJkWVDyjtRbmt76dsrM0obfdRoF2UOr3uJEyBTa4+NE/QpjzmriUNgd1YHD9c8rNJIggDvKt1AohITm3uDgTTELxUlrAWk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768484596; c=relaxed/simple;
	bh=jyYsGC1xmoAXqcJ9uNXGGl1XvFgWlQv04RWaWBLLHUU=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DTWlJcTEtmW79rGsDe3cVwc5umNq/MCIrvtj1vBrF6WfrQBsybkFkxochjKeTNDwZYwLdE/Aq+VWx8PuG565xs68PXUmw6KtQn6sLMknungKIZqrLOwq9uAS3DDbSvzvWGLIgYKNWRmaQlzAA2zItxCKXeKcTYAKR3afBIQTNIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=E6LNL2VL; arc=none smtp.client-ip=43.163.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="E6LNL2VL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1768484585; bh=VlEFbkT2YvcMONEFzm6fTlniXS7/QdNSEpoPQdxCcoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=E6LNL2VLpq40CkGo5m/xvJ/oxyziTK4eQlDGG24prjHlEbifdnzZcrTVPx/CG4AMv
	 qpnn4iAyZP84B0kfGiVXvDKM/mj3lzMykenYzWk8w4kNPc7DPgOvZR0epkzcMOHxNx
	 qC/d9lzdxhBsKwWgzPYhQokwBBQY4OOlfPg/6bi8=
Received: from localhost.localdomain ([223.166.246.160])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id AC338C6F; Thu, 15 Jan 2026 21:43:03 +0800
X-QQ-mid: xmsmtpt1768484583tmu3mzjvj
Message-ID: <tencent_E871320535E4E0B29E3D0E43102B899CF009@qq.com>
X-QQ-XMAILINFO: OVgMLYsdica2hZfbW+B3n8nFRBU1X7EykDnsn6QMQI80ptPseRsi2/m9EQ1zL3
	 iIAtZ1blIk4oHl5NX8HD+8eFXMg90PHgg7b4vEC5LkyCW4LajsLD/cXMLPe1AB0Rq100MGRCbk0R
	 gwboET2Hq1XtlIX0DYpksXDwjuXB5A6P4cnzX/ppnOrUaAa/KOYLoV2UVUTOq5Q5kDg1T+YiTQds
	 9c5m4vNOpYrOIMoKdPXt7YjdXbqrMwmuo1vsOTSo1O0WNzI1zIqUeqtZ2t9f807c9uYwo6LGBxca
	 CzhH9AQETe8Uu6ylJG8CZzwXZ6zAPa937WOfRFQCtRa/ODcoQrWxk2/k/iSDhOMpFGsecKI417oN
	 MQdxpvlfcpr0FkVTLK4q8FQQRbnhP+Kz0O5zjqYpxGSrSG0/QdwQj0w8Ia2Yu8yomS+dmHSHOUyp
	 U64U2iylRVTtkb4nnpQvGmhoHfAxp77kbp9o9xD5uxHfljVoYHpH5qv2acaozWkVJKDuSrRq0Mkc
	 dFZNfzr6e2qXHpIDGlWIWuZ1WmBKkmeDSg4jKX0jrMtrMLemR+4W2KrCPuIasI1U2GknhrJCNblI
	 I1MHl/lq6PN94fFOQo5F1N1oRpSJgeptq8V8v2QaP+DW/5LRaNjwOJo538FKaBj1/yjWQ3mBE/mQ
	 4ZHpQMDTYfM8lBCI5oTxyEY7TXZo0AslkmYs7hG2spea+W6i2aNCvN35WXJkEFbAPNmBfCPW9fz/
	 pGUNfCXnDkolIqsRA2dJ/a3CR6VuIyvWsBx6gyJQtlmc22jZ1d39ZYW4v3fu/p60NjUcaMEqT/7p
	 UKrdcqFbpEyvYmM6124iK7QMX4ZGFy9OTX/ae/bl3XPDPDto7uZDqSDWc2QLVqeLlhebB6p4Bkx4
	 E0/D/iyTIBSrXHllLy0wMzLS/xTq/SIEinn7UiH4xvNGF53ZbV12UaiG6UWUM0y1ggg0xTegJL9Y
	 l2xGATD0tk8dgGvsC9ZyUL9rk/WZP1eQindhKRcn61gscfK5dZUP3pr287F7wKPvbqAEre3gKUme
	 4OgVVJQ8+vdx0B4KuXRBx/kTskv1n75yg1bHqa8r4dGH+rq10+us1uOaN9jud0F1gRyAc2SjrvTD
	 rkYSVPKbUIrbrhr2iUQm2woW7TYCbATgGF3TOGA9RO4NoH/wtOR3jeIP22KGKgLam5Qgki
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
From: Felix Gu <gu_0233@qq.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Ban Feng <kcfeng0@nuvoton.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Felix Gu <gu_0233@qq.com>
Subject: [PATCH 1/2] hwmon: emc2305: Fix a resource leak in emc2305_of_parse_pwm_child
Date: Thu, 15 Jan 2026 21:42:37 +0800
X-OQ-MSGID: <20260115-hwmon-fixes-v1-1-305e15192884@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260115-hwmon-fixes-v1-0-305e15192884@qq.com>
References: <20260115-hwmon-fixes-v1-0-305e15192884@qq.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768483959; l=712; i=gu_0233@qq.com; h=from:subject:message-id; bh=jyYsGC1xmoAXqcJ9uNXGGl1XvFgWlQv04RWaWBLLHUU=; b=PMExQWnaD1gtjZvOcEo5TYexuiHS5dRrsLgoTt7caUVJDzr84+t32CQD+PSjpz6C8F59cI9Od 0o0W3CyWy/JDgZ7WJ2H0wdawaBgPO3eApUEYIQKVyAD6ihaoOcnpjve
X-Developer-Key: i=gu_0233@qq.com; a=ed25519; pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
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

