Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C557F6
	for <linux-hwmon@vger.kernel.org>; Wed, 31 Jan 2024 00:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706662746; cv=none; b=KleYC2E+pQxWwplzV055cc+nUe4lLXHJCKvjJfpIAu1BTwu3ceonTBLxWtI4h2OBesqj8kot07LxQROi4QJ6/fflWjlJiV7vrURTLEdyTg9proe6aIkEjamXxEFQZzdAh1m2lAyNhoQQjeYUovUN7j93W4mzenn2srNoyaB57wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706662746; c=relaxed/simple;
	bh=NyWQpZvyfXiQ1pPODvzBA3Cchx9hEFuF35X+qnan0xU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=mYW4WN+quLjkGc99UMb4DvPugj5IbvozdYR2N3lYx3ndSLoLXZsIFlwnzpAI0PA2R2f4fRflzUQEy/kQ/LTWUJYul8JBHrLdMbQ37kaVSC/VTwJRIvnlkRk9MbpbzvGfM8vSnnsh6CyPlV4IyF/PzKQFhyvWT2MW1juoOpu9z+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net; spf=pass smtp.mailfrom=iwanders.net; dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b=Jo8YtHRH; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="Jo8YtHRH"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-68c4fb9e7daso12885396d6.3
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Jan 2024 16:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1706662742; x=1707267542; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BGbVVWmzCS/qQW3OOIkbvYCslK4QZ0cY8oAxDb26lic=;
        b=Jo8YtHRHhNxNI4pom7MaF6nQYJcgjwqwyjhylKjLvNnweaQSVdK8U5eIrvCq7CIpXD
         zvVwrkNAgRfrkZmcPFrFioxwGh74LHm/skF388PFcX4MKVJ5VAsKHuiMY7qiCP4N44N5
         wN4AfrwXLQaWo2fEzB6azimVTO0TP0kUtAWxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706662742; x=1707267542;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BGbVVWmzCS/qQW3OOIkbvYCslK4QZ0cY8oAxDb26lic=;
        b=WADF1OJh8Y6aatThRC7AaiQo/9SQBFG/hRcPRDjYusso/31PkHMiUsLmg+zN4bMjSp
         kWM8Z3ppXUGOhA7bnrhmtmVcS/ZN05YZXD/qdtZ6uDv7e5NXhPF0rc+tRMJadRkMu0kK
         VVGSh4ddbLYy85aI03lOQpNvqXSOFfzAuvy6WDINb8J8ZTeCBbzkZlbx5CBOOje3/d2S
         DrfDovdiYd23mxXohGNd4y1SEDkgL4hwN26+51LtLxUetnVtf7GcBgxvdUhbnqpR65Bz
         BfCh3EOwHAkYEk+3hZFTVcBnbbo6Upabfk91DQ00r3+187+vtXzD4ybomKdyQfYOteYB
         Emrg==
X-Gm-Message-State: AOJu0YwFG/lt0JOAaVNFbASnKIdGD8c6a0p0x5JKbk/mMqYCVIFd4Yb/
	koBsrbFwr/4jW8fQ9P+sp09/mmvpxtJnS6ISXrFPmecqFsxJPksK2iHX0cs23CY=
X-Google-Smtp-Source: AGHT+IFTwSrfJqR+7Jmkta8hOZECRvc6kWaFJAi00qGGfQmJ5ZyhKGPk8OaRHjxJ5EoI5ngLZw9LYg==
X-Received: by 2002:a05:6214:20c1:b0:68c:5e0d:6a23 with SMTP id 1-20020a05621420c100b0068c5e0d6a23mr237795qve.34.1706662742669;
        Tue, 30 Jan 2024 16:59:02 -0800 (PST)
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id ld27-20020a056214419b00b006869e0eed00sm4969090qvb.26.2024.01.30.16.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 16:59:02 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	Ivor Wanders <ivor@iwanders.net>,
	Hans de Goede <hdegoede@redhat.com>,
	Mark Gross <markgross@kernel.org>
Cc: linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v5 2/2] platform/surface: aggregator_registry: add entry for fan speed
Date: Tue, 30 Jan 2024 19:58:56 -0500
Message-Id: <20240131005856.10180-3-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240131005856.10180-1-ivor@iwanders.net>
References: <20240131005856.10180-1-ivor@iwanders.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Add an entry for the fan speed function.
Add this new entry to the Surface Pro 9 group.

Signed-off-by: Ivor Wanders <ivor@iwanders.net>
Link: https://github.com/linux-surface/kernel/pull/144
Reviewed-by: Maximilian Luz <luzmaximilian@gmail.com>
---
Changes in v5:
  - No changes in this patch.
Changes in v4:
  - No changes in this patch.
Changes in v3:
  - No changes in this patch.
Changes in v2:
  - No changes in this patch.
---
 drivers/platform/surface/surface_aggregator_registry.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
index aeb3feae4..035d6b410 100644
--- a/drivers/platform/surface/surface_aggregator_registry.c
+++ b/drivers/platform/surface/surface_aggregator_registry.c
@@ -74,6 +74,12 @@ static const struct software_node ssam_node_tmp_pprof = {
 	.parent = &ssam_node_root,
 };
 
+/* Fan speed function. */
+static const struct software_node ssam_node_fan_speed = {
+	.name = "ssam:01:05:01:01:01",
+	.parent = &ssam_node_root,
+};
+
 /* Tablet-mode switch via KIP subsystem. */
 static const struct software_node ssam_node_kip_tablet_switch = {
 	.name = "ssam:01:0e:01:00:01",
@@ -305,6 +311,7 @@ static const struct software_node *ssam_node_group_sp9[] = {
 	&ssam_node_bat_ac,
 	&ssam_node_bat_main,
 	&ssam_node_tmp_pprof,
+	&ssam_node_fan_speed,
 	&ssam_node_pos_tablet_switch,
 	&ssam_node_hid_kip_keyboard,
 	&ssam_node_hid_kip_penstash,
-- 
2.17.1

