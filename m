Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7684B1527B4
	for <linux-hwmon@vger.kernel.org>; Sat, 25 Oct 2025 00:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351927; cv=none; b=Zifp4zTDiEE9uBkRxIJrkzRXurtoSr8esB0b2j4u3EQ7wC0ELs1TAliX0eOMTEbnSO9xZEMTWLLTu2AX+Fhbl1cFBDKsGG4njRxVMZsoKMj1XZN07/sXfO5YxCKNlfjQmX9X2qcGJ5E7wy2vTpxTzGcOsKGe+PP6aDukGuATnV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351927; c=relaxed/simple;
	bh=DIjn1i6LYuHnBLhKvNWo/fynkhJW/iU4X0uf260tH6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OFXWtZEhbU5xa5YzspT9+SqsmvFI5M6nduxbYmSJqAgccUIyqvBzBXSdTEm4hpJp5QNB5WMa3nolwCf3WxEDXhAYxsJ4RK7BLPZfHVL6KitLfV1x8ovXoZdPQE6Ffp6YSWQSLTnJUi0DhKGgJtubHHSPz4kqH6ZZEXrTx2srkUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bynZe1Dl; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bynZe1Dl"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b608df6d2a0so2345489a12.1
        for <linux-hwmon@vger.kernel.org>; Fri, 24 Oct 2025 17:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351925; x=1761956725; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3l4kEjsdDE6a6BGdSar9SEMlVw0yVffjguWwMFXN/4=;
        b=bynZe1Dl3wixpsJtZ5VraFHDvtNdkXGPDfRyGHiaZkV3UsRltVmZxze860+P2hFbs8
         QiEkcmuQUaYSNG72BMx3NLzy5KfBcN1j9NMmxMxNYkTYKcabEvIqjms5US19S9Yhm3Nk
         vxPKJm7lDV0gkBdPal5BAIObYytjZUVfTnLb9uZSyBWoWrtkDvy2eFX9VPE4KKE/GyMz
         seESTLnVgqgNUjms6kcHE3anx7xvcMfw75ElTfyWKBxn6GJBFgXtuZk5ve/bbOKBtzk4
         lPnQNKN/AFj813dosBNiylXs58hFm0hd9CtEk/A/DE0upKPZDTnPTYnsEmhi9ByBdmHB
         B5pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351925; x=1761956725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U3l4kEjsdDE6a6BGdSar9SEMlVw0yVffjguWwMFXN/4=;
        b=q3FpK4Rp8HRIHQlWKHdSBZIuV67fJhAw3O81BiVm+h8c3Ht6h/9lP3TxOQIxo+8YbN
         7tYBMU21IUvEcpPXC77634OwkQZbgUwfIFmCXdzVKlsSLabKlKo6NNMwR1knpZkCV/fH
         za6PJFXDGIWIrPXg1idcORjLLL9zUAPUfAcgChEfAZWdUEPbtFDYcFws9d7oFAQkUjP/
         DxPLKWrCfMIO4296CxzN/HF6fdDZsXIdDJ2pgrMmlfFHErW/cM+G1dsIDMHB41ci50Dm
         UDeu3Cpf+HLr6fyQRdcc745YxsQSuN6bA9uwZIGXfMPK4Q1NpDxoB2zyhNgx/z/spuoy
         3R4g==
X-Forwarded-Encrypted: i=1; AJvYcCXhqy0ReIWu0PSb+3Av9IMTtH/BouYmM479012XNTPRP6wRa52LN5Ozpb/RA0BVhaCWs0nZDqXK1Z5q4w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo7YVqjiP81ipWy3dM0deTxas+IYUCnvCxTNuZSNUwq/fB1KmJ
	KJpAkXlKOkmauEqz4nC5o4g2Mq6XDGD2UAiO610KH6xBv04Ql8Ta3hKp
X-Gm-Gg: ASbGncvMbU8AmjFY5N7r0AFJI4gO5Rqh5nfBDzCSHZRdVQZdHC78PixoY+ZilDnnK96
	XN0rVfVtQtJ2lFzORYLIriI8N1HKNAhtPNijaVhahz9IWtXnKdCrUMzesFNkk07YxuokdsM2sJi
	6tcOAUMMyVdN53/dQtsDvyk3xvmTx4Dja6JHLp1JIKbtuWthiILBX47+0zessprpkN/8sN9qTMA
	gu2807GUlGU/AiHl7f+lHvnFiYi0PiQX5ezAu9e1SfWgIbKCGtKvy8NgOfnm0Bl7W47y3pEPmfK
	OCNprmOwV9dDCVlWq9ByRvsgGApgeYeapqm8K5u/9twlIJGtZbDFndtwraohfZJROYHzJ2Kp7P0
	Vt7W0fWTdymcEkFg0tr1L3fxATWizZ759bvkPSoXteQK1QjVHnez0HhZIqJINwCSDaY16e3lcsl
	ZzX7oP3ufXgcHdemDRmV1cS4N0b/3gikIxSu16AL6tuuWZ6wUDsuEjA2vGpeNQcGHg9qkLg8rEW
	KMSLKu2xLyrqTrlwTS8kpIu8AYqWFkJScEFxMJqeDCHrdISabaejmxgAsZT3MAS
X-Google-Smtp-Source: AGHT+IEcAIrM5gDLd6A2M9OWpDkFvdgMAQWlJmHHcjPPAuvS+4wY77QHgPJLW5SNNNq/wEEOrEct6w==
X-Received: by 2002:a17:902:dad2:b0:286:d3c5:4d15 with SMTP id d9443c01a7336-2948ba3c6a1mr49230345ad.36.1761351924748;
        Fri, 24 Oct 2025 17:25:24 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:25:24 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:35 +1000
Subject: [PATCH v4 04/11] mfd: macsmc: Wire up Apple SMC RTC subdevice
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-4-374d5c9eba0e@gmail.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
In-Reply-To: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=747;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=DIjn1i6LYuHnBLhKvNWo/fynkhJW/iU4X0uf260tH6w=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM66XLGLz/n50Chebub0Ao9Nf53uT3wfl11dXS33N
 9x2ymOzjoksDGJcDJZiiiwbmoQ8Zhux3ewXqdwLM4eVCWSItEgDAxCwMPDlJuaVGukY6ZlqG+oZ
 GuoY6xgxcHEKwFSfMmdkeDBb4PWe+6s0vbok5oTvmR4jwlY+maPo+DIp1m2PikI7LzD8d963dV/
 l7GSLoMiFjx35q83EPmxqWT39yQmNyVyhhrPc2QA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the new SMC RTC function to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index e6cdae221f1d..500395bb48da 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -47,6 +47,7 @@
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
+	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };
 
 static int apple_smc_cmd_locked(struct apple_smc *smc, u64 cmd, u64 arg,

-- 
2.51.0

