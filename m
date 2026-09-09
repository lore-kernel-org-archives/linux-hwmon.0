Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCE639D6EC;
	Wed,  9 Sep 2026 18:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788978410; cv=none; b=GcAqk2sFQV6EOEBRdg2tcwn/i2DHhtgGd558hEKhdbaUW+Mjb1k3Vp9PFtJGJ745scddViYNHsS2EnnzKygaPl5+9MzZwHYwrEaxnsZ8XxNSF7sPNalxy3Tu4K5nyetDXEJSfRZRUQouPCLbXT/CY4ruZF0iR4MzQv5vEkQNfes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788978410; c=relaxed/simple;
	bh=NMuB+VaofqHfoe6kmK5xWNMKnVtJfloO3J+b1Ch3CVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MoAhkGM2xpancfm06AO0UQ7tO4dcnoLk2KV1qaF6SRVdNDAiLeG345v78aUSfs8PvhCsrw/wq3FBBXf6VOhkErKPiQ0nhVdvgfFfiAhhiMjf1hvaQ3MG49ea5yC4T8bWR5Blv40jmogVsJ/rUkVWQTl50CW37EUg9Anv397HezY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fQggdRTQ; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fQggdRTQ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7E92F4E415B8;
	Wed,  9 Sep 2026 18:26:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5339460448;
	Wed,  9 Sep 2026 18:26:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2786411C7AF95;
	Wed,  9 Sep 2026 20:26:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788978402; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QMVPjWVxoxXUCreQUwC+/mioLnDGc64lMOUrq7iP8Bk=;
	b=fQggdRTQCL8y4undPsIrTN/IOkXM5lrcra1KGgx7RTXfKAvSmXdGgm2X9g+bvCSk7c7ZpC
	326BMl7Djpp2tUPWRl3YGjL5if3pgjBxx2nSUlZnk350D7Zb1tyfQtcBhuyEH6lSHO/xKf
	890ODXWZ7IAl7kHWrcTJgWqqacHmUyWXV/njQLP0v8n6KooSfX5FzoIWojlBeYhw3AFR7f
	YdrGjMjY6S7egEqDU9BsVmgCLpAfqf9hhEPUsCjoRqLnaem9WD+M067dTDCB4lGPAOjnwG
	FCDvc7sPyDB41U06IT+JLutffT83b3uT+PDY9iBSV5iPAHgb7TosGT0iTjWjuA==
From: Paul Louvel <paul.louvel@bootlin.com>
Date: Wed, 09 Sep 2026 20:25:56 +0200
Subject: [PATCH 3/3] hwmon: (nct6775) Add support for NCT6122D
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-bootlin-hwmon-nct6126-v1-3-4e85615fef10@bootlin.com>
References: <20260909-bootlin-hwmon-nct6126-v1-0-4e85615fef10@bootlin.com>
In-Reply-To: <20260909-bootlin-hwmon-nct6126-v1-0-4e85615fef10@bootlin.com>
To: Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Paul Louvel <paul.louvel@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788978382; l=1535;
 i=paul.louvel@bootlin.com; s=20260313; h=from:subject:message-id;
 bh=NMuB+VaofqHfoe6kmK5xWNMKnVtJfloO3J+b1Ch3CVI=;
 b=IlnoN5lxRVHlvwpdf30LY26Pt3wwQ7orGfK5oOpae7y4vV9QHK2Kv/HuqEofdlu9MdmJvJgVK
 4dDN1j+ypZ+AbPQtWpXpMYIlUmD+Iguz9/ApxtFppWrLHGy+4JvXOA0
X-Developer-Key: i=paul.louvel@bootlin.com; a=ed25519;
 pk=eLW50NT18UAvUT5cAcYf88zNbBCZDLFXuptpyLVhVIU=
X-Last-TLS-Session-Version: TLSv1.3

The NCT6122D hardware monitor is the same as the NCT6126D, the only
difference if the number of UARTs: two instead of six.
Add it to the driver using the nct6126 chip kind to avoid code
duplication.

Assisted-by: opencode:z-ai/glm-5.3-flash
Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
---
 drivers/hwmon/nct6775-platform.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
index a8ef58d3a883..d359c28f3e0f 100644
--- a/drivers/hwmon/nct6775-platform.c
+++ b/drivers/hwmon/nct6775-platform.c
@@ -25,7 +25,7 @@ enum sensor_access { access_direct, access_asuswmi };
 static const char * const nct6775_sio_names[] __initconst = {
 	[nct6106] = "NCT6106D",
 	[nct6116] = "NCT6116D",
-	[nct6126] = "NCT6126D",
+	[nct6126] = "NCT6122D/NCT6126D",
 	[nct6775] = "NCT6775F",
 	[nct6776] = "NCT6776D/F",
 	[nct6779] = "NCT6779D",
@@ -77,6 +77,7 @@ MODULE_PARM_DESC(fan_debounce, "Enable debouncing for fan RPM signal");
 
 #define SIO_NCT6106_ID		0xc450
 #define SIO_NCT6116_ID		0xd280
+#define SIO_NCT6122_ID		0xd2a0
 #define SIO_NCT6126_A_ID	0xd283
 #define SIO_NCT6126_B_ID	0xd284
 #define SIO_NCT6775_ID		0xb470
@@ -1035,6 +1036,9 @@ static int __init nct6775_find(int sioaddr, struct nct6775_sio_data *sio_data)
 		else
 			sio_data->kind = nct6116;
 		break;
+	case SIO_NCT6122_ID:
+		sio_data->kind = nct6126;
+		break;
 	case SIO_NCT6775_ID:
 		sio_data->kind = nct6775;
 		break;

-- 
2.55.0

