Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F3D263F44
	for <linux-hwmon@vger.kernel.org>; Wed, 16 Sep 2026 00:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789518581; cv=none; b=CvAM4ZvENXx8U2iSclMCBK/+19L0l3RI/10VDiU+Q92i0mnJIWhYJN7SywS3SZdvwmqJN4NrBnke1BYXqsIyPWqTraaXSKoAlj0j7lT3z/dW0TLe6E6DPjWfwmImlv2Zs6nai0l3M4Vm9xFClZAgPgH/WOcim+d96aJU+70nAjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789518581; c=relaxed/simple;
	bh=JEOTKt0Dzx91mkjXhhoaM6TgD5HWgwbpqOYkcuSDjUY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uh4QDrc45Y0wmio3ZOQTv8L4SDBFO8g3E8NNoy9hBpJGkfGaHiKG8JTJdwc+xodGDffKze5Juo0gzMm/CofD0VndGQeyNFsknASD4ENKs18KsFPpGlSpQcTV1HznPRpA66uU/Ydavmf6BS7l5KqujDeMaD/mRu4N86b0Hw+VCFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=chU+HpyG; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="chU+HpyG"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3920so2533665e9.1
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Sep 2026 17:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789518578; x=1790123378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tKqlv/hz08xj9ZVfIOS5h1evGtqTWLQkw0YhrEDSCJE=;
        b=chU+HpyGozVf+AmQCHe8U1B+ejDkeOJcbAiofWsDeOrUEjM7bXEX5QIa/ywBMDkD27
         arFMwBACvIpOaLkozOzxdBp9fSidmJNowzup4y0wYRZw63JlyT2cuUf4Trqpp6K07+9Y
         pArPQsSM0YLORK1HDTdVQCVv8As+34X2u3Jx+roxOZoOlAcYgBbyz3Y1B5UkyHxFto5t
         tx38SgPjNg7HVgOtT0Rc0hoC77Dmoa2nE0GEKr1QxpLY1Q86/HzFVYizUUQhlI9T33/3
         e3D2EjsPBNMrmIJ7HWs1wLX2ahGqW5DPV1du3xLXIFaWPzniYwzUIqxgdDMRHoMwwLyL
         MH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789518578; x=1790123378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKqlv/hz08xj9ZVfIOS5h1evGtqTWLQkw0YhrEDSCJE=;
        b=E0jq0HZaDUZyA7uDNTb6iED1MTKy2aLo110j0shVrK0k+AHpVcjagQoeKfiv7U5lP7
         ee1GzrtDYlYmS/KL+ynjcAmvNtzmlxaABcfvmEXc+6ExR1UZ8Pty1BOblKD1pSGRraYW
         pQylsuMU9wdv0H4CQ5iaJrqZJhYj3wWQyDohVuV7ufjQzlWmhnf8G2LfdH0wrs9qb47B
         1ZcG2Z8WRCuZsTL+YwCENiQ23rGSDk+BdN8R7mT03WBV3N7gDGE7HLtAVlhwV3oXhufB
         T5aG6h3iv6jP7Rrdx+8hWkwdQt0KKq/LR9Eld7nBswRHq1TVph5vDKj7rjw6r6G/g+VT
         l7Tg==
X-Gm-Message-State: AFuF++lJZ706Gc2seYD0W9NXAeH/x4Qi0QhJ3UppS/r9MsCoDTwD5yOw
	fcYmfymmEnsKlCjwhDWzHhA2cCTWHmFMVZOeNHV4IYFI8qGgFfK3nauytZNRh8qi
X-Gm-Gg: AYBFou0ymXLk/B6of4ksqUHRhmyZpQJF2HP3Y5iQd1xZNKkmxdeN+u42jzNaCdDrdOQ
	WzZxzoio9JG1mpYu44hAb6QBz6NtgE3bTRpSKRWW4NT/rMf+eu8lArPUZt+5jJJ7Opw39zyGg5u
	Eh3GS8oTGsrOH92zpdkTd6R2gOIJizm4q/McE+i9a5iUPadKNhNxZlQX1R/E+8ORYlMWFTAwGq6
	luqxvZk156QSjkdUnRt1CRHRSmV58XhxFpYWdJLgBRCoDNuvawKU1lh2JqAdg3gW53iIeTTRqeN
	Or5sFNMU2HMPnuFRTI5IHEuBqG3aOI8Bi6PpNMBKDGGm6zBYypjAol/m++pliBlTinxmiNme3AL
	M90kZk1gcpxRrS4b/JcviaqS/f6uWJ2K5kzAwJITjbqvd589GuYGVJeNdR5CEwPoHER5E30yF5w
	Fecg9bEZFQdNQrcqgxWTjHtoqBw8T5Ays1oC+SzKzL9M1PRZ+SlzAjH0IIMstxlxcy3g5bkNgL1
	S58I8DCi1WHUD0cOtUZ1CUiqyLPOPTOwrfJ7dOA/h7G4uNuGs5a
X-Received: by 2002:a05:600c:1f83:b0:49c:c96a:d36b with SMTP id 5b1f17b1804b1-49eb7306966mr4213945e9.12.1789518578208;
        Tue, 15 Sep 2026 17:29:38 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83da99b7sm29827395e9.10.2026.09.15.17.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 17:29:37 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: James Seo <james@equiv.tech>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] hwmon: (hp-wmi-sensors) Fix use-after-free in fungible_show()
Date: Wed, 16 Sep 2026 05:29:26 +0500
Message-ID: <20260916002926.161595-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nsensor->current_state is dynamically replaced as the sensor's state
changes. update_numeric_sensor_from_wobj() does this by freeing the
old string and installing a new one:

	if (strcmp(trimmed, nsensor->current_state)) {
		new_string = hp_wmi_strdup(dev, trimmed);
		if (new_string) {
			devm_kfree(dev, nsensor->current_state);
			nsensor->current_state = new_string;
		}
	}

This function is only ever called from hp_wmi_update_info() while
state->lock is held, so the free-and-replace itself is properly
serialized against concurrent updates.

fungible_show(), however, reads the same pointer after the lock has
already been dropped:

	err = hp_wmi_update_info(state, info);
	if (err)
		return err;

	switch (prop) {
	...
	case HP_WMI_PROPERTY_CURRENT_STATE:
		seq_printf(seqf, "%s\n", nsensor->current_state);
		break;

hp_wmi_update_info() takes state->lock internally and releases it
before returning, so by the time fungible_show() dereferences
nsensor->current_state in seq_printf(), no lock is held. Two
processes reading a sensor's current_state debugfs entry at
overlapping times (or one reading it while another read of the same
sensor triggers a refresh) can race: one thread's seq_printf() can
be part-way through printing the string at the moment another
thread's call into update_numeric_sensor_from_wobj() frees it with
devm_kfree() and installs a new pointer, causing a use-after-free
read.

Take state->lock around the read in fungible_show() as well, so it
can never run concurrently with the free-and-replace in
update_numeric_sensor_from_wobj().

Fixes: 23902f98f8d4 ("hwmon: add HP WMI Sensors driver")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/hwmon/hp-wmi-sensors.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/hwmon/hp-wmi-sensors.c b/drivers/hwmon/hp-wmi-sensors.c
index 03c684b..55aee16 100644
--- a/drivers/hwmon/hp-wmi-sensors.c
+++ b/drivers/hwmon/hp-wmi-sensors.c
@@ -1247,7 +1247,9 @@ static int fungible_show(struct seq_file *seqf, enum hp_wmi_property prop)
 		break;
 
 	case HP_WMI_PROPERTY_CURRENT_STATE:
+		mutex_lock(&state->lock);
 		seq_printf(seqf, "%s\n", nsensor->current_state);
+		mutex_unlock(&state->lock);
 		break;
 
 	case HP_WMI_PROPERTY_UNIT_MODIFIER:
-- 
2.43.0

