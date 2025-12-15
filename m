Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F2E329E5A
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Dec 2025 09:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791524; cv=none; b=erMkRtDo2mDEStclc08Us0+O/u7k0m0lcl4Pcxji8y4IMX1JHy9AjzvjuGiDsGq2shlTe+LY73CFjjA8HEGc7mppIgd1XdynTlONShpyWRKj7dFCuMDj7SlzIFPQkyRkLiyh4BGG5Hl8WoyQrSEu/fJqfIrUvgi+lCe3cEtJX5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791524; c=relaxed/simple;
	bh=ZLczhFCSy+m+gUzqsZBz2A7r/g5l3YzTxanZgL7vunU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rU8GmPMU8ddCUB8ZnNyuVCYOBUH/jfomyYaFtylYOtXwbNlkge9z3xS4vIovl8o8wgV0CZXLN0j2NbltfcaLUldrV+EiBAlCNt4a3tC5w/Mclb3hFo6yF93pwV8cwW8aOIocevvMP2KsWEKAhqQGhTLstMMvWXllzWrtDMNu5B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcohmrJV; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcohmrJV"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a0d67f1877so11067855ad.2
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Dec 2025 01:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791521; x=1766396321; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JyG1HrY6OxFyDwa94CYzQgXUA/ZnED6KNtKcs5HUkkc=;
        b=WcohmrJVPXOIaZoAVi/8VnUN/zIaNUmh+7pEmFpwXF8EJF9pVgdaakiL3m9NQydIm7
         miA7VWJ9INDWOIu6TPv3x5Es3Z2QGiUVmn3LF9ZcBxT8QamYi7J1KToQzeBg3PRrVDi3
         Sp6/QtNNozCrh2FM5Jt1s+udMt58eLtGpT4+RutiSwoM9ob3kiAlN6gsZHZ3h3CxiPEe
         RKKmnFtdHO5CoE4Q8QUtXV/j6SI5XO9nRp24RzOJkPYjIjTqrbOhN1E0NI6GJhGQufgA
         6lr3FUNF2QFzersiKVHnvL6Ey4l/Wat0bW1BJ8feKRuk8hij8BYfLbdRJERoswYF2fRl
         7KzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791521; x=1766396321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JyG1HrY6OxFyDwa94CYzQgXUA/ZnED6KNtKcs5HUkkc=;
        b=WRdfjNBS4YZQYBeM57Y5Qn+HboVjUU1DsvutNZ0fqwM+qt0AwCkukrhxzoFU95s1/a
         +0Tfln6nB7f6LydQDd5NOUbKWbrVvMDN7ZzZ74K3eX0u2Smi9Hcqt7GXBBoDPrVFFUdT
         +L2tiTSn1X5NzAXsi8k9py1EjhEqwjYj2E5/Ns5IKQ1oTkDAmdVlKbU24MqO+05JkeUI
         sBGcGyY3UFdIr5HJpXVlYLFEfAi5hxusF7j9Cfdz2TK0T52bRMZWBVWW6/hUssFR+sTK
         oqqr8YysX+pu6WLCynnJbg2haFIoCmfojcroJBfOyuGRbTUAR5kxC9OvjXQzSHLZ3NlR
         Jfzw==
X-Forwarded-Encrypted: i=1; AJvYcCWC6EZsRQwRkMjhswH0TLq1GYoho70KBrn9saSWqs841kuIpycOFhVDwBZMpwnfbuqybl6vrzQU9Xh4QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz++emKe6WUMau/S05HxwWyHd6qfUA+JHpDn4RJMCvjQhZf+Szi
	NORy1qbwplehzYNwj7DhodBVarrP2h61yUaGmMhcXvGV1yH5yBjgIUSY
X-Gm-Gg: AY/fxX7asHMM6m6hQyxkKShhdPCrpYYHd34qEemKVBhVAQo3egoiF7t74djQkfvyDB6
	cUOXClbWHn/uosq+7emphKAxbQ3dX4yQ0sbUvSRqA/8025oWl1lGo+4r2n/IWnvSGEgSS/7bcV4
	JqVB59uNpaY/zRxlomlOEFLiUyxXz5CPjzjvmqgVrC3IFiK+R0znnZ+3WNMMBrp21pX/VYIVrs2
	ZtCrSmAIx3fBg0exr3KtBibnsDSeroyXmmbOhLOArMrVW9yGlGbh+6kD3jyAmn5XNUkEo15PudU
	7rZdTJidj+8bf6kH5TrrHTZ0o2FY4QJu5q1yd0kAuZ7cHeqp20t7F0wM/GmK2kDOTE9Hb3/tY17
	6B57Dvijo2Fr/yA4ahBOEA8zf9FbthmzWzhoGnefAusRmeB6XOGpF2uCBVzo8HFJBsJq2exV1zU
	yPUYhMsO0djgBrvuGWMBuG21KvO5KRXplcitEKjPQcub/0DxWsjwD0ZCSE4qE2/f5dACZTg3LJG
	yuzI5dpIMfyjVcU0EgWLonyAWj7LotTFy901Na0IfpWT+JULsNElilLaLTzofGRmK29jdjSOWkK
	Le8Xd9CLWZsj74gEObBp0C6Lni38ope66emGz/E1+VKp3GxIQbA=
X-Google-Smtp-Source: AGHT+IGrLdLzfp2H9tiVac+SQsAe4bk4AskKgVbq1niNwYTYkBxJLkhYZNfHpCAC+5TQzOHObd9ruQ==
X-Received: by 2002:a17:903:3bac:b0:295:560a:e499 with SMTP id d9443c01a7336-29f23b1296cmr99473905ad.5.1765791521288;
        Mon, 15 Dec 2025 01:38:41 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:38:41 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:47 +1000
Subject: [PATCH v6 3/7] mfd: macsmc: Wire up Apple SMC hwmon subdevice
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-3-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=744;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ZLczhFCSy+m+gUzqsZBz2A7r/g5l3YzTxanZgL7vunU=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn215lvbGxWfZmTpGq3Lqym4EiH8s2A7af357WZxnZyZ
 uYn2O/rmMjCIMbFYCmmyLKhSchjthHbzX6Ryr0wc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 oY6xjhEDF6cATPWbr4wMO1zKc7g2zW7v4HwR7C559/WHjwy7/16ymvClxfJzdduSfEaGPtaOhFL
 JJzUP5q6folLGbD4z69LuKwW/Ls+1WpDgv6qMDQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Add the SMC hwmon functionality to the mfd device

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 drivers/mfd/macsmc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 9099a7a22f1f..fa7b822d55bd 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -46,6 +46,7 @@
 
 static const struct mfd_cell apple_smc_devs[] = {
 	MFD_CELL_OF("macsmc-gpio", NULL, NULL, 0, 0, "apple,smc-gpio"),
+	MFD_CELL_OF("macsmc-hwmon", NULL, NULL, 0, 0, "apple,smc-hwmon"),
 	MFD_CELL_OF("macsmc-reboot", NULL, NULL, 0, 0, "apple,smc-reboot"),
 	MFD_CELL_OF("macsmc-rtc", NULL, NULL, 0, 0, "apple,smc-rtc"),
 };

-- 
2.52.0

