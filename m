Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29FA166F3A
	for <linux-hwmon@vger.kernel.org>; Wed, 20 Nov 2024 08:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732091651; cv=none; b=Vw1jQZeU6X34d+6BReUHOdwllDhBB8Aa2YnL3A4Q6i86QHQ3URsX1/F39BvDNgIJhvI2r7BQyWg/ox8URwELRBqkrMWWUnbz+jiCNT+8hfGR0/0R6SEZnjq4uwTL4+Ns4nQ17lLEFhrBLezADOY3kO4cb8QYBsj9Ty/0/PMq3xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732091651; c=relaxed/simple;
	bh=8dDSC2Cj8KTxntQZ48l0qLtV4B5umxyboaTusTTTNtE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Us+fUBgcoMxeg9hCNYXC/Il2jXcKEC3y+IYe9oVt9h7LXHndsd/HYzfdDOhTz778YI+F2pvfFqjaZDkv8VupoKRNkErDrOfLw+i7DNeUhXEM37wfasOYApvG2eVTg2tj6ajGV4oSxsAiyjtsCfyG7Y7tACToKRII+oKBb+tO7Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Xvp8s0I+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Xvp8s0I+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ELhM8SRHVwZjXbSVs7yXoFyzmHbryTxv7XCEG2ec0WQ=; b=Xvp8s0
	I+8Zp4BTIiV7SkcanoqWna268X07qxKZ8wXB1Gfg6asuk4bNKZ2l0057rxKQuk10
	7PXxwOtBOzqw99QaEXr5+z3xWDobtmosq+lNbKRqntT20t/XTXRkctyF7JC60N00
	x/Xy2gU49rUq4IfZDUW0br0Gtl8eIDbNMP8RmBwzvk3Vj+qmvzTGEwR04yStgQF/
	P/IIOHwCbcJlLJ4Ut9WknCuyx66FFYVeA4G8zmdnlJ6lXcYcVNR/LqPol7OP3F7f
	/EBffbQLjxAJK5fw7z60K4a8iYJsroFg4oQ1XMzUwEjF9BdZdDSANyIL4dHaM4Xl
	Fq8CGgsTTrUtHpgg==
Received: (qmail 832249 invoked from network); 20 Nov 2024 09:34:03 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2024 09:34:03 +0100
X-UD-Smtp-Session: l3s3148p1@xGMhA1QnwLIgAwDPXxznANR4Jedc6XSv
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	=?UTF-8?q?Carsten=20Spie=C3=9F?= <mail@carsten-spiess.de>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 1/3] hwmon: (isl28022) use proper path for DT bindings
Date: Wed, 20 Nov 2024 09:33:50 +0100
Message-ID: <20241120083349.22226-6-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241120083349.22226-5-wsa+renesas@sang-engineering.com>
References: <20241120083349.22226-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Vendor is "Renesas" not "ISL".

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 Documentation/hwmon/isl28022.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/isl28022.rst b/Documentation/hwmon/isl28022.rst
index 8d4422a2dacd..a7920a884b9f 100644
--- a/Documentation/hwmon/isl28022.rst
+++ b/Documentation/hwmon/isl28022.rst
@@ -33,7 +33,7 @@ details.
 
 The shunt value in micro-ohms, shunt voltage range and averaging can be set
 with device properties.
-Please refer to the Documentation/devicetree/bindings/hwmon/isl,isl28022.yaml
+Please refer to the Documentation/devicetree/bindings/hwmon/renesas,isl28022.yaml
 for bindings if the device tree is used.
 
 The driver supports only shunt and bus continuous ADC mode at 15bit resolution.
-- 
2.45.2

