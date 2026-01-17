Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E2F1ACEDF
	for <linux-hwmon@vger.kernel.org>; Sat, 17 Jan 2026 01:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768614800; cv=none; b=Dra99rgw11FDFRa7BMLPShma5QRlxyKK10wZIVuikNU4V0mO9+t1k+KWBGoH+Eky7Uq0JI80aiO95Ikq0m+NU0vKyM9OtmUk4TFby3seDwjEJtDOBS7A+2T4DyrhF5dDVAjyNdJjhQM1uUQcCdKNagpHZ0c4BsuplAC9Bqpa2zQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768614800; c=relaxed/simple;
	bh=grZSyLlf9fwsYdQb91BOR5AlvFLqnnAf60XnrqA59FE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nlqRj+qS7BWCx1H2PeWyADPz2fW/2knCdhNq8+hv3auUMS+GDcaKsvI872o28v6e8/lYf6VrV8yixyRYXP6a0fqK+QEpUZ8JARnaMoBQvoPXRVi6ywbLtFSR963D6wUNEh6pLY+hFJBlGicPPLFKDQciWrH5fcx9oAnW9z4ntyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IiITPwBh; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IiITPwBh"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-8c2c36c10dbso308562885a.2
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Jan 2026 17:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768614798; x=1769219598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3fGVYa8jqbyylm3+KfhI98KZ69x0vgd+VxZp6WJT5s=;
        b=IiITPwBhM75ROzw4jOIHBZ2Ndwg3YJWers9IfzaCDjYQn9ARoZMRghXa8olXLNsonL
         sFb/IjdqyQ8VK9+a8/Vv7bavyTD7/tkVVP9EnBi7UaZENxYrYFH2sHrY8LBCZJfb3Jx2
         UvG6OrJNLQ02T83urDVZgAZzkjhHQN0gq90ovGeSbMkhJWDSY38MCQWpEuiB9ZDlcbaX
         7/cMLF/G3ciK1GNGuLZudUcAIWSigipNNw0OHr6dLT9YkqHFPgQKgl//BjB8aptz8Whi
         ZmVOl4X925cZmMH1C4QfMGEuHFKwjw0sejDWPuaRa5ZRlhtOwHxPrD2ioYeHPPlblTcx
         R9OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768614798; x=1769219598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o3fGVYa8jqbyylm3+KfhI98KZ69x0vgd+VxZp6WJT5s=;
        b=jJ9/CrIXmf9FfzODcVYFxy5QbBLxabEj2rBY+Ar2dQjf5RlWzMH0chqi/YqCMfd26+
         /cmgyXC3YYKn9TSzRwJZ/uCIC87NBxLVRQIndmlIalUOB8wg9/XW11ehS9Ogjjw0U4vn
         pUIJUQtAiRgFxfquOVggeSXOo3qSkMtVjsNHn/ZEBFUsl+D9bofX5ocFzwMMtwLYiQrj
         50mQvUg6Vvvbp6CxnBzP+VmAZggLT1AiQDnab+VwZkIxoT/bFzLYd5et6h4gfymH7Nem
         y7e6uZxuJu3xgm5Mf1jHYA509seDlepLxXcgWUKWUsB+iMXLmhvBfEo4BgrUv19R6Px+
         onSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrTOqCw4SUxWHIB44/A1LhdhP5g3h0GtkJOu1Hrgp59wTpxGI7RircRlR0eZVj6jlPrumOZF/6/egPCw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrm9nyRtHp3US1RgEQ/BVv/WJ245nytkPuoGZEDCpJZ/JieHQF
	1ZXTPQLs4vOfWm9kAUn3PVX++ZICyFw1PlGnMLBAtvu1+mh84yAIvt8q
X-Gm-Gg: AY/fxX4eCMF0ipdeYmGpuq8BQJrbTtk7MkA6esUW+Dh0rerX3MydGF1lEUt1k+Odwvs
	M7zD1kENQ4Stjxawd8wVVGVGcivjsd3CVf4RXzHPGzp+MEKGngLyXzbDfS5gTt6MaKSMHnOdfgU
	OAwpMSKTEYy/oJXIiy2rJDeBmexS+MDoPs2frDYC6Mf6jcRN1Ss0e8OfUGwANBIWD7uzY+5FTzl
	8eEwHSIGo4XGiJU7F/kjmJK/cgMrEFlaO3qilV626Zev1ZP3dVvVIMivcrnzqfVga62xFKtPYII
	/5mPWLDmv9DQbh2jB4RmjVw3dF44tu3DabZOgzyLY9LUJ8dhW7orbYrXiH1rs0SdqjcJdFq6pFv
	xuGqPsl3HRBw8ggGtalJsWER2B8RFoBmTRYNY2v7ZomRKkzE+XXUDv60jQ3XzIihpHO7dXjsuW9
	Tf8F3HOFQVHg==
X-Received: by 2002:a05:620a:3199:b0:8b1:5f62:a5d5 with SMTP id af79cd13be357-8c6a6789902mr722211885a.62.1768614797805;
        Fri, 16 Jan 2026 17:53:17 -0800 (PST)
Received: from melody.ht.home ([2607:fa49:2104:2e00::983c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a724eadcsm356917985a.29.2026.01.16.17.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 17:53:17 -0800 (PST)
From: leobannocloutier@gmail.com
To: linux@roeck-us.net
Cc: leobannocloutier@gmail.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pali@kernel.org
Subject: [PATCH v2 1/1] hwmon: (dell-smm) Add Dell G15 5510 to fan control whitelist
Date: Fri, 16 Jan 2026 20:53:15 -0500
Message-ID: <20260117015315.214569-2-leobannocloutier@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260117015315.214569-1-leobannocloutier@gmail.com>
References: <ef59dcf1-5a53-426b-8c17-00ddc8fe5d11@roeck-us.net>
 <20260117015315.214569-1-leobannocloutier@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After running a system upgrade on a Dell G15 5510 (kernel upgraded from
6.17.8 to 6.18.4), the fans would spin at maximum speed whenever the AC
power cable was plugged. I copied and adopted the fan control whitelist
entry for the Dell G15 5511 to enable manual fan control.

Signed-off-by: Leo Banno-Cloutier <leobannocloutier@gmail.com>
---
 drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 6040a8940..93143cfc1 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1639,6 +1639,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
 		},
 		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
 	},
+	{
+		.ident = "Dell G15 5510",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Dell G15 5510"),
+		},
+		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_30A3_31A3],
+	},
 	{
 		.ident = "Dell G15 5511",
 		.matches = {
-- 
2.52.0

