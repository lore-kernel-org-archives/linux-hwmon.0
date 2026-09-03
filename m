Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749E44E8DFC;
	Thu,  3 Sep 2026 16:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788452013; cv=none; b=AXFOHpP/pvPaM05xjJ2rG28iBo5/stScdUZ3Oe2cdIaKFqx2k7Y2LB0MZDr8gO1+O6ChRzQPV5dpryJ0XgIo0595veBJLil32Q5XJAq6HvfcWMBxfuvXSezM0lPTur6qp7QrUVrNpR0JYtvS/xrFa39RF5PzxtXoe4lO4q3x2k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788452013; c=relaxed/simple;
	bh=8UQFqJ7V6Yf48WmBUyVQO7Deayy3QQLo3rzy+U3k5rs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dGDod+lsOW/3e2goDdsAnF0DdU2Efmp3wjpSC/wDB4aHVJkUX1Kg5t0Vwaz3BVVuG9K9q7XOloerpBuHYxXsozSyxl8qeo3PkTQdqEvrP15z4RF83eCEfZfFGgFaL1ngdIk7MxgHJ9C+QzfX4wkluSNKP1NEPOFwbUg8pkApQI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=E6BVpGPR; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=piCB+00f; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="E6BVpGPR";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="piCB+00f"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hbPls4jqrz8tXb;
	Thu, 03 Sep 2026 18:13:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788452009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=h1Co08G9MR44VQZUeFDKkaHm6spgJfjolo1eLwOl0VM=;
	b=E6BVpGPRqHL3YjODWmUCBgg+jl05/gMCPNph4p/hC3AKw39F1G3qnM1nd58voVVFVYqiTL
	p+hM7ugatoJHZ+NHcMyGYUS+4muDExbpAoqTCGwq9xV8IWiSHpFtRnMslCRHB6KfYIm2AJ
	zkMnOGMr/RxUBM4Gma1Og2TlbgQSaxJOJ1qyC07jNVNlAdXWoYctw1M1beda5EMoFUgJXv
	Hc3HuS6D7CleCXHTALOsF4US+8rA5KDjfGYKPAp3BJkYm3quGzIlF+kkFT+v1Lziv4DsVy
	6Ls19aSVtANJIc5QhORY6grR/ztru30GXoe3jQhpssyloXN39I//MjoYYTZ5yQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=piCB+00f;
	spf=pass (outgoing_mbo_mout: domain of manuelebnerli@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=manuelebnerli@mailbox.org
From: Manuel Ebner <manuelebnerli@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788452008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=h1Co08G9MR44VQZUeFDKkaHm6spgJfjolo1eLwOl0VM=;
	b=piCB+00fafEeUtnAoIZW5mS3xaGgulSxoFRDbfwKZM0SIuNVmh9uYpr4a5BOoIgxlB9U7D
	VgRzzF0bCUb2EIfhBh3suPbELunsgh+CRO8qagEpMIpN9Q4Gxi8FVSbdcD9XdD/l/V7Tbm
	KE/tP1VcfuGp75u0coNudEzQeQ1ruXiCZSh7D710SiFR9TwrJMOM8sIjqzCjIlzJJ++GXx
	CAgW7DOyOnptIiVVs+emFTJonNW4rYJngsALfo6jPK8mhUXAA0VouHmeTt1V0r8cUrws6P
	T6kSle37NbsJUsJ0K+rP/bhSm/apT8nRInZMIKHsRnKLe74J8gokwMzTda+7MA==
To: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Manuel Ebner <manuelebnerli@mailbox.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: hwmon: sysfs-interface: Fix bracket
Date: Thu,  3 Sep 2026 18:12:03 +0200
Message-ID: <20260903161204.735276-2-manuelebnerli@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: gj7iasqrxf6h33zqtjt4r1nfi834dgd7
X-MBO-RS-ID: 6dfbf9660062b840132
X-Rspamd-Queue-Id: 4hbPls4jqrz8tXb

Add missing ')'.

Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>
---
 Documentation/hwmon/sysfs-interface.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/sysfs-interface.rst b/Documentation/hwmon/sysfs-interface.rst
index 94e1bbce1..7cf4178c3 100644
--- a/Documentation/hwmon/sysfs-interface.rst
+++ b/Documentation/hwmon/sysfs-interface.rst
@@ -47,7 +47,7 @@ There is only one value per file, unlike the older /proc specification.
 The common scheme for files naming is: <type><number>_<item>. Usual
 types for sensor chips are "in" (voltage), "temp" (temperature) and
 "fan" (fan). Usual items are "input" (measured value), "max" (high
-threshold, "min" (low threshold). Numbering usually starts from 1,
+threshold), "min" (low threshold). Numbering usually starts from 1,
 except for voltages which start from 0 (because most data sheets use
 this). A number is always used for elements that can be present more
 than once, even if there is a single element of the given type on the
-- 
2.54.0

