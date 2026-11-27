Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770522;
	b=D+mlokEBTqjNtJfsgk4NLxYbHtPttrZTqwCNLzmozyXoknJJVJxzOUL6PSyJvUUIvQ5U
	 sK4wzMlN7zZiZWbgwOrb8638jZEopwtnDbHYqDOnXnBmw5bYpfpipB8K4MKyobJgByKTt
	 MKygVcD2avpi9KV8x8kfRQx1u1SOEXn610lHJnuL1E7uKJyIc7KHGMUxQZZsDjMqFPc4G
	 d5eeT76oDNCkYP13ByDDosQrOK16HEhD8PYp72+X/9+8DAf7WUJ3Rbj+Bx+if+BzSfaM1
	 sKBJuOBwAy20XZFV7b4UcaxMMbXs5tmpsll7MuWwQMnG6rRCrSOiIbW/w1BxD/O92AQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=JDoNSN/ccvThmpxJ1pEvOfhTc1YMWgt5laJmjZ6WIdg=;
	b=zeOTteb6j0A767VE7zuxEbTZiY5s72BXrU0HNa4Vfx5cxd9Xaieim+nXReyxz6scyDsB
	 fNtFEs6nfOjqKpNE33TNwQcamM3OluUtb9Fof0718a56rVSy3xsusfL9RG9KR2w/iA8sZ
	 pP6YSj/rpuBufyFamxJtbRqDcfOmU/4cJ9eU76gEpCaGQqO7k5BCd7Bo8XO6+fDAO9Se4
	 YW8WJ3MehwGKULN/RvCs85qXRfG6C8XLME4F/CDfN8wCFmzuibw47MlDF7UpfjXdecJID
	 6wugAw/bQHIUUnM3x6TxGqISr3aaf+gY4bSosfF0xITuk/ZSxEYdw7NRjHuH8Z5gZ7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z+GBscLM;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD27606A31E
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 09:08:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BD27606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z+GBscLM
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-33fb4680717so4358734eec.1
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 01:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795770521; x=1796375321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JDoNSN/ccvThmpxJ1pEvOfhTc1YMWgt5laJmjZ6WIdg=;
        b=Z+GBscLM3RTGFJbG2jH92f+0wKgsUV2kY2bWwzeKt1fs5F9RubU/5FmkS60t4cmTL3
         Fchq3wJD00JZcmIXtnLgKb5YGEoWRoRK8MwYzCJUR0K+5pe7EMOAK60ABtNVijdrhYjE
         kGxiPD1RpYs0SOurJIAZPJBdCtTiSIatW7OUFnQLcUbOw8FhFh2xmEOAmvkNoX+sw/XD
         HzUV0VRelAdR/tTTEgkX8sYn4vqaCOOyzraDQBAxHdmr9FLDAnxB3/JiPlcrHZNcmICK
         f0Z8Tx4cObss+OFF5Yw9uP9XxKKYzLw1y29qmhlLro0DqU3c8jRyrGLVcGrMitR8yyzj
         m0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770521; x=1796375321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDoNSN/ccvThmpxJ1pEvOfhTc1YMWgt5laJmjZ6WIdg=;
        b=gMB9pOOCvGyWxFttqzBDNQ53GbguMn5YdseZqdzFBXAQbxFKDN8u8r6SBbLyzzgNGi
         /yiUusiYLixvwqTuGby955yjOO92ahE1OiO/l0/EvdEEtsuBrb4dh8DC7oBJ+x3k71FI
         n4acZOHajYuX9xlAzUkg67LTCVpflcTKeIaksOZ580I7u5QGUnqG/on3NHjz94FLHg6I
         wi5NC1Nt60S2OCyFHhhzgQVWLtW/KePqClmoOV+WF4oIuEXNzHhUKsi23AIKsEH0Dq5v
         CKdU5iezfDSXRh1jtsQvFD74sLI+rGQVdFuEavxnxvEejg0d0lZvUqxdnz4FHWexVkzn
         5sSQ==
X-Gm-Message-State: APuU4Z8WLYyOkAulB2aaKKafVPEW0jqGmXozDnRUesqSaonIvmQrhCwp
	+Gmeay35iJqNcyPg3BIAx83oV6gqvugc1dMtsqdqvrNGabc1RHfoMQSE
X-Gm-Gg: AZFdTZfSmjgKtW3G2ShYKxfs8vGSE/q0XpGvRdCnUKS40VnMNbrY47++gutUHNav07X
	hzylIgBiBWG1lxZY3GuK+WK1/G5oV7vwgxDuwJ2/F5aOohmsT3pWWgqHUj+g1brRX7dhFPithJf
	MTPnor0z+cGj6Pa3Cq376s/Ek1UGNFBHzuQxs89rug+gbdmS9DPnYUrjB+OSVPxv8gFuXVCB0aM
	3M5jvjl9154aQUNwBsXpsic9Q8Plp3fpxm1qVDazjjQWy0+AXLrFpSbogO6p9UrZ0/8NuNlmXm0
	Qwby3J1V/J/K5GMIaFcEoqJb5eNJO4Y09xwv94BuqGtdyqqMFT5Zeyhene3sFiFWuiSQnIhTEFn
	RnOZf2lYDF3zMOr3XzhrDlOUnK8WgVyrRlALGGUg0RK9Qu7+kAOTT3btBAJYCa6gkJIjV+VRxft
	rzwsCKR7RRaaxckHDZI1/exABtY0OWmVr4xO24U36MP+TeYTp7bUEG0z1dgDQia7qCeSM/1ND/v
	4eKn159HqdHl+2PNY5lno4ov35PTrcC8EvaQ4E6zNAwB0GAx6tWEX4LpKqNB4P8xF7fuSnyRACo
	RRm3iZFephQFC+IKfW1QW59tQBQk3jc+/ZKwh8E5qPaxlLE5Je2kTFBG5lWXvhvLtj8b2wLjg54
	=
X-Received: by 2002:a05:693c:87d2:10b0:386:effe:512 with SMTP id 5a478bee46e88-386effe0580mr744270eec.32.1795770521366;
        Fri, 27 Nov 2026 01:08:41 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385c6830815sm63646122eec.20.2026.11.27.01.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:08:40 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	stable@vger.kernel.org,
	Runyu Xiao <runyu.xiao@seu.edu.cn>
Subject: [PATCH] hwmon: (occ) Check sensor_length against the sensor struct size
Date: Fri, 27 Nov 2026 17:08:37 +0800
Message-Id: <20261127090837.164246-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
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

occ_parse_poll_response() bounds each sensor block by
num_sensors * sensor_length. The show functions index the block with
fixed structs, such as the 68-byte struct power_sensor_a0. A smaller
sensor_length passes this check. The reads then run up to 17340 bytes
past the block.

Ignore a block whose sensor_length is smaller than the entry read by the
show functions, like a block of unknown type. A larger sensor_length is
still accepted, because the reads stay inside the block.

Found with a CodeQL-based static analysis tool that we are developing.
Reproduced in a userspace harness under AddressSanitizer. Not tested
on hardware.

Fixes: c10e753d43eb ("hwmon (occ): Add sensor types and versions")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260617201822.3B46E1F000E9@smtp.kernel.org/
Reported-by: Runyu Xiao <runyu.xiao@seu.edu.cn>
Link: https://lore.kernel.org/all/20260619023019.1064970-1-runyu.xiao@seu.edu.cn/
Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
I used an LLM to help write the harness and this patch.

 drivers/hwmon/occ/common.c | 48 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 5836054c5c25..4ec954728222 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -1049,6 +1049,45 @@ static int occ_setup_sensor_attrs(struct occ *occ)
 	return 0;
 }
 
+/*
+ * Size of one sensor entry, as the show functions read it.
+ * Keep in sync with occ_setup_sensor_attrs().
+ */
+static const struct {
+	const char *type;
+	u8 format;
+	u8 size;
+} occ_sensor_sizes[] = {
+	{ "TEMP", 0x01, sizeof(struct temp_sensor_1) },
+	{ "TEMP", 0x02, sizeof(struct temp_sensor_2) },
+	{ "TEMP", 0x10, sizeof(struct temp_sensor_10) },
+	{ "FREQ", 0x01, sizeof(struct freq_sensor_1) },
+	{ "FREQ", 0x02, sizeof(struct freq_sensor_2) },
+	{ "POWR", 0x01, sizeof(struct power_sensor_1) },
+	{ "POWR", 0x02, sizeof(struct power_sensor_2) },
+	{ "POWR", 0xA0, sizeof(struct power_sensor_a0) },
+	/* format 1 has no user_source */
+	{ "CAPS", 0x01, offsetof(struct caps_sensor_2, user_source) },
+	{ "CAPS", 0x02, sizeof(struct caps_sensor_2) },
+	{ "CAPS", 0x03, sizeof(struct caps_sensor_3) },
+	{ "EXTN", 0x01, sizeof(struct extended_sensor) },
+};
+
+static unsigned int occ_sensor_size(const struct occ_sensor_data_block *block)
+{
+	const struct occ_sensor_data_block_header *header = &block->header;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(occ_sensor_sizes); i++) {
+		if (header->sensor_format == occ_sensor_sizes[i].format &&
+		    !strncmp(header->eye_catcher, occ_sensor_sizes[i].type, 4))
+			return occ_sensor_sizes[i].size;
+	}
+
+	/* unknown formats are not used, see occ_setup_sensor_attrs() */
+	return 0;
+}
+
 /* only need to do this once at startup, as OCC won't change sensors on us */
 static int occ_parse_poll_response(struct occ *occ)
 {
@@ -1094,6 +1133,15 @@ static int occ_parse_poll_response(struct occ *occ)
 		}
 		size += offset;
 
+		if (block->header.num_sensors &&
+		    block->header.sensor_length < occ_sensor_size(block)) {
+			dev_warn(occ->bus_dev,
+				 "ignoring OCC %.4s sensors of length %u\n",
+				 block->header.eye_catcher,
+				 block->header.sensor_length);
+			continue;
+		}
+
 		dev_dbg(occ->bus_dev, " %04x..%04x: %.4s (%d sensors)\n",
 			old_offset, offset - 1, block->header.eye_catcher,
 			block->header.num_sensors);
-- 
2.34.1

