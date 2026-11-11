Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385739;
	b=VoSGLJELp5QYqYn6bqbaNUhJZn++bid2ZVsnNpDqBYxQM13YccP6fb/1dJDi9E10ozCR
	 Y+RTH1s45I+M9jWrOMOm1nNJgNWEHN1iRIsRrmQzWuFkCBEh0f0GDa6t6+ub05/G7/JRJ
	 vP7KQf7LbweQFo9FUHBUUuPoQCg6M9eBaCwfKLb/r8iItx9P072guMI+6dr/vl/cd68lj
	 xsQ3sEucrps8LG+D046udRVAEz5hYlo++PMi0+3Esui1nDTbE9k0J1drwKHjVtrbh12h8
	 cMmx8DJtcLEQtQJRpZNO6+uA9ichEu6h81acfV0YGViHJHWHOnr/xZlUH6djSqGRwIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oqt6WiGEqMCVRR7QR/nQyneBo34H3pnYJBAqkvsamRY=;
	b=YTih6vCSRy/wgQ4t8uHUjfiHBIW6RitB3rMoyapIq9atpiNB8Gfwz+y/icPvuU20A9Sj
	 Ihb2AgxwvHph5H89XSH8ESJ+krZxI7o/oC3guxh5Bdqmb1LZ07srMVyWj1Q+qsAEzGYj9
	 y5ppJ6PcLvUgSYvtPerAW07pYtNIYuWLiu5ElIDLSlIJBWEL2/+KHkZMeq8xqd7ipBBx/
	 zUAqZJGy3fcmGMvSrPjW8Cb2Q+yb1xCWsZpAJbTGCU2F+hSLmhJDTbBDedrOP1Qjw5mIx
	 q5YMl/RDjMQAY0ru8mdNuDC4S3dQdg9Z0mvu94XSPKz4xitDBqrKRR09P6mOZVrzJEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WveNnJAN;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448BC60A3831
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 08:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 448BC60A3831
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WveNnJAN
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c45551fa84eso433325466b.3
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 00:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794385738; x=1794990538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oqt6WiGEqMCVRR7QR/nQyneBo34H3pnYJBAqkvsamRY=;
        b=WveNnJANYQ5jI5VR1ozDjvLq8bePJgW5TiMOpnWaIp99YEJyKY0uE9TO26oOL5vR5z
         R6HoB+tiiqkmxlCB3jVOh6JQOg6RvNfgYo1l7oa8tcFkpUICQFXD0ohPqIh+M6mHPk/J
         hHrUrpf205+PAalTk6qjK3y03rjpLp3pZN1VHlzhzPtvXrTB2u6eP+lXryWXWPX9puxb
         wcE1Dq+2Ecc41OMUD+5v3JgwdRLETfD8aRctUaQgQGAnNkN48f7QdhV82tPrnNZTDCVa
         wOOMRtHqEmqBYhzxqdHJyc9OWe4c+HcEfFaeW14R8tRcuInsY7+gL0vEqwaBo2BPDKd9
         Zhhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794385738; x=1794990538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oqt6WiGEqMCVRR7QR/nQyneBo34H3pnYJBAqkvsamRY=;
        b=a/fd3UGaqD2y5OLQ+lMtbuzAJcX4UgKq/tpDMyDUBsyrqzvdQf7kzlC9nGZPH9HBvj
         8UaYkpt/yvPfyUASmlA42qtsbau8kzGUjoEg5hM3XKcgDBexz1K02qqDi+ZgglKG6/ne
         o7e1DVmBDiF1o9wNtXiekP6g9uUDHLpHXLhxpAbfD2vtWAYwIPKlDkXajBQr+vb6GcFo
         4oTUGxcCTTlk6A76f3Hp/237xvqb6ZxXkeUR6WKYAG/bcWhAqHSCmAbL9fgGFeDvl68N
         tdJGAy+cmaNrG3ygLQFdXplBI0d1b0i7u2oeaXWt9+BNxLf0TVATD2CAyXOwXNvq6Cw7
         Q/Kg==
X-Gm-Message-State: APuU4Z8neZVoXki62f6gj4lXpoOjO1zSqHx2DLiL7H2UJkXzNQrL3+35
	E5OovkU9lv4M6V6WNp6JmAXwhaDnPPdq5dSNCal0ALmkkd3ZEl9YF4koV/v3Xyyj
X-Gm-Gg: AYBFou25uT0PVCg6/ndqhxRKkDenFqbFq+8NhawzqfA6wUXuILvdLK3nDNREidIvm8s
	4NA37T+zNcO4vPzdl+wxTA2FHYnak9ePMC5oSgDgTaIz3TdiN/H3IxGdWmP4Cj7vvN3iSxxtcIP
	777Ie+qufgm1shUh5frfHtUkUu4gUwg+dTI5nXWoO2T0dgOOY2U0uL27quo57OoUCsIeq2q1Yz/
	PjARLnfDn7LOPmaWqp4qqmzikP+KKXU6mTW5Y9P8KeMj798oD4FI2VOrhr6CE5IQPsZt8np3yvr
	PEq25PEqgsm6/Zkmy/DguY9RbTGN5ZQ9xP1MRA8YYnwnoRXO9ab1k+YmyfRTGmpb4JgD7mTrNFC
	tjE5eS58vtY3RsIzJfgAQW05tCfemBAIbEHBNNIPc8kyBhHaeT6rbIMvOlikBSKStWXKaXvpYb1
	txhNV7Sr9J+aNthNYxeKu/KjZ1Z0VVEDbE0CLRJ8h93XqcDmp8R8swVxqECTgCQn0CPwGvcIrjp
	1mAfuiHFqUS6Z9CAV2jQMihPClgGERAqZx4p4pev98QUgs+3g2dPjfunX3hSCrw6Up8TkYmdGya
	wXYpruCnOKFP7pAu0KkxRYKqYhvQAiPa5V42WRICj3qiAeJ4HNQ/Qlt+W5VE5hlah4SkVXfb4TJ
	clB9rdBxosWUkOHF1aPjarHg6roKXfzelFz0vd/wkRhh1nFOULXsZB82m5qPbrWq3Y9SWguxYJA
	YrrchFh8eOe5p/WmENMHd4q/0rmdNABDGbGeT6aulydQa2
X-Received: by 2002:a17:907:dab:b0:c46:2a05:b257 with SMTP id a640c23a62f3a-c5066af79eemr119409166b.23.1794385737557;
        Wed, 11 Nov 2026 00:28:57 -0800 (PST)
Received: from fractal.tuxedo-gray.ts.net (c-78-82-25-228.bbcust.telenor.se. [78.82.25.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56ffc7sm210135866b.17.2026.11.11.00.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:28:56 -0800 (PST)
From: Johan Dahlin <jdahlin@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alwyn Kik <alwyn@kik.pw>,
	Fabio Baltieri <fabio.baltieri@gmail.com>,
	Hamza Mahfooz <someguy@effective-light.com>,
	Johan Dahlin <jdahlin@gmail.com>
Subject: [PATCH v2 7/7] hwmon: (nct6683) Scale the +5V and +12V inputs of the ASRock B850 Steel Legend WiFi
Date: Wed, 11 Nov 2026 09:28:38 +0100
Message-ID: <20261111082838.1418051-8-jdahlin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111082838.1418051-1-jdahlin@gmail.com>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
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

The +5V and +12V rails reach the chip through resistor dividers, so they
read as 1.70 V and 2.03 V while the UEFI setup shows 5.04 V and 12.19 V.

Let the sensor table carry a divider ratio and apply it when reading the
input, with ratios of 3 and 6 on this board. sysfs-interface.rst asks for
such conversions in user space because dividers differ between boards.
Here the board is identified by its customer ID, so the ratios are fixed.

Signed-off-by: Johan Dahlin <jdahlin@gmail.com>
---
 Documentation/hwmon/nct6683.rst |  3 ++-
 drivers/hwmon/nct6683.c         | 20 +++++++++++++++-----
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
index c8b8ade3b95b..17fba35bf9bb 100644
--- a/Documentation/hwmon/nct6683.rst
+++ b/Documentation/hwmon/nct6683.rst
@@ -63,7 +63,8 @@ by fan1 to fan6, and on the ASRock BC-250 (NCT6686D, customer ID 0x162b).
 
 On the ASRock B850 Steel Legend WiFi the temperature and voltage inputs
 are named after the H/W Monitor page of the BIOS setup, and fanN_label
-names the fan header each channel is wired to.
+names the fan header each channel is wired to. The +5V and +12V inputs
+report the rail voltage rather than the divided voltage seen by the chip.
 
 pwmN_enable selects the fan control mode:
 
diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index dcad72d1ef97..9a306728ee84 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -328,10 +328,14 @@ static const char *const nct6683_mon_label[] = {
 #define NUM_MON_LABELS		ARRAY_SIZE(nct6683_mon_label)
 #define MON_VOLTAGE_START	0x60
 
-/* Board specific names for the monitoring sources */
+/*
+ * Board specific names for the monitoring sources, and the ratio of the
+ * resistor divider in front of a voltage input.
+ */
 struct nct6683_mon_desc {
 	u8 src;			/* index into nct6683_mon_label */
 	const char *label;
+	u8 scale;		/* voltage divider ratio, 0 if none */
 };
 
 /*
@@ -346,11 +350,11 @@ static const struct nct6683_mon_desc asrock_b850sl_mon_desc[] = {
 	{ 0x46, "CPU" },		/* AMD TSI Addr 98h */
 	{ 0x60, "+3.3V" },		/* VCC */
 	{ 0x66, "CPU Vcore" },		/* VIN0 */
-	{ 0x69, "+5V" },		/* VIN3 */
+	{ 0x69, "+5V", 3 },		/* VIN3 */
 	{ 0x6b, "VDDCR_SOC" },		/* VIN5 */
 	{ 0x6c, "VDD_MISC" },		/* VIN6 */
 	{ 0x6d, "DRAM" },		/* VIN7 */
-	{ 0x76, "+12V" },		/* VIN16 */
+	{ 0x76, "+12V", 6 },		/* VIN16 */
 	{ }
 };
 
@@ -761,11 +765,17 @@ show_in_reg(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
 	struct nct6683_data *data = nct6683_update_device(dev);
+	const struct nct6683_mon_desc *desc;
 	int index = sattr->index;
 	int nr = sattr->nr;
+	long val = in_from_reg(data->in[index][nr]);
+
+	/* Report the rail voltage for inputs behind a resistor divider */
+	desc = nct6683_find_mon_desc(data, data->in_src[nr]);
+	if (desc && desc->scale)
+		val *= desc->scale;
 
-	return sprintf(buf, "%ld\n",
-		       in_from_reg(data->in[index][nr]));
+	return sprintf(buf, "%ld\n", val);
 }
 
 static umode_t nct6683_in_is_visible(struct kobject *kobj,
-- 
2.53.0

