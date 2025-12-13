Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862073B8D75
	for <linux-hwmon@vger.kernel.org>; Sat, 13 Dec 2025 20:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765656368; cv=none; b=kw5sNajw1V0ssp64Z5yBE6KnpCjuhAA2KmCX96oTqYKk5X1EYZlARRXSlw1molkG6vwC8BmO0CzQSHQ/C7A7nViK5MtG+QInpJsGsublTYwRPKGsDnAmKW/mNhtSkh9SvSV3GR5dmooMC/y2wz9cDIhBbxLssp1/IjTwI5zK19Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765656368; c=relaxed/simple;
	bh=vHDffevPJvWn0TDEIr3DY9YUUhJW/hc5O51BO7cTGxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=t3BpFGXwAnSeTJalD6LLp9FB7HZydrCxHqKt0uoMaDC3v+nxIaqDHigp8uAraPhXePonruys19GB+AFxg9IsWzLUN2X9sbtWrZ/j3QzKYpBV4wqhmTVZl+qyFUzcdNpg74YfYtYrn/DepeGQsg1u1WyBnobmBsSeWp5uqfnWSZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bf7ijr3g; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bf7ijr3g"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b73a9592fb8so493823866b.1
        for <linux-hwmon@vger.kernel.org>; Sat, 13 Dec 2025 12:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765656365; x=1766261165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p/5dOQDrua+flNbbvn9G1hHNSy2Etuw4W2yCxnsNBYM=;
        b=Bf7ijr3giFWr6wLCJeqPScXVbjkFP1Qp2rQ+djQR7ssHG0/P9eIiXwlh3ZqA+PCiza
         CwzquzFYUp19z39q2NHVUeEJs+bXlO/aMz4ErsIgnMVYNBiWD92DCcg+t/o/NV+U21He
         2f3AI/77DZJoJa8sdNN/MknPPd+WENkgUw3s6dKNEGjJxB+lG6+G54JqOoAoo9cJuJEh
         1JmwD5eKAt2kHUDIOoRCCUh+wyrP007JVmbdTP+crTtZpHiS6VKKugKLPt2p0cN1q1Kq
         yfAIUGmsB2YHsFUeL9uR0B0U5DR7eIyehcpQh05X7TfbU/GhpSq73Pnb7a+unTDz3F+x
         gaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765656365; x=1766261165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/5dOQDrua+flNbbvn9G1hHNSy2Etuw4W2yCxnsNBYM=;
        b=vBscyYVFolnLjkrlyi9GKytZZWyq2E1LfZxB6th2zMkE0sssEB4rBehg7tv/JcCTxN
         2ukzqqGmD1KbyiddNYkff0+agKzMNWpmVnh09Rgpr0exLrYiDwBJVJ4aAqm52K3ucwN3
         z0guhQp/t3d0KlGNX5IxIssODbgs1T3TY7Zm9avq7qKlMlUmNqN4dTXSr+ZNFSSKtX9t
         NE8cXx2pP9fCQiXSE5lHN7abq7ap8ralRIC5QbwT8egXe/O5U/kxLc9zwzxiFUtzDSH3
         Qh9ZiAxGKl7+tEpXNPiUPVT+9Klh8OzdVqEYG7mQAlwJycp1Wz7O2hU9ZnhHMEeAY6Ua
         kqKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMzPYKc/FOj2Z9OPfPJypA5igkPMEH48sWtqJyLYPQsrHYGXzM5/AL+E65fI9k7eDxQwQB8ODU9lMkwg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwAayJMQBWyYl/dHiUMv0ctVflG2LKFw10guFQfMIb0vxyM04Li
	fvcHhsYhN1ST1k3VqPNaUYH+tV4hwN7sKi39gVdkL2AfT0QCBSHsMb3r
X-Gm-Gg: AY/fxX5+O8XH8ySpFVr6F0y1qsLqv09zcSwqeqAvn1MabiL3hoLNryHJXQAfMWPCTOe
	9hIlvHcAMPQrbloX/4SZxF72tnPxdudlrVDm2VrtJDSgbM8FNQ1ds0nONloGfv/9ymCDZq4eysr
	XN/q6+oAeq8DxVh2OtUUyEe7AkhqBBG7geVXHbBzEHLW5sUSvCLp4lqtTPZkI1wqV3h57JFmtpN
	mtrsLC5m7a4kbTA2IRuoVDkhQn7MR3z+fo+7XRgWBcaiRi/7qeeW37d1VKvoRb9StCq+QJFaTnd
	4YfcN3MF6WOwC0o6Qjd7hdCnvjZ+KDEm5ex0Cdp2jMkTW/Tv9LxDvq/yLm0bX2TShtdPwtehi/G
	PuSVbC4Aqh9pUXsvUSuXZaO+Jp9fGsWm8a16MfojeSYR4DvCuFrMKV04H4omVi/uTSqfsKfG/zi
	e5/zKR3vGBMcqDJux5vvt+BDFYfZ4olQ==
X-Google-Smtp-Source: AGHT+IHyGed32ODALWiA3VxEmzJhRm8zqPkOmjtz4tMKYDQKKRya7+LJKpZFXDUO8WDaJs7zgWyz6A==
X-Received: by 2002:a17:907:60d2:b0:b73:9892:7f46 with SMTP id a640c23a62f3a-b7d0251dcc8mr1158285666b.29.1765656364614;
        Sat, 13 Dec 2025 12:06:04 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa517558sm919073466b.34.2025.12.13.12.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 12:06:03 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Robert McIntyre <rjmcinty@hotmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] hwmon: (asus-ec-sensors) add Pro WS TRX50-SAGE WIFI A
Date: Sat, 13 Dec 2025 21:03:40 +0100
Message-ID: <20251213200531.259435-1-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Robert McIntyre <rjmcinty@hotmail.com>

Adding support for Pro WS TRX50-SAGE WIFI A, which is identical
sensors-wise to Pro WS TRX50-SAGE WIFI

Signed-off-by: Robert McIntyre <rjmcinty@hotmail.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst | 1 +
 drivers/hwmon/asus-ec-sensors.c         | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index fb32acfec0f5..58986546c723 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -10,6 +10,7 @@ Supported boards:
  * PRIME X670E-PRO WIFI
  * PRIME Z270-A
  * Pro WS TRX50-SAGE WIFI
+ * Pro WS TRX50-SAGE WIFI A
  * Pro WS X570-ACE
  * Pro WS WRX90E-SAGE SE
  * ProArt X570-CREATOR WIFI
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index ef4561ae38f9..8435be30c3f7 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -801,6 +801,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_pro_art_x870E_creator_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("Pro WS TRX50-SAGE WIFI",
 					&board_info_pro_ws_trx50_sage_wifi),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("Pro WS TRX50-SAGE WIFI A",
+					&board_info_pro_ws_trx50_sage_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("Pro WS WRX90E-SAGE SE",
 					&board_info_pro_ws_wrx90e_sage_se),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("Pro WS X570-ACE",
-- 
2.52.0

