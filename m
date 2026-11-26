Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795712735;
	b=sU4XaK8lRE7gXg/sfwRMoUbqOwZWETV4IaQHwLAwzWvR0Ux6WpxC1NPZxXanLUDd+LwK
	 smVNV88yz7cKyplHxitcp1p2KQUK9E9CTlJx9hB+9WWHPpLxBVEc0fYt95in5BEp27+An
	 uGmZ25wiRznwRVPn4X+DQ4OEIwOwtwrEnnfJhaQrEsXmKLXlBE29K5stROOkWsC7Mc46N
	 JSXWaamqeaJ0U3b8mpCsCYQP93l/4TtTODMgxfFeX5u+i7D+e2DqavTH8jYIcMfY16NRl
	 M/o8bgcN0RGsIyqmyv3Cd1xmI0+J4DGQI4w90TtP612MeCwdVtv46d43qS1Qv6n+s2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795712735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=XcjJIrD5thD100zFeEcJgE7D0fGNyC94jOzAKJ+Xh0k=;
	b=ufJ9NoOhJ8umfga8T41CxEWK+TNA4cu4OFHL8xQjCnTq+UKxvL3kBICaGl80dZKoxTDI
	 NctScIazGNTm3dECbOM7OxykCR+IukNMvQLpAIjICNEFYfcoiiLH3Fm/PHIsg3SUEuOqq
	 8FkWZCa8MFRjY2gYcXhIE9iGGKCG9CifIqXmTfCr5wz9HBVIpnhFC9RORZeh6GhdnEbNV
	 wuc0TbtyAb2tdrDwlAe+RV3uJJnrbAaJkar6WD44eGZ9m/F9Omkr38mkZwMrWhck70gCr
	 /edqDDMd7WhRI0MzVJ4wtBSJ0YfJtfVymY16WsCJpHcRxbt7XjvKAjL60jsW5nll1HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U4sVDaB8;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1EE606A31E
	for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2026 17:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A1EE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U4sVDaB8
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so1312286766b.2
        for <linux-hwmon@vger.kernel.org>; Thu, 26 Nov 2026 09:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795712733; x=1796317533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XcjJIrD5thD100zFeEcJgE7D0fGNyC94jOzAKJ+Xh0k=;
        b=U4sVDaB8DakJLcp7jU3R1vtaVTH6DB2Tlx8iEyxyhKHHzhYywzBqvFrNKxrqgGpu7Z
         b2qBNieX6Fme29yzC7OWBujSQJioe5V2FgKrmPeALw0f8y62Q4Gj9ZZpQRjtm104F6PN
         zJd2zm6kS28Qqz0cVSoMs7ftGsYZ+c56d81oLx7rnNMoar6douDJg+b17j/NTi9XWRD8
         CfZo3ngkSL9uNBr044/uHkAlMvD7L+K4QSDiYlnVTyogn9coO6fMJLWelwAJGAS7d1ap
         jFdmVvAM0hruq4QNpPinC0cEylfrcn1iJZvwE306Rhu3U69q+b2AZ1Bp+xyhdGKWyLfl
         B9Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795712733; x=1796317533;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XcjJIrD5thD100zFeEcJgE7D0fGNyC94jOzAKJ+Xh0k=;
        b=YZKWiv3A39iDmmJ/KgwkIbcqFuvrRRw6ivIlTZH9n9CuEzyEBh/xLMXS1uQSyNigIQ
         DkZHYx/wJOyPAQ9HbDu4SHzsCKokxPGueqHHbnmP3bG4jJgaD+e3MTTGgqaso3bHSuur
         ODMSPoIUfkBWPvFW8NG7imXnMeljOabuo6yPBFEwDj1y7goL1SmwSZsOdNCi9FC8Faa1
         aAmdLLiq5mB1TbdX+UW6hCq2LLk36nAzZ5NGNTYzjUELHTSnii8X961v1isPGg0/5cBg
         wQxwmQqsY889RSmtRYidJ+cfHF1M2X6qTwVYovBHPp1rqrhRpZOJjhcoux6TAcmLrhgM
         zIgA==
X-Forwarded-Encrypted: i=1; AL+hErHacBoKso31Wrg05NKrsUfkBwTP2G+nHGX8hrJX5PZjP/8zg2uzsa8+xDjIrxce53ifHNrSoCEg+4WlHA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9oOYrgOkd2lDhochB/hJYT/h9RDna/tIZQQDhxEV3JmCnU+gPf
	fyQZQuB6MKTVPOCO1568UHUONpWWOZeCVg7mqmV6h4lLiRxeHjWk1f8M
X-Gm-Gg: AZFdTZeDK+croExCdQvnp7W7OB4ztTyzxLnNmPNlJ49+C54MfMC7N/oDU1cQXwcESND
	wwFYWvUGjxrUIkw14Eh9GwEXyvx6ldaDms2/T2fRz5YuvFL8wY4D02zEOVWLZ8R0SqyE9bkALsP
	N4fbwbR/89kT+hTq58rei6Ij6jKYQYxK//bV8Kn7yNO28Cx8wiUkznQs+vjPQH3z9VzZ5khs2dS
	xrv3lNyKc6zz0ltw2Ua7xHD3Hh6oayukq5yUY4QMDR08ONNpngrTyVXp3aBE6ykY53D5jOxnAN+
	0i4rW1YmOHZajNz6BnA+7IaWhg4/LLAw+vlJuYlnM1SbkLXcgLM/ldJsL1D8skBBOt29f3XyDfl
	IaqnRHWusqcf7ED+a3dcTIOyZdCCH2fq4wv2OpYoKllJrlMQtQRnnY6NSLTLWTA+NX6NqoSLzPG
	gH6F9OX091ugLNg5eHf5P+cUb+WkeHM2jcsTl7x4MQDpdbr3clfnQrju65PiujKZDznHsusReCP
	vEP4ElAX7KSuiTyI+JmaNjIXYbpY5mshnVHkllKJM2yuCRdSZ2fySU5/YPv4huv9705rjuZCnov
	xrJcrm3YYDd+7D0pmAwS30Pz+rseoBLU
X-Received: by 2002:a17:906:1553:b0:c50:576f:b39e with SMTP id a640c23a62f3a-c513ab0cf13mr1210196166b.26.1795712733274;
        Thu, 26 Nov 2026 09:05:33 -0800 (PST)
Received: from CachyOS ([176.88.122.93])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae9dc7asm781618066b.41.2026.11.26.09.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 09:05:32 -0800 (PST)
From: =?UTF-8?q?Asaf=20Nuri=20Bertizlio=C4=9Flu?= <asafbertizlioglu@gmail.com>
To: akpm@linux-foundation.org
Cc: linux@roeck-us.net,
	linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	ycistak@gmail.com
Subject: [PATCH RESEND] =?UTF-8?q?mailmap:=20Add=20entry=20for=20Asaf=20Nu?= =?UTF-8?q?ri=20Bertizlio=C4=9Flu?=
Date: Thu, 26 Nov 2026 20:05:01 +0300
Message-ID: <20261126170501.49888-1-asafbertizlioglu@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Map my old address to my new one. The old address appears in
existing Tested-by and Signed-off-by tags; I will use the new
address for all future contributions.

Signed-off-by: Asaf Nuri Bertizlioğlu <asafbertizlioglu@gmail.com>
---
Resending with Andrew in To; the first posting did not include him:
https://lore.kernel.org/linux-hwmon/20261120170257.589197-1-asafbertizlioglu@gmail.com/
The old address is in Cc.

 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 7fb33babc931..e1479571ece8 100644
--- a/.mailmap
+++ b/.mailmap
@@ -126,6 +126,7 @@ Ard Biesheuvel <ardb@kernel.org> <ard.biesheuvel@linaro.org>
 Arnaud Patard <arnaud.patard@rtp-net.org>
 Arnd Bergmann <arnd@arndb.de>
 Arun Kumar Neelakantam <quic_aneela@quicinc.com> <aneela@codeaurora.org>
+Asaf Nuri Bertizlioğlu <asafbertizlioglu@gmail.com> <ycistak@gmail.com>
 Asahi Lina <lina+kernel@asahilina.net> <lina@asahilina.net>
 Ashok Raj Nagarajan <quic_arnagara@quicinc.com> <arnagara@codeaurora.org>
 Ashwin Chaugule <quic_ashwinc@quicinc.com> <ashwinc@codeaurora.org>
-- 
2.56.1

