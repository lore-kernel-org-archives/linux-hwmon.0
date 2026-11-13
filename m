Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.105.40.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555894;
	b=4O7dLglG7qDOCeprL4ah338kLswwPuA+KNrmmNlZdkG2N6TLB3X74pGyn8objyUTRzJN
	 hA+CDQiNJ+UudIaafwuEhn/9Zig1itiVexOiWiaaCQ3K2U08CRRtxcUAyb3kSrEfJsA+G
	 emfdDk/kcgSOLyC/i/zTJ6h/go+BVC+RkZtDiCBabRI3lVdOjmprxJi0iDwnINWSNYv24
	 ysowGcCA81hh39xJdiH/sU4Xa96hfR43IcD2QQiU9cdSP6BjOys6NX738pifQyo81PPua
	 UmN4kVs+QMk+Ss3sxw0z00dWsuWFxnt6TLOLgYLXX/vG2OgPJCLSUv6CxhJwd1eDHpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555894;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=KaTTHc3w8R6rF7gqqWlw2mFxpaUpNPS0l+rvQI9X3UA=;
	b=a4t1IGZNuBM397BUn0/045WK1rZ+Qs7V1dllvDXbdswsbH//72cYjVSVFHSBQJfnelfH
	 1h+mQKXRsPn6/5np07beoHNi3z62W6Bli5CLF4ja7N4RV9DXqf8vzcuaq1yOHlaCkT8NA
	 bkOctG3Q7hrVOspMuUmiBv8F3zSKgjw58RhFptN1i2YXwt3jpF891bdxIA2nU5iG++MsL
	 5yaFc2viITjFmIdICje4+vtJe0fDJz/99bVdwUYXDSAjtnHjbXyuK6J/srYd+n4b8hK1G
	 dRwfXODrQmfyVCscmkblIBvI8Z6DcsHonzwvgMLA5rd5hXrkWw2pbPYTYAIBeeOJ4Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b="Wm8/urQe";
	arc=none smtp.remote-ip=46.105.40.108
Received: from 3.mo583.mail-out.ovh.net (3.mo583.mail-out.ovh.net [46.105.40.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54650606A32A
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2026 07:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54650606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=Wm8/urQe
Received: from director8.ghost.mail-out.ovh.net (unknown [10.110.54.164])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4jQq6639xwz62pC
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2026 07:44:46 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-cl275 (unknown [10.108.42.118])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 4B8D9C01BC;
	Fri, 13 Nov 2026 07:44:45 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.109])
	by ghost-submission-7ccd8bbbb6-cl275 with ESMTPSA
	id Hrv+B+u/9mr5jjgAjijQbg:T2
	(envelope-from <filip.golas@3mdeb.com>); Fri, 13 Nov 2026 07:44:45 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-109S0030e054812-a7f2-40ce-adf0-051fe7a7f619,
                    F6EB7A3E9421D9EE3A955D9585EDAC62A977302C) smtp.auth=filip.golas@3mdeb.com
X-OVh-ClientIp:37.47.248.243
From: =?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
To: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
Subject: [PATCH 1/3] platform/x86: dasharo-acpi: Extract dasharo_call() from dasharo_read_channel()
Date: Fri, 13 Nov 2026 08:43:45 +0100
Message-ID: <20261113074347.2301465-2-filip.golas@3mdeb.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113074347.2301465-1-filip.golas@3mdeb.com>
References: <20261113074347.2301465-1-filip.golas@3mdeb.com>
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
x-ovh-tracer-id: 13829991506800209903
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFlXx8+5JEVtbgskvn0mQwqwMiiUHVSJhKYYHJKacS3OogXmGYQzZSvElqTpv7MA26TfMZE1aPnucRMMWpnPSw7cwpUpV9rYonc9FqEtY61eI5P65EfaAQB/GOcsu7ZjW2myG0aC1gnunV1nnjJBGnnAsK0TkmGoLJIuPsr4F4fA2qwl88bGdgsMxS7EVKZg43uq6VXwrzV2kFOSXfG7oTtmCSoBgXxZoCX4RzDSQ9QvszATqN7V42JtdM/TvGtGIkflSyaaIIY+NgpBUKDrAdUM3dRwZpsTnxNDPnyiOSSBb0tAL7kcmZZYphQ1Sf8nd69ZMtjv5V27+oqMmiRpQ/8jOt1n7sbLMs2qor+TUW0oxda2Ayu4DRwm6GHCf4TJ0aaslkzcmCicRbbr7THJTIBTomkLO2qGG/Q6QNU9Xe4VZS0mEBMAr9QCXypy5QKlyLdyNENNXSd08VKzDFznzDHAKq0Wq1jmY8/BSSOGem0/PRkoXetAxQc+4EPG9O0dCRwhNUl98SrgqwL2kVYjNSQ8mOdfvGe5wZHVB9IWX6irXVoQjwIjFX+1r/RYyX26t1hr0sP9B1NnSVKDhEc2K8bqZi73zrGYOHi+xfIm4lZWY8rGe2tnM6JilVfj51Wc+87dmV4F2+X93Lr2saw3leEiC0QAOM4uKZf6hTPwvwztA
DKIM-Signature: a=rsa-sha256; bh=KaTTHc3w8R6rF7gqqWlw2mFxpaUpNPS0l+rvQI9X3UA=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1794555886; v=1;
 b=Wm8/urQebOGxivJXPn87IKUjBmkg82NhnYQIGZWgXa34yBrzSrRxO9ZnZWVKxFsj1HP1lNmS
 XHpYCnB/4vs4I2ZmobO3+G6xNHcGTfW5Agk2dALbBqJAbj+0lFJYKquVBVrdUtnCLCO7GgiKQnW
 4zNIPlREhpghsreEl8YoxdCX6S+b0lJ96JMiLON4RusPpLddISzHXWkd4ltpLdiH7OQvEg9zV41
 FmVhP4kdr7tviKKb3BIOK91JSk+WdwNMrxNoXKq3xwqP1BChRnf82xMenm629QdEG/aTvunRZRg
 TStYrARB1jAiXx0tNwqxbykWG3isAYSqPU1xMckLrJIBA==

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

