Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34FE258EF9
	for <linux-hwmon@vger.kernel.org>; Wed, 16 Sep 2026 00:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789518566; cv=none; b=Np8fz87FVDjGGb/sA6fLf7mdu1HiW5gCzSvwgXb/jmSA3HLAXkctEPXa7FfFNMX70G8vN+GOhWSQvEtdmCm4m0nRoli57yKF/3LLsf2REvitennSnNr0q7uUStYUvTXyA2NhNKqh7zSSiTCM8FsX/vZBL5+OMUuDl5FZlt8JCYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789518566; c=relaxed/simple;
	bh=p/5oJV7q1FbNiz+/7hDgsnCOP/jEEcdtH/tFny2YVic=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=po59myc1RVYibi5nGrqB+QoOfoliDqbdbiBHvm4Vow3ENTXbQqwgznv6irxxmyWVCI6vEeAj2c1fjGbuGTRh+kM1/oyvlsTsHmEnpJBq8ph4HbwFaTjywJ2KJSpxe06eRWjqLb0wKm2zGF9NmicZG6jbOy9fKUklYk0iPPFzWME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nxq6AqFM; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nxq6AqFM"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so1876955e9.1
        for <linux-hwmon@vger.kernel.org>; Tue, 15 Sep 2026 17:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789518563; x=1790123363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sxA4w87jUv9QABdrf7SXrS6ck3FNWWnv2LyiPXHQ/P4=;
        b=Nxq6AqFMS1CB3+VhPwGu52kxvreB6Ob+uS/gKPgZeSfRwFo3M4WIXlfs79fbYB72nW
         UK9jvwrndtR3HCb+i6CQaP778BbfzZzwrNXuj3MwK5LCVEJEvNX0sg56qhS0/k2br+kM
         DC6IVPQcu1V+zwmC+9NTDs6mHu5XOlF9JxTe90n31A2lrt2NC1tT8kwZ+2m6OKoBoCZN
         8J4EXStFalqzQnA/Q9ry+8BE4YrlN207hE6AUGJgtSZOAn8+JSd/sNhPmrt/HXCpaa5K
         4dzjeRETK/ynqQP+kfHlpkJCuYWb+d7bGJC9e7BgN6356w+q9PhSdpqafe1fgyIKuYFr
         VctA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789518563; x=1790123363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sxA4w87jUv9QABdrf7SXrS6ck3FNWWnv2LyiPXHQ/P4=;
        b=kflE2GY7/LnBIOjakUkK3h9H8vXOeYdnurELeKQ5K0O209Ga49vdi4gZLYb1rxjRZx
         7SFMsfY4Mj45GddqW7+1c+vyQN3AkF+9PA8qVA7VTTWvT++jyJJav34FBVA676ieH5gU
         JTgyJSfPEPEtiDbMGQaaj4nt//uD4MI8DSIzolwZ9LOnlnSVvYmyAY0Ghz2xRwbiM9KG
         56gkX65A/CRPhtBYeTz+XFrlKRFSf1OMcuclHrVR1B3UDlrt8R0NNmRH4dOLauv2HmUS
         2P55HzHLaoIBvOLGUfOmryZVZ4BHH5MoU2UEJCoFFpNtt5sRk/zatkc0bzSCuoqp8SFa
         xKCg==
X-Gm-Message-State: AFuF++k3/orFcLlAjhwIInBe9gwKmezXHCjhbJ8UXAyuo74CI+I6QNPc
	M8aANLdwI/ceEpGEHePZZIMmfngP1ZpMG4sPPRySzavy6WQldqVM9NFF
X-Gm-Gg: AYBFou10/zME/0thHEayNV7rh9/3BpmS8kVYP1QKtDVzPzjwpCEpDDQQdjpv1jhMN4U
	MkoTzZ9CreFPZxZbB0tUaXKQsUfC36M8ekDfLjC0fhn9bzoD2gL9evHAIMzXVIY6JaVdkivLUKW
	YxnMxXo9aMv2/XLjA5N/U4WgueRhcotRWwalXoTry2KuVQXqER8m+8vxe1LilIAyt+nrRz+Aw7J
	Lp+JiKXFBJ0pD1DNeNa2vLnipW8M7Ueah9jsFpHtKF7skwfrKYbWK4xHvWhcpp7KypLfXUDE5Hp
	67Bog9erpUZ05YB+Qgd8fgGjt6cBTGP5MpqPx8XXKFwyaEo4DttBmM8Y1sJkqd/OSvWsDdiFATc
	RSP16LOh9ucBROOr9+fybn2jAyEeqnWFLm34pbiXU/zRNefC3Ktk8yoXu/e5kSpAZUyMY8zvQPx
	xawoiL03YvoZtRsaXRG1mYx2bxdP03/lEorHiiddlhiXcSQVbLIJANvyONLkv/mZN+UhBDIFgRn
	Z8afJvNAiCWkapGnH7ZN1pwY0rBWXnAbCzJdrPwx2c2gGqznc9qwAMPrf8D6w==
X-Received: by 2002:a05:600c:4e86:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-49eb72f3d08mr4275965e9.10.1789518562814;
        Tue, 15 Sep 2026 17:29:22 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf438fbsm2809121f8f.36.2026.09.15.17.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 17:29:22 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: James Seo <james@equiv.tech>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] hwmon: (hp-wmi-sensors) Accept raw WMI strings in numeric sensor properties
Date: Wed, 16 Sep 2026 05:29:07 +0500
Message-ID: <20260916002907.161210-1-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit c9ba59258094 ("hwmon: (hp-wmi-sensors) Fix failure to load on
EliteDesk 800 G6") added support for BIOS-reported WMI strings that
are encoded as a length-prefixed UTF-16 ACPI_TYPE_BUFFER instead of
a plain ACPI_TYPE_STRING. check_wobj(), extract_acpi_value(), and
update_numeric_sensor_from_wobj() were all updated to recognize and
decode this encoding.

check_numeric_sensor_wobj() was missed. It performs its own
independent, stricter type check on every property of a
HPBIOS_BIOSNumericSensor instance:

	type = elements[i].type;
	valid_type = hp_wmi_property_map[prop];
	if (type != valid_type)
		return -EINVAL;

and, separately, on each entry of PossibleStates[]:

	type = elements[++i].type;
	if (type != valid_type)
		return -EINVAL;

Neither site has the ACPI_TYPE_BUFFER exception that check_wobj()
gained. Both populate_numeric_sensor_from_wobj() and
update_numeric_sensor_from_wobj() call check_numeric_sensor_wobj()
first and bail out on its -EINVAL before ever reaching the
buffer-aware code in extract_acpi_value() or the CurrentState
handling added to update_numeric_sensor_from_wobj(). So on any BIOS
that reports Name, Description, OtherSensorType, PossibleStates, or
CurrentState of a numeric sensor as a raw WMI string buffer, probing
that sensor fails outright, and the buffer-decoding path added for
it is unreachable dead code.

Give check_numeric_sensor_wobj() the same is_raw_wmi_string()
exception as check_wobj(), in both the main property loop and the
PossibleStates[] sub-loop.

Fixes: c9ba59258094 ("hwmon: (hp-wmi-sensors) Fix failure to load on EliteDesk 800 G6")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/hwmon/hp-wmi-sensors.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/hp-wmi-sensors.c b/drivers/hwmon/hp-wmi-sensors.c
index 03c684b..a4bb4da 100644
--- a/drivers/hwmon/hp-wmi-sensors.c
+++ b/drivers/hwmon/hp-wmi-sensors.c
@@ -631,8 +631,14 @@ static int check_numeric_sensor_wobj(const union acpi_object *wobj,
 	for (i = 0; i < elem_count && prop <= last_prop; i++, prop++) {
 		type = elements[i].type;
 		valid_type = hp_wmi_property_map[prop];
-		if (type != valid_type)
+		if (type != valid_type) {
+			if (type == ACPI_TYPE_BUFFER &&
+			    valid_type == ACPI_TYPE_STRING &&
+			    is_raw_wmi_string(elements[i].buffer.pointer,
+					      elements[i].buffer.length))
+				continue;
 			return -EINVAL;
+		}
 
 		switch (prop) {
 		case HP_WMI_PROPERTY_OPERATIONAL_STATUS:
@@ -651,8 +657,13 @@ static int check_numeric_sensor_wobj(const union acpi_object *wobj,
 			/* PossibleStates[0] has already been type-checked. */
 			for (j = 0; i + 1 < elem_count && j + 1 < count; j++) {
 				type = elements[++i].type;
-				if (type != valid_type)
+				if (type != valid_type) {
+					if (type == ACPI_TYPE_BUFFER &&
+					    is_raw_wmi_string(elements[i].buffer.pointer,
+							      elements[i].buffer.length))
+						continue;
 					return -EINVAL;
+				}
 			}
 
 			/* Old variant: BaseUnits follows PossibleStates[]. */
-- 
2.43.0

