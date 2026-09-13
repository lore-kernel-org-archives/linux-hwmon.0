Received: from outbound.ms.icloud.com (ms-2002a-snip4-2.eps.apple.com [57.103.74.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00A54BEE52
	for <linux-hwmon@vger.kernel.org>; Sun, 13 Sep 2026 11:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.74.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789299029; cv=none; b=Tcv6GZpN2gEGhg4W7+3G+1qk+9KGtG0YgUfr0l6LCt5G46JVcxQFvEbqL3PWZCf8Kf1aTEiDFwvJl0vG/wUwUHROZJhwNsPQm+PTGnObecsrhozo3OWaAzRFmtPB7ZHTK+N14xqjv+AgpPmSqadSwq1Uj482QGdej1dk5/ENx2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789299029; c=relaxed/simple;
	bh=WLPxoVldl9SP+vdH2Xd1XSNenlK3mtdn+uLjt0sOVxY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=abXxy6Kb4O5tHzV2w/5VEsD+55dgt/VZCTH43dE5fM9akLH08t8dzNfh3dTaodvK/vfHyGgjihcan8NjPBm/ATNUPJln8QNPTqVhzK6L4bPKQ9bZnZwgKGHmaHi64UGCL5ibK6POaMXTQCOC10J3nSe61fOMOTWGaKDVFaFH4R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com; spf=pass smtp.mailfrom=me.com; dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b=MZIeKS+i; arc=none smtp.client-ip=57.103.74.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=me.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me.com header.i=@me.com header.b="MZIeKS+i"
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-1 (Postfix) with ESMTPS id C96FA1800108;
	Sun, 13 Sep 2026 11:30:25 +0000 (UTC)
X-ICL-RepId: 01a09a88-6756-71db-9222-77e157a0eb9a
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQhMAUMGWgFeC0odXANcEhVdRUMMQxtXAHkVVkNUBF9QXxwOAFJFUR9UWEEOCl0SGFwUXFBYHkYSVg1dCRkGQV5QG18CQg8cE1YVEx1DGQ8rCEoEQwdFAl4LJRMJU1ZfFRcbXAAXBlsUBEQBXQVdAkkISwJcBVIARRdJAl4OWB9BFAhSGUcOQjBUHR0OWAYMUE0BQwgKAlEcVg1X
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai; t=1789299027; x=1791891027; bh=djagKHZWfxrim0bOjGxl1BoPQbzPhDkm3d94vlpzBVs=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=MZIeKS+i3oFT7DDhtNhMX39TDmcB0qlyEmWpOMoHWZb8IiFTMLMgKFkANG58XJvbOy4lPiAVD3sCPvFSLZUMErncYQLBDKFSgEjMZHvrvxUNj8J7eJwquFDyb5niwbJNKF/kAm2+ukMAoG+HW9LmPIw7A9fwpQzGmHCe0U1ojoo9+S7daW+N40Q6J1XdTMwrNmLxOU9lIoCCEw29TVXPgOjciwkKI38ivPPyQKGeqLqs7BRk9fRhoh843NE0nns6H/1VCkgzJN7oFVoFn/vEZVmlyK5qL7K0adMHe3Ln+VL1n/npC40OemoR/a2W9FF125BjIzVevf2KCxTxgg2Hzg==
Received: from dell-p3650 (unknown [17.156.208.39])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-1 (Postfix) with ESMTPSA id 7FBC6180040B;
	Sun, 13 Sep 2026 11:30:24 +0000 (UTC)
From: Patrick Pepin <patpep@me.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>
Cc: Armin Wolf <W_Armin@gmx.de>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Patrick Pepin <patpep@me.com>
Subject: [PATCH] hwmon: (dell-smm) Add Dell Precision 3650 Tower to fan control whitelist
Date: Sun, 13 Sep 2026 11:29:25 +0000
Message-ID: <20260913112925.11393-1-patpep@me.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=dfONHHXe c=1 sm=1 tr=0 ts=6aa68952
 cx=c_apl:c_pps:t_out a=kRaGL2Q7qLiahLf3O6OaIA==:117
 a=kRaGL2Q7qLiahLf3O6OaIA==:17 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10
 a=-UwBEhI7gGgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=HHGDD-5mAAAA:8
 a=p9pmaAl0BYmgHBKwmQEA:9
X-Proofpoint-ORIG-GUID: OR3MLYpJiKqGe6a2wMo1ULcCluTnc7Mx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDE2NCBTYWx0ZWRfX2Li57ab9HQQN
 Qv4yZ7i8l6M1K0VRDItvhVOzPQi5XN/B6u53JM870RwLlv1EXQVnFkeat3H7bKWn5o9MhkecU9v
 BbQhqSMlI2aZjsewB0LDuJMP25tlbTXYzXb/PM2dp40PIdmwS42K6EqexD+1h6I2lavqg5WJ/JL
 CMGaX8wR/9uofT2ms4BwVwmHQ0g09Blpb3uLgkolV8Lu+X/oRzvllihEXFhHu9L9VxnpCZh3qyv
 5MsLfu8gowfm2JlVSjeURW566d7WjQh4480UTN0ohAV/UzvnMRO2Qnv0mX32UXuvDSgpC9W1z7c
 X7bg9F6y4hQ6NgkOJGJ6qXvS1vEG76GO8qJ9KP41Pa7v7/Ca1n3oyL/znx90r8=
X-Proofpoint-GUID: OR3MLYpJiKqGe6a2wMo1ULcCluTnc7Mx
X-JNJ: AAAAAAAB/YNuWBjePZtGgspKFT3VlVJQY7uhM+9Zc1fdL1ry6d1Y6JMhR+53gHWDrgPZhJa2x3cp2sJcQx5xhHkHJn5cFKpA/6csyFxTqYyBIa1yuJFnfH8KjWapnSuDLa2tOxghFyZBOdvspCg2HE3udhW+JzxZjYLY0vWyUJ9qXQrtSMIqkPgwxBRZhfcMofMKfvSOcWNwEOka630T8wwv0zXPGqJvEJdUgMVgezfUWfh1SpZMtPhUnVt1rAJ9rwiY6Zj++0PfPjU9qIrypRIDd8aAnnL07+4eKUJcabjEswsgFJI7sSXT2tha5MWGXu1jWBHMO2pQc1xvRyxz5nnxMzzXuX5/pKMiTNb28QmmdzX61v04SX+LhxpwsKYwtufGMaH2RQYYN0A2TSWVCLeBJMRptYWy/WWRthlHhjaEeSXJbHbFnOqx1d1EcljYljrM1hjBWh4xUVt+UbRgCnerhVKRm15+zNKr3P4gkLFuSVZ5qoQ5xv1L7GtIEoHqXaeH0H5xnzPYfc9RY9wSISbNLkYZBnbvqM9LXUUqsEfDU5yTwzW9BgXGIw+A/60NrMjpoGnAv98/1ESi5qKHnCzpuaaQRBEZdRG+Wp0L2TvWqqQVk3oGhEhhgaz7Ovc7aOXubD17KsHq1iSPq0NQ1A/dmok6d2R50X7ff3WGqZW2Yoo5HPfvRXyxcSw2e5ofGRUrHDcPk4Y8DUp7Ovpca/GRbiDy+drL9dcnbPQZxdv6OL4DsQTXxo43a9Gcg6eNkmZdw0rZGxMOgSe6Aabo9XMLAbynjRRm+pEiYRCvT81Oh//Gjog5ncBgLREuNi449Y+oddFfkXmoccmDCB21IhgEASDrER4CUcMCRyirrIlWFfbaZs93xoqxKkSH2W4BT4u2upzYLXykwjCrxN36i9zCYOAyRyD8uk/dE3BUhmlYIi0YtJtbn4inTcm0pkw7+mx5hU0uYPpCfE394U9NVVtnS6AWZmf
 zLS/+In5a8HiMY/xAwqE/j+Eup1BUOrxAL3t86wE92hpm9yzRqRe9r3cucNbuLOn0DuB0DFjYWTInIIfsp0yHbRzPZiugtsFbvr8HmApKj7I1MTi90IDFBRhF9Ik3kqc1fcEurOlky5Fz02FGJSdnsOEnKK0/PyQIENag1Ngbvecw38Od9HiT9ITRutgXpSqpnAigj/1BlikaZdLQ447gLF+8pi4yv0fvk6tCZK+RnnWAQkups3O7hlxVr1LvW8OdweISrX6+hwiEzHaIXg==

On the Dell Precision 3650 Tower, the EC ignores fan speed writes unless
automatic BIOS fan control is disabled first. The same SMM code pair as
the OptiPlex 7000 (I8K_FAN_34A3_35A3) works on this machine through the
WMI-SMM backend: after writing 1 to pwm1_enable, all three fans (CPU,
front, top) accept the three fan states and report matching RPM.

Tested on BIOS 1.48.0 with kernels 7.0.0-30 and 7.0.0-31 (Ubuntu 26.04).

Signed-off-by: Patrick Pepin <patpep@me.com>
---
 drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
index 7ed94a3db..47668634f 100644
--- a/drivers/hwmon/dell-smm-hwmon.c
+++ b/drivers/hwmon/dell-smm-hwmon.c
@@ -1639,6 +1639,14 @@ static const struct dmi_system_id i8k_whitelist_fan_control[] __initconst = {
 		},
 		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
 	},
+	{
+		.ident = "Dell Precision 3650 Tower",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Precision 3650 Tower"),
+		},
+		.driver_data = (void *)&i8k_fan_control_data[I8K_FAN_34A3_35A3],
+	},
 	{
 		.ident = "Dell Optiplex 7090",
 		.matches = {
-- 
2.53.0

