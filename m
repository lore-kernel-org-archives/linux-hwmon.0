Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D4B32110E
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Oct 2025 04:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761108434; cv=none; b=Sv12Cik3KEnSNpRNYPCaaT0hA2/efuzh1WM60HTP3749YZHUOAAlvLDvsRf33HTIt3JM6OrNZebhzPwqGPYzM0xUraVvrMQcww47URdumjwQPPt9jlqj23BIPgUbqfQ9JwNwAK9f9Uuj2cfsBJOpDj6zOsl1xi26LLyiE6VThd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761108434; c=relaxed/simple;
	bh=emjKQWb3F6rOxwSUr/RzSm5M0/FFlkCkJAaJf7c48pA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UYcTMalvpOwYvDs8yJTCVTnHAvpwLbRPl1yPrlWYX7WPM9sT8fYoOSnDuZVFkEQlHehR1lX2s5iWmsc1Ccrer4U6FqT9jZTxLga/07HR4+b3MurF7FSZlyNXIOwoASZLis05HBIwgEO7iuWSU8GRDNwCNaqz84kCKiRWQCBbuek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=bn1PcFsr; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="bn1PcFsr"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-33d28dbced5so5468843a91.2
        for <linux-hwmon@vger.kernel.org>; Tue, 21 Oct 2025 21:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1761108432; x=1761713232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8FKJOKMqwXHhFrO9BQqSZunbt6V18YJAj8RFJDvZcc=;
        b=bn1PcFsriSRAVEoic025yNndQX3cGFAf0excqQh8HyfOYn4v7NZ1x7jj5emW4veEux
         ep9bnAKsw+XbLQM7k9FOfd075zTVeFHMrsAiQLghn+Z1Oqi3magIjU0BMWKOk/X1PER3
         fDspvi/4CPzrd1TWRbS1cYOvAh/tfZaQZBaealRDoyN+ZsWy9Y4uAQXk+/pQksxGo7vi
         wzmDL5mIhLXesySPjKbV7Sr0SB/Vz8bHWra0hc3TPUSGmKpuYxzc5hYuKHToC5bwj5Yc
         TLT6DqiClLEQ/lccuMow7tfXIYhKC+FZ9MxwBnq2bhpWkz9T5SkUePjytfrJXxzjVCjN
         bzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761108432; x=1761713232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8FKJOKMqwXHhFrO9BQqSZunbt6V18YJAj8RFJDvZcc=;
        b=AjE1rxNybSlsjHD0Emns/2Esz+Pi+DCSvu9s1iUDTT8hmRoftSFXvENVxFHQZTL3ey
         vmTVsQZgveT7ZOWVVUXWD7hHWzfGxDvug6/acGqs4JHl2OEmGFWRlAIJHCztTZVAB7wG
         cR9VeOYcEWF1acijDZWKq7B2dbIqSGIDPh4pzoX9+SoDlHqD5YF1zxThCC7yqwKNWOeE
         4aHBe2u3xkZdnNOqK7p9FPAd+GVDoKQCEbuHx5+q6b/1Cuu1782VVxF1MmZwBLIshhfm
         Jhz2MvwFPHu0GiOYA3eW/8mvq+HCLEwF5uzHC0HR2SA+jh/8MCn8QoJdZxo1WzjmbUVR
         Gyow==
X-Gm-Message-State: AOJu0YxWVmUXIrp/03PO0x+XT+FobKPZmvOT0I7rynvyb+DzADvuNqwJ
	Ui8psitS0Hiku9W7n2PWHUQCDqbolCcVX3EdRg00x7urMiNB4XczyDuTmbaBrHwWg8Q=
X-Gm-Gg: ASbGnctjD7FhzDoQo66MjFPLZPc6YMQ1R9407FKDgjt/92M/fxVzYLMoP2/gi/+MSwz
	OXh/m+iB6YonDM3HYRg0UEw3VNU3miVYsDhUUpBgRQ01XIQRDoD/rmiHt9U1I4ejj0ESBZO3E0R
	5cr44FGn4n0/ptCdsiqJT9nNV0G7o+pHoon9rkUi0RYiyf5HE+nRa/O/DcYoudDq4ihRLlwMcij
	cl2IZd5QNxMWbnIs7d/2Zv0gU+NMd96X+dvkYgNmA2H9ewSoSAsX/zc/UBek3wwZkvfoif/YYSm
	DrVHM/DhQ50dCsGrevP1vZPSW9EP22iFDWi0f5kI4+kXhnfrEuNTKRjE+u8nDmTX1DqGPWRzmKs
	2HMyaHrbYMdy2nzhsiR9Wq7R4qxrHWzMoe6mmBGk6l41qBIHuuDvXkVndLunYym560mwsiH7Fuq
	mNt7cv
X-Google-Smtp-Source: AGHT+IElLTdPaMtun1OrDiKuY5Pc6xIJ3dRoMTudaPZDceWpXZomujWtY5sZOb/M5md8LuBAZMbgNQ==
X-Received: by 2002:a17:90b:270a:b0:33b:ae47:fe72 with SMTP id 98e67ed59e1d1-33bceb1cf3cmr24397298a91.0.1761108431821;
        Tue, 21 Oct 2025 21:47:11 -0700 (PDT)
Received: from z440.. ([2601:1c0:4502:2d00:8004:e310:f3d:dd0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223dd9d6sm1257413a91.7.2025.10.21.21.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 21:47:11 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 2/5] drivers/hwmon: Add Kconfig entry for TSC1641
Date: Tue, 21 Oct 2025 21:47:05 -0700
Message-ID: <20251022044708.314287-3-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022044708.314287-1-igor@reznichenko.net>
References: <20251022044708.314287-1-igor@reznichenko.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a Kconfig entry for the TSC1641 driver under the HWMON_I2C menu.
The driver can be built as a module or built-in. Default is module.

Signed-off-by: Igor Reznichenko <igor@reznichenko.net>
---
 drivers/hwmon/Kconfig | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
index 2760feb9f83b..b9d7b02932a6 100644
--- a/drivers/hwmon/Kconfig
+++ b/drivers/hwmon/Kconfig
@@ -2434,6 +2434,18 @@ config SENSORS_TMP513
 	  This driver can also be built as a module. If so, the module
 	  will be called tmp513.
 
+config SENSORS_TSC1641
+	tristate "ST Microelectronics TSC1641 Power Monitor"
+	depends on I2C
+	select REGMAP_I2C
+	help
+	  If you say yes here you get support for TSC1641 power  monitor chip.
+	  The TSC1641 driver is configured for the default configuration of
+	  the part except temperature is enabled by default.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called tsc1641.
+
 config SENSORS_VEXPRESS
 	tristate "Versatile Express"
 	depends on VEXPRESS_CONFIG
-- 
2.43.0

