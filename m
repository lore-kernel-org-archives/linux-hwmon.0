Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=87.98.150.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765532;
	b=iIOXnpdKHSoa1pYmYq3puEt+QVR/bwkNaT9ai0MwqiFAOACOmJvD+N6BIW1jXIwicg9C
	 hYenp9V8jG47EjJHmTrQyiDhQB1yP0ZumnPUi3V5/2TGqwVTWxfA6N1h5X5mW2Gwt7V0C
	 rStLiAoFk90Nbk/i++uMG7DzYO0WRF9RmdLTJ3duIf4R/LQQPmXJ5Sqo6HCBgPyl0819W
	 x0Q0kZR2as3i7DfwEaBBkmDfnC2PJ5fVgYqOcERc5/d4xONrnak3IMkjmjQOrFm59r+uv
	 heL3F70egLiFPuPWz24gHSRUyADIVvcZd1jJe1ac0v4SynueDPM9WUJy0J5jGQvydkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765532;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=KaTTHc3w8R6rF7gqqWlw2mFxpaUpNPS0l+rvQI9X3UA=;
	b=S8Pnox068QLvul+1njw7NXcisqdIVTNquJgw19zp+2QyNoU+SQfTCPKd2Wm+HRgg5Pnd
	 FNLBY9RwaXRlDXO9O8q6CM+Zlm0158i4f0x9+Pwk4qr9Yo0S2+YAPv8ampAtz1GmZmihL
	 Mb5P6vOuChEGHG5deg8AlHlMfSJnOtu+LmIYzSpKP0s9UJ9jcGgb7M9uR9iNBUSf0X//i
	 S2CyL4Jt6C7Xkf/cviXrYzi51ojLSMUMzlacunkciYL/TRx0FPDm163lD25gQHN8RmcaO
	 Sdi7BvKV8QjrfnKzhZ+qVp89NTjOg5LXBMnG82Dm1hLogCpM0aUKEGBuh9m7H9ExVZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=SD07hBlE;
	arc=none smtp.remote-ip=87.98.150.177
Received: from 15.mo561.mail-out.ovh.net (15.mo561.mail-out.ovh.net [87.98.150.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68538606A324
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 07:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68538606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=SD07hBlE
Received: from director9.ghost.mail-out.ovh.net (unknown [10.110.54.182])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4jbQSN299fz61cD
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 07:45:24 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-dkqtv (unknown [10.111.182.117])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B428D81F60;
	Fri, 27 Nov 2026 07:45:23 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.108])
	by ghost-submission-7ccd8bbbb6-dkqtv with ESMTPSA
	id +aujBBI1CWsizRQAjZbTUQ:T2
	(envelope-from <filip.golas@3mdeb.com>); Fri, 27 Nov 2026 07:45:23 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-108S0023c8104ad-fab3-46ab-a4a8-ad0a9e56bc9d,
                    2D78F170DE5B25267C595F1CD7CE4558A7ADEF44) smtp.auth=filip.golas@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: =?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
To: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
Subject: [PATCH v3 1/3] platform/x86: dasharo-acpi: Extract dasharo_call() from dasharo_read_channel()
Date: Fri, 27 Nov 2026 08:45:16 +0100
Message-ID: <20261127074518.3244152-2-filip.golas@3mdeb.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127074518.3244152-1-filip.golas@3mdeb.com>
References: <20261127074518.3244152-1-filip.golas@3mdeb.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 3824681987527536623
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTE3aoIt9ZbT9+ThQKh2A4MdYGWex/GSt+Rp12USAIE6G6DBzatBv/M83d6W/OnIX3mxwK72pSip8x3QuWgUHV5qjHbrkRpWVdUV9qoAgZ8a2eejD/lenMXheNlZBCKi6Fy2fWj9kj5YpyHMYRXt8w1/BqJsUAbeV+nxVlWISB+Z/XYm3TT2RuKqVRippYrLodcFhtWj0oj/1Z0K3J8lTZVP/WKvi+epIyqr6HIWNUEWfGoC+ApCytv2L+OtVFIC3Pe7Ywqaxa7IrM7oDik89E60RJM3HqWG4jJWani2BYbirfA1XKS/HMYp+GzdAy7pTmoqOjJeSiULBJk710UwRLPIqTD+izOCjEN34QOowPYwYiDrzaOUWOPWVfHvrasczhtUXH/XLUeV3wCx46ctFF8UGrBVbVQpOA2Wk8onLdOrDEYUfERHZaLZc6o64BN5ShmOdNE4KBm1+7nPyk3VT1EnkJUbJILlc5Qe4t65zN9P7LkiYYFbrWV+MlePv5oYNF1bix1uoX1HrrdQke3yqM7iryVUrWayPqYpJTaZSrl38eNyRKdHevEf6q1Sr5+p2BhCIRQnOlWaobI6vjsr5SbGLvacGT0Yx5N43MsdnqWTcYsbOtDtnFqRjOoNKa6EUayvjqRsVFqKpselMQtjQ7wg8A4oCbMvP4jG6fO2+E4dhQ
DKIM-Signature: a=rsa-sha256; bh=KaTTHc3w8R6rF7gqqWlw2mFxpaUpNPS0l+rvQI9X3UA=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1795765524; v=1;
 b=SD07hBlEvLl/dVFROi93mP4OaJDiFwCZTjuPpJxlCmxtjSfWX5ehZR+M0+sEBos1aecmeM1y
 KcSVC5YQT4GGFLY1eVtwMqCU+/WpgPfBpi2Xr7MJtUnVgQzp4cMtYH4Uuco+gKUqoQjZKyMB4Ii
 tRmWHHFV77SeW1ac/5Lkr1C0fEgz71HcAcbhYv5r9X7zhBjxhPReO6dV051TJkZK9RHYw0vnWcJ
 o72ceTU1tZ2/SjEetfJk0aXODAypdlaqKh/83gPvcDlZhZkZaM+w4x3CLCktKIz6cL/kjS7xQBq
 EmPf759vC64k/klImU7Ybj5layLOBuoG6WJMbpkZ/tHFA==

Move the ACPI method evaluation out of dasharo_read_channel() into a new
dasharo_call() helper, which additionally accepts up to two extra integer
arguments after the channel's group and index. This allows the upcoming
write and fan curve support to reuse the same code path.

No functional change intended.

Signed-off-by: Filip Gołaś <filip.golas@3mdeb.com>
---
 drivers/platform/x86/dasharo-acpi.c | 40 +++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/dasharo-acpi.c b/drivers/platform/x86/dasharo-acpi.c
index dfea00cdde18..13d97eb43511 100644
--- a/drivers/platform/x86/dasharo-acpi.c
+++ b/drivers/platform/x86/dasharo-acpi.c
@@ -93,13 +93,18 @@ static int dasharo_get_feature_cap_count(struct dasharo_data *data, enum dasharo
 	return count;
 }
 
-static int dasharo_read_channel(struct dasharo_data *data, char *method, enum dasharo_feature feat, int channel, long *value)
+/*
+ * Evaluate a DASH method taking the group and index of a channel, followed by
+ * up to two more integer arguments, and returning an integer.
+ */
+static int dasharo_call(struct dasharo_data *data, const char *method, enum dasharo_feature feat,
+			int channel, const u64 *args, unsigned int n_args, u64 *ret)
 {
 	struct acpi_object_list obj_list;
-	union acpi_object obj[2];
+	union acpi_object obj[4];
 	acpi_handle handle;
 	acpi_status status;
-	u64 val;
+	unsigned int i;
 
 	if (feat >= ARRAY_SIZE(data->capabilities))
 		return -EINVAL;
@@ -107,20 +112,35 @@ static int dasharo_read_channel(struct dasharo_data *data, char *method, enum da
 	if (channel >= data->caps_found[feat])
 		return -EINVAL;
 
+	if (n_args > ARRAY_SIZE(obj) - 2) // 2 fixed args always at obj[0] and obj[1]
+		return -EINVAL;
+
 	obj[0].type = ACPI_TYPE_INTEGER;
 	obj[0].integer.value = data->capabilities[feat][channel].group;
 	obj[1].type = ACPI_TYPE_INTEGER;
 	obj[1].integer.value = data->capabilities[feat][channel].index;
-	obj_list.count = 2;
-	obj_list.pointer = &obj[0];
+	for (i = 0; i < n_args; ++i) {
+		obj[2 + i].type = ACPI_TYPE_INTEGER;
+		obj[2 + i].integer.value = args[i];
+	}
+	obj_list.count = 2 + n_args;
+	obj_list.pointer = obj;
 
 	handle = ACPI_HANDLE(&data->pdev->dev);
-	status = acpi_evaluate_integer(handle, method, &obj_list, &val);
-	if (ACPI_FAILURE(status))
-		return -ENODEV;
+	status = acpi_evaluate_integer(handle, (acpi_string)method, &obj_list, ret);
+	return ACPI_FAILURE(status) ? -ENODEV : 0;
+}
 
-	*value = val;
-	return 0;
+static int dasharo_read_channel(struct dasharo_data *data, const char *method,
+				enum dasharo_feature feat, int channel, long *value)
+{
+	u64 val;
+	int ret;
+
+	ret = dasharo_call(data, method, feat, channel, NULL, 0, &val);
+	if (!ret)
+		*value = val;
+	return ret;
 }
 
 static int dasharo_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
-- 
2.56.0

