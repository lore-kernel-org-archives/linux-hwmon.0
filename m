Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CD715539A
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Oct 2025 18:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759431020; cv=none; b=KMvzQXoyaptF4n4D6XFuj4+g1masehPWHrh/j+1nlITixHuTsiYELrr8ktiOkMzCbhE8FzN3X6opLGbJ4VrCvdFr0GxHHY9ZCxzFcs7OJphwO+iPOdQmyWqHY5g8+a+66uPXAKQsvJbnukMc1XGP1LmEYiiaQDH1hJdC+oFnwnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759431020; c=relaxed/simple;
	bh=+5m+4sgTII4yCZaAet+Qp+1LoGf9H06zjUeyc9Iv/fM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QpNS5VswPHfg6gwhDyPiZkzKqLvDTHq09RBhQ745Jq5Pgs/jFmB5OMpI9ER+7V021F+sLZl294UTKY7fJZoFXxfWRg3ay2v+wqQD+gB28vxcbU8aCihhnOy/L8y2X4h5JlxYG4K14BdVRKPqd/tFPALOMiJLZtaqwxjbKL75gKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJ36Cb1L; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJ36Cb1L"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3ee1221ceaaso938890f8f.3
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Oct 2025 11:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759431017; x=1760035817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+dRh7hUJcZfRa3tzyKlaq5YbJA/Dgq6bx57UbBqN/vc=;
        b=TJ36Cb1LUztBgvb+g9Yf/pHev1/35FtFS5DlsDFTfyEc6kjPRr8CLdh/+KOnjGc7mA
         ZmJ7XJ52ODB25cI/e5gb2NCf/940mKwrW0+678y+wQ/hbooOl+3teK0BWsZpLZGoV+tN
         31hXBpCkmHY0H9Feo5QJDYdskdQVMas9lR635J8K/Y2Fvf4Z/YO03fi8cAYAKl06NtZh
         i+qUlx+FQZ6mlEFLedRL3jkSyoe9DbiMsvam/6IPD7Gk/bQKE3zL+yYmQ0c4KvRIh/gu
         sSf3egzuBNN08ZshP9aWdtLuZsMOajtdhPLoYFxO8zJx7cO8ao8rree/KM/2wBEVLPvr
         FbXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759431017; x=1760035817;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+dRh7hUJcZfRa3tzyKlaq5YbJA/Dgq6bx57UbBqN/vc=;
        b=BWPq0vw96tC0A7sHnX0rdJNJ3JlrUb/uH9qBrOykwHJRLkcbU0engTZvfTK1Bk7iQk
         BV+r1+WJcUbqo7vlIQ0MXUYLz9+IeIU4ia1FeWE7VLsPRMEVm/lSSi9OjPjnhiEpaAOf
         1rcRYQ/xURttOMfh2YxJHj1EPV0+OsG17j/Dy60H9XeLnKwvqbcNtlp7OsrgLpbb2FcM
         7QkUPt6Z9E3EOo/O9YbCYlFAVRhLjhOgIyl123KxSK4IyUoXXzkztTeLT7hQrSxeClnc
         Yabh0BHfPCxAAMbQ2fbAjZMgjBoI80SHJ3MkzRTo5WT4pqL1OSJ8tbe7yFoWqJ5vFfvp
         0YWw==
X-Forwarded-Encrypted: i=1; AJvYcCWykVIKKeVzUVo8apYQk1ElX/JLKWi8oJmappIquvogFOMfYXzpIvKmvxHvsB7kY7YeLTmE6a/3KYNnLw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk4K2VEUI97Oa6ZJ37RqmG4LaHeuh2ONS/ZyRMj2UA9qmm1QA2
	bw74jOTFaorS0Uq0DfBPBG0sT3A4UKWgQ4eMI7IKiCr7UVNJnjop1emA1VqqZQ==
X-Gm-Gg: ASbGncsdBCTP7FoPuOLRfc1GjObfvkRd0z1AeuolZB6jJy0wQ4qGrH1EaLfMDOz+z17
	Xs46QYYZan+pusGobhtkmDC024CzjGMoVFdxvcyp8e+E2U9mxRJ/OBeBw1az+hSbFWl2jTmkmGf
	ouxT/TFTqd65cNF8Jqj06nJg2A+30V+2MGjXy71whzdIBqzlWgLCQbllo5h5RnTQNjamyXcRbfA
	4AvZauFyT8bKB19ggwMkOdvsgeQ8uWX/xJL2rnuJ+gbkCxG6bgIic22PgRbV5Mk7WKnFEL7CTX2
	A83MvwgNkUcZi6+r0UmXysNTQANEECseR4sD/IXzWC+89ib6WWsHdkXAM+GTq1IuvLML6KlKzVq
	qUO7+A3KqerVikiqUlQiqBkkcILWMSa/ngxtbyVOmA3FzLY14u2GfUoqteOineQN1pi5h41jtdQ
	==
X-Google-Smtp-Source: AGHT+IG0f8mpS6OQkJvra3BO7swBfZy5YCzRMfDwUCKFbpOkGl9skRSpnUpMfSkKZCiALKsmjFPRzg==
X-Received: by 2002:a05:6000:24c6:b0:3fa:ebaf:4c3e with SMTP id ffacd0b85a97d-425671b3081mr219050f8f.54.1759431016524;
        Thu, 02 Oct 2025 11:50:16 -0700 (PDT)
Received: from toolbx.fritz.box ([2a02:8071:b783:140:715c:faf0:31ea:b518])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e9780sm4616246f8f.29.2025.10.02.11.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 11:50:15 -0700 (PDT)
From: Maximilian Luz <luzmaximilian@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Maximilian Luz <luzmaximilian@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (nct6775) Add ASUS ROG STRIX X870E-H GAMING WIFI7
Date: Thu,  2 Oct 2025 20:49:56 +0200
Message-ID: <20251002184958.359744-1-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ASUS ROG STRIX X870E-H GAMING WIFI7 has a NCT6799D compatible chip,
which is also accessed via ACPI.

Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
---

I'm not entirely sure if this is strictly necessary. There don't seem to
be any resource conflict warnings as reported on other boards. However,
there is some locking in the DSDT, so I guess it might be overall safer
to just go through ACPI, as it does expose AsusMbSwInterface.
---
 drivers/hwmon/nct6775-platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/nct6775-platform.c b/drivers/hwmon/nct6775-platform.c
index 407945d2cd6a..c3a719aef1ac 100644
--- a/drivers/hwmon/nct6775-platform.c
+++ b/drivers/hwmon/nct6775-platform.c
@@ -1403,6 +1403,7 @@ static const char * const asus_msi_boards[] = {
 	"ROG STRIX X670E-E GAMING WIFI",
 	"ROG STRIX X670E-F GAMING WIFI",
 	"ROG STRIX X670E-I GAMING WIFI",
+	"ROG STRIX X870E-H GAMING WIFI7",
 	"ROG STRIX Z590-A GAMING WIFI",
 	"ROG STRIX Z590-A GAMING WIFI II",
 	"ROG STRIX Z590-E GAMING WIFI",
-- 
2.51.0

