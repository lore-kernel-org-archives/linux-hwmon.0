Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F112E7BCC
	for <linux-hwmon@vger.kernel.org>; Sat, 13 Dec 2025 20:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765656370; cv=none; b=SB1ippo4k47KBUpCYJjgXC6tbfHDPjenP/hxBgn47eLQ65TuH2OSgRraw8QryMMhIIgkMt8FK/MpNUML9veOe5bXtClL9AKeLxFBSMJudQj6YAC4sKKX5n5WXO06/GcUEdYYtAPqd18Y9DuzWrQecqlYoCiiNPlN+x91+vOwB6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765656370; c=relaxed/simple;
	bh=FpUwGkzvz3rrTNZPPOiP02YajkG0j8BUEzXxp/iOwEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UDTwvsRxQE8MIqLAyui8wEUrYlsNZ+6UCeU2YoV0zBNx8mRgt9MhELWoD9ZUUr0YIfs1TY3eqH/4nQzDMg+d/v/Eif1QMzWSE3C9wqVQWXUt4a6Sd3fgobDzZ9Vm8hrU4Bg6SR3OpTnjMFL88MYpH3yJotpmjLebLe/p4IUpDVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfqJC+nM; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bfqJC+nM"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b79d0a0537bso300818566b.2
        for <linux-hwmon@vger.kernel.org>; Sat, 13 Dec 2025 12:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765656367; x=1766261167; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5s5dkq1vk1AHcVUHSxDmLyBvnvr/yMNsJ6hcXpFniJA=;
        b=bfqJC+nM14Lp3OT3Zv9veLfF9dQS9J4c03R0CG1j4fCF/UmrcrXpkPvU/YLaOj1esR
         d5qEu94sJVlK0ER/6I2YSYSbO1OT9E+HXmXzII4okQ3BooBU0s3GEtw1ZNsMneiOUHLP
         HAIcaUK3MRlUqedPaH049ReS3L5hNhZ10KwbR3KQOifiluh3CRtKPRVj6qbYT5osj+KP
         6zp/9pz9F9nxS76LTZwY+IemJdhT0pQ4rLz70a0UD97B12lsF+pO8w9MvAfjtUkpSWpP
         Hnz7YAMbdevQ701o0K9x6IJ3PBIMC1sviwWaUTqmhdjPM9bjqJKwk4XkIcdZWSHmfEqz
         lHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765656367; x=1766261167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5s5dkq1vk1AHcVUHSxDmLyBvnvr/yMNsJ6hcXpFniJA=;
        b=djNgyLXMEMLPAjuX3YBjv03GLV1oX/KTd9VLGKdPRRin6c1sPwe8OzHkKBJHGnEs12
         mecn/qSFwAwiwKaHVP6oxEv4L8e516wwtMJd3J0xc8QuEc9pbMyS/mCXsidOgAlr/gLt
         EEKeuLnDMispZRc9dxiGUsLjM8zICj/G2nLrceb+nbnMk8S+Ttl7kFI2/EaGdNsN18mH
         4zC0M/ho25ayrtds3mgTOC/ufbvom4MZ+lq8IsflMkLUWuBnjRq1XJPmaVWkFkTpkaIL
         Uve/uyb9PmEJBgXLELLSHOylzSCO8EgXHIuveCVLgXj6vgF+9mdAsyl44S1oZridB27z
         QMpg==
X-Forwarded-Encrypted: i=1; AJvYcCXc7K72+W+vYWqiLYkFuZl1Iz4k7dk8bkdVse8iUgUGk1qZB2pWigZ5lxYZ189lpHzKnLZ8LSDYOGjhCQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0acnCtVjfL8WkPNLudxPIzWodRj/SOfjSHaqf1CfricD4e/LE
	VsD6KrVe4/lYDnU+JV9Yts/UgYFQZQ36EvByXxPlFH4anAQABzTyITK6
X-Gm-Gg: AY/fxX7JqLiEvo4ETtOkA1T3PsDZWUdeeUxZvREqNavHsspChhIGFwk5b2nvyABfDdo
	nOErezNtA8TWMpOgvWQgP+HUn1hlMNwPOofIqk63FZXukHvV9p4ir+l5rh1R5ajp2U1YrKeBWEz
	9xf04xfhFkbNflicWOyvW72u8dm+Cb94NwT+T0CAJa6MIEYshCdn42+JODopqUJhB+5jGWDbVK5
	VHxCZSQ7t5iIzkwje7HPB6awdhjZFehqo1LZ7+Q0HO9NeeH/KmKwbPGs3Ffy1wlQuCPnZi5vaD/
	N2/c69UJ714gNI8ImkpjFV7yB/dmEbmBkeRpeMSdGn6gcgaYI3Jg9oXdvyJEtotfsuk6W3AXIm/
	/JaCvm2KxWA7wEOdU59SOGSFsXbFJOjokzYN3DDdbIcXc39xfT6PvhuOP3XhrHHcuRK4OHthcsr
	dSbvooPohpdnQLJbHsIUNzhgdK81Mu126C+Rg4nVgu
X-Google-Smtp-Source: AGHT+IFEf4AeZqk/y2Uc4hdBQ9EAJ/emBupffcRfGxaUuJK9YxYrmpAdf40oE4IoN3O0wAzUQW3vrw==
X-Received: by 2002:a17:907:940d:b0:b73:6d56:f3ff with SMTP id a640c23a62f3a-b7d236610ecmr640225866b.20.1765656366622;
        Sat, 13 Dec 2025 12:06:06 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7cfa517558sm919073466b.34.2025.12.13.12.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 12:06:06 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Reis Holmes <reisholmes@pm.me>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] hwmon: (asus-ec-sensors) add ROG MAXIMUS X HERO
Date: Sat, 13 Dec 2025 21:03:42 +0100
Message-ID: <20251213200531.259435-3-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251213200531.259435-1-eugene.shalygin@gmail.com>
References: <20251213200531.259435-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Reis Holmes <reisholmes@pm.me>

Add support for ROG MAXIMUS X HERO. The support is incomplete because
the second EC, which provides part of the data, is inaccessible via the
kernel ec module.

Signed-off-by: Reis Holmes <reisholmes@pm.me>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 232885f24430..fb32acfec0f5 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -23,6 +23,7 @@ Supported boards:
  * ROG CROSSHAIR VIII IMPACT
  * ROG CROSSHAIR X670E HERO
  * ROG CROSSHAIR X670E GENE
+ * ROG MAXIMUS X HERO
  * ROG MAXIMUS XI HERO
  * ROG MAXIMUS XI HERO (WI-FI)
  * ROG MAXIMUS Z690 FORMULA
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index 61b18b88ee8f..ef4561ae38f9 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -474,6 +474,14 @@ static const struct ec_board_info board_info_maximus_vi_hero = {
 	.family = family_intel_300_series,
 };
 
+static const struct ec_board_info board_info_maximus_x_hero = {
+	.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
+		SENSOR_TEMP_T_SENSOR |
+		SENSOR_TEMP_VRM | SENSOR_FAN_CPU_OPT,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_LPCB_SIO1_MUT0,
+	.family = family_intel_300_series,
+};
+
 static const struct ec_board_info board_info_maximus_xi_hero = {
 	.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
 		SENSOR_TEMP_T_SENSOR |
@@ -815,6 +823,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_maximus_xi_hero),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS XI HERO (WI-FI)",
 					&board_info_maximus_xi_hero),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS X HERO",
+					&board_info_maximus_x_hero),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG MAXIMUS Z690 FORMULA",
 					&board_info_maximus_z690_formula),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX B550-E GAMING",
-- 
2.52.0

