Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794753481;
	b=hh2FQ3ACV6Pr+Wx+Wt3hDIlczRDfCGc7ZDCRi7wSwPSPYm3+s3JvoB8IidxL7s/2ePWY
	 WK6tYSvytraVvN79OiRY/O2PukjKaWsxTKQMjuVhkLyvFgov8+ihIoUUB5iNbskapIA74
	 +BF5rcmQ3Ga6NvK47XzJ1UPUizYYU2q3Z1DUFH0X86POg/eCF0LKWfDekvOHezvuNr536
	 pHsWTMkARtiity4eA1teLPoazJsACEsxhDyP4vOtqn7WmSmNzymEKm/n6u0+VNky6dqgA
	 IKMbY3LJp7C2Isw14a1rQSA8dtx+HQs2zVQ8boYD7a8R8BbnYlBh+CkHCfjZrw4E4qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794753481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LpSjIj8pKJ9BkaQaLlGgGcKivjXC6GF5pWFS+e/nTfQ=;
	b=HQ4rUAGREcKOP2zoRehAyW7VIYuKJUWr8fLUcSHXdHeEEgq6gD6rJ/k/LhPiE4v3TkPj
	 9y+5luS2udocQTPXvU4opjJieQgc6Xa1KaZi9Rmha3WPrRnUf1LcMKLt8CyqhSoaRn4jN
	 F1uueuG6zKE416713PMEBytLl9p+h/orv74GGo/f0FAFXcGFOwxc04HAT1fzgrt2ynsyZ
	 pf+6xe1Ik5UT8zOqpUgkzMg/IqUNVTX0iABql/s897verXygmqprpXew+S76e0C0Ej+J9
	 g0Fd5bJnAhjvwBMqxYF7y0r7Q+x1Bz98RDgxERfLrwNahAsuJboAW0asmOFpuR9f8Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SA7w7fjj;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1EF606A336
	for <linux-hwmon@vger.kernel.org>; Sun, 15 Nov 2026 14:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA1EF606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SA7w7fjj
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so1268035e9.0
        for <linux-hwmon@vger.kernel.org>; Sun, 15 Nov 2026 06:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794753479; x=1795358279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpSjIj8pKJ9BkaQaLlGgGcKivjXC6GF5pWFS+e/nTfQ=;
        b=SA7w7fjjruQZnf4O5mdcIdBHyaqX5GaOq4CquECmWjYzqFCzAZD4IGGfm/ivxkzNUt
         RJfnocz57Jma8fkQsD6xB8yEDIQt/+555ogJpLLHFwBjxq9t547frWhbrGtSkaoPzq5p
         hAZ40tR8I0/eiVWnZv17F7p6RgHqVYtinebAcdLGeWrnzC0DpaSJqPbNk5bBq35pi4DJ
         qvZH3qG+xylsYGOVXzMFZMKmxdGfNbDAyb8daZVkhmpzzW/TXNQ95Bqr1O02TvOpIOe9
         Un2VDrhtePUTYi8C1vfTepx6SMkNdI0u/cEeNfA8TMyyXYFBIRLwQbVIFGDj8DwQju01
         +mtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794753479; x=1795358279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LpSjIj8pKJ9BkaQaLlGgGcKivjXC6GF5pWFS+e/nTfQ=;
        b=VViQO+AgbSduCxOAD5iLP2uVyP3xyvxN/AtMJutcnI0YhZ3dM1ZgsblFSmYTWhCk+v
         yu7OOaZgTKshNITrSIeeRWucifdcK+wXTubyRlpiBI18MFd/sFtosJ6jaRNxBbefp4+q
         g2l3MmkYMZa25Q86Xk6aCD/p3fz4HnKDI8VHi++pq9w0boU/TKOqxbqkh2RaPf/Jv3ye
         0CNqvPWuHPs5jIe00PqvRaxq/EVzBTRyWg6BQ2Q2QZbti7OVHpbvFAhD4Fixd6UdzQk8
         kpicrrbn4+1FKuojr/CC8wT+fb2eFdqf71yERkKC9mlmkMveiyFUnGGXOoenn0bWfRyf
         DTeg==
X-Forwarded-Encrypted: i=1; AL+hErGzLrLNMa87f514K4sidP1nlg8pd3m002u8usXm+STio8rntiYgf4vu45MTRl0eZIM94bEzdBF2FuRD4g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+qxuHPw8k9njrLIbjVIs6oWhQSOvM6wbaEYJ/7H3Hi+EblGtzJ
	XFn70+ptnzPp3jp1JndPOxE+M/ev2VunFo7xwSMS3qIUylgC74hir13g
X-Gm-Gg: AYBFou1GjHvqnfLV582UUGrdvHWJHt53irG10lc1QRUHFeINwJCNhDkisbNg5L0PZSj
	4pqbzFjsYiFxsUJNQ+qiRZI/DgvoObrRCpHqHM4kyVqE/wUfHxxDYYftE+xEPoKFrCmdZPTph7S
	gRyYvJXuYipKXWMYF47PCfmZg5E0PkYadnK0fOGERKnRyZd/9EoTdjjO/mH0/ccN9CGUdt4WAJC
	gCtjsClZBV+a+bsZblyS3BWIIKPs0lDR0oPnggKhGOHEms9BkXzaPlRtA8L143ueTh+M19YpB8G
	mSoxr4uB1/oDxh6sIP+YgCqMBlLD2+VP362XaZ8hDZMkk3CrQtp7l3T2OjBhhaiMFhQgCdmvPRr
	HwAV1hpCrgZfj5HQz8sWBERRK4Fp+JEJhR/lGub1YyFHdbwxW59NNjZZW60xms+gx7aR5RkGk8a
	xuEp6szHNmzEcbHyda79inwo6AYQOzR/Cv8+k+G2ry1mnsv2ouC+AQR4ZllWd8bSzY7AYgXHMYt
	XBQxVMiRRE+lO2z51riT+WaGHi/qp1q3/UmgZNj88mMnKKZiFyCKmucXw/ucck3ioLaiIT24RSt
	iOeK/Nu6ERWMxi8qKFw5fEnOuYiLQWgd+zAYyBApq3zNm0YkyAVLv6Ad6VliJE2ZiLv6dRNAahN
	fxBWNXd5ZBE5b0tI=
X-Received: by 2002:a05:600c:6099:b0:4ab:cc03:7f60 with SMTP id 5b1f17b1804b1-4bb55a753f8mr160792155e9.18.1794753479132;
        Sun, 15 Nov 2026 06:37:59 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac1159sm196174025e9.4.2026.11.15.06.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:37:58 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: John Roden <jonathan.roden@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] hwmon: (asus-ec-sensors) add ROG STRIX X670E-F GAMING WIFI
Date: Sun, 15 Nov 2026 15:25:40 +0100
Message-ID: <20261115143708.492883-4-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115143708.492883-1-eugene.shalygin@gmail.com>
References: <20261115143708.492883-1-eugene.shalygin@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: John Roden <jonathan.roden@gmail.com>

Add support for the ROG STRIX X670E-F GAMING WIFI model.

Signed-off-by: John Roden <jonathan.roden@gmail.com>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index b3a061bd10db..fb7704c46d8b 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -50,6 +50,7 @@ Supported boards:
  * ROG STRIX X570-I GAMING
  * ROG STRIX X670E-A GAMING WIFI
  * ROG STRIX X670E-E GAMING WIFI
+ * ROG STRIX X670E-F GAMING WIFI
  * ROG STRIX X670E-I GAMING WIFI
  * ROG STRIX X870-F GAMING WIFI
  * ROG STRIX X870-I GAMING WIFI
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index d86f3614d557..d0c01b825377 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -822,6 +822,14 @@ static const struct ec_board_info board_info_strix_x670e_e_gaming_wifi = {
 	.family = family_amd_600_series,
 };
 
+static const struct ec_board_info board_info_strix_x670e_f_gaming_wifi = {
+	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
+		SENSOR_TEMP_MB | SENSOR_TEMP_VRM |
+		SENSOR_TEMP_T_SENSOR,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_SB_PCI0_SBRG_SIO1_MUT0,
+	.family = family_amd_600_series,
+};
+
 static const struct ec_board_info board_info_strix_x670e_i_gaming_wifi = {
 	.sensors = SENSOR_TEMP_CPU | SENSOR_TEMP_CPU_PACKAGE |
 			SENSOR_TEMP_MB | SENSOR_TEMP_VRM,
@@ -1035,6 +1043,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_strix_x670e_e_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X670E-E GAMING WIFI",
 					&board_info_strix_x670e_e_gaming_wifi),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X670E-F GAMING WIFI",
+					&board_info_strix_x670e_f_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X670E-I GAMING WIFI",
 					&board_info_strix_x670e_i_gaming_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ROG STRIX X870-F GAMING WIFI",
-- 
2.56.1

