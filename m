Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4122D2652B6;
	Tue,  3 Feb 2026 16:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770136484; cv=none; b=Q4EUn+W+YlgdQpKS8sxt2i5bIzV+Sv0lLjSDYw20mAyMfF+1/NBfI83tYz6UejM4Sk9yhTgba3PvH/JO0QNw/8Fb0VlzCvT6PEdAtDo4Dotd7wzvr2GQapU2ELSbJSxqXUbY8wDN0KPSGSzgPb+SIjFbo1KORHK+BLuTAjpuQ0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770136484; c=relaxed/simple;
	bh=2pgCjptzypBu9AJU7hIrDI4zuQWJmmZgNidCA0aJ7sc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HvSuP3Skr2ls8JviW1lri9Y8YKMXkh/5ar52BLviodfhpaGqP+9pZn6TtZPDjyS/OSzEeLpsKM6L23mxjvef6VjLTGtezF3NQ3a//W9XPyQmOw6LDRtathWsdz8ZTirwKuQXxW3gESooY4DzZ1BgV6ISW79wKAsw22Kt5i51o58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lTRogpeg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lTRogpeg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E48C116D0;
	Tue,  3 Feb 2026 16:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770136484;
	bh=2pgCjptzypBu9AJU7hIrDI4zuQWJmmZgNidCA0aJ7sc=;
	h=From:To:Cc:Subject:Date:From;
	b=lTRogpegVRS8Iiyz/3f/CqfTpE+7Z18XX+dP7AGGN+mEBb9UMZJ+81qN9kGg5RW9L
	 mM9NdDr8poTJPXCZRhQTPi4m9cRlQW6MZG5XJUSItI9D6M6BP3o4gjyDxLj2Nwewe2
	 0b9GZfEUuxsToQxivae9jWdJvLiLLqqCaZZtNhhvO7aptxVV+y3OyX32P5JC2lYgEz
	 ggJ0phttqtURqmtW6d++KvFIGA2UwXticB+Qg6lsIb00Znk2HZ3EE82BWi4/eMGYrh
	 JGkabbjW3NoVnkxakN5ODsTJ4zA6Fz8ikKhyy8SfQ9p/2JRcftDxoVuXjzyODumPoX
	 gkX+8uqqxNF2A==
From: Arnd Bergmann <arnd@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: (occ) Mark occ_init_attribute() as __printf
Date: Tue,  3 Feb 2026 17:34:36 +0100
Message-Id: <20260203163440.2674340-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

This is a printf-style function, which gcc -Werror=suggest-attribute=format
correctly points out:

drivers/hwmon/occ/common.c: In function 'occ_init_attribute':
drivers/hwmon/occ/common.c:761:9: error: function 'occ_init_attribute' might be a candidate for 'gnu_printf' format attribute [-Werror=suggest-attribute=format]

Add the attribute to avoid this warning and ensure any incorrect
format strings are detected here.

Fixes: 744c2fe950e9 ("hwmon: (occ) Rework attribute registration for stack usage")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/hwmon/occ/common.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index b3694a4209b9..89928d38831b 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -749,6 +749,7 @@ static ssize_t occ_show_extended(struct device *dev,
  * are dynamically allocated, we cannot use the existing kernel macros which
  * stringify the name argument.
  */
+__printf(7, 8)
 static void occ_init_attribute(struct occ_attribute *attr, int mode,
 	ssize_t (*show)(struct device *dev, struct device_attribute *attr, char *buf),
 	ssize_t (*store)(struct device *dev, struct device_attribute *attr,
-- 
2.39.5

