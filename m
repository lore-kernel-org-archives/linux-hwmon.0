Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8600E253B40
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Sep 2025 19:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758655788; cv=none; b=XT7CAAiP+Jq6icjtqAY0Q2zINTojq0jO+6cU/56VwbCfwNylvNL2NRrLQuwqP2SVJawwCXQmI+XN9ZG1j9G5zV1zrnLehMTDehtRgQYXlUBg7yU+zZGVs1fLqg+A5Xayc71/fkOwwnzItC2tRcBvQlp4l4A6NTNy2MRQATU6X+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758655788; c=relaxed/simple;
	bh=fP3thc+kVifTosgn3z97ZGSIOh9Iu49HneFiVEHzD6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gKP9zAfSlwYvYlkbWo3CU0nsjZVeKicp/JRLqwhCfgbpaMoitHJq8y+/3RXJzdbdX8FgshWeAs6+jp3FNxa4ff54zT9venw28V5t9ahf3XK2IuZwkBYNKWv4CPBG7uP6qv/eAPvPxHvU1UnjWrGVdspYmx8eiOkZW11UXiOxKu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AgA28qNB; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AgA28qNB"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b30f8d14b9cso147695166b.3
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Sep 2025 12:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758655784; x=1759260584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=48AS41XIpjVoRU+0wgpEbU66QCbFruFApgvY2hxBZiI=;
        b=AgA28qNBm3mHAQUw75KGYGhZe0eQ6vdW0+tECAWXr+Tf0leXkJKeiNAVryiI8NIamr
         NWeSX3twMNWOfMiUvT8pTLRG2U3awMse+oX1+ts9etCEMalkyx0JDgt9+iSGzjX1fHBJ
         Y3mNgRAyjwAyf73zhcBN0ZUlq7sXKITktKwdGP7sg4usiMW70UOAEL//o6Kqp7poPDbV
         q/qn2RxfRIlBRRwPxleZokLE6x7hV2gycV7UKQTfbbZfjasE7rO3e113uYVGv5UhasnI
         KEqw1G1odywluMM9h/EGgMJuBsFCmyBU8MHJ2czZMytixgXvTfbk33FKfIEOnkS2IUuy
         Mv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758655784; x=1759260584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=48AS41XIpjVoRU+0wgpEbU66QCbFruFApgvY2hxBZiI=;
        b=jblzRGpB1Edoj1GDTcEPnkapxWtsI8LA0zpJIyuMqdKzYD20Ok+SgqJdlpvNpw1ik3
         kfaFstze4+Kc/cVmpEY/DlEYXD++Ff+908BwWImPqjRbAIgRu1S4SFxEzbwo3TiUDtZu
         N3BMmshIkjNMJZ4HbfPndgPnBy/LYI36J/QIGAGz4ke+NRa62ekG2I96muuro7DLf0YI
         rFQkWX0p8xq8IuRHVMNAlsdQkGEfHyo18BCx1KM8LbQ7q1HYdL25ePZ+fsqETBjKusk8
         xBaYF/y6K5Qk0SFvLfabVfwNaNxsY/hScFC4bHa4uSVsHxxI8hBv7jUB9Aobj7ZS6dQJ
         C1NA==
X-Forwarded-Encrypted: i=1; AJvYcCVWyg1GDs1GCDD2Y0vL1dO5smyPIyT2cb5PJ7/zlysHNPu0qwuJpx1cyPqCFDxRTw0lH61dyQuXodvphA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3Ps3Pcm62YkcVwXjg5Ms264DK5z0KWZJay+/Rnk6mqI4Xz4La
	M2jmQgqvFXctzLnrVbfhxuD1jzMfk1SZ/2UsKN+myeNF7cjG7860G9uN
X-Gm-Gg: ASbGncv9xmxqP/lAarQNZRxPaE8esu7sahZbB2QMOF8dtC9NRTQgxycfMfTEylhLmCr
	yxYFV4rn+fCfh2sidVX4b/r3midQz0aRQTug3mBk3tEKj9f4jNintVS6/3/OxTPcDrEH1SVOtAu
	MWWLWhja0bnfHbn1tNBMD5qWXoJpWQKTgvxFxBaHH1vxL+DAVP5+c2xIOISvSXcvrWcIYK/t0qf
	WjXovfQKdCPY+z76aCql14tH1OEN1BMi86X25rxJUPo928c2BqUt3JNFHwZW8XKwE14SvdGhsCZ
	k2YENo+u6yK978FDZaSMzzQ9BSnaXcbWjCe0FJreo3TtjCVCmqHVGX870BTxDUGU5MId/My4Hpd
	QSXW4ItSMkPbgwXEppojm94e2n/ZEtpYWA+EQ/HbNBps=
X-Google-Smtp-Source: AGHT+IEJi5n4B3lRbxv0Dhubtahif4aO7G+ZtrfSFN8eZ2s95Bk6Owhctf2Hc2F2YFNV0l1GWudmIA==
X-Received: by 2002:a17:907:3fa8:b0:b04:563f:e120 with SMTP id a640c23a62f3a-b302bd15aa4mr365987166b.53.1758655783835;
        Tue, 23 Sep 2025 12:29:43 -0700 (PDT)
Received: from puma.museclub.art ([2a00:6020:b3ea:9c00:26e7:b56a:5a2d:1d72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b1fd271f895sm1370710466b.97.2025.09.23.12.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 12:29:43 -0700 (PDT)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Ben Copeland <ben.copeland@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (asus-ec-sensors) increase timeout for locking ACPI mutex
Date: Tue, 23 Sep 2025 21:26:56 +0200
Message-ID: <20250923192935.11339-3-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250923192935.11339-1-eugene.shalygin@gmail.com>
References: <20250923192935.11339-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ben Copeland <ben.copeland@linaro.org>

Some motherboards require more time to acquire the ACPI mutex,
causing "Failed to acquire mutex" messages to appear in the kernel log.
Increase the timeout from 500ms to 800ms to accommodate these cases.

Signed-off-by: Ben Copeland <ben.copeland@linaro.org>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 drivers/hwmon/asus-ec-sensors.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index ce3ea0333fd9..34a8f6b834c9 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -49,7 +49,7 @@ static char *mutex_path_override;
  */
 #define ASUS_EC_MAX_BANK	3
 
-#define ACPI_LOCK_DELAY_MS	500
+#define ACPI_LOCK_DELAY_MS	800
 
 /* ACPI mutex for locking access to the EC for the firmware */
 #define ASUS_HW_ACCESS_MUTEX_ASMX	"\\AMW0.ASMX"
-- 
2.51.0

