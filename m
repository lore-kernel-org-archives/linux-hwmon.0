Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E37C5392C48;
	Wed,  9 Sep 2026 18:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788978400; cv=none; b=taAl3Ei4jTf6RFMuTBuk7YACvrDKLoC13r0LkpxAqqijqq9SfAtww08kB5DTZ/s/3pwY/t8WbXEaqY4Fp6ry6o8A1geUnWhQ1rUOUgKfh89woOyD0u0cnS0jvKOdwLpK9FRkCTjiGUQvVrO4mMHFxmwf2HdMy40nrUGzesqvc34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788978400; c=relaxed/simple;
	bh=f5aiTZ4e42jlzpUAaNGbkK9DSqCTLeI3+3SKAshCoLQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XyQoLv3URNYF2MOFOkRRIK0tjbnc54Ie723bsCMXFOX58nOrtQ/4XfPN0DAqr3+8m1Evt9DhMHDxOlt6HbusVxLdib1AwDIaJjfTflUrabOnaR5KmGzyuNQq+YGSwY8OVYRYuJmvU5/MgP+upXm+h7ePV5vM/wy40FZNo2gIR7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FbMBOlM7; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FbMBOlM7"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4293E4E415B9;
	Wed,  9 Sep 2026 18:26:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 15D0660448;
	Wed,  9 Sep 2026 18:26:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A444311C7918E;
	Wed,  9 Sep 2026 20:26:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788978392; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=LC797ZJK0mgOkjvXz+Q18uE/g6w9FA8e4i9NKAzTH6M=;
	b=FbMBOlM7WFyl/ImBFXBLOGSCSRB7X55qvf+s+Kb6iiGpstSBUmqwi93xJTQQ1oQVfX0QOv
	Jgle8cNdPVO/HVPnPQe4wKlVM4MOGx9hUrKwRb0VwVy37LtIuSFQiBq3fW5ITcEfSYldrG
	htWq7ClqpFxaq/jI4M340GtOVnVQiYFtnD1j3GpiRkYEczZIt5VrTZ0GDaz1oZ1aigJzDK
	tE1uNZap6FXZFo+56YxqMrxqo6Ft9SffkZBEkmYzgRQ5CerZDFO+rQMBWJoEWzvsSvML1/
	NxdB5toz6Vm9wRqfanxAJwaqmpfSaeM2iHEEOS8DuxpJnBA//F6vln/yMmkXoA==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Wed, 09 Sep 2026 20:25:54 +0200
Subject: [PATCH 1/3] Documentation: hwmon: (nct6775) Document
 NCT6116D/NCT6122D/NCT6126D support
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-bootlin-hwmon-nct6126-v1-1-4e85615fef10@bootlin.com>
References: <20260909-bootlin-hwmon-nct6126-v1-0-4e85615fef10@bootlin.com>
In-Reply-To: <20260909-bootlin-hwmon-nct6126-v1-0-4e85615fef10@bootlin.com>
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Paul Louvel <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788978382; l=1255;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=f5aiTZ4e42jlzpUAaNGbkK9DSqCTLeI3+3SKAshCoLQ=;
 b=wf0XJAWB3MAJndjcU1+w1yHKhXMLhtXRLXu3Uy8jVGWho6WvXTBgwfn35yrNvefpaLeiM9R0A
 ZbIo8tFcVWUC9t60iCkKxFxe1ChBvkRpLasN1/HpSWotJgTZn4W92Yb
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

The NCT6112D/NCT6114D/NCT6116D family has been supported by the driver
since commit 29c7cb485b32 ("hwmon: (nct6775) Integrate new model
nct6116"), but was never added to the list of supported chips in the
driver documentation.

Also add the NCT6122D/NCT6126D.

Assisted-by: opencode:z-ai/glm-5.3-flash
Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 Documentation/hwmon/nct6775.rst | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/hwmon/nct6775.rst b/Documentation/hwmon/nct6775.rst
index 41b21bed7e27..5199c083b9e7 100644
--- a/Documentation/hwmon/nct6775.rst
+++ b/Documentation/hwmon/nct6775.rst
@@ -16,6 +16,22 @@ Supported chips:
 
     Datasheet: Available from the Nuvoton web site
 
+  * Nuvoton NCT6112D/NCT6114D/NCT6116D
+
+    Prefix: 'nct6116'
+
+    Addresses scanned: ISA address retrieved from Super I/O registers
+
+    Datasheet: Available from the Nuvoton web site
+
+  * Nuvoton NCT6122D/NCT6126D
+
+    Prefix: 'nct6126'
+
+    Addresses scanned: ISA address retrieved from Super I/O registers
+
+    Datasheet: Available from the Nuvoton web site
+
   * Nuvoton NCT5572D/NCT6771F/NCT6772F/NCT6775F/W83677HG-I
 
     Prefix: 'nct6775'

-- 
2.55.0

